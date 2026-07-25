unit uLicense;

interface

uses
  SysUtils, Classes, Windows, DateUtils, uDm, hddinfo, ZDataset, ZConnection;

type
  TLicenseInfo = record
    IsRegistered: Boolean;
    HWID: string;
    RegDate: TDateTime;
    ExpireDate: TDateTime;
    MaxClients: Integer;
    LicenseType: string;
    DaysLeft: Integer;
    StatusText: string;
  end;

function GetMachineHWID: string;
function GenerateLicenseKey(const AHWID: string; AYears, AMonths, AMaxClients: Integer; const ALicType: string): string;
function ValidateLicenseKey(const AKey: string; var AInfo: TLicenseInfo): Boolean;
procedure EnsureLicenseTableExists;
function CheckCurrentLicense(var AInfo: TLicenseInfo): Boolean;
function SaveLicenseToDB(const AKey: string; const AInfo: TLicenseInfo): Boolean;

implementation

const
  LICENSE_SALT = 'BIGLOTTO_2026_SECRET_KEY_PRO_SALT_8899';

function SimpleHash(const S: string): string;
var
  I: Integer;
  H: Cardinal;
begin
  H := 5381;
  for I := 1 to Length(S) do
    H := ((H shl 5) + H) + Ord(S[I]);
  Result := IntToHex(H, 8);
end;

function XORCipher(const S, Key: string): string;
var
  I, KeyLen: Integer;
  C: Char;
begin
  Result := '';
  KeyLen := Length(Key);
  if KeyLen = 0 then Exit;
  for I := 1 to Length(S) do
  begin
    C := Char(Ord(S[I]) xor Ord(Key[((I - 1) mod KeyLen) + 1]));
    Result := Result + C;
  end;
end;

function EncodeBase64(const Input: string): string;
const
  B64: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
var
  I, Len: Integer;
  B1, B2, B3: Byte;
begin
  Result := '';
  Len := Length(Input);
  I := 1;
  while I <= Len do
  begin
    B1 := Ord(Input[I]);
    Inc(I);
    if I <= Len then B2 := Ord(Input[I]) else B2 := 0;
    if I + 1 <= Len then B3 := Ord(Input[I + 1]) else B3 := 0;

    Result := Result + B64[((B1 shr 2) and $3F) + 1];
    Result := Result + B64[(((B1 shl 4) or (B2 shr 4)) and $3F) + 1];
    
    if I <= Len then
      Result := Result + B64[(((B2 shl 2) or (B3 shr 6)) and $3F) + 1]
    else
      Result := Result + '=';

    if I + 1 <= Len then
      Result := Result + B64[(B3 and $3F) + 1]
    else
      Result := Result + '=';

    Inc(I, 2);
  end;
end;

function DecodeBase64(const Input: string): string;
const
  B64: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
var
  I, Len, P: Integer;
  Vals: array[0..3] of Byte;
  C: Char;
begin
  Result := '';
  Len := Length(Input);
  I := 1;
  while I <= Len do
  begin
    for P := 0 to 3 do
    begin
      if (I + P <= Len) then
      begin
        C := Input[I + P];
        if C = '=' then Vals[P] := 0
        else Vals[P] := Pos(C, B64) - 1;
      end
      else Vals[P] := 0;
    end;

    Result := Result + Char((Vals[0] shl 2) or (Vals[1] shr 4));
    if Input[I + 2] <> '=' then
      Result := Result + Char(((Vals[1] and $0F) shl 4) or (Vals[2] shr 2));
    if Input[I + 3] <> '=' then
      Result := Result + Char(((Vals[2] and $03) shl 6) or Vals[3]);

    Inc(I, 4);
  end;
end;

function FormatKeyWithHyphens(const S: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
  begin
    Result := Result + S[I];
    if (I mod 5 = 0) and (I < Length(S)) then
      Result := Result + '-';
  end;
end;

function CleanKeyString(const S: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
  begin
    if S[I] in ['A'..'Z', 'a'..'z', '0'..'9', '+', '/', '='] then
      Result := Result + S[I];
  end;
end;

function GetMachineHWID: string;
var
  HDD: THDDInfo;
  SerText: string;
begin
  try
    HDD := THDDInfo.Create;
    try
      SerText := Trim(HDD.SerialNumber);
      if SerText = '' then
        SerText := GetCDriveVolumeSerial;
    finally
      HDD.Free;
    end;
  except
    SerText := GetCDriveVolumeSerial;
  end;
  if SerText = '' then SerText := 'BL-DEFAULT-9999';
  Result := 'BL-' + Copy(SimpleHash(SerText + '_HWID_BL'), 1, 4) + '-' +
                   Copy(SimpleHash(SerText + '_HWID_2'), 1, 4) + '-' +
                   Copy(SimpleHash(SerText + '_HWID_3'), 1, 4);
end;

function GenerateLicenseKey(const AHWID: string; AYears, AMonths, AMaxClients: Integer; const ALicType: string): string;
var
  RegDate, ExpireDate: TDateTime;
  RegStr, ExpStr, Payload, HashStr, Encrypted: string;
  TotalMonths: Integer;
begin
  RegDate := Date;
  TotalMonths := (AYears * 12) + AMonths;
  if TotalMonths <= 0 then TotalMonths := 12;
  ExpireDate := IncMonth(RegDate, TotalMonths);

  RegStr := FormatDateTime('yyyy-mm-dd', RegDate);
  ExpStr := FormatDateTime('yyyy-mm-dd', ExpireDate);

  HashStr := SimpleHash(AHWID + '|' + RegStr + '|' + ExpStr + '|' + IntToStr(AMaxClients) + '|' + ALicType + '|' + LICENSE_SALT);

  Payload := Trim(AHWID) + '|' + RegStr + '|' + ExpStr + '|' + IntToStr(AMaxClients) + '|' + ALicType + '|' + HashStr;
  Encrypted := XORCipher(Payload, LICENSE_SALT);
  Result := FormatKeyWithHyphens(EncodeBase64(Encrypted));
end;

procedure SplitString(const Input: string; Delim: Char; List: TStringList);
var
  P, StartPos: Integer;
begin
  List.Clear;
  StartPos := 1;
  for P := 1 to Length(Input) do
  begin
    if Input[P] = Delim then
    begin
      List.Add(Copy(Input, StartPos, P - StartPos));
      StartPos := P + 1;
    end;
  end;
  if StartPos <= Length(Input) then
    List.Add(Copy(Input, StartPos, Length(Input) - StartPos + 1));
end;

function ValidateLicenseKey(const AKey: string; var AInfo: TLicenseInfo): Boolean;
var
  CleanKey, Decrypted, ExpectedHash: string;
  Parts: TStringList;
  MyHWID: string;
  CurrDate: TDateTime;
begin
  Result := False;
  FillChar(AInfo, SizeOf(AInfo), 0);
  AInfo.IsRegistered := False;

  CleanKey := CleanKeyString(AKey);
  if CleanKey = '' then
  begin
    AInfo.StatusText := 'ยังไม่ได้ลงทะเบียน';
    Exit;
  end;

  try
    Decrypted := XORCipher(DecodeBase64(CleanKey), LICENSE_SALT);
    Parts := TStringList.Create;
    try
      SplitString(Decrypted, '|', Parts);

      if Parts.Count < 6 then
      begin
        AInfo.StatusText := 'รหัสลงทะเบียนไม่ถูกต้อง';
        Exit;
      end;

      AInfo.HWID := Parts[0];
      AInfo.RegDate := EncodeDate(StrToInt(Copy(Parts[1], 1, 4)), StrToInt(Copy(Parts[1], 6, 2)), StrToInt(Copy(Parts[1], 9, 2)));
      AInfo.ExpireDate := EncodeDate(StrToInt(Copy(Parts[2], 1, 4)), StrToInt(Copy(Parts[2], 6, 2)), StrToInt(Copy(Parts[2], 9, 2)));
      AInfo.MaxClients := StrToIntDef(Parts[3], 1);
      AInfo.LicenseType := Parts[4];
      ExpectedHash := Parts[5];

      // Check Hash Checksum
      if SimpleHash(AInfo.HWID + '|' + Parts[1] + '|' + Parts[2] + '|' + Parts[3] + '|' + Parts[4] + '|' + LICENSE_SALT) <> ExpectedHash then
      begin
        AInfo.StatusText := 'รหัสลงทะเบียนถูกดัดแปลง (Checksum Error)';
        Exit;
      end;

      // Check HWID Match
      MyHWID := GetMachineHWID;
      if SameText(AInfo.HWID, MyHWID) = False then
      begin
        AInfo.StatusText := 'รหัสลงทะเบียนไม่ตรงกับเครื่องนี้ (HWID Mismatch)';
        Exit;
      end;

      // Check Expiration
      CurrDate := Date;
      AInfo.DaysLeft := DaysBetween(AInfo.ExpireDate, CurrDate);
      if CurrDate > AInfo.ExpireDate then
      begin
        AInfo.IsRegistered := False;
        AInfo.DaysLeft := 0;
        AInfo.StatusText := 'สิทธิ์การใช้งานหมดอายุแล้ว (' + DateToStr(AInfo.ExpireDate) + ')';
        Exit;
      end;

      AInfo.IsRegistered := True;
      AInfo.StatusText := 'ลงทะเบียนเรียบร้อย (หมดอายุ: ' + DateToStr(AInfo.ExpireDate) + ' เหลือ ' + IntToStr(AInfo.DaysLeft) + ' วัน)';
      Result := True;
    finally
      Parts.Free;
    end;
  except
    on E: Exception do
    begin
      AInfo.IsRegistered := False;
      AInfo.StatusText := 'เกิดข้อผิดพลาดในการตรวจสอบรหัส: ' + E.Message;
    end;
  end;
end;

procedure EnsureLicenseTableExists;
begin
  with Dm do
  begin
    if ZConnection1.Connected then
    begin
      ZExecQuery.Close;
      ZExecQuery.SQL.Text := 'SELECT 1 FROM RDB$RELATIONS WHERE RDB$RELATION_NAME = ''SYSTEM_LICENSE''';
      try ZExecQuery.Open; except end;

      if ZExecQuery.IsEmpty then
      begin
        ZExecQuery.Close;
        ZExecQuery.SQL.Text :=
          'CREATE TABLE SYSTEM_LICENSE (' +
          '  ID INTEGER NOT NULL PRIMARY KEY, ' +
          '  SERVER_HWID VARCHAR(100), ' +
          '  LICENSE_TYPE VARCHAR(20), ' +
          '  REG_DATE DATE, ' +
          '  EXPIRE_DATE DATE, ' +
          '  MAX_CLIENTS INTEGER, ' +
          '  LICENSE_KEY VARCHAR(500), ' +
          '  LAST_ACTIVE_DATE DATE, ' +
          '  STATUS INTEGER ' +
          ')';
        try ZExecQuery.ExecSQL; except end;
      end;
      ZExecQuery.Close;
    end;
  end;
end;

function SaveLicenseToDB(const AKey: string; const AInfo: TLicenseInfo): Boolean;
begin
  Result := False;
  EnsureLicenseTableExists;
  with Dm do
  begin
    if ZConnection1.Connected then
    begin
      ZExecQuery.Close;
      ZExecQuery.SQL.Text := 'DELETE FROM SYSTEM_LICENSE';
      try ZExecQuery.ExecSQL; except end;

      ZExecQuery.SQL.Text :=
        'INSERT INTO SYSTEM_LICENSE (ID, SERVER_HWID, LICENSE_TYPE, REG_DATE, EXPIRE_DATE, MAX_CLIENTS, LICENSE_KEY, LAST_ACTIVE_DATE, STATUS) ' +
        'VALUES (1, :pHWID, :pType, :pRegDate, :pExpDate, :pMaxClients, :pKey, :pLastDate, :pStatus)';
      ZExecQuery.ParamByName('pHWID').AsString := AInfo.HWID;
      ZExecQuery.ParamByName('pType').AsString := AInfo.LicenseType;
      ZExecQuery.ParamByName('pRegDate').AsDateTime := AInfo.RegDate;
      ZExecQuery.ParamByName('pExpDate').AsDateTime := AInfo.ExpireDate;
      ZExecQuery.ParamByName('pMaxClients').AsInteger := AInfo.MaxClients;
      ZExecQuery.ParamByName('pKey').AsString := AKey;
      ZExecQuery.ParamByName('pLastDate').AsDateTime := Date;
      if AInfo.IsRegistered then
        ZExecQuery.ParamByName('pStatus').AsInteger := 1
      else
        ZExecQuery.ParamByName('pStatus').AsInteger := 0;

      try
        ZExecQuery.ExecSQL;
        Result := True;
      except
        Result := False;
      end;
    end;
  end;
end;

function CheckCurrentLicense(var AInfo: TLicenseInfo): Boolean;
var
  SavedKey: string;
begin
  Result := False;
  FillChar(AInfo, SizeOf(AInfo), 0);
  AInfo.StatusText := 'ยังไม่ได้ลงทะเบียน';

  EnsureLicenseTableExists;
  with Dm do
  begin
    if ZConnection1.Connected then
    begin
      ZExecQuery.Close;
      ZExecQuery.SQL.Text := 'SELECT * FROM SYSTEM_LICENSE WHERE ID = 1';
      try ZExecQuery.Open; except end;

      if ZExecQuery.Active and not ZExecQuery.IsEmpty then
      begin
        SavedKey := ZExecQuery.FieldByName('LICENSE_KEY').AsString;
        Result := ValidateLicenseKey(SavedKey, AInfo);

        // Update LAST_ACTIVE_DATE for Anti-Clock Rollback check
        if Result and (Date >= ZExecQuery.FieldByName('LAST_ACTIVE_DATE').AsDateTime) then
        begin
          ZExecQuery.Close;
          ZExecQuery.SQL.Text := 'UPDATE SYSTEM_LICENSE SET LAST_ACTIVE_DATE = :pDate WHERE ID = 1';
          ZExecQuery.ParamByName('pDate').AsDateTime := Date;
          try ZExecQuery.ExecSQL; except end;
        end;
      end;
      ZExecQuery.Close;
    end;
  end;
end;

end.
