unit Utils;

interface

uses
  Windows, SysUtils, Graphics, Controls, Forms, NiceGrid, Classes, SortListViews,
  IniFiles, ComCtrls, NB30;

procedure RestorePos(Sender: TControl; dim: String = '');
procedure WritePos(Sender: TControl; dim: String = '');
procedure WriteStr(const Section, Ident, Value: String);
function  ReadStr(const Section, Ident, Default: String): String;
procedure WriteInt(const Section, Ident: String; Value: Longint);
function  ReadInt(const Section, Ident: String; Default: Longint): Longint;
procedure WriteFont(const Section, Ident: String; Value: TFont);
function  Get_MACAddress: string;
function  GetMACAddress(PCName: string) : string;
function  ReadFont(const Section, Ident: String; Default: TFont): TFont;
function  FindShowForm(FormClass: TFormClass; const Caption: string = ''): TForm;
function  IniStr(Section,Idents,DeflThai,DeflEng: String; Languages:Byte): String;
function  AltLang(Thai,Eng: String; Lang:Byte): String;
function  TxtToFloat(StrNum: String):Extended;
function  TxtToFloat1(StrNum: String):Extended;
Function  AutoNo(NoCount: Byte; LastNo: String):String;
Function  AutoNum(LastNo: String):String;
function  foundChar(Str: String;Chr: Char): Boolean;
function  GetComputerName: string;
function  GetAppVersion:string;
function  EnDeCrypt(const Value : String) : String;

//procedure SortNiceGrid(var GenStrGrid: TNiceGrid; ThatCol: Integer);
//procedure SortNiceGrid1(var GenStrGrid: TNiceGrid; ThatCol: Integer);

implementation


function EnDeCrypt(const Value : String) : String;
var
  CharIndex : integer;
begin
  Result := Value;
  for CharIndex := 1 to Length(Value) do
    Result[CharIndex] := chr(not(ord(Value[CharIndex])));
end;

function GetAdapterInfo(Lana: Char): String;
var
  Adapter: TAdapterStatus;
  NCB: TNCB;
begin
  FillChar(NCB, SizeOf(NCB), 0);
  NCB.ncb_command := Char(NCBRESET);
  NCB.ncb_lana_num := Lana;
  if Netbios(@NCB) <> Char(NRC_GOODRET) then
  begin
    Result := 'mac not found';
    Exit;
  end;

  FillChar(NCB, SizeOf(NCB), 0);
  NCB.ncb_command := Char(NCBASTAT);
  NCB.ncb_lana_num := Lana;
  NCB.ncb_callname := '*';

  FillChar(Adapter, SizeOf(Adapter), 0);
  NCB.ncb_buffer := @Adapter;
  NCB.ncb_length := SizeOf(Adapter);
  if Netbios(@NCB) <> Char(NRC_GOODRET) then
  begin
    Result := 'mac not found';
    Exit;
  end;
  Result :=
    IntToHex(Byte(Adapter.adapter_address[0]), 2) + '-' +
    IntToHex(Byte(Adapter.adapter_address[1]), 2) + '-' +
    IntToHex(Byte(Adapter.adapter_address[2]), 2) + '-' +
    IntToHex(Byte(Adapter.adapter_address[3]), 2) + '-' +
    IntToHex(Byte(Adapter.adapter_address[4]), 2) + '-' +
    IntToHex(Byte(Adapter.adapter_address[5]), 2);
end;


function Get_MACAddress: string;
var
 AdapterList: TLanaEnum; 
 NCB: TNCB; 
begin 
 FillChar(NCB, SizeOf(NCB), 0); 
 NCB.ncb_command := Char(NCBENUM); 
 NCB.ncb_buffer := @AdapterList; 
 NCB.ncb_length := SizeOf(AdapterList); 
 Netbios(@NCB); 
 if Byte(AdapterList.length) > 0 then
   Result := GetAdapterInfo(AdapterList.lana[0]) 
end;

function GetMACAddress(PCName: string) : string;
type
  TASTAT = packed record
    adapt: nb30.TADAPTERSTATUS;
    NameBuff: array [0..30] of TNAMEBUFFER;
  end;
  var
  NCB: TNCB;
  Tmp: String;
  pASTAT: Pointer;
  AST: TASTAT;
begin
  // The IBM NetBIOS 3.0 specifications defines four basic
  // NetBIOS environments under the NCBRESET command. Win32
  // follows the OS/2 Dynamic Link Routine (DLR) environment.
  // This means that the first NCB issued by an application
  // must be a NCBRESET, with the exception of NCBENUM.
  // The Windows NT implementation differs from the IBM
  // NetBIOS 3.0 specifications in the NCB_CALLNAME field.
  FillChar(NCB, SizeOf(NCB), 0);
  NCB.ncb_command := Chr(NCBRESET);
  NetBios(@NCB);

  // To get the Media Access Control (MAC) address for an
  // ethernet adapter programmatically, use the Netbios()
  // NCBASTAT command and provide a "*" as the name in the
  // NCB.ncb_CallName field (in a 16-chr string).
  // NCB.ncb_callname = "* "
  FillChar(NCB, SizeOf(NCB), 0);
  FillChar(NCB.ncb_callname[0], 16, ' ');
  Move(PCName[1], NCB.ncb_callname[0], Length(PCName));
  NCB.ncb_command := Chr(NCBASTAT);

  // For machines with multiple network adapters you need to
  // enumerate the LANA numbers and perform the NCBASTAT
  // command on each. Even when you have a single network
  // adapter, it is a good idea to enumerate valid LANA numbers
  // first and perform the NCBASTAT on one of the valid LANA
  // numbers. It is considered bad programming to hardcode the
  // LANA number to 0 (see the comments section below).
  NCB.ncb_lana_num := #0;
  NCB.ncb_length := SizeOf(AST);

  GetMem(pASTAT, NCB.ncb_length);

  if pASTAT=nil then
  begin
    result := 'memory allocation failed!';
    exit;
  end;
  NCB.ncb_buffer := pASTAT;
  NetBios(@NCB);

  Move(NCB.ncb_buffer, AST, SizeOf(AST));

  with AST.adapt do
    Tmp := Format('%.2x-%.2x-%.2x-%.2x-%.2x-%.2x',
             [ord(adapter_address[0]), ord(adapter_address[1]), ord(adapter_address[2]),
              ord(adapter_address[3]), ord(adapter_address[4]), ord(adapter_address[5])]);

  FreeMem(pASTAT);
  Result := Tmp;
end;

function GetComputerName: string;
var
  buffer: array[0..MAX_COMPUTERNAME_LENGTH + 1] of Char;
  Size: Cardinal;
begin
  Size := MAX_COMPUTERNAME_LENGTH + 1;
  Windows.GetComputerName(@buffer, Size);
  Result := StrPas(buffer);
end;

function IsNetConnect: Boolean;
begin
  if GetSystemMetrics(SM_NETWORK) and $01 = $01 then Result := True
  else
    Result := False;
end;{function}

function  GetAppVersion:string;
var
    Size, Size2: DWord;
    Pt, Pt2: Pointer;
begin
     Size := GetFileVersionInfoSize(PChar (ParamStr (0)), Size2);
     if Size > 0 then
     begin
       GetMem (Pt, Size);
       try
          GetFileVersionInfo (PChar (ParamStr (0)), 0, Size, Pt);
          VerQueryValue (Pt, '\', Pt2, Size2);
          with TVSFixedFileInfo (Pt2^) do
          begin
            //Result:= ' Version '+
            Result:=
                     IntToStr (HiWord (dwFileVersionMS)) + '.' +
                     IntToStr (LoWord (dwFileVersionMS)) + '.' +
                     IntToStr (HiWord (dwFileVersionLS)) + '.' +
                     IntToStr (LoWord (dwFileVersionLS));
         end;
       finally
         FreeMem (Pt);
       end;
     end;
end;

function foundChar(Str: String;Chr: Char): Boolean;
Var
   i: integer;
begin
  result := false;
  for i := 1 to length(str) do
    if Str[i] = Chr then
      result := true;
end;

{
function TxtToFloat(StrNum: String):Extended;
Var
  returnNum : String;
  i: integer;
begin
  if (StrNum <> '') then
  begin
   try
      result := StrTofloat(StrNum);
   except
    for i := 0 to length(StrNum) do
    begin
      if (StrNum[i] in ['0'..'9','.','-']) then
      returnNum := ReturnNum + String(strNum[i]);
    end;
    if returnNum = '-' then
      result := 0
    else
      result :=strToFloat(ReturnNum);
   end;
  end
  else result := 0;
end;
}

function TxtToFloat(StrNum: String):Extended;
var S,ParsedStr: string;
    Flags : TReplaceFlags;
begin
  S := StrNum;
  if S <> '' then
  begin
    if (Pos(',', S) > 0) then
    begin
      Result := StrToFloat(StringReplace(S,',','', [rfReplaceAll]));
    end
    else
    begin
      Result := StrToFloat(S);
    end;
  end
  else Result := 0;
end;

function TxtToFloat1(StrNum: String):Extended;
var S,ParsedStr: string;
    Flags : TReplaceFlags;
begin
  S := StrNum;
  Result := 0;
  if (Pos(',', S)>0) then
  begin
    Flags:=[];
    Flags:=[rfReplaceAll,rfIgnoreCase];
    parsedStr := StringReplace(S, ',', '', Flags);
    Result := StrToFloat(parsedStr);
  end
  else
  begin
    Result := StrToFloat(S);
  end;
end;

Function IniStr(Section,Idents,DeflThai,DeflEng: String; Languages:Byte): String;
Var IniFile: TIniFile;
Begin
  Case Languages of
    0 : begin
          IniFile := TIniFile.Create(
              ExtractFilePath(Application.ExeName)+'\Thai.lng');
          Result := IniFile.ReadString(Section,Idents,DeflThai);
        end;
    1 : begin
          IniFile := TIniFile.Create(
              ExtractFilePath(Application.ExeName)+'\Eng.lng');
          Result := IniFile.ReadString(Section,Idents,DeflEng);
        end;
  end;
  IniFile.Free;
end;

Function AltLang(Thai,Eng: String; Lang:Byte): String;
Begin
  Case Lang of
    0 : begin
          Result := Thai;
        end;
    1 : begin
          Result := Eng;
        end;
  end;
end;

procedure RestorePos(Sender: TControl; dim: String = '');
var
  MyIni: TIniFile;
  strO, strS: String;
begin
try
  MyIni := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));

  if Sender is TForm then
  begin
    if MyIni.ValueExists(Sender.Name, 'State') then
    begin
      if MyIni.ReadInteger(Sender.Name, 'State', -1) = 1 then
      begin
        (Sender as TForm).WindowState := wsMinimized;
        Exit;
      end;

      if MyIni.ReadInteger(Sender.Name, 'State', -1) = 2 then
      begin
        (Sender as TForm).WindowState := wsMaximized;
        Exit;
      end;
    end;
    if (MyIni.ValueExists(Sender.Name, 'Left') AND ((dim = '') OR (dim = 'l'))) then
    Sender.Left := MyIni.ReadInteger(Sender.Name, 'Left', -1);

    if (MyIni.ValueExists(Sender.Name, 'Top') AND ((dim = '') OR (dim = 't'))) then
      Sender.Top := MyIni.ReadInteger(Sender.Name, 'Top', -1);

    if (MyIni.ValueExists(Sender.Name, 'Height') AND ((dim = '') OR (dim = 'h'))) then
      Sender.Height := MyIni.ReadInteger(Sender.Name, 'Height', -1);

    if (MyIni.ValueExists(Sender.Name, 'Width') AND ((dim = '') OR (dim = 'w'))) then
      Sender.Width := MyIni.ReadInteger(Sender.Name, 'Width', -1);
  end
  else
  begin
  strO := Sender.Owner.Name;
  strS := Sender.Name;

  if (MyIni.ValueExists(strO, strS + '_Left') AND ((dim = '') OR (dim = 'l'))) then
    Sender.Left := MyIni.ReadInteger(strO, strS + '_Left', -1);

  if (MyIni.ValueExists(strO, strS + '_Top') AND ((dim = '') OR (dim = 't'))) then
    Sender.Top := MyIni.ReadInteger(strO, strS + '_Top', -1);

  if (MyIni.ValueExists(strO, strS + '_Height') AND ((dim = '') OR (dim = 'h'))) then
    Sender.Height := MyIni.ReadInteger(strO, strS + '_Height', -1);

  if (MyIni.ValueExists(strO, strS + '_Width') AND ((dim = '') OR (dim = 'w'))) then
    Sender.Width := MyIni.ReadInteger(strO, strS + '_Width', -1);

  end;
finally
  MyIni.Free;
end;
end;

procedure WritePos(Sender: TControl; dim: String = '');
var
  MyIni: TIniFile;
  strO, strS: String;
begin
try
  MyIni := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));

  if Sender is TForm then
  begin
    if (Sender as TForm).WindowState = wsMinimized then
    begin
      MyIni.WriteInteger(Sender.Name, 'State', 1);
      Exit;
    end;
    if (Sender as TForm).WindowState = wsMaximized	 then
    begin
      MyIni.WriteInteger(Sender.Name, 'State', 2);
      Exit;
    end;
    if (Sender as TForm).WindowState = wsNormal then
      MyIni.WriteInteger(Sender.Name, 'State', 0);

    if (dim = '') OR (dim = 'l') then
      MyIni.WriteInteger(Sender.Name, 'Left', Sender.Left);
    if (dim = '') OR (dim = 't') then
      MyIni.WriteInteger(Sender.Name, 'Top', Sender.Top);
    if (dim = '') OR (dim = 'h') then
      MyIni.WriteInteger(Sender.Name, 'Height', Sender.Height);
    if (dim = '') OR (dim = 'w') then
      MyIni.WriteInteger(Sender.Name, 'Width', Sender.Width);
  end
  else
  begin
  strO := Sender.Owner.Name;
  strS := Sender.Name;

  if (dim = '') OR (dim = 'l') then
    MyIni.WriteInteger(strO, strS + '_Left', Sender.Left);
  if (dim = '') OR (dim = 't') then
    MyIni.WriteInteger(strO, strS + '_Top', Sender.Top);
  if (dim = '') OR (dim = 'h') then
    MyIni.WriteInteger(strO, strS + '_Height', Sender.Height);
  if (dim = '') OR (dim = 'w') then
    MyIni.WriteInteger(strO, strS + '_Width', Sender.Width);
  end;
finally
  MyIni.Free;
end;
end;

procedure WriteStr(const Section, Ident, Value: String);
var
  MyIni: TIniFile;
begin
try
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Settings.ini');

  MyIni.WriteString(Section, Ident, Value);

finally
  MyIni.Free;
end;
end;

function ReadStr(const Section, Ident, Default: String): String;
var
  MyIni: TIniFile;
begin
try
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Settings.ini');

  Result := MyIni.ReadString(Section, Ident, Default);

finally
  MyIni.Free;
end;
end;

procedure WriteFont(const Section, Ident: String; Value: TFont);
var
  MyIni: TIniFile;
begin
  try
    MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Settings.ini');

    MyIni.WriteInteger(Section, Ident + '_Charset', Value.Charset);
    MyIni.WriteInteger(Section, Ident + '_Color', Value.Color);
    MyIni.WriteInteger(Section, Ident + '_Height', Value.Height);
    MyIni.WriteString(Section, Ident + '_Name', Value.Name);
    MyIni.WriteInteger(Section, Ident + '_Size', Value.Size);
    case Value.Pitch of
      fpDefault: MyIni.WriteInteger(Section, Ident + '_Pitch', 0);
      fpFixed: MyIni.WriteInteger(Section, Ident + '_Pitch', 1);
      fpVariable: MyIni.WriteInteger(Section, Ident + '_Pitch', 2);
    end;
    if fsBold in Value.Style then
      MyIni.WriteInteger(Section, Ident + '_fsBold', 1)
    else
      MyIni.WriteInteger(Section, Ident + '_fsBold', 0);

    if fsItalic	 in Value.Style then
      MyIni.WriteInteger(Section, Ident + '_fsItalic', 1)
    else
      MyIni.WriteInteger(Section, Ident + '_fsItalic', 0);

    if fsUnderline	 in Value.Style then
      MyIni.WriteInteger(Section, Ident + '_fsUnderline', 1)
    else
      MyIni.WriteInteger(Section, Ident + '_fsUnderline', 0);

    if fsStrikeOut	 in Value.Style then
      MyIni.WriteInteger(Section, Ident + '_fsStrikeOut', 1)
    else
      MyIni.WriteInteger(Section, Ident + '_fsStrikeOut', 0);

  finally
    MyIni.Free;
  end;
end;

function ReadFont(const Section, Ident: String; Default: TFont): TFont;
var
  MyIni: TIniFile;
  f: TFont;
  p: Integer;
begin
  try
    MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Settings.ini');
    f := TFont.Create;

    f.Charset := MyIni.ReadInteger(Section, Ident + '_Charset', Default.Charset);
    f.Color := MyIni.ReadInteger(Section, Ident + '_Color', Default.Color);
    f.Height := MyIni.ReadInteger(Section, Ident + '_Height', Default.Height);
    f.Name := MyIni.ReadString(Section, Ident + '_Name', Default.Name);
    f.Size := MyIni.ReadInteger(Section, Ident + '_Size', Default.Size);

    case Default.Pitch of
      fpDefault: p := 0;
      fpFixed: p := 1;
      fpVariable:  p := 2;
    end;
    p := MyIni.ReadInteger(Section, Ident + '_Pitch', p);
    case p of
      0: f.Pitch := fpDefault;
      1: f.Pitch := fpFixed;
      2: f.Pitch := fpVariable;
    end;

    if fsBold in Default.Style then p := 1 else p := 0;
    p := MyIni.ReadInteger(Section, Ident + '_fsBold', p);
    if p = 1 then f.Style := f.Style + [fsBold] else f.Style := f.Style - [fsBold];

    if fsItalic in Default.Style then p := 1 else p := 0;
    p := MyIni.ReadInteger(Section, Ident + '_fsItalic', p);
    if p = 1 then f.Style := f.Style + [fsItalic] else f.Style := f.Style - [fsItalic];

    if fsUnderline in Default.Style then p := 1 else p := 0;
    p := MyIni.ReadInteger(Section, Ident + '_fsUnderline', p);
    if p = 1 then f.Style := f.Style + [fsUnderline] else f.Style := f.Style - [fsUnderline];

    if fsStrikeOut in Default.Style then p := 1 else p := 0;
    p := MyIni.ReadInteger(Section, Ident + '_fsStrikeOut', p);
    if p = 1 then f.Style := f.Style + [fsStrikeOut] else f.Style := f.Style - [fsStrikeOut];


    Result := f;
  finally
    MyIni.Free;
  end;
end;

procedure WriteInt(const Section, Ident: String; Value: Longint);
var
  MyIni: TIniFile;
begin
try
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Settings.ini');

  MyIni.WriteInteger(Section, Ident, Value);

finally
  MyIni.Free;
end;
end;

function ReadInt(const Section, Ident: String; Default: Longint): Longint;
var
  MyIni: TIniFile;
begin
try
  MyIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Settings.ini');

  Result := MyIni.ReadInteger(Section, Ident, Default);

finally
  MyIni.Free;
end;
end;

function FindShowForm(FormClass: TFormClass; const Caption: string = ''): TForm;
var
  I: Integer;
begin
  Screen.Cursor := crSQLWait;
  try
    Result := nil;
    for I := 0 to Screen.FormCount - 1 do begin
      if Screen.Forms[I] is FormClass then
        if (Caption = '') or (Caption = Screen.Forms[I].Caption) then begin
          Result := Screen.Forms[I];
          Break;
        end;
    end;
    if Result = nil then begin
      Application.CreateForm(FormClass, Result);
      if Caption <> '' then Result.Caption := Caption;
    end;
    with Result do begin
      if ((WindowState = wsNormal)or(WindowState = wsMinimized)) then WindowState :=  wsMaximized;  //;
      Show;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

Function AutoNo(NoCount: Byte; LastNo: String):String;
Var CurVal,LenNo,ZeroLen,CurValLen,i: integer;
    ZeroLead: String;
begin
  if LastNo <> '' then
  begin
    LenNo     := length(IntToStr(StrToInt(LastNo)));
    CurVal    := StrToInt(LastNo);
    CurVallen := length(intTostr(Curval+1));
    ZeroLen   := NoCount-LenNo;
    if Zerolen < lenNo then
      Zerolen := 0;

    ZeroLead  := '';
    if ZeroLen <> 0 then
    for i:=1 to Zerolen do
      ZeroLead := ZeroLead+'0';

    result := ZeroLead+IntToStr(CurVal+1);
  end
  else Result := '0001';
end;

Function AutoNum(LastNo: String):String;
Var CurVal,LenNo,ZeroLen,CurValLen,i: integer;
    ZeroLead,fCode,RCode: String;
begin
  if LastNo <> '' then
  begin
    LenNo := length(LastNo);

    for i:=LenNo DownTo 1 do
    begin
      if Not (lastNo[i] in ['0'..'9']) then
      break;
    end;
    fCode := Copy(LastNo,1,i);
    rCode := Copy(LastNo,i+1,LenNo);
    LenNo := Length(rCode);


    CurVal := StrToInt(rCode);
    CurVallen := length(intTostr(Curval+1));
    ZeroLen := lenNo-CurValLen;

    ZeroLead := '';
    if ZeroLen <> 0 then
    for i:=1 to Zerolen do
    ZeroLead := ZeroLead+'0';
    result := fcode+ZeroLead+IntToStr(CurVal+1);
  end
  else Result := '000001';
end;


end.
