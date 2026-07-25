unit uFindServCust;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, PngSpeedButton, IAsemiPanel, Grids,
  se_controls, KsSkinGroupBoxs, NiceGrid,DB, ADODB, AppEvnts, PngBitBtn,
  ImgList, ComCtrls, SortListViews,ABSMain;

type
  TfrmFindServCust = class(TForm)
    Panel1: TPanel;
    EditFindCust: TEdit;
    RdgSort: TRadioGroup;
    Panel2: TPanel;
    ApplicationEvents1: TApplicationEvents;
    OkBtn: TPngBitBtn;
    Label1: TLabel;
    CustList: TSortListView;
    FindBtn: TPngSpeedButton;
    ImageList1: TImageList;
    PngBitBtn1: TPngBitBtn;
    procedure FindBtnClick(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure CustListDblClick(Sender: TObject);
    procedure EditFindCustKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFindServCust: TfrmFindServCust;

implementation

uses uDm;

{$R *.dfm}

procedure TfrmFindServCust.FindBtnClick(Sender: TObject);
var QrFindCust : TABSQuery;
    SortBySQL: String;
    i: integer;
begin
 with Dm do
 begin
  Case RdgSort.ItemIndex of
    0 : SortBySQL := ' ORDER BY CustID ASC';
    1 : SortBySQL := ' ORDER BY FNAME ASC';
  end;

  QrFindCust := TABSQuery.Create(nil);
  try
  except
  end;
  QrFindCust.DatabaseName := ExportDB.DatabaseName;
  try
    QrFindCust.Close;
  except
  end;
  QrFindCust.SQL.Clear;
  if EditFindCust.text = '' then
    QrFindCust.SQL.Add('Select * from Cust '+SortBySQL)
  else
    QrFindCust.SQL.Add('Select * from Cust where FName+" "+LName like "%'+EditfindCust.Text+'%"'+SortBySQL);
  try
    try
      QrFindCust.Open;
    except
    end;
  except
  end;

     With CustList do
   begin
     Clear;
     Items.BeginUpdate;
     if QrFindCust.Active and (not QrFindCust.IsEmpty) then
     begin
       i := 0;
       QrFindCust.First;
       While Not QrfindCust.Eof do
       begin
          with Items.Add do
          begin
             try
                if QrFindCust.FieldByName('BFNAME').AsString = 'นาย' then
                  Items[i].ImageIndex := 0
                else if QrFindCust.FieldByName('BFNAME').AsString = 'นาง' then
                  Items[i].ImageIndex := 1
                else if (QrFindCust.FieldByName('BFNAME').AsString = 'น.ส.')or(QrFindCust.FieldByName('BFNAME').AsString = 'นางสาว') then
                  Items[i].ImageIndex := 2
                else if QrFindCust.FieldByName('BFNAME').AsString = 'นางสาว' then
                  Items[i].ImageIndex := 3
                else
                  Items[i].ImageIndex := 4;

                Caption := QrfindCust.FieldByName('CUSTID').AsString;
                SubItems.Add(QrFindCust.fieldByName('FName').AsString+' '+QrFindCust.fieldByName('LName').AsString);
                if QrfindCust.FieldByName('HASCOM').AsBoolean then
                 SubItems.Add('มี')
                else
                 SubItems.Add('ไม่มี');

                QrFindCust.Next;
                inc(i);
             except
             end;
          end;
       end;
     end;
     Items.EndUpdate;
     QrFindCust.Free;
     CustList.SetFocus;
   end;
  end;
end;

procedure TfrmFindServCust.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  OkBtn.Enabled := CustList.SelCount > 0;
end;

procedure TfrmFindServCust.FormShow(Sender: TObject);
begin
  CustList.Clear;
  EditFindcust.SetFocus;
end;

procedure TfrmFindServCust.CustListDblClick(Sender: TObject);
begin
  if CustList.SelCount > 0 then
    Modalresult := mrOk;
end;

procedure TfrmFindServCust.EditFindCustKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    FindBtnClick(Sender);
end;

end.
