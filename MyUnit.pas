unit MyUnit;

interface       

Uses
     SysUtils,DbTables,Windows,BDE,Inifiles,Forms,Registry, Zip, ShlObj, ActiveX,
     Dialogs;

Const Key = 'AZCXEVGTIR';     

procedure Create_Registry;
procedure Write_Registry(SECTION,REGSTR,VALUES: STRING);
Function  Read_RegistKey(SECTION,RegStr:String): String;
procedure Write_RegBool(SECTION,Ident: String; VALUES: Boolean);
Function  Read_RegBool(SECTION,Ident:String): Boolean;
Function  Read_RegInt(SECTION,Ident:String): Integer;
procedure Write_RegInt(SECTION,Ident: String; VALUES: Integer);
Function  ExtractShotDir(ShotDir: String) : String;

function  KeepNumChar(St: String): String;
function  Date8Digit(Dates :TDateTime):String;
function  Alter(Str: String):String;
function  DateToChr(StrDate:String):String;
function  ChrToDate(StrDate:String):String;
function  DateFromCode1(Code: String):TDateTime;
function  DateFromCode(Code: String):TDateTime;
function  ExprFromKey(Code: String):TDateTime;
function  ActiveDate(Code: String):Boolean;
function  ShowDiskData(Drive: string): string;
Function  EncodeId(SoftID: string): String;
Function  EncodeId1(SoftID: string): String;
Function  Registered(regisNum:String): Boolean;
Function  Registered1(regisNum:String; Drive: String): Boolean;
Function  IsRegMac(regisNum:String): Boolean;
function  CryptString(const S, Key: string): string;
function  CryptString1(Stri, Strk: String): String;
//procedure AddFolderToZip(TarGet: String);
procedure AddFolderToZip(DbName: String; TarGet: String; ShowMss: Boolean);
procedure ExtractFolderZip(Zipfile,TargetFolders: String);
function LeftPad(value: integer; digit: Integer): string;


Var
  DBPath: String;
  FIniFile: TIniFile;
  Softkey,Regiskeys: String;
  FREGIniFile: TRegIniFile;

implementation

Uses EncDec, Utils;

function LeftPad(value: integer; digit: Integer): string;
begin
   result := Format('%.*d',[digit, value]);
end;

function KeepNumChar(St: String): String;
Var i: integer;
begin
  for i := 1 to length(St) do
    if St[i] in ['0'..'9','a'..'z','A'..'Z'] then
      Result := Result+St[i];
end;

function Date8Digit(Dates :TDateTime):String;
Var d,m,y:word;
    dd,mm,yyyy: String;
begin
  DecodeDate(Dates,y,m,d);
  if d < 10 then dd := '0'+IntToStr(d) else dd := IntToStr(d);
  if m < 10 then mm := '0'+IntToStr(m) else mm := IntToStr(m);
  yyyy := IntToStr(y);

  result := dd+mm+yyyy;
end;

function Alter(Str: String):String;
Var i: integer;
    rs : String;
begin
  for i := length(Str) Downto 1 do
  begin
    rs := rs+String(Str[i]);
  end;
  result := rs;
end;

function DateToChr(StrDate:String):String;
var i: integer;
    Temp: String;
begin
  Temp := '';
  for i := 1 to length(StrDate) do
  begin
    Temp := Temp + Key[StrToInt(String(StrDate[i]))+1];
  end;
  result := Temp;
end;

function ChrToDate(StrDate:String):String;
var i: integer;
    Temp: String;
begin
  Temp := '';
  for i := 1 to length(StrDate) do
  begin
    Temp := Temp + IntToStr(Pos(StrDate[i], Key)-1);//  Key[StrToInt(String(StrDate[i]))+1];
  end;
  result := Temp;
end;

function DateFromCode1(Code: String):TDateTime;
Var fDate,ldate,StDate: String;
begin
  fDate  := Copy(Code,1,3);
  lDate  := Copy(Code,length(Code)-4,5);
  stDate := Alter(fdate+ldate);
  stDate := ChrToDate(StDate);
  Result := StrToDate(copy(stDate,1,2)+'/'+copy(stDate,3,2)+'/'+Copy(stDate,5,4));
end;

function DateFromCode(Code: String):TDateTime;
Var fDate,ldate,StDate: String;
begin
  fDate := Copy(Code,1,3);
  lDate := Copy(Code,length(Code)-4,5);
  stDate := Alter(fdate+ldate);
  Result := StrToDate(copy(stDate,1,2)+'/'+copy(stDate,3,2)+'/'+Copy(stDate,5,4));
end;

function ExprFromKey(Code: String):TDateTime;
Var fDate,ldate,StDate: String;
    d,m,y: String;
    DateStart, DateExpire: TDateTime;
begin
  fDate  := Copy(Code,1,3);
  lDate  := Copy(Code,length(Code)-4,5);
  stDate := Alter(fdate+ldate);
  stDate := ChrToDate(stDate); //เพิ่มเข้ามา
  //Showmessage(stDate);

  Try
    d :=  copy(stDate,1,2);
    m :=  copy(stDate,3,2);
    y :=  copy(stDate,5,4);

    DateExpire := StrToDate(d+'/'+m+'/'+IntToStr(StrToInt(y)+1));

    result := DateExpire;
  except

  end

end;

function ActiveDate(Code: String):Boolean;
Var fDate,ldate,StDate: String;
    d,m,y: String;
    DateExpire: TDateTime;
begin
  fDate  := Copy(Code,1,3);
  lDate  := Copy(Code,length(Code)-4,5);
  stDate := Alter(fdate+ldate);
  stDate := ChrToDate(stDate); //เพิ่มเข้ามา

  Try
    d :=  copy(stDate,1,2);
    m :=  copy(stDate,3,2);
    y :=  copy(stDate,5,4);

    DateExpire := StrToDate(d+'/'+m+'/'+IntToStr(StrToInt(y)+1));

    //result := DateExpire > Date;
    result := DateExpire > StrToDate(DecodeString(Read_RegistKey('Config','LastDate')));

  except
    result := false;
  end

end;

procedure Create_Registry;
begin
  FREGIniFile := TRegIniFile.Create('Software\BLT');
end;

procedure Write_Registry(SECTION,REGSTR,VALUES: STRING);
begin
  FREGIniFile.WriteString(SECTION, REGSTR,VALUES);
end;

Function Read_RegistKey(SECTION,RegStr:String): String;
begin
  Result := FREGIniFile.ReadString(SECTION,RegStr, '');
end;

procedure Write_RegBool(SECTION,Ident: String; VALUES: Boolean);
begin
  FREGIniFile.WriteBool(SECTION, Ident,VALUES);
end;

Function Read_RegBool(SECTION,Ident:String): Boolean;
begin
  Result := FREGIniFile.ReadBool(SECTION,Ident, false);
end;

procedure Write_RegInt(SECTION,Ident: String; VALUES: Integer);
begin
  FREGIniFile.WriteInteger(SECTION, Ident,VALUES);
end;

Function Read_RegInt(SECTION,Ident:String): Integer;
begin
  Result := FREGIniFile.ReadInteger(SECTION,Ident, 7);
end;

Function ExtractShotDir(ShotDir: String) : String;
begin
  Result := ExtractFilePath(ParamStr(0));
  Result := ExpandFileName(Result + ShotDir);
end;

function StripPathSlash(const path: string): string;
var
  i: integer;
begin
  result := path;
  i := length(path);
  if (i > 3) and (path[i] = '\') then setlength(result,i-1);
end;

function BrowseProc(hwnd: HWnd; uMsg: integer; lParam, lpData: LPARAM): integer; stdcall;
var
  Dir: array[0..MAX_PATH] of char;
begin
  case uMsg of
    BFFM_INITIALIZED:
      begin
        SendMessage(hwnd, BFFM_SETSTATUSTEXT, 0, lpData);
        SendMessage(hwnd, BFFM_SETSELECTION, 1, lpData);
      end;
    BFFM_SELCHANGED:
      if(SHGetPathFromIDList(PItemIDList(lParam), Dir)) then
        SendMessage(hwnd, BFFM_SETSTATUSTEXT, 0, integer(@Dir[0]));
  end;
  result := 0;
end;

function GetFolder(OwnerHdl: THandle;
  var Folder: string; const Title: string): boolean;
var
  displayname: array[0..MAX_PATH] of char;
  bi: TBrowseInfo;
  pidl: PItemIdList;
begin
  CoInitialize(NIL);
  bi.hWndOwner := OwnerHdl;
  bi.pIDLRoot := nil;
  bi.pszDisplayName := pchar(@displayname[0]);
  bi.lpszTitle := pchar(Title);
  bi.ulFlags := BIF_RETURNONLYFSDIRS or BIF_STATUSTEXT;
  if Folder = '' then
  begin
    bi.lpfn := nil;
    bi.lParam := 0;
  end else
  begin
    Folder := StripPathSlash(Folder);
    bi.lpfn := @BrowseProc;
    bi.lParam := integer(pchar(Folder));
  end;
  bi.iImage := 0;
  pidl := SHBrowseForFolder(bi);
  result := pidl <> nil;
  if not result then exit;
  try
    result := SHGetPathFromIDList(pidl,pchar(@displayname[0]));
    Folder := displayname;
  finally
    CoTaskMemFree(pidl);
  end;
end;

procedure AddFolderToZip(DBName: String; TarGet: String; ShowMss: Boolean);
var
  AppFolder, DataFolder,DataFile: string;
  addCnt: integer;
  Day,month,year: Word;
  Sec, Min, Hour, Msec: Word;
  zip : Tzip;
  IniFile: TiniFile;
begin

  zip := Tzip.create(nil);
  AppFolder := ExtractFilePath(Application.exeName);
  DataFolder := AppFolder+'Data';

  //Showmessage(Target);
  //Showmessage(DBName);

  //IniFile  := TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
  //DataFile := IniFile.ReadString('DB','DBFile',DataFolder+'\LNUM.LUX');
  DataFile := DBName; //DataFolder+'\LNUM.LUX';

  DecodeTime(Now, Hour, Min, Sec, MSec);
  Decodedate(Date,year,month,day);

  if not DirectoryExists(Target) then
    if not CreateDir(Target) then
      raise Exception.Create(Target);
  try
   zip.filename := Target+'\LNUM_'+IntToStr(year)+'_'+IntToStr(Month)+'_'+IntToStr(day)+'-'+
                   IntToStr(Hour)+'-'+IntToStr(Min)+'.ZIP';

   zip.AddPath := ExtractFileDir(DataFile);// DataFolder;
   //Showmessage(ExtractFileDir(DataFile));

   zip.FileSpecList.Add(ExtractFileName(DataFile));
   //zip.FileSpecList.Add(DataFile);
   //Showmessage(DataFile);
   //zip.FileSpecList.Add('LNUM.LUX');
   zip.AddOptions := [aoRecursive, aoFolderEntries]; //include all subfolders too.
   addCnt := zip.add;                  //DO IT HERE!!!
   //if ShowMss then
   //Showmessage(IntToStr(addCnt));
   if addCnt = 1 then
    MessageDlg('สำรองฐานข้อมูลไว้ใน "'+zip.filename+'" เสร็จเรียบร้อยแล้ว',mtInformation, [mbOk], 0)
  finally
   zip.Free;
    //IniFile.Free;
  end;

{
  AppFolder := ExtractFilePath(Application.exeName);
  DataFolder := AppFolder+'Data';

  IniFile  := TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
  DataFile := IniFile.ReadString('DB','DBFile',DataFolder+'\LNUM.LUX');
  DecodeTime(Now, Hour, Min, Sec, MSec);
  Decodedate(Date,year,month,day);

  zip := Tzip.create(nil);

  if not DirectoryExists(Target) then
    if not CreateDir(Target) then
      raise Exception.Create(Target);

  try
   zip.filename := Target+'\LNUM_'+IntToStr(year)+'_'+IntToStr(Month)+'_'+IntToStr(day)+'_'+
                  IntToStr(Hour)+'-'+IntToStr(Min)+'.ZIP';
   zip.AddPath := DataFolder;
   zip.FileSpecList.Add(ExtractFileName(DataFile));              //add everything in the folder and...
   //zip.AddOptions := [aoRecursive, aoFolderEntries]; //include all subfolders too.
   addCnt := zip.add;                  //DO IT HERE!!!
   if ShowMss then
    MessageDlg('สำรองฐานข้อมูลไว้ใน "'+zip.filename+'" เสร็จเรียบร้อยแล้ว',mtInformation, [mbOk], 0)
  finally
   zip.Free;
   IniFile.Free;
  end;
  }
end;

procedure ExtractFolderZip(Zipfile,TargetFolders: String);
var
  AppFolder, TargetFolder: string;
  addCnt : Integer;
  Zip : TZip;
begin
  Zip := Tzip.create(nil);
  zip.filename := Zipfile;
  //zip.ExtractPath := TargetFolders+'\';
  zip.ExtractPath := TargetFolders;
  zip.FileSpecList.IndexOfName('LNUM.MDB');
  zip.ExtractOptions := [eoWithPaths];
  addCnt := zip.Extract;
  Zip.Free;  
end;

function StrToOem(const AnsiStr: String) : String;
begin
  SetLength(result, Length(AnsiStr));
  if Length(result)>0 then
    CharToOem(PChar(AnsiStr), PChar(result))
end;

function TablePasswort(var table: ttable; password: String) : Boolean;
var
  pTblDesc : pCRTblDesc;
  hDb      : hDBIDb;
begin 
  result := false; 
  with table do 
  begin 
    if Active and (not Exclusive) then 
      Close; 
    if (not Exclusive) then 
      Exclusive := true; 
    if (not Active) then
      Open;
    hDb := DBHandle; 
    Close
  end; 
  GetMem(pTblDesc, sizeof(CRTblDesc)); 
  FillChar(pTblDesc^, sizeof(CRTblDesc), 0); 
  with pTblDesc^ do 
  begin 
    StrPCopy(szTblName, StrToOem(table.tablename));
    szTblType := szParadox;
    StrPCopy(szPassword, StrToOem(password)); 
    bPack := true; 
    bProtected := true
  end; 
  if DbiDoRestructure(hDb, 1, pTblDesc, nil, nil, nil, false)<>DBIERR_NONE then 
    exit; 
  if pTblDesc<>nil then 
    FreeMem(pTblDesc, sizeof(CRTblDesc)); 
  result := true
end;

procedure LoadIniSettings;
var
  DbFile : String;
begin
  FIniFile := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  with FIniFile do
  begin
    DBPath := ReadString('DB','Path','');
    DBFile := DBPath+'\'+'SongData.db';
  end;
end;

procedure SaveIniSettings;
begin
  FIniFile := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  with FIniFile do
  begin
    WriteString('DB','Path',DbPath);
  end;
end;

function ShowDiskData(Drive: string): string;
var
  VolSer : DWord;
  SysFlags, SysLen : DWord;
  i : integer;
  NamLen : integer;
  Buf : string;
  VolNameAry: array[0..255] of char;
  VolNameStr,fstSerial,DateStr : String;
  R_Date,R_Month,R_Year : Word;

begin
  { get Disk name (volume id) and serial number }
  if (Length(Drive) >= 3) then
     Buf := Copy(Drive, 1, 3)
  else
     Buf := '';
  NamLen:=255;
  SysLen:=255;

  if GetVolumeInformation(pChar(Buf), VolNameAry, NamLen,@VolSer, SysLen, SysFlags, nil, 0) then
     VolNameStr := StrPas(VolNameAry);
     //Showmessage(StrPas(VolNameAry));

  DecodeDate(Date,R_Year,R_Month,R_Date);
  DateStr := IntToStr(R_Date)+IntToStr(R_Month)+IntToStr(R_Year);

  for i := 1 to length(intTostr(volser)) do
    fstSerial := fstSerial+Copy(intTostr(volser),i,1)+intTostr(strToint(Copy(intTostr(volser),i,1))+3);

  result := 'B'+Copy(fstSerial,1,15); //เอาแค่ 16 ตัวแรก

{
  for i := 1 to length(intTostr(volser)+ EncodeId1('360110162')) do
  begin
    fstSerial := fstSerial+Copy(EncodeId1('360110162')+intTostr(volser),i,1);//+intTostr(strToint(Copy(intTostr(volser),i,1))+3);
    if (i Mod 4)=0 then
      fstSerial := fstSerial+'-'
  end;
  result := Copy(fstSerial,1,19); //เอาแค่ 19 ตัวแรก
}

end;

Function EncodeId(SoftID: string): String;
Var i: integer;
    DecodeID,rs: String;
    a,Ch: Char;
    KeyNo : integer;
begin
  DecodeID:='';
  rs:= '';
  for i:= 1 to length(SoftID) do
  begin
     a := softID[i];
     KeyNo := ord(a);
     Ch := chr(keyno+Round(i*3.125));
     //if ch in ['a'..'z','A'..'Z','1'..'9','?','=','\','/','@','#','$','!','_','-'] then
     //if ch in ['a'..'z','A'..'Z','1'..'9','?','=','\','/','@','#','$','!','_'] then
     if ch in ['a'..'z','A'..'Z','1'..'9','@','#','$'] then
     rs:= rs+String(ch)
     else rs := rs+string(chr(keyNo+i));
  end;
  result := rs;
end;

Function EncodeId1(SoftID: string): String;
Const key = 360110162;
Var i: integer;
    txt,DecodeID,rs,b: String;
    a,Ch: Char;
    KeyNo : integer;
begin
  DecodeID:='';
  rs:= '';
  for i:= 1 to length(SoftID) do
  begin
     a := softID[i];
     KeyNo := ord(a);
     Ch := chr(keyno*Round(i) xor (Key shr 8));
     if ch in ['a'..'z','A'..'Z','1'..'9','@','#','$'] then
         rs:= rs+String(ch)
     else
         rs := rs + InttoStr(ord(ch) div 4 ); //copy(InttoStr(ord(ch) div 3 ),1,1);
  end;
  result := Copy(rs,1,15);
end;

function CryptString(const S, Key: string): string;
var
  i, j: Integer;
  C: Byte;
  P: PByte;
begin
  SetLength(Result, Length(S));
  P := PByte(Result);

  j := 1;
  for i := 1 to Length(S) do
  begin
    C := Ord(S[i]);

    C := C xor Ord(Key[j]);
    P^ := C;
    Inc(P);
    Inc(j);
    if j > Length(Key) then
      j := 1;
  end;
end;

function CryptString1(Stri, Strk: String): String;
var
    Longkey: string;
    I: Integer;
    Next: char;
begin
    for I := 0 to (Length(Stri) div Length(Strk)) do
    Longkey := Longkey + Strk;
    for I := 1 to length(Stri) do
    begin
        Next := chr((ord(Stri[i]) xor ord(Longkey[i])));
        Result := Result + Next;
    end;
end;


Function Registered(regisNum:String): Boolean;
begin
  Result := false;
  Softkey := ShowDiskData(ExtractFilePath(Application.ExeName));
  if EncodeId(softkey)=regisNum then
  result := true;
end;


Function Registered1(regisNum:String; Drive: String): Boolean;
begin
  Result := false;
  //Softkey := ShowDiskData(ExtractFilePath(Application.ExeName));
  Softkey := ShowDiskData(Drive);
  //if EncodeId1(softkey)=regisNum then
  if EncodeId(softkey)=regisNum then
  result := true;
end;

Function IsRegMac(regisNum:String): Boolean;
begin
  Result := false;
  Softkey := 'M'+EnCodeString(StringReplace(Get_MacAddress,'-','', [rfReplaceAll]));
  //if EncodeId(softkey)=regisNum then
  if (EncodeString(softkey)=regisNum) then
  result := true;
end;


function GetWindowsVersion: string;
var
  VerInfo: TOsversionInfo; 
  PlatformId, VersionNumber: string; 
  Reg: TRegistry; 
begin
   VerInfo.dwOSVersionInfoSize := SizeOf(VerInfo);
   GetVersionEx(VerInfo); 
// Detect platform 
   Reg := TRegistry.Create; 
   Reg.RootKey := HKEY_LOCAL_MACHINE; 
   case VerInfo.dwPlatformId of 
   VER_PLATFORM_WIN32s: begin 
// Registry (Huh? What registry?) 
                           PlatformId := 'Windows 3.1'; 
                        end; 
   VER_PLATFORM_WIN32_WINDOWS: begin 
// Registry 
       Reg.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion', False); 
       PlatformId := Reg.ReadString('ProductName'); 
       VersionNumber := Reg.ReadString('VersionNumber'); 
                               end; 
   VER_PLATFORM_WIN32_NT: begin 
// Registry 
       Reg.OpenKey('\SOFTWARE\Microsoft\Windows NT\CurrentVersion', False); 
       PlatformId := Reg.ReadString('ProductName'); 
       VersionNumber := Reg.ReadString('CurrentVersion'); 
                          end; 
   end; 
   Reg.Free; 
   Result := PlatformId + ' (version ' + VersionNumber + ')'; 
end;

const 
{ operating system (OS)constants } 
cOsUnknown = -1; 
cOsWin95 = 0; 
cOsWin98 = 1; 
cOsWin98SE = 2; 
cOsWinME = 3; 
cOsWinNT = 4; 
cOsWin2000 = 5; 
cOsWhistler = 6; 


function GetOperatingSystem : Integer;
var 
  osVerInfo : TOSVersionInfo; 
  majorVer, minorVer,VersionID : Integer;
begin 
   VersionID := cOsUnknown; 
{ set operating system type flag } 
   osVerInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo); 
   if GetVersionEx(osVerInfo) then 
   begin
      majorVer := osVerInfo.dwMajorVersion; 
      minorVer := osVerInfo.dwMinorVersion; 
      case osVerInfo.dwPlatformId of
      VER_PLATFORM_WIN32_NT : { Windows NT/2000 }
                              begin 
                                 if majorVer <= 4 then 
                                    VersionID := cOsWinNT
                                 else if (majorVer = 5) AND (minorVer= 0) 
                                      then 
                                         VersionID := cOsWin2000
                                 else if (majorVer = 5) AND (minorVer = 1) 
                                      then 
                                         VersionID := cOsWhistler
                                 else 
                                    VersionID := cOsUnknown;
                              end; 
      VER_PLATFORM_WIN32_WINDOWS : { Windows 9x/ME } 
                                   begin 
                                      if (majorVer = 4) AND (minorVer = 0) 
                                         then
                                         VersionID := cOsWin95
                                      else if (majorVer = 4) AND (minorVer = 
                                               10) then 
                                           begin 
                                              if osVerInfo.szCSDVersion[1] = 
                                                 'A' then 
                                                 VersionID := cOsWin98SE
                                              else 
                                                 VersionID := cOsWin98;
                                           end 
                                      else if (majorVer = 4) AND (minorVer 
                                           = 90) then
                                           VersionID := cOsWinME
                                      else 
                                         VersionID := cOsUnknown;
                                   end; 
      else 
      VersionID := cOsUnknown;
      end; 
   end 
   else 
      VersionID := cOsUnknown;

   Case VersionID of
    -1 : Result := -1;//'OsUnknown';
     0 : Result := 0;//'OsWin95';
     1 : Result := 1;//'OsWin98';
     2 : Result := 2;//'OsWin98SE';
     3 : Result := 3;//'OsWinME';
     4 : Result := 4;//'OsWinNT';
     5 : Result := 5;//'OsWin2000';
     6 : Result := 6;//'OsWinXP';
   end;

end; 





end.
