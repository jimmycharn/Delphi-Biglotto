unit uIncExp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Mask, sCustomComboEdit, sCurrEdit,
  sCurrencyEdit, sEdit, se_controls, KsSkinButtons;

type
  TfrmIncExp = class(TForm)
    Panel1: TPanel;
    DatePick: TDateTimePicker;
    Label1: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    ed1: TsCurrencyEdit;
    ed2: TsCurrencyEdit;
    ed3: TsCurrencyEdit;
    ed4: TsCurrencyEdit;
    ed5: TsCurrencyEdit;
    ed6: TsCurrencyEdit;
    edReceive: TsCurrencyEdit;
    sCurrencyEdit8: TsCurrencyEdit;
    edOutStd: TsCurrencyEdit;
    sCurrencyEdit10: TsCurrencyEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label13: TLabel;
    Label14: TLabel;
    BtnMoveCancel: TSeSkinButton;
    SeSkinButton1: TSeSkinButton;
    EdMobile1: TsEdit;
    Label2: TLabel;
    procedure edReceiveChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIncExp: TfrmIncExp;

implementation

{$R *.dfm}

procedure TfrmIncExp.edReceiveChange(Sender: TObject);
begin
  edOutStd.Value := ed6.Value-edReceive.Value;
end;

end.
