unit uCutByChart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, TeeProcs, Chart, ExtCtrls, NiceGrid, ComCtrls,
  SortListViews, StdCtrls, Buttons, se_controls, KsSkinButtons, ABSMain,
  sCustomComboBox, sEdit, KsSkinEdits, KsSkinCheckBoxs, Menus, Mask,
  sCustomComboEdit, sComboEdit, XLSReadWriteII, BIFFRecsII,
{$ifdef ver140}
  Variants,
{$endif}
  CellFormats, siComp, sHintManager, BrwsFldr, ZDataset;

type
  TfrmCutByChart = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    DeleteBtn: TSeSkinButton;
    BtnCutChart: TSeSkinButton;
    Panel5: TPanel;
    ChartListData: TSortListView;
    Panel6: TPanel;
    ChartListCut: TSortListView;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    SeSkinButton2: TSeSkinButton;
    BtnCutOut: TSeSkinButton;
    BtnCutPrint: TSeSkinButton;
    Panel11: TPanel;
    CbLotType: TComboBox;
    HDatePick: TDateTimePicker;
    edLID: TsEdit;
    Panel12: TPanel;
    SeSkinButton5: TSeSkinButton;
    EdSendName: TSeSkinEdit;
    lbOnHandItem: TLabel;
    lbOnHand: TLabel;
    lbCutItem: TLabel;
    lbCut: TLabel;
    Panel13: TPanel;
    ChkDataAll: TSeSkinCheckBox;
    Panel14: TPanel;
    ChkCutAll: TSeSkinCheckBox;
    ChartPopMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Panel15: TPanel;
    Panel16: TPanel;
    Chart1: TChart;
    Series1: TBarSeries;
    RdUpLine: TRadioButton;
    RdDownLine: TRadioButton;
    Panel17: TPanel;
    CbCutType: TsComboBox;
    Label2: TLabel;
    edDealerID: TsComboEdit;
    edDealerName: TsEdit;
    Panel18: TPanel;
    SortListView1: TSortListView;
    Panel19: TPanel;
    Panel20: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    SeSkinButton7: TSeSkinButton;
    Panel21: TPanel;
    SeSkinCheckBox1: TSeSkinCheckBox;
    Panel22: TPanel;
    SeSkinButton6: TSeSkinButton;
    XLS: TXLSReadWriteII;
    SaveXLSDialog: TSaveDialog;
    BtnExcelExport: TSeSkinButton;
    BtnCutToCb: TSeSkinButton;
    MenuCutClpbrd: TPopupMenu;
    N13: TMenuItem;
    N28: TMenuItem;
    Panel23: TPanel;
    RdgNumType: TRadioGroup;
    procedure ChartListDataCustomSort(Sender: TObject; ColIndex: Integer;
      Str1, Str2: String; var Res: Integer; var Handled: Boolean);
    procedure ChartListDataClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Chart1AfterDraw(Sender: TObject);
    procedure Series1BeforeDrawValues(Sender: TObject);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Series1DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series1AfterDrawValues(Sender: TObject);
    procedure Chart1DblClick(Sender: TObject);
    procedure BtnCutPrintClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure BtnCutOutClick(Sender: TObject);
    procedure CbCutTypeChange(Sender: TObject);
    procedure BtnCutChartClick(Sender: TObject);
    procedure ChkDataAllClick(Sender: TObject);
    procedure ChkCutAllClick(Sender: TObject);
    procedure Panel16Resize(Sender: TObject);
    procedure edDealerIDButtonClick(Sender: TObject);
    procedure Panel4Resize(Sender: TObject);
    procedure BtnExcelExportClick(Sender: TObject);
    procedure BtnCutToCbMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N13Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure BtnCutToCbClick(Sender: TObject);
    procedure RdgNumTypeClick(Sender: TObject);
    procedure Panel5Resize(Sender: TObject);
  private
    { Private declarations }
    function findDealer(Code: String): Boolean;
    function ShowDealer(Code: String): Boolean;
    
  public
    { Public declarations }
     procedure ShowChart;
     procedure SumList(DataList, CutList: TSortListView);
  end;

var
  frmCutByChart: TfrmCutByChart;
  MValue: Double;
  GridTemp: Array[0..19] of TNiceGrid;
  ToTal_Items : Integer;
  ToTal_Price : Double;

implementation

uses Utils, uPrintCutPrev, uDm, uMain, uFindDealer, uSelectCut, Clipbrd;

{$R *.dfm}


procedure TfrmCutByChart.ShowChart;
Var i: integer;
    DataX: Extended;
    DataY: String;
begin

 Chart1.Title.Text.Text := CbCutType.Items.Strings[CbCutType.itemindex];// 'เลข 3 ตัวตรง';
 With Series1,ChartListData do
 Begin
  //Series2.Clear;
  //for t := 0 to ChartGridData.RowCount-1 do
  Series1.Clear;
  //with ChartListData do
  for i := 0 to Items.Count-1 do
  begin
    //DataX := TxtToFloat(ChartGridData[1,t]);
    //DataY := ChartGridData[0,t];

    if Items[i].Checked then
    begin
      DataX := TxtToFloat(Items[i].SubItems[0]);
      DataY := Items[i].Caption;

      Add( DataX, DataY, clTeeColor) ;
    end;

    //With Series2 do
      //AddXY( dm.QrExpReportsumpay.Value, t, dm.QrExpReportlkexpKind.Value, clTeeColor);

  end;
 end;
end;

procedure TfrmCutByChart.ChartListDataCustomSort(Sender: TObject;
  ColIndex: Integer; Str1, Str2: String; var Res: Integer;
  var Handled: Boolean);
Var  n1, n2: Extended; //Integer;
begin

  if (ColIndex in [1]) then
  begin
    n1 := TxtToFloat(Str1);
    n2 := txtToFloat(Str2);
    if (n1 = n2)
      then Res := 0 else
    if (n1 > n2)
      then Res := 1
      else Res := -1;
    Handled := True;
  end;


end;


procedure TfrmCutByChart.ChartListDataClick(Sender: TObject);
begin
  ShowChart;
end;

function TfrmCutByChart.ShowDealer(Code: String): Boolean;
Var QrFindDealer : TABSQuery;
    i,j: integer;
begin
 with Dm do
 begin
  Result := false;
  QrFindDealer := TABSQuery.Create(nil);
  try
  except
  end;
  QrFindDealer.DatabaseName := Database.DatabaseName;
  try
    QrFindDealer.Close;
  except
  end;
  QrFindDealer.SQL.Clear;
  if EdDealerID.Text <> '' then
    QrFindDealer.SQL.Add('Select * from Dealer Where Code like "%'+Code+'%"')
  else
    QrFindDealer.SQL.Add('Select * from Dealer Where Code = "'+Code+'"');// :aCode');

  try
    try
      QrFindDealer.Open;
    except
    end;
  except
  end;

  If QrFindDealer.Eof then
  begin
    edDealerName.Text := '';
    Showmessage('รหัสเจ้ามือไม่ถูกต้อง กรุณากรอกรหัสเจ้ามือใหม่ให้ถูกต้อง');
   {
    for i:= 0 to PayGrid.Rowcount-1 do
    begin
      for j := 0 to PayGrid.ColCount-1 do
      begin
          PayGrid.Cells[j,i] := '0';
      end;
    end;
   }
    EdDealerID.SetFocus;
    EdDealerID.SelectAll;
    Exit;
  end;

 {
  PayGrid[0,0]   := QrFindDealer.FieldByName('ComRnUp').AsString;
  PayGrid[0,1]   := QrFindDealer.FieldByName('ComRnDwn').AsString;
  PayGrid[0,2]   := QrFindDealer.FieldByName('ComPosUp').AsString;
  PayGrid[0,3]   := QrFindDealer.FieldByName('ComPosDwn').AsString;
  PayGrid[0,4]   := QrFindDealer.FieldByName('Com2Up').AsString;
  PayGrid[0,5]   := QrFindDealer.FieldByName('Com2Tod').AsString;
  PayGrid[0,6]   := QrFindDealer.FieldByName('Com2Dwn').AsString;
  PayGrid[0,7]   := QrFindDealer.FieldByName('Com2Mee').AsString;
  PayGrid[0,8]   := QrFindDealer.FieldByName('Com2Pos').AsString;
  PayGrid[0,9]   := QrFindDealer.FieldByName('Com3Up').AsString;
  PayGrid[0,10]  := QrFindDealer.FieldByName('Com3Tod').AsString;
  PayGrid[0,11]  := QrFindDealer.FieldByName('Com3Dwn').AsString;
  PayGrid[0,12]  := QrFindDealer.FieldByName('Com4').AsString;
  PayGrid[0,13]  := QrFindDealer.FieldByName('Com4Tod').AsString;
  PayGrid[0,14]  := QrFindDealer.FieldByName('Com5').AsString;
  PayGrid[0,15]  := QrFindDealer.FieldByName('Com5Tod').AsString;

  PayGrid[1,0]   := FormatFloat('###,##0.##',QrFindDealer.FieldByName('PayRnUp').AsFloat);
  PayGrid[1,1]   := FormatFloat('###,##0.##',QrFindDealer.FieldByName('PayRnDwn').AsFloat);
  PayGrid[1,2]   := FormatFloat('###,##0.##',QrFindDealer.FieldByName('PayPosUp').AsFloat);
  PayGrid[1,3]   := FormatFloat('###,##0.##',QrFindDealer.FieldByName('PayPosDwn').AsFloat);
  PayGrid[1,4]   := FormatFloat('###,##0.##',QrFindDealer.FieldByName('Pay2Up').AsFloat);
  PayGrid[1,5]   := FormatFloat('###,##0.##',QrFindDealer.FieldByName('Pay2Tod').AsFloat);
  PayGrid[1,6]   := FormatFloat('###,##0.##',QrFindDealer.FieldByName('Pay2Dwn').AsFloat);
  PayGrid[1,7]   := FormatFloat('###,##0.##',QrFindDealer.FieldByName('Pay2Mee').AsFloat);
  PayGrid[1,8]   := FormatFloat('###,##0.##',QrFindDealer.FieldByName('Pay2Pos').AsFloat);
  PayGrid[1,9]   := FormatFloat('###,##0.##',QrFindDealer.FieldByName('Pay3Up').AsFloat);
  PayGrid[1,10]  := FormatFloat('###,##0.##',QrFindDealer.FieldByName('Pay3Tod').AsFloat);
  PayGrid[1,11]  := FormatFloat('###,##0.##',QrFindDealer.FieldByName('Pay3Dwn').AsFloat);
  PayGrid[1,12]  := FormatFloat('###,##0.##',QrFindDealer.FieldByName('Pay4').AsFloat);
  PayGrid[1,13]  := FormatFloat('###,##0.##',QrFindDealer.FieldByName('Pay4Tod').AsFloat);
  PayGrid[1,14]  := FormatFloat('###,##0.##',QrFindDealer.FieldByName('Pay5').AsFloat);
  PayGrid[1,15]  := FormatFloat('###,##0.##',QrFindDealer.FieldByName('Pay5Tod').AsFloat);
 }
  //DealerHasCom := QrFindDealer.FieldByName('HasCom').AsBoolean;
  EdDealerID.Text := QrFindDealer.FieldByName('Code').AsString;
  edDealerName.Text := ' '+QrFindDealer.FieldByName('FName').AsString+' '+QrFindDealer.FieldByName('LName').AsString;
  EdDealerID.SetFocus;
  EdDealerID.SelectAll;
  Result := true;
 end;
end;

procedure TfrmCutByChart.FormShow(Sender: TObject);
begin
  RdgNumType.Height := ChartListData.Height+5;
  if Not ShowDealer(EdDealerID.Text) then
    edDealerName.Text := '';

  BtnCutChart.Top := (Panel4.Height div 2)-(BtnCutChart.Height+(BtnCutChart.Height div 2));
  DeleteBtn.Top   := BtnCutChart.Top+Round(BtnCutChart.Height*1.5);
  ChartListCut.Items.BeginUpdate;
  ChartListCut.Clear;
  ChartListCut.Items.EndUpdate;
  //CbCutTypeChange(Sender);
  RdgNumTypeClick(Sender);
  SumList(ChartListData,ChartListCut);
  //ShowChart;
end;

procedure TfrmCutByChart.Chart1AfterDraw(Sender: TObject);
var Middle : Integer;
begin
  //Middle:=(Chart1.BottomAxis.IStartPos+Chart1.BottomAxis.IEndPos) div 2;
  //Chart1.Canvas.DoVertLine(Middle,Chart1.LeftAxis.IStartPos,Chart1.LeftAxis.IEndPos);

  //Middle:=(Chart1.BottomAxis.IStartPos+Chart1.BottomAxis.IEndPos) div 2;
  //Chart1.Canvas.DoHorizLine(Middle,Chart1.BottomAxis.IStartPos,Chart1.BottomAxis.IEndPos);
end;

procedure TfrmCutByChart.Series1BeforeDrawValues(Sender: TObject);
var
YPos, XPos, XValue: Integer;
begin
 {
  with Chart1, Chart1.Canvas do
  begin
    Ypos := Series[ 0 ].CalcYPosValue(MValue);
    Pen.Color := clRed;
    Pen.Width := 1;
    Pen.Style := psSolid;
    MoveTo( ChartRect.Left, YPos );
    LineTo( ChartRect.Right, YPos );

   
    XValue := 3;
    Xpos := Series[ 0 ].CalcXPosValue( XValue );
    Pen.Color := clBlue;
    Pen.Width := 1;
    Pen.Style := psDot;
    MoveTo( XPos, ChartRect.Bottom );
    LineTo( XPos, ChartRect.Top );
   }
  //end;
end;

procedure TfrmCutByChart.Chart1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  XVal: double;
  YVal: double;
  YPos, XPos, XValue: Integer;
begin
  XVal:=Chart1.Series[0].XScreenToValue(x);// .Axis.Bottom.CalcPosPoint(X);
  YVal:=Chart1.Series[0].YScreenToValue(y);// .XScreenToValue(x) .Axes.Left.CalcPosPoint(Y);

  if RdUpLine.Checked then
  begin
    Chart1.Title.Text[0]:= 'ตัดยอดที่เกิน '+FormatFloat('#,###.##',Round(YVal))+' บาท';//    +IntToStr(Round(YVal))+' บาท';
  end
  else
    Chart1.Title.Text[0]:= 'ตัดยอดที่ต่ำกว่า '+IntToStr(Round(YVal))+' บาท';
  //Chart1.Title.Text[0]:=IntToStr(Round(XVal))+' , '+IntToStr(Round(YVal));
  // FormatFloat('#.##', XVal) + ' , ' + FormatFloat('#.##', YVal);
  MValue := Round(YVal);

end;

procedure TfrmCutByChart.Series1DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin

  //Series1BeforeDrawValues(Sender);
end;

procedure TfrmCutByChart.Series1AfterDrawValues(Sender: TObject);
Var YPos, XPos, XValue: Integer;
begin 
  with Chart1, Chart1.Canvas do
  begin
    Ypos := Series[ 0 ].CalcYPosValue(MValue);
    Pen.Color := clRed;
    Pen.Width := 1;
    Pen.Style := psSolid;
    MoveTo( ChartRect.Left, YPos );
    LineTo( ChartRect.Right, YPos );
  end;
end;

procedure TfrmCutByChart.SumList(DataList, CutList: TSortListView);
Var i: integer;
begin
  With DataList do
  begin
    Total_Price := 0;
    for i := 0 to Items.Count-1 do
    begin
      Total_Price := Total_Price+txtToFloat(Items[i].SubItems[0]);

    end;
    Total_Items := Items.Count;

    lbOnHandItem.Caption := IntToStr(Total_Items)+' ประตู';
    lbOnHand.Caption     := FormatFloat('#,##0.##',Total_Price);
  end;
    //-------------------------------------------------------------------

  With CutList do
  begin
    Total_Price := 0;
    for i := 0 to Items.Count-1 do
    begin
      Total_Price := Total_Price+txtToFloat(Items[i].SubItems[0]);

    end;
    Total_Items := Items.Count;

    lbCutItem.Caption := IntToStr(Total_Items)+' ประตู';
    lbCut.Caption     := FormatFloat('#,##0.##',Total_Price);
  end;

end;


procedure TfrmCutByChart.Chart1DblClick(Sender: TObject);
Var i,j: integer;
    foundCutNum: Boolean;
begin
  With ChartListData do
  begin
   if MValue >= 1 then
   begin
    ChartListCut.Items.BeginUpdate;
    items.BeginUpdate;

    for i := Items.Count-1 DownTo 0 do
    begin

      if RdUpLine.Checked then //เลือกตัดบนเส้น
      begin
        if txtToFloat(items[i].SubItems[0]) > MValue then
        begin
          FoundCutNum := false;
          for j := 0 to ChartListCut.Items.Count-1 do
          begin
            if ChartListCut.Items[j].Caption = ChartListData.Items[i].Caption then
            begin
              FoundCutNum := true;
              Break;
            end;
          end;

          if FoundCutNum then
          begin
            ChartListCut.Items[j].SubItems[0] := FormatFloat('#,###.##',txtToFloat(ChartListCut.Items[j].SubItems[0])+(txtToFloat(ChartListData.Items[i].SubItems[0])-MValue));
          end
          else
          begin
            With ChartListCut.Items.Add do
            begin
              Caption := ChartListData.Items[i].Caption;
              SubItems.Add(FormatFloat('#,###.##',(txtToFloat(ChartListData.Items[i].SubItems[0])-MValue)));
            end;
          end;

          Items[i].SubItems[0] := FormatFloat('#,###.##', MValue);

        end;
      end
      else
      begin
        if txtToFloat(items[i].SubItems[0]) <= MValue then
        begin

          FoundCutNum := false;
          for j := 0 to ChartListCut.Items.Count-1 do
          begin
            if ChartListCut.Items[j].Caption = ChartListData.Items[i].Caption then
            begin
              FoundCutNum := true;
              Break;
            end;
          end;

          if FoundCutNum then
          begin
            ChartListCut.Items[j].SubItems[0] := FormatFloat('#,###.##',txtToFloat(ChartListCut.Items[j].SubItems[0])+txtToFloat(ChartListData.Items[i].SubItems[0]));
          end
          else
          begin
            With ChartListCut.Items.Add do
            begin
              Caption := ChartListData.Items[i].Caption;
              SubItems.Add(FormatFloat('#,###.##',txtToFloat(ChartListData.Items[i].SubItems[0])));
            end;
          end;

          Items[i].Delete
        end
        else
        begin

          FoundCutNum := false;
          for j := 0 to ChartListCut.Items.Count-1 do
          begin
            if ChartListCut.Items[j].Caption = ChartListData.Items[i].Caption then
            begin
              FoundCutNum := true;
              Break;
            end;
          end;

          if FoundCutNum then
          begin
            ChartListCut.Items[j].SubItems[0] := FormatFloat('#,###.##',txtToFloat(ChartListCut.Items[j].SubItems[0])+MValue);
          end
          else
          begin
            With ChartListCut.Items.Add do
            begin
              Caption := ChartListData.Items[i].Caption;
              SubItems.Add(FormatFloat('#,###.##',MValue));
            end;
          end;

          Items[i].SubItems[0] := FormatFloat('#,###.##', (txtToFloat(Items[i].SubItems[0])-MValue));
        end;
      end;
    end;
    
    Items.EndUpdate;
    ChartListCut.Items.EndUpdate;

    ChkCutAll.Checked := true;
    for i := 0 to ChartListCut.Items.Count-1 do
        ChartListCut.Items[i].checked := true;

    SumList(ChartListData,ChartListCut);


   end
   else Showmessage('การตัดออกไม่ถูกต้อง ยอดที่ต้องการตัดต้องไม่ต่ำกว่า 1 บาท'); 

  end;
  ShowChart;

end;

procedure TfrmCutByChart.BtnCutPrintClick(Sender: TObject);
begin
   if ChartListCut.Items.Count > 0 then
   begin
      //frmPrintCutPrev.InputPageCut(CutListNum, DatePick.Date, ComboLotType, ComboCutType, EdCutName.Text);
      //frmPrintCutPrev.InputPageCut(ChartListCut, HDatePick.Date, CbLotType, '3 ตัวบน', EdSendName.Text);
      frmPrintCutPrev.InputPageCut(ChartListCut, HDatePick.Date, CbLotType, CbCutType.Text, EdSendName.Text);
      frmPrintCutPrev.Showmodal;

      //if ChkPrintCut.Checked then
        //Btn_CutClick(Sender);
   end
   else Showmessage('ไม่พบข้อมูลเลขเกินอั้นที่ต้องการพิมพ์');
end;

procedure TfrmCutByChart.DeleteBtnClick(Sender: TObject);
Var FoundNum : Boolean;
    i,j: integer;
begin
    ChartListCut.Items.BeginUpdate;
    ChartListData.Items.BeginUpdate;
    for i := ChartListCut.Items.Count-1 DownTo 0 do
    begin
      if ChartListCut.Items[i].Checked then
      begin

          FoundNum := false;
          for j := 0 to ChartListData.Items.Count-1 do
          begin
            if ChartListData.Items[j].Caption = ChartListCut.Items[i].Caption then
            begin
              FoundNum := true;
              Break;
            end;
          end;

          if FoundNum then
          begin
            ChartListData.Items[j].SubItems[0] := FormatFloat('#,###.##',txtToFloat(ChartListData.Items[j].SubItems[0])+txtToFloat(ChartListCut.Items[i].SubItems[0]));
          end
          else
          begin
            With ChartListData.Items.Add do
            begin
              Caption := ChartListCut.Items[i].Caption;
              SubItems.Add(FormatFloat('#,###.##',txtToFloat(ChartListCut.Items[i].SubItems[0])));
            end;
          end;

          ChartListCut.Items[i].Delete;

      end;
    end;
    ChartListData.Items.EndUpdate;
    ChartListCut.Items.EndUpdate;

    ChkDataAll.Checked := true;
    for i := 0 to ChartListData.Items.Count-1 do
        ChartListData.Items[i].checked := true;

    SumList(ChartListData,ChartListCut);
    ShowChart;


end;

procedure TfrmCutByChart.BtnCutOutClick(Sender: TObject);
Var TCutDat: TABSTable;
    i,j,CutCol,CutRow: integer;
    years, months, dates : Word;
    CutTime: TDateTime;
    NumType: String;
    NGrid : TNiceGrid;
    FoundNum: Boolean;
    ZQExec: TZQuery;
    AmountVal: Double;
begin

  with ChartListCut do
  begin
    j:=0;
    //Sum:= 0;
    //Itm:=0;
    if Items.Count > 0 then
    begin
      for i:= 0 to Items.Count-1 do
      begin
          if items[i].Checked = true then
          begin
            inc(j);
            //Sum := Sum + txtToFloat(items[i].SubItems[0]);
            //inc(Itm);
          end;
      end;
    end;
  end;
  if j <= 0 then
  begin
    Showmessage('ไม่พบข้อมูลที่ต้องการตีออก');
    exit;
  end;

  if MessageDlg('ต้องการตีออกจำนวน '+IntToStr(j)+' รายการ ใช่หรือไม่?',
  mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

  if ChartListCut.Items.Count > 0 then

  //begin
    Case CbCutType.ItemIndex of
      0: NumType := 'RunUp';
      1: NumType := 'NumPos1';
      2: NumType := 'NumPos2';
      3: NumType := 'NumPos3';
      4: NumType := 'RunDown';
      5: NumType := 'DownPos1';
      6: NumType := 'DownPos2';
      7: NumType := 'Num2Up';
      8: NumType := 'Num2Tod';
      9: NumType := 'Num2Mee';
     10: NumType := 'Num2Left';
     11: NumType := 'Num2Right';
     12: NumType := 'Num2Down';
     13: NumType := 'Num3Up';
     14: NumType := 'Num3Tod';
     15: NumType := 'Num3Dwn';
     16: NumType := 'Num4';
     17: NumType := 'Num4Tod';
     18: NumType := 'Num5';
     19: NumType := 'Num5Tod';
    end;

    With Dm do
    begin
      DecodeDate(HDatePick.Date,years,months,dates);
      CutTime := Now;

      // 1. Firebird DB Insertion
      if ZConnection1.Connected then
      begin
        ChartListCut.Items.BeginUpdate;
        try
          for i := ChartListCut.Items.Count - 1 downto 0 do
          begin
            if ChartListCut.Items[i].Checked then
            begin
              AmountVal := TxtToFloat(ChartListCut.Items[i].SubItems[0]);
              ZQExec := TZQuery.Create(nil);
              try
                ZQExec.Connection := ZConnection1;
                ZQExec.SQL.Text := 'INSERT INTO CUT (CutDate, DateCut, LottoType, Num, DealerID, ' + NumType + ') ' +
                                  'VALUES (:aCutDate, :aDateCut, :aLottoType, :aNum, :aDealerID, :aAmount)';
                ZQExec.ParamByName('aCutDate').AsDateTime := CutTime;
                ZQExec.ParamByName('aDateCut').AsDate     := HDatePick.Date;
                ZQExec.ParamByName('aLottoType').AsInteger:= StrToIntDef(edLID.Text, 0);
                ZQExec.ParamByName('aNum').AsString       := ChartListCut.Items[i].Caption;
                ZQExec.ParamByName('aDealerID').AsString  := '0001';
                ZQExec.ParamByName('aAmount').AsFloat     := AmountVal;
                try ZQExec.ExecSQL; except end;
              finally
                ZQExec.Free;
              end;

              ChartListCut.Items[i].Delete;
            end;
          end;
        finally
          ChartListCut.Items.EndUpdate;
        end;
      end;

      // 2. ABS DB Insertion (only if ABS database connected)
      if Database.Connected then
      begin
        try
          TCutDat := TABSTable.Create(nil);
          TCutDat.DatabaseName := Database.DatabaseName;
          TCutDat.TableName := 'Cut';
          try TCutDat.Open; except end;
          With ChartListCut, TCutDat do
          begin
            Database.StartTransaction;
            ChartListCut.Items.BeginUpdate;
            for i := Items.Count - 1 downto 0 do
            begin
              if items[i].Checked = true then
              begin
                Append;
                TcutDat.FieldByName('CutDate').AsDateTime  := CutTime;
                TcutDat.FieldByName('DateCut').AsDateTime  := HDatePick.Date;
                TcutDat.FieldByName('LottoType').AsInteger := StrtoInt(edLID.Text);
                TcutDat.FieldByName('Num').AsString        := Items[i].Caption;
                TcutDat.FieldByName('DealerID').AsString   := '0001';
                TcutDat.FieldByName(NumType).AsFloat       := TxtToFloat(Items[i].SubItems[0]);
                items[i].Delete;
              end;
            end;
            Post;
            Database.Commit(False);
          end;
          TCutDat.Free;
          ChartListCut.Items.EndUpdate;
        except
        end;
      end;
      SumList(ChartListData,ChartListCut);

      Case CbCutType.ItemIndex of
        0: begin NGrid := GridTemp[0]; CutCol := 1; CutRow := 0; end;//LimitNum := 'Limit1'; Price := 'Price1'; end;
        1: begin NGrid := GridTemp[1]; CutCol := 2; CutRow := 1; end;//LimitNum := 'Limit2'; Price := 'Price2'; end;
        2: begin NGrid := GridTemp[2]; CutCol := 3; CutRow := 1; end;//LimitNum := 'Limit3'; Price := 'Price3'; end;
        3: begin NGrid := GridTemp[3]; CutCol := 4; CutRow := 1; end;//LimitNum := 'Limit4'; Price := 'Price4'; end;
        4: begin NGrid := GridTemp[4]; CutCol := 5; CutRow := 2; end;//LimitNum := 'Limit5'; Price := 'Price5'; end;
        5: begin NGrid := GridTemp[5]; CutCol := 6; CutRow := 3; end;//LimitNum := 'Limit6'; Price := 'Price6'; end;
        6: begin NGrid := GridTemp[6]; CutCol := 7; CutRow := 3; end;//LimitNum := 'Limit7'; Price := 'Price7'; end;
        7: begin NGrid := GridTemp[7]; CutCol := 1; CutRow := 4; end;//LimitNum := 'Limit1'; Price := 'Price1'; end;
        8: begin NGrid := GridTemp[8]; CutCol := 2; CutRow := 5; end;//LimitNum := 'Limit2'; Price := 'Price2'; end;
        9: begin NGrid := GridTemp[9]; CutCol := 3; CutRow := 6; end;//LimitNum := 'Limit3'; Price := 'Price3'; end;
       10: begin NGrid := GridTemp[10]; CutCol := 4; CutRow := 7; end;//LimitNum := 'Limit4'; Price := 'Price4'; end;
       11: begin NGrid := GridTemp[11]; CutCol := 5; CutRow := 7; end;//LimitNum := 'Limit5'; Price := 'Price5'; end;
       12: begin NGrid := GridTemp[12]; CutCol := 6; CutRow := 8; end;//LimitNum := 'Limit6'; Price := 'Price6'; end;
       13: begin NGrid := GridTemp[13]; CutCol := 1; CutRow := 9; end;//LimitNum := 'Limit1'; Price := 'Price1'; end;
       14: begin NGrid := GridTemp[14]; CutCol := 2; CutRow := 10; end;//LimitNum := 'Limit2'; Price := 'Price2'; end;
       15: begin NGrid := GridTemp[15]; CutCol := 3; CutRow := 11; end;//LimitNum := 'Limit3'; Price := 'Price3'; end;
       16: begin NGrid := GridTemp[16]; CutCol := 1; CutRow := 12; end;//LimitNum := 'Limit1'; Price := 'Price1'; end;
       17: begin NGrid := GridTemp[17]; CutCol := 2; CutRow := 13; end;//LimitNum := 'Limit2'; Price := 'Price2'; end;
       18: begin NGrid := GridTemp[18]; CutCol := 1; CutRow := 14; end;//LimitNum := 'Limit1'; Price := 'Price1'; end;
       19: begin NGrid := GridTemp[19]; CutCol := 2; CutRow := 15; end;//LimitNum := 'Limit2'; Price := 'Price2'; end;
      end;

      with ChartListCut do
      begin
        ChartListData.Items.BeginUpdate;
        for i :=  Items.Count-1 downto 0 do
        begin
          
          for j := 0 to ChartListData.Items.Count-1 do
          begin
            FoundNum := false;
            if ChartListCut.items[i].Caption = ChartListData.Items[j].Caption then
            begin
              ChartListData.Items[j].SubItems[0] := FormatFloat('#,###.##',(txtToFloat(ChartListData.Items[j].SubItems[0]))+(txtToFloat(Items[i].SubItems[0])) );
              FoundNum := true;
              Break;
            end;
          end;
          
          if Not FoundNum then
          begin
              with ChartListData.Items.Add do
              begin
                Caption  := Items[i].Caption;
                SubItems.Add(Items[i].SubItems[0]);
              end;
          end;
          
        end;
        ChartListData.Items.EndUpdate;
      end;

      With ChartListData do
      begin
        NGrid.BeginUpdate;
        NGrid.Clear;
        NGrid.RowCount := 1;

        for i := 0 to items.Count-1 do
        begin
          if i > 0 then
            NGrid.InsertRow(0);

          NGrid[0,0] := Items[i].Caption;
          NGrid[CutCol,0] := Items[i].SubItems[0];
        end;
        
        NGrid.EndUpdate;
        CbCutTypeChange(Sender);
      end;
    end;
end;

procedure TfrmCutByChart.CbCutTypeChange(Sender: TObject);
Var NGridCut: TNiceGrid;
    CutCol, CutRow, i: integer;
begin
  with fMain,ChartListData do
  begin

    ChartListCut.Items.BeginUpdate;
    Items.BeginUpdate;
    Items.Clear;
    ChartListCut.Items.Clear;

    Case CbCutType.ItemIndex of
      0: begin NGridCut := GridTemp[0]; CutCol := 1; CutRow := 0; end;//LimitNum := 'Limit1'; Price := 'Price1'; end;
      1: begin NGridCut := GridTemp[1]; CutCol := 2; CutRow := 1; end;//LimitNum := 'Limit2'; Price := 'Price2'; end;
      2: begin NGridCut := GridTemp[2]; CutCol := 3; CutRow := 1; end;//LimitNum := 'Limit3'; Price := 'Price3'; end;
      3: begin NGridCut := GridTemp[3]; CutCol := 4; CutRow := 1; end;//LimitNum := 'Limit4'; Price := 'Price4'; end;
      4: begin NGridCut := GridTemp[4]; CutCol := 5; CutRow := 2; end;//LimitNum := 'Limit5'; Price := 'Price5'; end;
      5: begin NGridCut := GridTemp[5]; CutCol := 6; CutRow := 3; end;//LimitNum := 'Limit6'; Price := 'Price6'; end;
      6: begin NGridCut := GridTemp[6]; CutCol := 7; CutRow := 3; end;//LimitNum := 'Limit7'; Price := 'Price7'; end;
      7: begin NGridCut := GridTemp[7]; CutCol := 1; CutRow := 4; end;//LimitNum := 'Limit1'; Price := 'Price1'; end;
      8: begin NGridCut := GridTemp[8]; CutCol := 2; CutRow := 5; end;//LimitNum := 'Limit2'; Price := 'Price2'; end;
      9: begin NGridCut := GridTemp[9]; CutCol := 3; CutRow := 6; end;//LimitNum := 'Limit3'; Price := 'Price3'; end;
     10: begin NGridCut := GridTemp[10]; CutCol := 4; CutRow := 7; end;//LimitNum := 'Limit4'; Price := 'Price4'; end;
     11: begin NGridCut := GridTemp[11]; CutCol := 5; CutRow := 7; end;//LimitNum := 'Limit5'; Price := 'Price5'; end;
     12: begin NGridCut := GridTemp[12]; CutCol := 6; CutRow := 8; end;//LimitNum := 'Limit6'; Price := 'Price6'; end;
     13: begin NGridCut := GridTemp[13]; CutCol := 1; CutRow := 9; end;//LimitNum := 'Limit1'; Price := 'Price1'; end;
     14: begin NGridCut := GridTemp[14]; CutCol := 2; CutRow := 10; end;//LimitNum := 'Limit2'; Price := 'Price2'; end;
     15: begin NGridCut := GridTemp[15]; CutCol := 3; CutRow := 11; end;//LimitNum := 'Limit3'; Price := 'Price3'; end;
     16: begin NGridCut := GridTemp[16]; CutCol := 1; CutRow := 12; end;//LimitNum := 'Limit1'; Price := 'Price1'; end;
     17: begin NGridCut := GridTemp[17]; CutCol := 2; CutRow := 13; end;//LimitNum := 'Limit2'; Price := 'Price2'; end;
     18: begin NGridCut := GridTemp[18]; CutCol := 1; CutRow := 14; end;//LimitNum := 'Limit1'; Price := 'Price1'; end;
     19: begin NGridCut := GridTemp[19]; CutCol := 2; CutRow := 15; end;//LimitNum := 'Limit2'; Price := 'Price2'; end;
    end;

    for i := 0 to NGridCut.RowCount-1 do
    begin
      if NGridcut[CutCol,i] <> '' then
      With Items.Add do
      begin
        Caption   := NGridCut[0,i];
        SubItems.Add(NGridcut[CutCol,i]);
      end;

    end;
    Items.EndUpdate;
    ChartListCut.Items.EndUpdate;

    for i := 0 to Items.Count-1 do
        Items[i].checked := true;

    SumList(ChartListData,ChartListCut);
    ShowChart;

  end;
end;

procedure TfrmCutByChart.BtnCutChartClick(Sender: TObject);
Var FoundCutNum : Boolean;
    i,j: integer;
    Subtract,OverStart,StartVal,EndVal: Double;
begin
  With ChartListData,frmSelectCut do
  begin
   if ShowModal = mrOk then
   begin
    ChartListCut.Items.BeginUpdate;
    items.BeginUpdate;

    for i := Items.Count-1 DownTo 0 do
    begin

      Case RdSelectCut.ItemIndex of
        0:begin
            if txtToFloat(items[i].SubItems[0]) > edOver.Value then
            begin
              FoundCutNum := false;
              for j := 0 to ChartListCut.Items.Count-1 do
              begin
                if ChartListCut.Items[j].Caption = ChartListData.Items[i].Caption then
                begin
                  FoundCutNum := true;
                  Break;
                end;
              end;

              if FoundCutNum then
              begin
                ChartListCut.Items[j].SubItems[0] := FormatFloat('#,###.##',txtToFloat(ChartListCut.Items[j].SubItems[0])+(txtToFloat(ChartListData.Items[i].SubItems[0])-edOver.Value));
              end
              else
              begin
                With ChartListCut.Items.Add do
                begin
                  Caption := ChartListData.Items[i].Caption;
                  SubItems.Add(FormatFloat('#,###.##',(txtToFloat(ChartListData.Items[i].SubItems[0])-edOver.Value)));
                end;
              end;

              Items[i].SubItems[0] := FormatFloat('#,###.##', edOver.Value);

              if txtToFloat(Items[i].SubItems[0]) <= 0 then
                Items[i].Delete

            end;
          end;

        1:begin
            if txtToFloat(items[i].SubItems[0]) < edLow.Value then
            begin

              FoundCutNum := false;
              for j := 0 to ChartListCut.Items.Count-1 do
              begin
                if ChartListCut.Items[j].Caption = ChartListData.Items[i].Caption then
                begin
                  FoundCutNum := true;
                  Break;
                end;
              end;

              if FoundCutNum then
              begin
                ChartListCut.Items[j].SubItems[0] := FormatFloat('#,###.##',txtToFloat(ChartListCut.Items[j].SubItems[0])+txtToFloat(Items[i].SubItems[0]));
              end
              else
              begin
                if txtToFloat(ChartListData.Items[i].SubItems[0]) > 0 then
                With ChartListCut.Items.Add do
                begin
                  Caption := ChartListData.Items[i].Caption;
                  SubItems.Add(FormatFloat('#,###.##',txtToFloat(ChartListData.Items[i].SubItems[0])));
                end;
              end;

              Items[i].Delete
            end
            else
            begin

              FoundCutNum := false;
              for j := 0 to ChartListCut.Items.Count-1 do
              begin
                if ChartListCut.Items[j].Caption = ChartListData.Items[i].Caption then
                begin
                  FoundCutNum := true;
                  Break;
                end;
              end;

              if FoundCutNum then
              begin
                ChartListCut.Items[j].SubItems[0] := FormatFloat('#,###.##',txtToFloat(ChartListCut.Items[j].SubItems[0])+edLow.Value);
              end
              else
              begin
                if edLow.Value > 0 then
                With ChartListCut.Items.Add do
                begin
                  Caption := ChartListData.Items[i].Caption;
                  SubItems.Add(FormatFloat('#,###.##',edLow.Value));
                end;
              end;

              Items[i].SubItems[0] := FormatFloat('#,###.##', (txtToFloat(Items[i].SubItems[0])-edLow.Value));
              if txtToFloat(Items[i].SubItems[0]) <= 0 then
                Items[i].Delete
            end;
          end;


        2:begin
            if edEnd.Value > edStart.Value then
            begin
              StartVal := edStart.Value;
              EndVal   := edEnd.Value;
            end
            else if edEnd.Value < edStart.Value then
            begin
              StartVal := edEnd.Value;
              EndVal   := edStart.Value;
            end;
            Subtract := EndVal - StartVal;

            if txtToFloat(items[i].SubItems[0]) > StartVal then
              OverStart := txtToFloat(items[i].SubItems[0]) - StartVal
            else
              OverStart := 0;

            if Subtract > 0 then
            begin
              if StartVal = 0 then
              begin

                //if txtToFloat(items[i].SubItems[0]) < edEnd.Value then
                if txtToFloat(items[i].SubItems[0]) < EndVal then
                begin
                  FoundCutNum := false;
                  for j := 0 to ChartListCut.Items.Count-1 do
                  begin
                    if ChartListCut.Items[j].Caption = ChartListData.Items[i].Caption then
                    begin
                      FoundCutNum := true;
                      Break;
                    end;
                  end;

                  if FoundCutNum then
                  begin
                    ChartListCut.Items[j].SubItems[0] := FormatFloat('#,###.##',txtToFloat(ChartListCut.Items[j].SubItems[0])+txtToFloat(Items[i].SubItems[0]));
                  end
                  else
                  begin
                    if txtToFloat(ChartListData.Items[i].SubItems[0]) > 0 then
                    With ChartListCut.Items.Add do
                    begin
                      Caption := ChartListData.Items[i].Caption;
                      SubItems.Add(FormatFloat('#,###.##',txtToFloat(ChartListData.Items[i].SubItems[0])));
                    end;
                  end;

                  Items[i].Delete
                end
                else
                begin

                  FoundCutNum := false;
                  for j := 0 to ChartListCut.Items.Count-1 do
                  begin
                    if ChartListCut.Items[j].Caption = ChartListData.Items[i].Caption then
                    begin
                      FoundCutNum := true;
                      Break;
                    end;
                  end;

                  if FoundCutNum then
                  begin
                    ChartListCut.Items[j].SubItems[0] := FormatFloat('#,###.##',txtToFloat(ChartListCut.Items[j].SubItems[0])+EndVal);
                  end
                  else
                  begin
                    if EndVal > 0 then
                    With ChartListCut.Items.Add do
                    begin
                      Caption := ChartListData.Items[i].Caption;
                      SubItems.Add(FormatFloat('#,###.##',EndVal));
                    end;
                  end;

                  Items[i].SubItems[0] := FormatFloat('#,###.##', (txtToFloat(Items[i].SubItems[0])-EndVal));
                  if txtToFloat(Items[i].SubItems[0]) <= 0 then
                    Items[i].Delete
                end;
              end
              else  // edStart ไม่เท่ากับ 0
              begin
                FoundCutNum := false;
                for j := 0 to ChartListCut.Items.Count-1 do
                begin
                  if ChartListCut.Items[j].Caption = ChartListData.Items[i].Caption then
                  begin
                    FoundCutNum := true;
                    Break;
                  end;
                end;

                if FoundCutNum then
                begin
                  if txtToFloat(Items[i].SubItems[0]) >= EndVal then
                  begin
                    ChartListCut.Items[j].SubItems[0] := FormatFloat('#,###.##',txtToFloat(ChartListCut.Items[j].SubItems[0])+Subtract);
                    Items[i].SubItems[0] := FormatFloat('#,###.##', (txtToFloat(Items[i].SubItems[0])-Subtract));
                  end
                  else
                  if (txtToFloat(Items[i].SubItems[0]) > StartVal) and (txtToFloat(Items[i].SubItems[0]) < EndVal) then
                  begin
                    ChartListCut.Items[j].SubItems[0] := FormatFloat('#,###.##',txtToFloat(ChartListCut.Items[j].SubItems[0])+OverStart);
                    Items[i].SubItems[0] := FormatFloat('#,###.##', (txtToFloat(Items[i].SubItems[0])-OverStart));
                  end;
                end
                else
                begin
                  With ChartListCut.Items do
                  begin
                    if txtToFloat(Items[i].SubItems[0]) >= EndVal then
                    begin
                      if Subtract > 0 then
                      begin
                        with Add do
                        begin
                          Caption := ChartListData.Items[i].Caption;
                          SubItems.Add(FormatFloat('#,###.##',Subtract));
                        end;
                        Items[i].SubItems[0] := FormatFloat('#,###.##', (txtToFloat(Items[i].SubItems[0])-Subtract));
                      end;
                    end
                    else
                    if (txtToFloat(Items[i].SubItems[0]) > StartVal) and (txtToFloat(Items[i].SubItems[0]) < EndVal) then
                    begin
                      if OverStart > 0 then
                      begin
                        with Add do
                        begin
                          Caption := ChartListData.Items[i].Caption;
                          SubItems.Add(FormatFloat('#,###.##',OverStart));
                        end;
                        Items[i].SubItems[0] := FormatFloat('#,###.##', (txtToFloat(Items[i].SubItems[0])-OverStart));
                      end;
                    end;
                  end;
                end;
              end;
            end;
          end;
      end;
    end;
    
    Items.EndUpdate;
    ChartListCut.Items.EndUpdate;

    ChkCutAll.Checked := true;
    for i := 0 to ChartListCut.Items.Count-1 do
        ChartListCut.Items[i].checked := true;

    SumList(ChartListData,ChartListCut);
    ShowChart;
   end
  end;
end;

{
begin
    ChartListCut.Items.BeginUpdate;
    ChartListData.Items.BeginUpdate;
    for i := ChartListData.Items.Count-1 DownTo 0 do
    begin
      if ChartListData.Items[i].Checked then
      begin

          FoundNum := false;
          for j := 0 to ChartListCut.Items.Count-1 do
          begin
            if ChartListCut.Items[j].Caption = ChartListData.Items[i].Caption then
            begin
              FoundNum := true;
              Break;
            end;
          end;

          if FoundNum then
          begin
            ChartListCut.Items[j].SubItems[0] := FormatFloat('#,###.##',txtToFloat(ChartListCut.Items[j].SubItems[0])+txtToFloat(ChartListData.Items[i].SubItems[0]));
          end
          else
          begin
            With ChartListCut.Items.Add do
            begin
              Caption := ChartListData.Items[i].Caption;
              SubItems.Add(FormatFloat('#,###.##',txtToFloat(ChartListData.Items[i].SubItems[0])));
            end;
          end;

          ChartListData.Items[i].Delete;

      end;
    end;
    ChartListCut.Items.EndUpdate;
    ChartListData.Items.EndUpdate;
    ChkCutAll.Checked := true;
    for i := 0 to ChartListCut.Items.Count-1 do
        ChartListCut.Items[i].checked := true;

    SumList(ChartListData,ChartListCut);
    ShowChart;
end;
}


procedure TfrmCutByChart.ChkDataAllClick(Sender: TObject);
Var i,j: integer;
begin
  with ChartListData do
  begin
    for i := 0 to Items.Count-1 do
        Items[i].checked := ChkDataAll.Checked;

    j:=0;
    if Items.Count > 0 then
    begin
      for i:= 0 to Items.Count-1 do
      begin
          if items[i].Checked = true then
          begin
            inc(j);
          end;
      end;
    end;
  end;
  ShowChart;
end;

procedure TfrmCutByChart.ChkCutAllClick(Sender: TObject);
Var i,j: integer;
begin
  with ChartListCut do
  begin
    for i := 0 to Items.Count-1 do
        Items[i].checked := ChkCutAll.Checked;

    j:=0;
    if Items.Count > 0 then
    begin
      for i:= 0 to Items.Count-1 do
      begin
          if items[i].Checked = true then
          begin
            inc(j);
          end;
      end;
    end;
  end;
end;

procedure TfrmCutByChart.Panel16Resize(Sender: TObject);
begin
  rdUpLine.Left   := (Panel16.Width div 2)-(rdUpLine.Width+(rdUpline.Width div 2));
  rdDownLine.Left := (Panel16.Width div 2)+(rdDownline.Width div 2);
end;

function TfrmCutByChart.findDealer(Code: String): Boolean;
Var QrFindDealer : TABSQuery;
    i,j: integer;
begin
 with Dm do
 begin
  Result := false;
  QrFindDealer := TABSQuery.Create(nil);
  try
  except
  end;
  QrFindDealer.DatabaseName := Database.DatabaseName;
  try
    QrFindDealer.Close;
  except
  end;
  QrFindDealer.SQL.Clear;
  if EdDealerID.Text <> '' then
    QrFindDealer.SQL.Add('Select * from Dealer Where Code like "%'+Code+'%"')
  else
    QrFindDealer.SQL.Add('Select * from Dealer Where Code = "'+Code+'"');// :aCode');

  try
    try
      QrFindDealer.Open;
    except
    end;
  except
  end;

  If QrFindDealer.Eof then
  begin
    //PanelCustName.Caption := '';
    Showmessage('รหัสเจ้ามือไม่ถูกต้อง กรุณากรอกรหัสเจ้ามือใหม่ให้ถูกต้อง');
   {
    for i:= 0 to PayGrid.Rowcount-1 do
    begin
      for j := 0 to PayGrid.ColCount-1 do
      begin
          PayGrid.Cells[j,i] := '0';
      end;
    end;
   }
    EdDealerID.SetFocus;
    EdDealerID.SelectAll;
    Exit;
  end;
 {
  PayGrid[0,0]   := QrFindDealer.FieldByName('ComRnUp').AsString;
  PayGrid[0,1]   := QrFindDealer.FieldByName('ComRnDwn').AsString;
  PayGrid[0,2]   := QrFindDealer.FieldByName('ComPosUp').AsString;
  PayGrid[0,3]   := QrFindDealer.FieldByName('ComPosDwn').AsString;
  PayGrid[0,4]   := QrFindDealer.FieldByName('Com2Up').AsString;
  PayGrid[0,5]   := QrFindDealer.FieldByName('Com2Tod').AsString;
  PayGrid[0,6]   := QrFindDealer.FieldByName('Com2Dwn').AsString;
  PayGrid[0,7]   := QrFindDealer.FieldByName('Com2Mee').AsString;
  PayGrid[0,8]   := QrFindDealer.FieldByName('Com2Pos').AsString;
  PayGrid[0,9]   := QrFindDealer.FieldByName('Com3Up').AsString;
  PayGrid[0,10]  := QrFindDealer.FieldByName('Com3Tod').AsString;
  PayGrid[0,11]  := QrFindDealer.FieldByName('Com3Dwn').AsString;
  PayGrid[0,12]  := QrFindDealer.FieldByName('Com4').AsString;
  PayGrid[0,13]  := QrFindDealer.FieldByName('Com4Tod').AsString;
  PayGrid[0,14]  := QrFindDealer.FieldByName('Com5').AsString;
  PayGrid[0,15]  := QrFindDealer.FieldByName('Com5Tod').AsString;

  PayGrid[1,0]   := FormatFloat('###,##0.##',QrFindDealer.FieldByName('PayRnUp').AsFloat);
  PayGrid[1,1]   := FormatFloat('###,##0.##',QrFindDealer.FieldByName('PayRnDwn').AsFloat);
  PayGrid[1,2]   := FormatFloat('###,##0.##',QrFindDealer.FieldByName('PayPosUp').AsFloat);
  PayGrid[1,3]   := FormatFloat('###,##0.##',QrFindDealer.FieldByName('PayPosDwn').AsFloat);
  PayGrid[1,4]   := FormatFloat('###,##0.##',QrFindDealer.FieldByName('Pay2Up').AsFloat);
  PayGrid[1,5]   := FormatFloat('###,##0.##',QrFindDealer.FieldByName('Pay2Tod').AsFloat);
  PayGrid[1,6]   := FormatFloat('###,##0.##',QrFindDealer.FieldByName('Pay2Dwn').AsFloat);
  PayGrid[1,7]   := FormatFloat('###,##0.##',QrFindDealer.FieldByName('Pay2Mee').AsFloat);
  PayGrid[1,8]   := FormatFloat('###,##0.##',QrFindDealer.FieldByName('Pay2Pos').AsFloat);
  PayGrid[1,9]   := FormatFloat('###,##0.##',QrFindDealer.FieldByName('Pay3Up').AsFloat);
  PayGrid[1,10]  := FormatFloat('###,##0.##',QrFindDealer.FieldByName('Pay3Tod').AsFloat);
  PayGrid[1,11]  := FormatFloat('###,##0.##',QrFindDealer.FieldByName('Pay3Dwn').AsFloat);
  PayGrid[1,12]  := FormatFloat('###,##0.##',QrFindDealer.FieldByName('Pay4').AsFloat);
  PayGrid[1,13]  := FormatFloat('###,##0.##',QrFindDealer.FieldByName('Pay4Tod').AsFloat);
  PayGrid[1,14]  := FormatFloat('###,##0.##',QrFindDealer.FieldByName('Pay5').AsFloat);
  PayGrid[1,15]  := FormatFloat('###,##0.##',QrFindDealer.FieldByName('Pay5Tod').AsFloat);
 }

  //DealerHasCom := QrFindDealer.FieldByName('HasCom').AsBoolean;
  EdDealerID.Text := QrFindDealer.FieldByName('Code').AsString;
  EdDealerName.Text := ' '+QrFindDealer.FieldByName('FName').AsString+' '+QrFindDealer.FieldByName('LName').AsString;
  EdDealerID.SetFocus;
  EdDealerID.SelectAll;
  Result := true;
 end;
end;

procedure TfrmCutByChart.edDealerIDButtonClick(Sender: TObject);
begin
  with frmFindDealer do
  begin
    if Showmodal = mrOk then
    begin
      with DealerList do
      begin
          findDealer(Items[selected.index].Caption);
      end;
    end;
  end;
end;

procedure TfrmCutByChart.Panel4Resize(Sender: TObject);
begin
  BtnCutChart.Top := (Panel4.Height div 2)-(BtnCutChart.Height+(BtnCutChart.Height div 2));
  DeleteBtn.Top   := BtnCutChart.Top+Round(BtnCutChart.Height*1.5);
end;

procedure TfrmCutByChart.BtnExcelExportClick(Sender: TObject);
Var
   i,j,GCnt1,GCnt2,GCnt3,GCnt4,GCnt5,Col,Row,Lrow: Integer;
   QrDelete : TABSQuery;
   IsDown: Boolean;
begin
  with ChartListCut do
  begin
    j:=0;
    //GCnt1 := 0;
    if Items.Count > 0 then
    begin
      for i:= 0 to Items.Count-1 do
      begin
          if items[i].Checked = true then
          begin
            inc(j);
            //inc(GCnt1);
          end;
      end;
    end;
  end;
  if j <= 0 then
  begin
    Showmessage('ไม่พบข้อมูลที่ต้องการส่งออกเป็นไฟล์ Excel');
    exit;
  end;

  //GCnt1 := InputGrid.RowCount;
  GCnt1 := ChartListCut.Items.Count; //InputGrid.RowCount;
  //SaveXLSDialog.InitialDir := edExportFolder.Text;

{  
  if ChkSumCust.Checked then
    SaveXLSDialog.FileName := GetComputerName+'_'+formatDateTime('dd-mm-yy',DatePick.Date)+'_'+formatDateTime('HH-MM-SS',Now)
  else
    SaveXLSDialog.FileName := GetComputerName+'_'+PanelCustName.Caption+'_'+formatDateTime('dd-mm-yy',DatePick.Date)+'_'+formatDateTime('HH-MM-SS',Now);
}

  SaveXLSDialog.FileName := 'ส่ง_'+edDealerName.Text+'_'+CbCutType.Items[CbCutType.itemIndex];

  if SaveXLSDialog.Execute then
  begin
    if FileExists(SaveXLSDialog.FileName) then
    begin
      if MessageDlg('ไฟล์ '+SaveXLSDialog.FileName+' มีอยู่แล้วต้องการเขียนทับหรือใม่',mtConfirmation,[mbYes,mbNo],0) = IdNo then
        exit
      else
        XLS.Filename := SaveXLSDialog.FileName;
    end
    else
    begin
        XLS.Filename := SaveXLSDialog.FileName;
    end
  end
  else exit;


  XLS.Clear;
  //XLS.Codepage := 874;

  // Add format #0
   with XLS.Formats.Add do begin
    FontIndex := XLS.Fonts.AddIndex;
    XLS.Fonts[FontIndex].Name := 'Courier new';
    XLS.Fonts[FontIndex].Size := 12;
    XLS.Fonts[FontIndex].Color := xcRed;
    HorizAlignment := chaCenter;
  end;

  // Add format #1
  with XLS.Formats.Add do begin
    FontIndex := XLS.Fonts.AddIndex;
    XLS.Fonts[FontIndex].AssignTFont(Font);
    BorderTopColor := xcBlue;
    BorderTopStyle := cbsThin;
  end;

  // Add format #2
  with XLS.Formats.Add do begin
    //FontIndex := XLS.Fonts.AddIndex;
    //XLS.Fonts[FontIndex].Name := 'CordiaUPC';   
    BorderTopColor := xcBlue;
    BorderBottomColor := xcBlue;
    BorderTopStyle := cbsThin;
    BorderBottomStyle := cbsThin;
    FillPatternForeColor := xcLilac;
    HorizAlignment := chaCenter;
  end;

  // Add format #3
  with XLS.Formats.Add do begin
    BorderTopColor := xcBlue;
    BorderBottomColor := xcBlue;
    BorderTopStyle := cbsThin;
    BorderBottomStyle := cbsThin;
  end;

  // Add format #4
  // ShortDateFormat is a Delphi global variable for the local date format.
  with XLS.Formats.Add do begin
    NumberFormat := '#,##0.00_);[Red](#,##0.00)';
  end;


 LRow := 0;
 Row := 0;
 //if InputGrid.RowCount > 0 then
 if ChartListCut.Items.Count > 0 then
 begin

  XLS.Sheets[0].WriteString(0,0,1,'Num');
  XLS.Sheets[0].WriteString(1,0,1,'Up');
  XLS.Sheets[0].WriteString(2,0,1,'Down');
  XLS.Sheets[0].WriteString(3,0,1,'ID');
  XLS.Sheets[0].WriteString(4,0,1,'CustID');
  XLS.Sheets[0].WriteString(5,0,1,'BookNo');
  XLS.Sheets[0].WriteString(6,0,1,'UserID');
  XLS.Sheets[0].WriteString(7,0,1,'LottoID');

  Case CbCutType.ItemIndex of
    4,5,6,12,15: isDown := true;
  else
    isDown := false;
  end;

  with ChartListCut do
  //for Col := 0 to InputGrid.ColCount - 1 do
  for Col := 0 to Columns.Count - 1 do
  begin
   LRow := 0; 
   for Row := 0 To GCnt1 -1 do
   begin
    if Items[Row].Checked = true then
    begin
      if Not IsDown then
      begin
        if Col = 0 then
          XLS.Sheets[0].WriteString(Col,LRow+1,2,Items[Row].Caption)
        else
          XLS.Sheets[0].WriteString(Col,LRow+1,2,FormatFloat('#.##',TxtToFloat(Items[Row].SubItems[Col-1])));
      end
      else
      begin
        if Col = 0 then
          XLS.Sheets[0].WriteString(Col,LRow+1,2,Items[Row].Caption)
        else
          XLS.Sheets[0].WriteString(Col+1,LRow+1,2,FormatFloat('#.##',TxtToFloat(Items[Row].SubItems[Col-1])));
      end;
      LRow := LRow+1;
    end;

   end;
  end;
 end;
 try
  XLS.Write;
  Showmessage('ข้อมูลได้ส่งออกไปยังไฟล์ '+SaveXLSDialog.FileName+' เรียบร้อยแล้ว');
 except
  Showmessage('เกิดปัญหาในการส่งออก ไม่สามารถส่งออกไปยังไฟล์ '+SaveXLSDialog.FileName+' ได้');
 end;

end;

procedure TfrmCutByChart.BtnCutToCbMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var P: TPoint;
begin
  //P := BtnCutToCb.ClientToScreen(Point(0,-40));
  //MenuCutClpBrd.Popup(P.x,P.y);
end;

procedure TfrmCutByChart.N13Click(Sender: TObject);
Var i,j,Total: integer;
    NumCut,txtPrice : String;

begin
  with ChartListCut do
  begin
    j:=0;
    if Items.Count > 0 then
    begin
      for i:= 0 to Items.Count-1 do
      begin
          if items[i].Checked = true then
            inc(j);
      end;
    end;
  end;
  if j <= 0 then
  begin
    Showmessage('ไม่พบข้อมูลที่ต้องการคัดลอกไปยังคลิปบอร์ด');
    exit;
  end;


  NumCut := '';
  txtPrice := '';
  Total := 0;
  with ChartListCut do
  begin
    for i := 0 to Items.Count-1 do
    begin
      if Items[i].Checked then
      begin
        txtPrice := formatFloat('0',txtToFloat(items[i].SubItems[0]));
        Case CbCutType.ItemIndex of
          0: NumCut := NumCut + (items[i].Caption+' '+txtPrice+#13#10); //วิ่งบน
          1: NumCut := NumCut + (items[i].Caption+'- '+txtPrice+#13#10); //หน้าบน
          2: NumCut := NumCut + '-'+(items[i].Caption+'- '+txtPrice+#13#10); //กลางบน
          3: NumCut := NumCut + '-'+(items[i].Caption+' '+txtPrice+#13#10); //หลังบน
          4: NumCut := NumCut + (items[i].Caption+' -'+txtPrice+#13#10); //วิ่งล่าง
          5: NumCut := NumCut + (items[i].Caption+'- -'+txtPrice+#13#10); //หน้าล่าง
          6: NumCut := NumCut + '-'+(items[i].Caption+' -'+txtPrice+#13#10); //หลังล่าง
          7: NumCut := NumCut + (items[i].Caption+' '+txtPrice+#13#10); //2ตัวบน
          8: NumCut := NumCut + (items[i].Caption+' +'+txtPrice+#13#10); //2ตัวโต๊ด
          9: NumCut := NumCut + (items[i].Caption+'+ '+txtPrice+#13#10); //2ตัวมี
         10: NumCut := NumCut + (items[i].Caption+'- '+txtPrice+#13#10); //2ตัวหน้า
         11: NumCut := NumCut + '-'+(items[i].Caption+' '+txtPrice+#13#10); //2ตัวหลัง
         12: NumCut := NumCut + (items[i].Caption+' -'+txtPrice+#13#10); //2ตัวล่าง
         13: NumCut := NumCut + (items[i].Caption+' '+txtPrice+#13#10); //3ตัวบน
         14: NumCut := NumCut + (items[i].Caption+' +'+txtPrice+#13#10); //3ตัวโต๊ด
         15: NumCut := NumCut + (items[i].Caption+' -'+txtPrice+#13#10); //3ตัวล่าง
         16: NumCut := NumCut + (items[i].Caption+' '+txtPrice+#13#10); //4ตัวบน
         17: NumCut := NumCut + (items[i].Caption+' +'+txtPrice+#13#10); //4/3โต๊ด
         18: NumCut := NumCut + (items[i].Caption+' '+txtPrice+#13#10); //5ตัวบน
         19: NumCut := NumCut + (items[i].Caption+' +'+txtPrice+#13#10); //5/3โต๊ด

        end;
        inc(Total);
      end;
    end;
    Clipboard.AsText := NumCut;
    Showmessage('คัดลอกลงคลิปบอร์ดจำนวน '+IntToStr(Total)+' ประตู');
  end;
end;

procedure TfrmCutByChart.N28Click(Sender: TObject);
Var i,j,Total: integer;
    NumCut,txtPrice : String;
begin
  with ChartListCut do
  begin
    j:=0;
    if Items.Count > 0 then
    begin
      for i:= 0 to Items.Count-1 do
      begin
          if items[i].Checked = true then
            inc(j);
      end;
    end;
  end;
  if j <= 0 then
  begin
    Showmessage('ไม่พบข้อมูลที่ต้องการคัดลอกไปยังคลิปบอร์ด');
    exit;
  end;

  NumCut := '';
  txtPrice := '';
  Total := 0;
  with ChartListCut do
  begin
    for i := 0 to Items.Count-1 do
    begin
      if Items[i].Checked then
      begin
        txtPrice := formatFloat('0',txtToFloat(items[i].SubItems[0]));
        NumCut := NumCut + (items[i].Caption+' '+txtPrice+#13#10);
        inc(Total);
      end;
    end;
    Clipboard.AsText := NumCut;
    Showmessage('คัดลอกลงคลิปบอร์ดจำนวน '+IntToStr(Total)+' ประตู');
  end;
end;

procedure TfrmCutByChart.BtnCutToCbClick(Sender: TObject);
Var i,Total: integer;
    NumCut,txtPrice,HeadStr : String;

begin
  NumCut := '';
  txtPrice := '';
  Total := 0;
  with ChartListCut do
  begin
    Case CbCutType.ItemIndex of
      0:HeadStr := 'Float-Top'+ #13#10;
      1:HeadStr := 'Left-Top'+ #13#10;
      2:HeadStr := 'Center-Top'+ #13#10;
      3:HeadStr := 'Right-Top'+ #13#10;
      4:HeadStr := 'Down'+ #13#10;
      5:HeadStr := 'Left-Down'+ #13#10;
      6:HeadStr := 'Right-Down'+ #13#10;
      7:HeadStr := '2 Top'+ #13#10;
      8:HeadStr := '2 Tod'+ #13#10;
      9:HeadStr := '2 Float'+ #13#10;
      10:HeadStr := 'Left-Top'+ #13#10;
      11:HeadStr := 'Split-Top'+ #13#10;
      12:HeadStr := '2 Down'+ #13#10;
      13:HeadStr := '3 Top'+ #13#10;
      14:HeadStr := '3 Float'+ #13#10;
      15:HeadStr := '3 Down'+ #13#10;
      16:HeadStr := '4 Top'+ #13#10;
      17:HeadStr := '4 Float'+ #13#10;
      18:HeadStr := '5 Top'+ #13#10;
      19:HeadStr := '5 Float'+ #13#10;
    end;

    for i := 0 to Items.Count-1 do
    begin
      if Items[i].Checked then
      begin
        txtPrice := formatFloat('0',txtToFloat(items[i].SubItems[0]));
        NumCut := NumCut + (items[i].Caption+'='+txtPrice+#13#10);
        inc(Total);
      end;
    end;
    Clipboard.AsText := HeadStr+NumCut;
    Showmessage('คัดลอกเลข '+CbCutType.Items[CbCutType.ItemIndex]+' ลงคลิปบอร์ดจำนวน '+IntToStr(Total)+' ประตู');
  end;
end;

procedure TfrmCutByChart.RdgNumTypeClick(Sender: TObject);
Var NGridCut: TNiceGrid;
    CutCol, CutRow, i: integer;
begin
  with fMain,ChartListData do
  begin

    ChartListCut.Items.BeginUpdate;
    Items.BeginUpdate;
    Items.Clear;
    ChartListCut.Items.Clear;

    Case RdgNumType.ItemIndex of
      0: begin NGridCut := GridTemp[0]; CutCol := 1; CutRow := 0; end;//LimitNum := 'Limit1'; Price := 'Price1'; end;
      1: begin NGridCut := GridTemp[1]; CutCol := 2; CutRow := 1; end;//LimitNum := 'Limit2'; Price := 'Price2'; end;
      2: begin NGridCut := GridTemp[2]; CutCol := 3; CutRow := 1; end;//LimitNum := 'Limit3'; Price := 'Price3'; end;
      3: begin NGridCut := GridTemp[3]; CutCol := 4; CutRow := 1; end;//LimitNum := 'Limit4'; Price := 'Price4'; end;
      4: begin NGridCut := GridTemp[4]; CutCol := 5; CutRow := 2; end;//LimitNum := 'Limit5'; Price := 'Price5'; end;
      5: begin NGridCut := GridTemp[5]; CutCol := 6; CutRow := 3; end;//LimitNum := 'Limit6'; Price := 'Price6'; end;
      6: begin NGridCut := GridTemp[6]; CutCol := 7; CutRow := 3; end;//LimitNum := 'Limit7'; Price := 'Price7'; end;
      7: begin NGridCut := GridTemp[7]; CutCol := 1; CutRow := 4; end;//LimitNum := 'Limit1'; Price := 'Price1'; end;
      8: begin NGridCut := GridTemp[8]; CutCol := 2; CutRow := 5; end;//LimitNum := 'Limit2'; Price := 'Price2'; end;
      9: begin NGridCut := GridTemp[9]; CutCol := 3; CutRow := 6; end;//LimitNum := 'Limit3'; Price := 'Price3'; end;
     10: begin NGridCut := GridTemp[10]; CutCol := 4; CutRow := 7; end;//LimitNum := 'Limit4'; Price := 'Price4'; end;
     11: begin NGridCut := GridTemp[11]; CutCol := 5; CutRow := 7; end;//LimitNum := 'Limit5'; Price := 'Price5'; end;
     12: begin NGridCut := GridTemp[12]; CutCol := 6; CutRow := 8; end;//LimitNum := 'Limit6'; Price := 'Price6'; end;
     13: begin NGridCut := GridTemp[13]; CutCol := 1; CutRow := 9; end;//LimitNum := 'Limit1'; Price := 'Price1'; end;
     14: begin NGridCut := GridTemp[14]; CutCol := 2; CutRow := 10; end;//LimitNum := 'Limit2'; Price := 'Price2'; end;
     15: begin NGridCut := GridTemp[15]; CutCol := 3; CutRow := 11; end;//LimitNum := 'Limit3'; Price := 'Price3'; end;
     16: begin NGridCut := GridTemp[16]; CutCol := 1; CutRow := 12; end;//LimitNum := 'Limit1'; Price := 'Price1'; end;
     17: begin NGridCut := GridTemp[17]; CutCol := 2; CutRow := 13; end;//LimitNum := 'Limit2'; Price := 'Price2'; end;
     18: begin NGridCut := GridTemp[18]; CutCol := 1; CutRow := 14; end;//LimitNum := 'Limit1'; Price := 'Price1'; end;
     19: begin NGridCut := GridTemp[19]; CutCol := 2; CutRow := 15; end;//LimitNum := 'Limit2'; Price := 'Price2'; end;
    end;

    for i := 0 to NGridCut.RowCount-1 do
    begin
      if NGridcut[CutCol,i] <> '' then
      With Items.Add do
      begin
        Caption   := NGridCut[0,i];
        SubItems.Add(NGridcut[CutCol,i]);
      end;

    end;
    Items.EndUpdate;
    ChartListCut.Items.EndUpdate;

    for i := 0 to Items.Count-1 do
        Items[i].checked := true;

    SumList(ChartListData,ChartListCut);
    ShowChart;

  end;
end;

procedure TfrmCutByChart.Panel5Resize(Sender: TObject);
begin
  RdgNumType.Height := ChartListData.Height+5;
end;

end.