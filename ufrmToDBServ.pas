unit ufrmToDBServ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, sEdit, se_controls, KsSkinSpinButtons, Mask,
  sCustomComboEdit, sComboEdit, ExtCtrls, KsSkinButtons,ABSMain;

type
  TfSendToServ = class(TForm)
    Panel1: TPanel;
    LbCust: TLabel;
    edCustID: TsComboEdit;
    PanelCust: TPanel;
    LbBookNo: TLabel;
    SpinBook: TSeSkinSpinButton;
    edRefNum: TsEdit;
    CBLotType: TComboBox;
    PickDate: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    SeSkinButton1: TSeSkinButton;
    SeSkinButton2: TSeSkinButton;
    edLotNo: TsEdit;
    Bevel1: TBevel;
    procedure FormShow(Sender: TObject);
    procedure CBLotTypeChange(Sender: TObject);
    procedure edCustIDButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSendToServ: TfSendToServ;

implementation

uses uDm, uFindServCust;

{$R *.dfm}

procedure TfSendToServ.FormShow(Sender: TObject);
Var found: Boolean;
begin
  Application.ProcessMessages;
  With Dm do
  begin
    found := false;
    ServCust.Close;
    try
      ServCust.Open;
    except
    end;
    found := ServCust.Locate('CustID',edCustID.Text,[]);
    if Not found then
    begin
      ServCust.First;
      edCustID.Text := ServCust.fieldByName('CustID').AsString;
      PanelCust.Caption := ServCust.fieldByName('FName').AsString+' '+ServCust.fieldByName('LName').AsString;
    end;

    found := false;
    ServLotto.Close;
    try
      ServLotto.Open;
    except
    end;
    CbLotType.Clear;
    ServLotto.First;
    while not ServLotto.Eof do
    begin
      CbLotType.Items.Add(ServLotto.fieldByName('LotName').AsString);
      ServLotto.Next;
    end;
    found := ServLotto.Locate('ID',StrToInt(edLotNo.Text),[]);
    if found then
    begin
      CbLotType.ItemIndex := CbLotType.Items.IndexOf(ServLotto.fieldByName('LotName').asString);
    end
    else
    begin
      CBLotTypeChange(Sender);
    end;
  end;

end;

procedure TfSendToServ.CBLotTypeChange(Sender: TObject);
Var found: Boolean;
begin
  with Dm, CbLotType Do
  begin
    ServLotto.Close;
    try
      ServLotto.Open;
    except
    end;
    found := ServLotto.Locate('LotName',CbLotType.Items[ItemIndex],[]);
    if found then
      edLotNo.Text := ServLotto.fieldByName('ID').AsString;
  end;
end;

procedure TfSendToServ.edCustIDButtonClick(Sender: TObject);
begin
  with frmFindServCust,Dm do
  begin
    if Showmodal = mrOk then
    begin
      Application.ProcessMessages;
      with CustList do
      begin
        //FindCustCom(Items[selected.index].Caption);

        EdCustID.Text := Items[selected.index].Caption;
        PanelCust.Caption := ' '+Items[Selected.index].SubItems[0];
        //EdCustNo.SetFocus;
        //if isUp then
          //EdNumber.SetFocus
        //else
          //EdDwnNumber.SetFocus;
        //RefreshBtnClick(Sender);
      end;

    end;
  end;
end;

end.
