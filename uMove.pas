unit uMove;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, sCustomComboEdit, sComboEdit, ExtCtrls,
  se_controls, KsSkinButtons, sCurrEdit, sCurrencyEdit, ABSMain, ComCtrls;

type
  TfrmMove = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    LbCust: TLabel;
    edCust: TsComboEdit;
    ChkFoundCust: TCheckBox;
    PanelCustName: TPanel;
    BtnMoveOK: TSeSkinButton;
    BtnMoveCancel: TSeSkinButton;
    edStart: TsCurrencyEdit;
    Panel3: TPanel;
    edEnd: TsCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    edBookNo: TsCurrencyEdit;
    Label3: TLabel;
    DateMove: TDateTimePicker;
    Label4: TLabel;
    ChkMoveB: TCheckBox;
    ChkMoveCust: TCheckBox;
    procedure edCustButtonClick(Sender: TObject);
    procedure edCustKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnMoveOKClick(Sender: TObject);
    procedure ChkMoveBClick(Sender: TObject);
    procedure ChkMoveCustClick(Sender: TObject);
  private
    { Private declarations }
    function FindCust(CustID:String):Boolean;
  public
    { Public declarations }
  end;

var
  frmMove: TfrmMove;

implementation

uses uFindCust, uDm, uMain;

{$R *.dfm}

function TfrmMove.FindCust(CustID:String):Boolean;
Var QrFindCust: TABSQuery;
    i: Integer;
begin
  result := false;
  With Dm do
  begin
    if Trim(CustID) = '' then
  begin
    PanelCustName.Caption := '';
    Result := False;
    Exit;
  end;
  QrFindCust := TABSQuery.Create(nil);
    try
    except
    end;
    QrFindCust.DatabaseName := Database.DatabaseName;
    try
      QrFindCust.Close;
    except
    end;
    QrFindCust.SQL.Clear;
    QrFindCust.SQL.Add('Select * from Cust Where CustID like "%'+CustID+'%"');
    try
      try
        QrFindCust.Open;
      except
      end;
    except
    end;
    if QrFindCust.RecordCount = 0 then
    begin
      Showmessage('ไม่พบลูกค้าที่ต้องการ กรุณากรอกรหัสลูกให้ถูกต้อง');
      PanelCustName.Caption := '';
      result := false;
    end
    else
    begin
      edCust.Text := QrFindCust.FieldByName('CustID').AsString;
      PanelCustName.Caption := ' '+QrFindCust.FieldByName('fName').AsString+' '+QrFindCust.FieldByName('lName').AsString;
      //edCust.SelectAll;
      Result := true;
    end;
    QrFindCust.Free;
  end;
end;

procedure TfrmMove.edCustButtonClick(Sender: TObject);
begin
  with frmFindCust,Dm do
  begin
    if Showmodal = mrOk then
    begin
      Application.ProcessMessages;
      with CustList do
      begin
        ChkFoundCust.Checked := true;
        EdCust.Text := Items[selected.index].Caption;
        PanelCustName.Caption := ' '+Items[Selected.index].SubItems[0];
        EdCust.SetFocus;
      end;

    end;
  end;
end;

procedure TfrmMove.edCustKeyPress(Sender: TObject; var Key: Char);
begin
  ChkFoundCust.Checked := false;
  if Key = #13 then
    Key := #0;

end;

procedure TfrmMove.FormShow(Sender: TObject);
begin
  if edCust.Visible then
  begin
    edCust.SetFocus;
    edCust.SelectAll;
  end;
end;

procedure TfrmMove.BtnMoveOKClick(Sender: TObject);
begin
  if Not(ChkMoveCust.Checked) then
  begin
    if ChkFoundCust.Checked then
    begin
      Modalresult := mrOK;
    end
    else
    begin
      Modalresult := mrNone;
      if FindCust(edCust.Text) then
      begin
        ChkFoundCust.Checked := true;
        Modalresult := mrOK;
      end
      else
        ChkFoundCust.Checked := false;

      edCust.SetFocus;
      edCust.SelectAll;

    end;
  end;
end;


procedure TfrmMove.ChkMoveBClick(Sender: TObject);
begin
  Label3.Visible   := Not(ChkMoveB.Checked);
  edBookNo.Visible := Not(ChkMoveB.Checked);
end;

procedure TfrmMove.ChkMoveCustClick(Sender: TObject);
begin
  lBCust.Visible := Not(ChkMoveCust.Checked);
  edCust.Visible := Not(ChkMoveCust.Checked);
  PanelCustName.Visible := Not(ChkMoveCust.Checked);
end;

end.
