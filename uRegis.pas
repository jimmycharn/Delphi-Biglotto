unit uRegis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sEdit, AdvPicture, se_controls, KsSkinButtons,
  ExtCtrls,Clipbrd, IniFiles;

type
  TfRegis = class(TForm)
    edCode: TsEdit;
    edKey: TsEdit;
    BtnRegis: TSeSkinButton;
    lbBuild: TLabel;
    edCode1: TsEdit;
    Label1: TLabel;
    Shape1: TShape;
    Label2: TLabel;
    btnClearKey: TSeSkinButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure BtnRegisClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnClearKeyClick(Sender: TObject);
    procedure edKeyChange(Sender: TObject);
    procedure edKeyDblClick(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRegis: TfRegis;

implementation

uses MyUnit, uMain, Utils, UEncrypt,ComObj, ActiveX, SerialGenerator;

{$R *.dfm}

function GetMotherBoardSerial: string;
var
  objWMIService: OLEVariant;
  colItems: OLEVariant;
  colItem: OLEVariant;
  oEnum: IEnumvariant;
  iValue: Longword;
  function GetWMIObject(const objectName: string): IDispatch;
  var
    chEaten: Integer;
    BindCtx: IBindCtx;
    Moniker: IMoniker;
  begin
    OleCheck(CreateBindCtx(0, bindCtx));
    OleCheck(MkParseDisplayName(BindCtx, StringToOleStr(objectName),chEaten, Moniker));
    OleCheck(Moniker.BindToObject(BindCtx, nil, IDispatch, Result));
  end;
begin
  Result := '';
  objWMIService := GetWMIObject('winmgmts:\\localhost\root\cimv2');
  colItems := objWMIService.ExecQuery('SELECT SerialNumber FROM Win32_BaseBoard', 'WQL', 0);
  oEnum := IUnknown(colItems._NewEnum) as IEnumVariant;
  if oEnum.Next(1, colItem,iValue) = 0 then
    Result := VarToStr(colItem.SerialNumber);
end;


procedure TfRegis.BtnRegisClick(Sender: TObject);
Var
  LenDate: integer;
  StrDate,StrKey: String;
  HardwareID: string;
  SerialNo: string;
  SerialInfo: TSerialInfo;
begin
  HardwareID := Trim(edCode.Text);
  With fMain do
    SerialNo := Trim(edKey.Text);

  if (HardwareID = '') or (SerialNo = '') then
  begin
    ShowMessage('กรุณาระบุ Hardware ID และ Serial No');
    ModalResult := mrNone;
    Exit;
  end;

  SerialInfo := ValidateSerialWithExpiry(HardwareID, SerialNo);
  if not (SerialInfo.IsValid) then
  begin
    ShowMessage('Serial Number ไม่ถูกต้อง!');
    ModalResult := mrNone;
    Exit;
  end;

  if SerialInfo.IsExpired then
  begin
    ShowMessage('Serial Number นี้ หมดอายุแล้ว!');
    ModalResult := mrNone;
    Exit;
  end;
end;

procedure TfRegis.FormShow(Sender: TObject);
begin
  if (edKey.Text = '') then
    BtnRegis.Caption := 'ลงทะเบียน'
  else
    BtnRegis.Caption := 'ตกลง';
  edKey.SetFocus;
  lbBuild.Caption := 'Build '+GetAppVersion;
end;

procedure TfRegis.btnClearKeyClick(Sender: TObject);
begin
  try
    if (edKey.Text = AppKey) then
    begin
      if MessageDlg('คุณแน่ใจที่จะต้องการลบ  Key  ลงทะเบียนใช่หรือไม่?'+#13#10+
                'ซึ่งถ้าลบแล้ว จะไม่สามารถใช้งานได้สมบูรณ์อีกต่อไป',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        Regis := false;
        Write_Registry('Register','RegisKEY','');
        AppKey := '';
        edKey.Text := '';
        edKey.ReadOnly := false;
        edKey.PasswordChar := #0;
        edKey.SetFocus;
        BtnRegis.Caption := 'ลงทะเบียน';
      end;
    end
    else
    begin
      edKey.Clear;
      BtnRegis.Caption := 'ลงทะเบียน';
    end;
  except
    edKey.Clear;
    edKey.SetFocus;
    BtnRegis.Caption := 'ลงทะเบียน';
  end;
  ModalResult := mrNone;
end;

procedure TfRegis.edKeyChange(Sender: TObject);
begin
  btnClearKey.Enabled := edKey.Text <> '';
  if edKey.Text = AppKey then
    BtnRegis.Caption := 'ตกลง';
end;

procedure TfRegis.edKeyDblClick(Sender: TObject);
begin
  if edKey.Text = ''  then
    edKey.Text := Clipboard.AsText;
end;

procedure TfRegis.Label4Click(Sender: TObject);
Var StrRegis: String;
begin
  StrRegis := '';
  StrRegis := StrRegis+'App : BigLotto V. '+GetAppVersion+#13#10;
  StrRegis := StrRegis+'Code : '+EdCode.text+#13#10;
  StrRegis := StrRegis+'Key : '+ Read_RegistKey('Register','RegisKEY')+#13#10;
  StrRegis := StrRegis+'MainBoard S/N : '+GetMotherBoardSerial+#13#10;
  Clipboard.AsText := StrRegis;
end;

procedure TfRegis.Label3Click(Sender: TObject);
begin
  if edCode.Text <> '' then
    Clipboard.AsText := edCode.Text;
end;

end.
