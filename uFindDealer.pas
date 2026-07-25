unit uFindDealer;

interface         

uses
  ZDataset,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, PngSpeedButton, IAsemiPanel, Grids,
  se_controls, KsSkinGroupBoxs, NiceGrid,DB, ADODB, AppEvnts, PngBitBtn,
  ImgList, ComCtrls, SortListViews,ABSMain;

type
  TfrmFindDealer = class(TForm)
    Panel1: TPanel;
    EditFindDealer: TEdit;
    RdgSort: TRadioGroup;
    Panel2: TPanel;
    ApplicationEvents1: TApplicationEvents;
    OkBtn: TPngBitBtn;
    Label1: TLabel;
    DealerList: TSortListView;
    FindBtn: TPngSpeedButton;
    ImageList1: TImageList;
    PngBitBtn1: TPngBitBtn;
    procedure FindBtnClick(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure DealerListDblClick(Sender: TObject);
    procedure EditFindDealerKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFindDealer: TfrmFindDealer;

implementation

uses uDm;

{$R *.dfm}

procedure TfrmFindDealer.FindBtnClick(Sender: TObject);
var ZQFindDealer: TZQuery;
    SortBySQL: String;
    i: integer;
    SearchText: string;
begin
  Case RdgSort.ItemIndex of
    0 : SortBySQL := ' ORDER BY CODE ASC';
    1 : SortBySQL := ' ORDER BY FNAME ASC';
  end;

  with Dm do
  begin
    DealerList.Clear;
    DealerList.Items.BeginUpdate;
    try
      if not ZConnection1.Connected then Exit;

      ZQFindDealer := TZQuery.Create(nil);
      try
        ZQFindDealer.Connection := ZConnection1;
        SearchText := Trim(EditFindDealer.Text);
        if SearchText = '' then
          ZQFindDealer.SQL.Text := 'SELECT * FROM DEALER ' + SortBySQL
        else
          ZQFindDealer.SQL.Text := 'SELECT * FROM DEALER WHERE (COALESCE(FNAME,'''') || '' '' || COALESCE(LNAME,'''') || '' '' || COALESCE(CODE,'''')) LIKE ' + QuotedStr('%' + SearchText + '%') + SortBySQL;

        try
          ZQFindDealer.Open;
          if ZQFindDealer.Active and (not ZQFindDealer.IsEmpty) then
          begin
            i := 0;
            ZQFindDealer.First;
            while not ZQFindDealer.Eof do
            begin
              with DealerList.Items.Add do
              begin
                Caption := ZQFindDealer.FieldByName('CODE').AsString;
                SubItems.Add(Trim(ZQFindDealer.FieldByName('FNAME').AsString + ' ' + ZQFindDealer.FieldByName('LNAME').AsString));
                if ZQFindDealer.FieldByName('HASCOM').AsInteger > 0 then SubItems.Add('มี') else SubItems.Add('ไม่มี');
                Inc(i);
              end;
              ZQFindDealer.Next;
            end;
          end;
        except
        end;
      finally
        ZQFindDealer.Free;
      end;
    finally
      DealerList.Items.EndUpdate;
    end;
  end;
end;

procedure TfrmFindDealer.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  OkBtn.Enabled := DealerList.SelCount > 0;
end;

procedure TfrmFindDealer.FormShow(Sender: TObject);
begin
  DealerList.Clear;
  FindBtnClick(Sender);
  EditFindDealer.SetFocus;
end;

procedure TfrmFindDealer.DealerListDblClick(Sender: TObject);
begin
  if DealerList.SelCount > 0 then
    Modalresult := mrOk;
end;

procedure TfrmFindDealer.EditFindDealerKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    FindBtnClick(Sender);
end;

end.
