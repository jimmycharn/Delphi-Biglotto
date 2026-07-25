unit ufrmKeyGen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Clipbrd, uLicense;

type
  TfrmKeyGen = class(TForm)
    PanelHeader: TPanel;
    lblTitle: TLabel;
    grpInput: TGroupBox;
    lblHWID: TLabel;
    edHWID: TEdit;
    btnCurrentHWID: TButton;
    lblYears: TLabel;
    edYears: TEdit;
    lblMonths: TLabel;
    edMonths: TEdit;
    lblMaxClients: TLabel;
    edMaxClients: TEdit;
    grpResult: TGroupBox;
    memKey: TMemo;
    btnGenerate: TButton;
    btnCopyKey: TButton;
    btnClose: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCurrentHWIDClick(Sender: TObject);
    procedure btnGenerateClick(Sender: TObject);
    procedure btnCopyKeyClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKeyGen: TfrmKeyGen;

implementation

{$R *.dfm}

procedure TfrmKeyGen.FormCreate(Sender: TObject);
begin
  edYears.Text := '1';
  edMonths.Text := '1';
  edMaxClients.Text := '1';
  edHWID.Text := GetMachineHWID;
end;

procedure TfrmKeyGen.btnCurrentHWIDClick(Sender: TObject);
begin
  edHWID.Text := GetMachineHWID;
end;

procedure TfrmKeyGen.btnGenerateClick(Sender: TObject);
var
  HWID: string;
  Years, Months, MaxClients: Integer;
  GenKey: string;
begin
  HWID := Trim(edHWID.Text);
  if HWID = '' then
  begin
    ShowMessage('กรุณากรอก Hardware ID ของลูกค้าก่อนครับ');
    edHWID.SetFocus;
    Exit;
  end;

  Years := StrToIntDef(Trim(edYears.Text), 1);
  Months := StrToIntDef(Trim(edMonths.Text), 1);
  MaxClients := StrToIntDef(Trim(edMaxClients.Text), 1);

  if Years < 0 then Years := 0;
  if Months < 0 then Months := 0;
  if (Years = 0) and (Months = 0) then Months := 1;
  if MaxClients < 1 then MaxClients := 1;

  GenKey := GenerateLicenseKey(HWID, Years, Months, MaxClients, 'SERVER');
  memKey.Text := GenKey;
  Clipboard.AsText := GenKey;

  ShowMessage('สร้างรหัสลงทะเบียนเรียบร้อยแล้ว!' + #13#10 +
              'ระยะเวลา: ' + IntToStr(Years) + ' ปี ' + IntToStr(Months) + ' เดือน' + #13#10 +
              'จำนวนเครื่องลูก: ' + IntToStr(MaxClients) + ' เครื่อง' + #13#10 +
              '(คัดลอกลง Clipboard เรียบร้อยแล้ว สามารถส่งให้ลูกค้าได้ทันที)');
end;

procedure TfrmKeyGen.btnCopyKeyClick(Sender: TObject);
begin
  if Trim(memKey.Text) <> '' then
  begin
    Clipboard.AsText := Trim(memKey.Text);
    ShowMessage('คัดลอกรหัสลงทะเบียนลง Clipboard เรียบร้อยแล้ว');
  end;
end;

procedure TfrmKeyGen.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
