unit hddinfo;

interface

uses Windows, SysUtils, Classes;

function GetCDriveVolumeSerial: string;

const
  IOCTL_STORAGE_QUERY_PROPERTY = $2D1400;

type
  THDDInfo = class (TObject)
  private
    FDriveNumber: Byte;
    FFileHandle: Cardinal;
    FInfoAvailable: Boolean;
    FProductRevision: string;
    FProductId: string;
    FSerialNumber: string;
    FVendorId: string;
    procedure ReadInfo;
    procedure SetDriveNumber(const Value: Byte);
  public
    constructor Create;
    property DriveNumber: Byte read FDriveNumber write SetDriveNumber;
    property VendorId: string read FVendorId;
    property ProductId: string read FProductId;
    property ProductRevision: string read FProductRevision;
    property SerialNumber: string read FSerialNumber;
    function SerialNumberInt: Cardinal;
    function SerialNumberText: string;
    function IsInfoAvailable: Boolean;
  end;

implementation

type
  STORAGE_PROPERTY_QUERY = packed record
    PropertyId: DWORD;
    QueryType: DWORD;
    AdditionalParameters: array[0..3] of Byte;
  end;

  STORAGE_DEVICE_DESCRIPTOR = packed record
    Version: ULONG;
    Size: ULONG;
    DeviceType: Byte;
    DeviceTypeModifier: Byte;
    RemovableMedia: Boolean;
    CommandQueueing: Boolean;
    VendorIdOffset: ULONG;
    ProductIdOffset: ULONG;
    ProductRevisionOffset: ULONG;
    SerialNumberOffset: ULONG;
    STORAGE_BUS_TYPE: DWORD;
    RawPropertiesLength: ULONG;
    RawDeviceProperties: array[0..511] of Byte;
  end;

function ByteToChar(const B: Byte): Char;
begin
  Result := Chr(B + $30);
end;

function GetCDriveVolumeSerial: string;
var
  VolName, FSName: array[0..255] of Char;
  VolSer, MaxLen, Flags: DWORD;
begin
  if GetVolumeInformation('C:\', VolName, SizeOf(VolName), @VolSer, MaxLen, Flags, FSName, SizeOf(FSName)) then
    Result := IntToHex(VolSer, 8)
  else
    Result := '87654321';
end;

function SerialNumberToCardinal(SerNum: String): Cardinal;
begin
  Result := 0;
  if Length(SerNum) > 0 then
    HexToBin(PChar(SerNum), PChar(@Result), SizeOf(Cardinal));
end;

function SerialNumberToString(SerNum: String): String;
var
  I, StrLen: Integer;
  Pair: string;
  B: Byte;
  Ch: Char absolute B;
begin
  Result := '';
  StrLen := Length(SerNum);

  if Odd(StrLen) then Exit;

  I := 1;
  while I < StrLen do
  begin
    Pair := Copy(SerNum, I, 2);
    HexToBin(PChar(Pair), PChar(@B), 1);
    Result := Result + Chr(B);
    Inc(I, 2);
  end;

  I := 1;
  while I < Length(Result) do
  begin
    Ch := Result[I];
    Result[I] := Result[I + 1];
    Result[I + 1] := Ch;
    Inc(I, 2);
  end;
end;

constructor THDDInfo.Create;
begin
  inherited;
  FFileHandle := INVALID_HANDLE_VALUE;
  SetDriveNumber(0);
end;

function THDDInfo.IsInfoAvailable: Boolean;
begin
  Result := FInfoAvailable;
end;

procedure THDDInfo.ReadInfo;
type
  PCharArray = ^TCharArray;
  TCharArray = array[0..32767] of Char;
var
  Returned: Cardinal;
  Status: LongBool;
  PropQuery: STORAGE_PROPERTY_QUERY;
  DeviceDescriptor: STORAGE_DEVICE_DESCRIPTOR;
  PCh: PChar;
  DrivePath: string;
begin
  FInfoAvailable := False;
  FProductRevision := '';
  FProductId := '';
  FSerialNumber := '';
  FVendorId := '';

  try
    DrivePath := '\\.\PhysicalDrive' + ByteToChar(FDriveNumber);
    FFileHandle := CreateFile(
                     PChar(DrivePath),
                     0,
                     FILE_SHARE_READ or FILE_SHARE_WRITE,
                     nil,
                     OPEN_EXISTING,
                     0,
                     0
                   );

    if FFileHandle <> INVALID_HANDLE_VALUE then
    begin
      ZeroMemory(@PropQuery, SizeOf(PropQuery));
      ZeroMemory(@DeviceDescriptor, SizeOf(DeviceDescriptor));
      DeviceDescriptor.Size := SizeOf(DeviceDescriptor);

      Status := DeviceIoControl(
                  FFileHandle,
                  IOCTL_STORAGE_QUERY_PROPERTY,
                  @PropQuery,
                  SizeOf(PropQuery),
                  @DeviceDescriptor,
                  DeviceDescriptor.Size,
                  Returned,
                  nil
                );

      if Status then
      begin
        if DeviceDescriptor.VendorIdOffset <> 0 then
        begin
          PCh := @PCharArray(@DeviceDescriptor)^[DeviceDescriptor.VendorIdOffset];
          FVendorId := Trim(PCh);
        end;

        if DeviceDescriptor.ProductIdOffset <> 0 then
        begin
          PCh := @PCharArray(@DeviceDescriptor)^[DeviceDescriptor.ProductIdOffset];
          FProductId := Trim(PCh);
        end;

        if DeviceDescriptor.ProductRevisionOffset <> 0 then
        begin
          PCh := @PCharArray(@DeviceDescriptor)^[DeviceDescriptor.ProductRevisionOffset];
          FProductRevision := Trim(PCh);
        end;

        if DeviceDescriptor.SerialNumberOffset <> 0 then
        begin
          PCh := @PCharArray(@DeviceDescriptor)^[DeviceDescriptor.SerialNumberOffset];
          FSerialNumber := Trim(PCh);
        end;
      end;
    end;
  except
    // Catch any IOCTL exception safely
  end;

  if FFileHandle <> INVALID_HANDLE_VALUE then
  begin
    CloseHandle(FFileHandle);
    FFileHandle := INVALID_HANDLE_VALUE;
  end;

  // Fallback if physical drive serial could not be read
  if FSerialNumber = '' then
  begin
    FSerialNumber := GetCDriveVolumeSerial;
    FProductId := 'Volume Disk';
  end;

  FInfoAvailable := (FSerialNumber <> '');
end;

function THDDInfo.SerialNumberInt: Cardinal;
begin
  Result := 0;
  if (IsInfoAvailable = True) and (FSerialNumber <> '') then
    Result := SerialNumberToCardinal(FSerialNumber);
end;

function THDDInfo.SerialNumberText: string;
begin
  Result := '';
  if (IsInfoAvailable = True) and (FSerialNumber <> '') then
    Result := SerialNumberToString(FSerialNumber);
end;

procedure THDDInfo.SetDriveNumber(const Value: Byte);
begin
  FDriveNumber := Value;
  ReadInfo;
end;

end.
