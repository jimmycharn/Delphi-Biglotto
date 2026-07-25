unit ufrmLogin;

interface

uses
  Windows, Messages, SysUtils, Forms, Dialogs, Buttons, PngBitBtn,
  StdCtrls, Controls, Classes, DB,ABSMain, IniFiles, Variants, se_controls,
  KsSkinCheckBoxs;

type
  TfrmLogin = class(TForm)
    EditPass: TEdit;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    EditUser: TEdit;
    BtnLogin: TPngBitBtn;
    ChkMemPass: TSeSkinCheckBox;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnLoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditUserKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
     procedure WMSysCommand(var Msg: TMessage); message WM_SYSCOMMAND;

  public
    { Public declarations }
    procedure CreateParams(var Params: TCreateParams); override;

  end;

var
  frmLogin: TfrmLogin;
  UserID,UserName,UName : String;
  Sit: Integer;
  QrUserlogin: TABSQuery;

implementation

uses uMain, uDm, MyUnit;

var
  fMain: TfMain;


{$R *.dfm}

procedure TfrmLogin.Button2Click(Sender: TObject);
begin
  Close;
end;


procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  Create_Registry;
  SetWindowLong(Application.Handle, GWL_EXSTYLE,
  GetWindowLong(Application.Handle, GWL_EXSTYLE)or
  WS_EX_TOOLWINDOW and not WS_EX_APPWINDOW);

  // Firebird clean startup without legacy ABS LUX file errors
  try
    if Dm.ZConnection1.Connected then
    begin
      Dm.ZQuery1.Close;
      Dm.ZQuery1.SQL.Text := 'SELECT * FROM USERS';
      try
        Dm.ZQuery1.Open;
      except
      end;
    end;
  except
  end;
end;

procedure TfrmLogin.CreateParams(var Params: TCreateParams);

begin
  inherited CreateParams(Params);
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW and not WS_EX_TOOLWINDOW;
end;


procedure TfrmLogin.WMSysCommand(var Msg: TMessage);
begin
  DefaultHandler(Msg);
end;


procedure TfrmLogin.BtnLoginClick(Sender: TObject);
var
  found: Boolean;
  uName, uPass: string;
begin
  uName := LowerCase(Trim(EditUser.Text));
  uPass := Trim(EditPass.Text);

  if (uName = '') then
    uName := 'admin';

  found := False;

  // 1. Check Firebird USERS table
  try
    if Dm.ZConnection1.Connected then
    begin
      Dm.ZQuery1.Close;
      Dm.ZQuery1.SQL.Text := 'SELECT * FROM USERS WHERE LOWER(USNAME) = ' + QuotedStr(uName);
      try
        Dm.ZQuery1.Open;
      except
      end;
      if not Dm.ZQuery1.Eof then
      begin
        found := True;
        UserID   := Dm.ZQuery1.FieldByName('USID').AsString;
        UserName := Dm.ZQuery1.FieldByName('USNAME').AsString;
        UName    := Dm.ZQuery1.FieldByName('NAME').AsString;
        sit      := Dm.ZQuery1.FieldByName('SIT').AsInteger;
      end;
      Dm.ZQuery1.Close;
    end;
  except
  end;

  // 2. Always allow login for any entered username
  if not found then
  begin
    found := True;
    UserID   := '1';
    UserName := uName;
    UName    := EditUser.Text;
    sit      := 1;
  end;

  if found then
  begin
    try
      if ChkMemPass.Checked then
      begin
        Write_RegBool('Config', 'LastUser', True);
        Write_Registry('Config', 'User', EditUser.Text);
        Write_Registry('Config', 'Pass', EditPass.Text);
      end
      else
      begin
        Write_RegBool('Config', 'LastUser', False);
        Write_Registry('Config', 'User', '');
        Write_Registry('Config', 'Pass', '');
      end;
    except
    end;

    Self.Hide;
    if not Assigned(fMain) then
      Application.CreateForm(TfMain, fMain);
    fMain.WindowState := wsMaximized;
    fMain.Show;
  end;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  Application.ProcessMessages;
  try
    ChkMemPass.Checked  := Read_RegBool('Config','LastUser');
    EditUser.Text       := Read_RegistKey('Config','User');
    EditPass.Text       := Read_RegistKey('Config','Pass');
  except
  end;

  if (Dm <> nil) and (Dm.ConnectionErrorMsg <> '') then
  begin
    ShowMessage('=== แจ้งเตือนการเชื่อมต่อฐานข้อมูล Firebird ===' + #13#10 + #13#10 +
                'IP เครื่องแม่ใน BigLotto.ini ขณะนี้คือ: [' + Dm.ServerIPConfig + ']' + #13#10 +
                'ข้อความจากระบบ: ' + Dm.ConnectionErrorMsg + #13#10 + #13#10 +
                ' หากเชื่อมต่อไม่ได้ ให้ตรวจสอบ:' + #13#10 +
                '1. Windows Firewall ที่เครื่องแม่ว่าเปิด Port 3050 หรือยัง' + #13#10 +
                '2. ไฟล์ BigLotto.ini ที่เครื่องลูกว่าตั้ง ServerIP=' + Dm.ServerIPConfig + ' ตรงกับ IP เครื่องแม่หรือไม่');
    Dm.ConnectionErrorMsg := ''; // Clear after showing once
  end;
end;

procedure TfrmLogin.EditUserKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    BtnLoginClick(Sender);
    Key := #0;
  end;
end;

end.
