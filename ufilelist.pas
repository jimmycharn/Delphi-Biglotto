unit ufilelist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, AppEvnts, ShlObj, ActiveX,TlHelp32,
  BrwsFldr, SortListViews, DateUtils;


type
  TfFilelist = class(TForm)
    edDir: TEdit;
    SpeedButton1: TSpeedButton;
    RestoreBtn: TButton;
    Button2: TButton;
    Label1: TLabel;
    DelBtn: TButton;
    ApplicationEvents1: TApplicationEvents;
    BrowseForFolder: TBrowseForFolder;
    SpeedButton2: TSpeedButton;
    FileList: TSortListView;
    ChkSelAll: TCheckBox;
    procedure Button2Click(Sender: TObject);
    procedure RestoreBtnClick(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure DelBtnClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FileListClick(Sender: TObject);
    procedure ChkSelAllClick(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure GetBackupfile;
  end;

var
  fFilelist: TfFilelist;

implementation

uses MyUnit, uMain;

{$R *.dfm}

function processExists(exeFileName: string): Boolean;
var
   ContinueLoop: BOOL;
   FSnapshotHandle: THandle;
   FProcessEntry32: TProcessEntry32;
begin
   FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
   FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
   ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
   Result := False;
   while Integer(ContinueLoop) <> 0 do
   begin
      if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
         UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
         UpperCase(ExeFileName))) then
      begin
         Result := True;
      end;
      ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
   end;
   CloseHandle(FSnapshotHandle);
end;

function GetFileDate(TheFileName: string): string;
var
  FHandle: integer;
begin
  FHandle := FileOpen(TheFileName, 0);
  try
    Result := DateTimeToStr(FileDateToDateTime(FileGetDate(FHandle)));
  finally
    FileClose(FHandle);
  end;
end;

Procedure TfFilelist.GetBackupfile;
var
  FindFileData : TWin32FindData;
  SearchHandle : THandle;
begin
  SearchHandle := FindFirstFile( PChar( edDir.Text+'*.xls' ), FindFileData );
  Filelist.Clear;
  Filelist.Items.BeginUpdate;
  If SearchHandle <> INVALID_HANDLE_VALUE then
  begin
    Repeat
      If Not (FindFileData.dwFileAttributes = FILE_ATTRIBUTE_DIRECTORY) then
      begin
         with FileList.Items.Add do
         begin
            try
               Caption := findfileData.cFileName;
               SubItems.Add(GetFileDate(edDir.Text+findfileData.cFileName));
               if findfileData.nFileSizeLow < 1024 then
                SubItems.Add(IntToStr(findfileData.nFileSizeLow)+' BYTE')
               else
                SubItems.Add(IntToStr(Round(findfileData.nFileSizeLow / 1024))+' KB');
               //if DaysBetween(Now,StrToDateTime(GetFileDate(edDir.Text+findfileData.cFileName))) >= 2 then
                  //ListBox1.Items.Add(findfileData.cFileName);
            except
               Caption := findfileData.cFileName;
               SubItems.Add('');
               SubItems.Add(IntToStr(findfileData.nFileSizeLow));
            end;            
         end;
      end;
    Until Not FindNextFile(SearchHandle,FindFileData);
  end;
  Filelist.Items.EndUpdate;
end;


procedure TfFilelist.Button2Click(Sender: TObject);
begin
   Close;
end;

procedure TfFilelist.RestoreBtnClick(Sender: TObject);
begin
   if processExists('LuckyNumber.exe') then
   begin
      MessageDlg('โปรแกรม Lucky Number กำลังทำงานอยู่ กรุณาปิดโปรแกรมก่อนทำการ นำเข้าฐานข้อมูล',mtInformation, [mbOk], 0);
      exit;
   end;
   with FileList do
   begin
     try
      if SelCount > 0 then
         ExtractFolderZip(edDir.text+Items[Selected.Index].Caption ,ExtractFileDir(Read_RegistKey('Dir','Dbfile')));
     except
         MessageDlg('เกิดไม่ปัญหาในการกู้คืนฐานข้อมูล ยกเลิกการกู้',mtInformation, [mbOk], 0);
     end;
   end;
end;

procedure TfFilelist.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
   //RestoreBtn.Enabled := FileList.SelCount > 0;
   //DelBtn.Enabled := FileList.SelCount > 0;
end;

procedure TfFilelist.DelBtnClick(Sender: TObject);
Var i: integer;
begin
   with FileList do
   begin
    if MessageDlg('ต้องการลบรายการแฟ้มที่เลือก ใช่หรือไม่?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin

      for i := Items.Count-1 DownTo 0 do
      begin
        if items[i].Checked = true then
        begin
          if DeleteFile(pChar(edDir.Text + Items[i].Caption)) then
          begin
            Items.Delete(i);
          end;
        end;        
      end;
      messageDlg('ไฟล์ข้อมูลที่เลือกถูกลบเรียบร้อยแล้ว',mtInformation,[mbOK],0);
      FileListClick(Sender);
    end;

   end;
end;

procedure TfFilelist.SpeedButton1Click(Sender: TObject);
var
  BI: TBrowseInfo;
  Buf: PChar;
  Dir,
  Root: PItemIDList;
  Alloc: IMalloc;
begin
  SHGetMalloc(Alloc);
  Buf := Alloc.Alloc(Max_Path);

  // CSIDL_BITBUCKET  RecycleBin
  // CSIDL_CONTROLS   ControlPanel
  // CSIDL_DESKTOP    Desktop
  // CSIDL_DRIVES     My Computer
  // CSIDL_FONTS      Fonts
  // CSIDL_NETHOOD    Network Neighborhood
  // CSIDL_NETWORK    The virtual version of the above
  // CSIDL_PERSONAL   'Personal'
  // CSIDL_PRINTERS   printers
  // CSIDL_PROGRAMS   Programs in the Start Menu
  // CSIDL_RECENT     Recent Documents
  // CSIDL_SENDTO     Folder SendTo
  // CSIDL_STARTMENU  The whole Start menu
  // CSIDL_STARTUP    The Autostart Group
  // CSIDL_TEMPLATES  Document templates

  // use of the constants above
  SHGetSpecialFolderLocation(Handle, CSIDL_DRIVES, Root);

  with BI do
  begin
    hwndOwner := fFilelist.Handle;
    // NIL means show all
    pidlRoot := Root;
    pszDisplayName := Buf;
    lpszTitle := 'เลือกโฟลเดอร์แบคอัพ ฐานข้อมูล';
    ulFlags := 0;
    lpfn := nil;
  end;

  try
    Dir := SHBrowseForFolder(BI);
    if Dir<>nil then
    begin
      SHGetPathFromIDList(Dir, Buf);
      Write_Registry('Dir','BackupDir',Buf);
      edDir.Text := Buf+'\';
      Alloc.Free(Dir);
    end;
  finally
    Alloc.Free(Root);
    Alloc.Free(Buf);
  end;
  GetBackupfile;
end;

procedure TfFilelist.SpeedButton2Click(Sender: TObject);
begin
   With BrowseForFolder,fMain do begin
      Path := edDir.Text;
      if Execute then
      begin
         //Write_Registry('Dir','BackupDir',Path);
         Write_Registry('Dir',edImportFolder.text,Path);
         edDir.Text := Path+'\';
      end;
   end;
   GetBackupfile;
end;

procedure TfFilelist.FormShow(Sender: TObject);
begin
  //with fMain do
  //begin
   //Create_Registry;
   //edDir.Text := Read_RegistKey('Dir','BackupDir')+'\';
    //edDir.Text := edImportFolder.text +'\';
    GetBackupfile;
   //end;
   ChkSelAll.Checked := false;
end;

procedure TfFilelist.FileListClick(Sender: TObject);
Var i,j: integer;
begin
  with FileList do
  begin
    j:=0;
    if Items.Count > 0 then
    begin 
      for i:= 0 to Items.Count-1 do
      begin
          if items[i].Checked = true then
          begin
            inc(j);
          end;
      end;
    end;
    DelBtn.Enabled := (j > 0);
  end;
end;

procedure TfFilelist.ChkSelAllClick(Sender: TObject);
Var i,j: integer;
begin
  with FileList do
  begin
    for i := 0 to Items.Count-1 do
        Items[i].checked := ChkSelAll.Checked;

    j:=0;
    if Items.Count > 0 then
    begin 
      for i:= 0 to Items.Count-1 do
      begin
          if items[i].Checked = true then
          begin
            inc(j);
          end;
      end;
    end;
    DelBtn.Enabled := (j > 0);
  end;
end;

end.
