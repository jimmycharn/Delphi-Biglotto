unit SerialGenerator;

interface

uses
  Windows, SysUtils, Classes, Registry, DateUtils;

type
  THardwareInfo = record
    ComputerName: string;
    ProcessorID: string;
    BIOSSerial: string;
    DiskSerial: string;
    WindowsProductID: string;
  end;

  TSerialInfo = record
    SerialNumber: string;
    ExpiryDate: TDateTime;
    IsValid: Boolean;
    IsExpired: Boolean;
    DaysRemaining: Integer;
  end;

// ????????????????????? Hardware ID
function GetHardwareID: string;
function GetHardwareInfo: THardwareInfo;

// ????????????? Serial No ??? Hardware ID ???????????????
function GenerateSerialFromHardwareID(const HardwareID: string; ExpiryDate: TDateTime): string;

// ??????????????? Serial No ??????????????????????
function ValidateSerialWithExpiry(const HardwareID, SerialNo: string): TSerialInfo;

// ???????????? ??????????????? Hardware
function GetComputerName: string;
function GetProcessorID: string;
function GetBIOSSerial: string;
function GetDiskSerial: string;
function GetWindowsProductID: string;

// ?????????????????
function ExtractExpiryDateFromSerial(const SerialNo: string): TDateTime;
function DateToSerialCode(ADate: TDateTime): string;
function SerialCodeToDate(const Code: string): TDateTime;

implementation

// ================== ????????????????? ==================

function StringToHash(const Input: string): string;
var
  i, HashValue: Integer;
  Temp: string;
begin
  HashValue := 0;
  for i := 1 to Length(Input) do
    HashValue := ((HashValue shl 5) - HashValue) + Ord(Input[i]);
  
  Temp := IntToHex(Abs(HashValue), 8);
  Result := Temp;
end;

function XOREncode(const Text, Key: string): string;
var
  i: Integer;
  KeyLen: Integer;
begin
  Result := '';
  KeyLen := Length(Key);
  if KeyLen = 0 then Exit;
  
  for i := 1 to Length(Text) do
    Result := Result + IntToHex(Ord(Text[i]) xor Ord(Key[((i-1) mod KeyLen) + 1]), 2);
end;

// ?????????????????? 4 ???????? (Hex)
function DateToSerialCode(ADate: TDateTime): string;
var
  Days: Integer;
  BaseDate: TDateTime;
begin
  // ????????? 1 ?????? 2000 ???????
  BaseDate := EncodeDate(2000, 1, 1);
  Days := DaysBetween(ADate, BaseDate);
  
  // ???????? Hex 4 ???? (??????????? 2179)
  Result := IntToHex(Days, 4);
end;

// ??????????????????????
function SerialCodeToDate(const Code: string): TDateTime;
var
  Days: Integer;
  BaseDate: TDateTime;
begin
  Result := 0;
  if Length(Code) <> 4 then Exit;
  
  try
    Days := StrToInt('$' + Code);
    BaseDate := EncodeDate(2000, 1, 1);
    Result := IncDay(BaseDate, Days);
  except
    Result := 0;
  end;
end;

// ================== ???????????? Hardware ==================

function GetComputerName: string;
var
  Buffer: array[0..MAX_COMPUTERNAME_LENGTH] of Char;
  Size: DWORD;
begin
  Size := MAX_COMPUTERNAME_LENGTH + 1;
  if Windows.GetComputerName(Buffer, Size) then
    Result := Buffer
  else
    Result := '';
end;

function GetProcessorID: string;
var
  Reg: TRegistry;
begin
  Result := '';
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKeyReadOnly('HARDWARE\DESCRIPTION\System\CentralProcessor\0') then
    begin
      try
        Result := Reg.ReadString('ProcessorNameString');
        if Result = '' then
          Result := Reg.ReadString('Identifier');
      except
        Result := '';
      end;
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

function GetBIOSSerial: string;
var
  Reg: TRegistry;
begin
  Result := '';
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKeyReadOnly('HARDWARE\DESCRIPTION\System\BIOS') then
    begin
      try
        Result := Reg.ReadString('SystemProductName');
        if Result = '' then
          Result := Reg.ReadString('SystemManufacturer');
      except
        Result := '';
      end;
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

function GetDiskSerial: string;
var
  VolumeSerialNumber: DWORD;
  MaximumComponentLength: DWORD;
  FileSystemFlags: DWORD;
  VolumeName: array[0..MAX_PATH] of Char;
  FileSystemName: array[0..MAX_PATH] of Char;
begin
  Result := '';
  if GetVolumeInformation('C:\', VolumeName, SizeOf(VolumeName),
    @VolumeSerialNumber, MaximumComponentLength, FileSystemFlags,
    FileSystemName, SizeOf(FileSystemName)) then
  begin
    Result := IntToHex(VolumeSerialNumber, 8);
  end;
end;

function GetWindowsProductID: string;
var
  Reg: TRegistry;
begin
  Result := '';
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKeyReadOnly('SOFTWARE\Microsoft\Windows NT\CurrentVersion') then
    begin
      try
        Result := Reg.ReadString('ProductId');
      except
        Result := '';
      end;
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

// ================== ???????????? ==================

function GetHardwareInfo: THardwareInfo;
begin
  Result.ComputerName := GetComputerName;
  Result.ProcessorID := GetProcessorID;
  Result.BIOSSerial := GetBIOSSerial;
  Result.DiskSerial := GetDiskSerial;
  Result.WindowsProductID := GetWindowsProductID;
end;

function GetHardwareID: string;
var
  Info: THardwareInfo;
  Combined: string;
begin
  Info := GetHardwareInfo;

  {
  Combined := Info.ComputerName + '|' +
              Info.ProcessorID + '|' +
              Info.BIOSSerial + '|' +
              Info.DiskSerial + '|' +
              Info.WindowsProductID;
  }

  Combined := Info.ProcessorID + '|' +
              Info.BIOSSerial + '|' +
              Info.DiskSerial;
  
  Result := StringToHash(Combined);
end;

function GenerateSerialFromHardwareID(const HardwareID: string; ExpiryDate: TDateTime): string;
const
  SECRET_KEY = 'MySecretKey2024';
var
  Encoded: string;
  DateCode: string;
  Combined: string;
  Part1, Part2, Part3, Part4, Part5: string;
  CheckSum: Integer;
  i: Integer;
begin
  if HardwareID = '' then
  begin
    Result := '';
    Exit;
  end;
  
  // ?????????????????????? 4 ????????
  DateCode := DateToSerialCode(ExpiryDate);
  
  // ??? Hardware ID ??? DateCode
  Combined := HardwareID + DateCode;
  
  // ????????
  Encoded := XOREncode(Combined, SECRET_KEY);
  
  while Length(Encoded) < 40 do
    Encoded := Encoded + StringToHash(Encoded);
  
  // ????? CheckSum
  CheckSum := 0;
  for i := 1 to Length(Combined) do
    CheckSum := CheckSum + Ord(Combined[i]);
  CheckSum := CheckSum mod 9999;
  
  // ???????? 5 ????
  Part1 := Copy(Encoded, 1, 4);
  Part2 := Copy(Encoded, 5, 4);
  Part3 := Copy(Encoded, 9, 4);
  Part4 := DateCode;  // ??????????
  Part5 := IntToHex(CheckSum, 4);
  
  // ?????? Serial: XXXX-XXXX-XXXX-DDDD-CCCC
  // DDDD = ??????????, CCCC = CheckSum
  Result := UpperCase(Part1 + '-' + Part2 + '-' + Part3 + '-' + Part4 + '-' + Part5);
end;

function ExtractExpiryDateFromSerial(const SerialNo: string): TDateTime;
var
  DateCode: string;
  CleanSerial: string;
begin
  Result := 0;
  
  // ????????????? - ???
  CleanSerial := StringReplace(SerialNo, '-', '', [rfReplaceAll]);
  
  // ????????? 13-16 (??????????)
  if Length(CleanSerial) >= 16 then
  begin
    DateCode := Copy(CleanSerial, 13, 4);
    Result := SerialCodeToDate(DateCode);
  end;
end;

function ValidateSerialWithExpiry(const HardwareID, SerialNo: string): TSerialInfo;
var
  ExpiryDate: TDateTime;
  GeneratedSerial: string;
  CurrentDate: TDateTime;
begin
  // ???????????
  Result.SerialNumber := SerialNo;
  Result.IsValid := False;
  Result.IsExpired := False;
  Result.DaysRemaining := 0;
  
  // ???????????????? Serial
  ExpiryDate := ExtractExpiryDateFromSerial(SerialNo);
  Result.ExpiryDate := ExpiryDate;
  
  if ExpiryDate = 0 then
  begin
    Exit; // Serial ??????????
  end;
  
  // ????? Serial ????????????????????
  GeneratedSerial := GenerateSerialFromHardwareID(HardwareID, ExpiryDate);
  
  // ??????????????????
  if UpperCase(Trim(SerialNo)) = UpperCase(Trim(GeneratedSerial)) then
  begin
    Result.IsValid := True;
    
    // ?????????????????
    CurrentDate := Date;
    if CurrentDate > ExpiryDate then
    begin
      Result.IsExpired := True;
      Result.DaysRemaining := 0;
    end
    else
    begin
      Result.IsExpired := False;
      Result.DaysRemaining := DaysBetween(ExpiryDate, CurrentDate);
    end;
  end;
end;

end.
