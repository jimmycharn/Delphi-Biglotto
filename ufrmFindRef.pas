unit ufrmFindRef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, PngSpeedButton, NiceGrid, ABSMain,
  IAsemiPanel,DB, ADODB, AppEvnts, ComCtrls, PngBitBtn, SortListViews,
  Menus;

type
  TfrmFindRef = class(TForm)
    Panel1: TPanel;
    PngSpeedButton6: TPngSpeedButton;
    RdGroup: TRadioGroup;
    Panel2: TPanel;
    PngSpeedButton1: TPngSpeedButton;
    ApplicationEvents1: TApplicationEvents;
    DatePick1: TDateTimePicker;
    DatePick2: TDateTimePicker;
    OkBtn: TPngBitBtn;
    RdgSortBy: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    EdCustID: TEdit;
    SpeedButton1: TSpeedButton;
    EdEmployID: TEdit;
    SpeedButton2: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    RefList: TSortListView;
    Panel3: TPanel;
    lbItems: TLabel;
    lbSum: TLabel;
    Label5: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure PngSpeedButton1Click(Sender: TObject);
    procedure PngSpeedButton6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure RefListDblClick(Sender: TObject);
    procedure RefListMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFindRef: TfrmFindRef;

implementation

uses uDm, Utils, uFindCust, uMain;

{$R *.dfm}

procedure TfrmFindRef.PngSpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmFindRef.PngSpeedButton6Click(Sender: TObject);
var QrFindRef,QrCust : TABSQuery;
    OrderBy,SortBy,SQLCon : String;
    years,months,days: Word;
    aDate, bDate: TDateTime;
    SumRef: Extended;
begin
 With Dm, fMain do
 begin
  aDate := DatePick.Date;

  QrFindRef := TABSQuery.Create(nil);
  try
  except
  end;
  QrFindRef.DatabaseName := Database.DatabaseName;
  try
    QrFindRef.Close;
  except
  end;
  QrFindRef.SQL.Clear;
  Case RdGroup.ItemIndex of
    0 : OrderBy := 'RefNo ';
    //1 : OrderBy := 'Sum(Price) ';
  end;
    Case RdGSortBy.ItemIndex of
    1 : SortBy := 'DESC';
    0 : SortBy := 'ASC';
  end;

  QrFindRef.SQL.Add('Select RefNo from Data where (lotType = :aLotType) '+
                      'and (Period_Date = :aDate) and (CustNo = :aCustNo) Group By RefNo Order By '+OrderBy+SortBy);

  //Showmessage(DateToStr(aDate));
  //Showmessage(edCustNo.Text);
  QrFindRef.ParamByName('aLotType').Value := StrToInt(edLotID.Text);
  QrFindRef.ParamByName('aDate').Value := DateToSTr(aDate);
  QrFindRef.ParamByName('aCustNo').Value := edCustNo.Text;
  try
    try
      QrFindRef.Open;
    except
    end;
  except
  end;
  
  SumRef := 0;
     With RefList do
   begin
     Clear;
     Items.BeginUpdate;
     if QrfindRef.Active and (not QrfindRef.IsEmpty) then
     begin
       QrfindRef.First;
       While Not QrfindRef.Eof do
       begin
          with Items.Add do
          begin
             try
                Caption := QrfindRef.FieldByName('RefNo').AsString;
                QrfindRef.Next;
             except
             end;
          end;
       end;
     end;
     Items.EndUpdate;
     QrCust.Free;
     QrfindRef.Free;
     lbItems.Caption := IntToStr(Items.Count)+' รายการ';
   end;
  end;
end;

procedure TfrmFindRef.FormShow(Sender: TObject);
begin
 with fMain do
 begin
  RefList.Clear;
  DatePick1.Date := DatePick.Date;
  DatePick2.Date := DatePick.Date;
 end;
end;

procedure TfrmFindRef.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  OkBtn.Enabled := RefList.SelCount > 0;
end;

procedure TfrmFindRef.SpeedButton1Click(Sender: TObject);
begin
  with frmFindCust,CustList do
  begin
    if ShowModal = mrOk then
    begin
      EdCustID.Text := Items[ItemIndex].Caption;
    end;
  end;
end;

procedure TfrmFindRef.SpeedButton2Click(Sender: TObject);
begin
 {
  with frmFindEmploy,EmpList do
  begin
    if ShowModal = mrOk then
    begin
      EdEmployID.Text := Items[ItemIndex].Caption;
    end;
  end;
 }
end;

procedure TfrmFindRef.RefListDblClick(Sender: TObject);
begin
  if RefList.SelCount > 0 then
    Modalresult := mrOk;
end;

procedure TfrmFindRef.RefListMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var P: TPoint;
begin
  if (RefList.SelCount > 0) and (Button = mbRight) then
  begin
    P := RefList.ClientToScreen(Point(x,y));
    popupmenu1.Popup(P.x,P.y);
  end;

end;

procedure TfrmFindRef.N1Click(Sender: TObject);
Var QrDelRef: TABSQuery;
begin
  with RefList, Dm do
  begin
    if MessageDlg('ต้องลบเลขที่อ้างอิง  "'+Items[Selected.Index].Caption+'"  ใช่หรือไม่?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        QrDelRef := TABSQuery.Create(nil);
        try
        except
        end;
        QrDelRef.DatabaseName := Database.DatabaseName;
        try
          QrDelRef.Close;
        except
        end;
        QrDelRef.SQL.Clear;
        QrDelRef.SQL.Add('Delete from data Where RefNo = :aRefNo');
        QrDelRef.ParamByName('aRefNo').Value := Items[Selected.Index].Caption;
        try
          try
            QrDelRef.ExecSQL;
          except
          end;
        except
        end;
        Items.Delete(Selected.Index);
      except
      end;
    end;
  end;
end;

end.
