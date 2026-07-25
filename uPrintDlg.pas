unit uPrintDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, Buttons,RpDevice,Printers,WinSpool;

type
  TfrmPrintDlg = class(TForm)
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    Button1: TButton;
    Label1: TLabel;
    GroupBox3: TGroupBox;
    Button3: TButton;
    GroupBox2: TGroupBox;
    RdbAll: TRadioButton;
    RdbPages: TRadioButton;
    RdbSel: TRadioButton;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    SeCopies: TSpinEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LbState: TLabel;
    LbType: TLabel;
    LbPort: TLabel;
    LbComment: TLabel;
    OK: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrintDlg: TfrmPrintDlg;

implementation

{$R *.dfm}

procedure TfrmPrintDlg.Button1Click(Sender: TObject);
var
  APrinter, ADriver, APort: array[0..100] of Char;
  PrinterHandle, DevMode: THandle;
begin
  Printer.GetPrinter(APrinter, ADriver, APort, DevMode);
  OpenPrinter(APrinter, PrinterHandle, nil);
  PrinterProperties(self.Handle, PrinterHandle);
  ClosePrinter(PrinterHandle);
end;

procedure TfrmPrintDlg.ComboBox1Change(Sender: TObject);
begin
  //RpDev.SelectPrinter(ComboBox1.Text, true);
  RpDev.SelectPrinter(Combobox1.Items[Combobox1.itemIndex],true);
  //LbState.Caption := RpDev.
  RpDev.SaveToPrinter;
end;

end.
