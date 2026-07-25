unit ufrmRegister;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Clipbrd, uLicense, ufrmKeyGen;

type
  TfrmRegister = class(TForm)
    PanelHeader: TPanel;
    lblTitle: TLabel;
    grpHWID: TGroupBox;
    lblHWIDHint: TLabel;
    edHWID: TEdit;
    btnCopyHWID: TButton;
    grpKey: TGroupBox;
    lblKeyHint: TLabel;
    memKey: TMemo;
    btnActivate: TButton;
    grpStatus: TGroupBox;
    lblStatus: TLabel;
    lblExpDate: TLabel;
    lblDaysLeft: TLabel;
    lblMaxClients: TLabel;
    btnOpenKeyGen: TButton;
    btnClose: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCopyHWIDClick(Sender: TObject);
    procedure btnActivateClick(Sender: TObject);
    procedure btnOpenKeyGenClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    procedure RefreshLicenseStatus;
  public
    { Public declarations }
  end;

var
  frmRegister: TfrmRegister;

implementation

{$R *.dfm}

procedure TfrmRegister.FormCreate(Sender: TObject);
begin
  edHWID.Text := GetMachineHWID;
  RefreshLicenseStatus;
end;

procedure TfrmRegister.RefreshLicenseStatus;
var
  Info: TLicenseInfo;
begin
  CheckCurrentLicense(Info);
  if Info.IsRegistered then
  begin
    lblStatus.Caption := 'สถานะ: ✅ ลงทะเบียนเรียบร้อยแล้ว';
    lblStatus.Font.Color := clGreen;
    lblExpDate.Caption := 'วันที่หมดอายุ: ' + FormatDateTime('dd/mm/yyyy', Info.ExpireDate);
    lblDaysLeft.Caption := 'ระยะเวลาคงเหลือ: ' + IntToStr(Info.DaysLeft) + ' วัน';
    lblMaxClients.Caption := 'จำนวนเครื่องลูกที่อนุญาต: ' + IntToStr(Info.MaxClients) + ' เครื่อง';
  end
  else
  begin
    lblStatus.Caption := 'สถานะ: ❌ ' + Info.StatusText;
    lblStatus.Font.Color := clRed;
    lblExpDate.Caption := 'วันที่หมดอายุ: -';
    lblDaysLeft.Caption := 'ระยะเวลาคงเหลือ: 0 วัน';
    lblMaxClients.Caption := 'จำนวนเครื่องลูกที่อนุญาต: -';
  end;
end;

procedure TfrmRegister.btnCopyHWIDClick(Sender: TObject);
begin
  Clipboard.AsText := edHWID.Text;
  ShowMessage('คัดลอก Hardware ID (' + edHWID.Text + ') ลง Clipboard เรียบร้อยแล้ว' + #13#10 +
              'สามารถนำไปส่งให้ผู้ขายเพื่อขอรหัสลงทะเบียนได้ทันที');
end;

procedure TfrmRegister.btnActivateClick(Sender: TObject);
var
  Key: string;
  Info: TLicenseInfo;
begin
  Key := Trim(memKey.Text);
  if Key = '' then
  begin
    ShowMessage('กรุณาวางรหัสลงทะเบียน (License Key) ในช่องก่อนครับ');
    memKey.SetFocus;
    Exit;
  end;

  if ValidateLicenseKey(Key, Info) then
  begin
    if SaveLicenseToDB(Key, Info) then
    begin
      ShowMessage('🎉 เปิดใช้งานสำเร็จ!' + #13#10 +
                  'สิทธิ์ใช้งานถึงวันที่: ' + FormatDateTime('dd/mm/yyyy', Info.ExpireDate) + #13#10 +
                  'จำนวนเครื่องลูก: ' + IntToStr(Info.MaxClients) + ' เครื่อง');
      RefreshLicenseStatus;
    end
    else
    begin
      ShowMessage('ไม่สามารถบันทึกข้อมูลสิทธิ์ลงในฐานข้อมูลได้');
    end;
  end
  else
  begin
    ShowMessage('❌ การเปิดใช้งานไม่สำเร็จ:' + #13#10 + Info.StatusText);
  end;
end;

procedure TfrmRegister.btnOpenKeyGenClick(Sender: TObject);
var
  KeyGenForm: TfrmKeyGen;
begin
  KeyGenForm := TfrmKeyGen.Create(Self);
  try
    KeyGenForm.ShowModal;
    RefreshLicenseStatus;
  finally
    KeyGenForm.Free;
  end;
end;

procedure TfrmRegister.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
