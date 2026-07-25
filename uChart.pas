unit uChart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, TeeProcs, Chart, StdCtrls, se_controls,
  KsSkinCheckBoxs, ComCtrls, SortListViews, ExtCtrls, NiceGrid, KsSkinButtons,
  sCheckedControl, sCheckbox, AppEvnts;

type
  TfrmChart = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel12: TPanel;
    SeSkinButton5: TSeSkinButton;
    Panel2: TPanel;
    Panel5: TPanel;
    ChartListData: TSortListView;
    Panel9: TPanel;
    Panel10: TPanel;
    lbOnHandItem: TLabel;
    lbOnHand: TLabel;
    Panel13: TPanel;
    ChkDataAll: TSeSkinCheckBox;
    Panel15: TPanel;
    Panel16: TPanel;
    Chart1: TChart;
    Series1: TBarSeries;
    Chk2Up: TsCheckBox;
    Chk2Dwn: TsCheckBox;
    Chk3Up: TsCheckBox;
    ChkAll: TsCheckBox;
    PlotChartBtn: TSeSkinButton;
    Chk2Left: TsCheckBox;
    Chk2Split: TsCheckBox;
    CalBtn: TSeSkinButton;
    ApplicationEvents1: TApplicationEvents;
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Series1AfterDrawValues(Sender: TObject);  
    procedure FormShow(Sender: TObject);
    procedure Panel5Resize(Sender: TObject);
    procedure ChartListDataCustomSort(Sender: TObject; ColIndex: Integer;
      Str1, Str2: String; var Res: Integer; var Handled: Boolean);
    procedure ChkDataAllClick(Sender: TObject);
    procedure ChartListDataClick(Sender: TObject);
    procedure ChartListDataDblClick(Sender: TObject);
    procedure PlotChartBtnClick(Sender: TObject);
    procedure ChkAllChange(Sender: TObject);
    procedure CalBtnClick(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure Chk2UpChange(Sender: TObject);
    procedure Chk2LeftChange(Sender: TObject);
    procedure Chk2SplitChange(Sender: TObject);
    procedure Chk2DwnChange(Sender: TObject);
    procedure Chk3UpChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowChart;
    procedure SumList(DataList: TSortListView);
  end;

var
  frmChart: TfrmChart;
  MValue: Double;
  GridTemp1: Array[0..19] of TNiceGrid;
  NiceData2,NiceData3: TNiceGrid;
  ToTal_Items,Total_Chk : Integer;
  ToTal_Price : Double;
  
implementation

uses uMain,Utils;

{$R *.dfm}

procedure TfrmChart.ShowChart;
Var i: integer;
    DataX: Extended;
    DataY: String;
begin
 With Series1,ChartListData do
 Begin
  Series1.Clear;
  for i := 0 to Items.Count-1 do
  begin
    //if Items[i].Checked then
    //begin
      DataX := TxtToFloat(Items[i].SubItems[0]);
      DataY := Items[i].Caption;

      Add( DataX, DataY, clTeeColor) ;
    //end;
  end;
 end;
end;

procedure TfrmChart.SumList(DataList: TSortListView);
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
end;

procedure TfrmChart.Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  XVal: double;
  YVal: double;
  YPos, XPos, XValue: Integer;
begin
  XVal:=Chart1.Series[0].XScreenToValue(x);
  YVal:=Chart1.Series[0].YScreenToValue(y);
  Chart1.Title.Text[0]:= FormatFloat('#,###.##',Round(YVal))+' บาท';

  //if RdUpLine.Checked then
  //begin
    //Chart1.Title.Text[0]:= 'ตัดยอดที่เกิน '+FormatFloat('#,###.##',Round(YVal))+' บาท';
  //end
  //else
    //Chart1.Title.Text[0]:= 'ตัดยอดที่ต่ำกว่า '+IntToStr(Round(YVal))+' บาท';

  MValue := Round(YVal);

end;

procedure TfrmChart.Series1AfterDrawValues(Sender: TObject);
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

procedure TfrmChart.FormShow(Sender: TObject);
begin
  Total_Chk := 0;
  //RdgNumType.Height := ChartListData.Height+5;
  //if Not ShowDealer(EdDealerID.Text) then
    //edDealerName.Text := '';

  //BtnCutChart.Top := (Panel4.Height div 2)-(BtnCutChart.Height+(BtnCutChart.Height div 2));
  //DeleteBtn.Top   := BtnCutChart.Top+Round(BtnCutChart.Height*1.5);
  //ChartListCut.Items.BeginUpdate;
  //ChartListCut.Clear;
  //ChartListCut.Items.EndUpdate;
  //CbCutTypeChange(Sender);
  //RdgNumTypeClick(Sender);
  //ChartListDataCustomSort(ChartListData,1, ChartListData.Columns[0]., ChartListData.Columns[1], 0,true);
  //SumList(ChartListData);
  ChkAllChange(Sender);
  //ShowChart;
end;

procedure TfrmChart.Panel5Resize(Sender: TObject);
begin
  //RdgNumType.Height := ChartListData.Height+5;
end;

procedure TfrmChart.ChartListDataCustomSort(Sender: TObject;
  ColIndex: Integer; Str1, Str2: String; var Res: Integer;
  var Handled: Boolean);

Var  n1, n2: Extended;
begin
  if (ColIndex in [0]) then
  begin
    n1 := Length(Str1);
    n2 := Length(Str2);
    if (n1 = n2) then
      Res := 0
    else
    if (n1 > n2) then
      Res := 1
    else
      Res := -1;

    Handled := True;
  end;
  
  if (ColIndex in [1]) then
  begin
    n1 := TxtToFloat(Str1);
    n2 := txtToFloat(Str2);
    if (n1 = n2) then
      Res := 0
    else
    if (n1 > n2) then
      Res := 1
    else
      Res := -1;

    Handled := True;
  end;
end;

procedure TfrmChart.ChkDataAllClick(Sender: TObject);
Var i,j: integer;
begin
 {
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
  }
end;

procedure TfrmChart.ChartListDataClick(Sender: TObject);
begin
  ShowChart;
end;

procedure TfrmChart.ChartListDataDblClick(Sender: TObject);
begin
  Modalresult := mrOk;
end;

procedure TfrmChart.PlotChartBtnClick(Sender: TObject);
Var NGrid: TNiceGrid;
    DatCol, DatRow, i: integer;
begin
  with ChartListData do
  begin

    Items.BeginUpdate;
    Items.BeginUpdate;
    Items.Clear;
    Items.Clear;

    if Chk2Up.Checked then
    begin
      NGrid := NiceData2; DatCol := 1;
      for i := 0 to NGrid.RowCount-1 do
      begin
        if NGrid[DatCol,i] <> '' then
        With Items.Add do
        begin
          Caption   := NGrid[0,i];
          SubItems.Add(NGrid[DatCol,i]);
        end;
      end;
    end;

    if Chk2Left.Checked then
    begin
      NGrid := NiceData2; DatCol := 4;
      for i := 0 to NGrid.RowCount-1 do
      begin
        if NGrid[DatCol,i] <> '' then
        With Items.Add do
        begin
          Caption   := NGrid[0,i];
          SubItems.Add(NGrid[DatCol,i]);
        end;
      end;
    end;

    if Chk2Split.Checked then
    begin
      NGrid := NiceData2; DatCol := 5;
      for i := 0 to NGrid.RowCount-1 do
      begin
        if NGrid[DatCol,i] <> '' then
        With Items.Add do
        begin
          Caption   := NGrid[0,i];
          SubItems.Add(NGrid[DatCol,i]);
        end;
      end;
    end;

    if Chk2Dwn.Checked then
    begin
      NGrid := NiceData2; DatCol := 6;
      for i := 0 to NGrid.RowCount-1 do
      begin
        if NGrid[DatCol,i] <> '' then
        With Items.Add do
        begin
          Caption   := NGrid[0,i];
          SubItems.Add(NGrid[DatCol,i]);
        end;
      end;
    end;

    if Chk3Up.Checked then
    begin
      NGrid := NiceData3; DatCol := 1;
      for i := 0 to NGrid.RowCount-1 do
      begin
        if NGrid[DatCol,i] <> '' then
        With Items.Add do
        begin
          Caption   := NGrid[0,i];
          SubItems.Add(NGrid[DatCol,i]);
        end;
      end;
    end;

    Items.EndUpdate;
    Items.EndUpdate;



    //for i := 0 to Items.Count-1 do
        //Items[i].checked := true;

    SumList(ChartListData);
    ShowChart;

    if (Total_Chk = 1) then
      CalBtnClick(Sender)
    else
      Panel16.Caption := '';

    //Showmessage(IntToStr(Total_Chk));

  end;
end;

procedure TfrmChart.ChkAllChange(Sender: TObject);
begin
  Chk2Up.Checked    := ChkAll.Checked;
  Chk2Left.Checked  := ChkAll.Checked;
  Chk2Split.Checked := ChkAll.Checked;
  Chk2Dwn.Checked   := ChkAll.Checked;
  Chk3Up.Checked    := ChkAll.Checked;
  

  if ChkAll.Checked then
    Total_Chk := 5
  else
    Total_Chk := 0;

  PlotChartBtnClick(Sender);
end;

procedure TfrmChart.CalBtnClick(Sender: TObject);
Var Total_Avg,Total_Dif: Extended;
    i,Count,Shft_Avg,Max_Items,Avg: Integer;
    Str: String;
begin
  if Chk3Up.Checked then
    Max_Items := 1000
  else
    Max_Items := 100;

  Avg := Round(Total_Price/Max_Items);

  With ChartListData do
  begin
    Total_Avg := 0;
    Total_Dif := 0;
    Count := 0;
    Str := '';
    if (Total_Items > 0) then
    begin
      for i := 0 to Items.Count-1 do
      begin
        if (txtToFloat(Items[i].SubItems[0]) < Avg) then
        begin
          //Str := Str+Items[i].SubItems[0]+#13#10;
          Total_Avg := Total_Avg+TxtToFloat(Items[i].SubItems[0]);
          Total_Dif := Total_Dif+(Avg-txtToFloat(Items[i].SubItems[0]));
          Inc(Count);
          //Showmessage(IntToStr(i+1)+'='+FloatToStr(Total_Avg));
        end
        else
        begin
          Total_Avg := Total_Avg+Avg;
          Inc(Count);
          //Showmessage(IntToStr(i+1)+'='+FloatToStr(Total_Avg));
        end;

      end;
      Str := Str+'เฉลี่ย = '+IntToStr(Round(Avg))+#13#10;
      Str := Str+'รวมเฉลี่ย = '+IntToStr(Round(Total_Avg))+#13#10;
      Str := Str+'รวม = '+IntToStr(Count)+' ประตู';
      Showmessage(Str);

      //Showmessage('เฉลี่ย = '+FloatToStr(Total_Price/Max_Items));
      //Showmessage('รวมเฉลี่ย = '+FloatToStr(Total_Avg));
      //Showmessage(Str);
      //showmessage('Total_Dif = '+FloatToStr(Total_Dif));
      //Showmessage('Count = '+IntToStr(Count));

      //if Chk3Up.Checked then
        //Shft_Avg := Round((Total_Dif/(Max_Items-Total_Items+Count))+Avg)
        Shft_Avg := Round((Total_Dif/Max_Items)+Avg);
      //else
        //Shft_Avg := Round((Total_Dif/(100-Total_Items+Count))+Avg);

      Panel16.Caption := IntToStr(Shft_Avg);
      //Showmessage('ราคาเฉลี่ย = '+IntToStr(Shft_Avg));
    end;
    //else
      //Panel16.Caption := '';
    //else
      //Showmessage('ไม่พบข้อมูลที่ต้องการคำนวณ');
  end;
end;

procedure TfrmChart.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  //if Chk3Up.Checked and (Not(Chk2Up.Checked or Chk2Left.Checked Or Chk2Split.Checked Or Chk2Dwn.Checked)) then
    //CalBtn.Enabled := true
  //else
    //CalBtn.Enabled := false;

  //CalBtn.Enabled := Total_Chk = 1;
end;

procedure TfrmChart.Chk2UpChange(Sender: TObject);
begin
  if Chk2Up.Checked then
    Total_Chk := Total_Chk+1
  else
    Total_Chk := Total_Chk-1;

  PlotChartBtnClick(Sender);
end;

procedure TfrmChart.Chk2LeftChange(Sender: TObject);
begin
  if Chk2Left.Checked then
    Total_Chk := Total_Chk+1
  else
    Total_Chk := Total_Chk-1;

  PlotChartBtnClick(Sender);
end;

procedure TfrmChart.Chk2SplitChange(Sender: TObject);
begin
  if Chk2Split.Checked then
    Total_Chk := Total_Chk+1
  else
    Total_Chk := Total_Chk-1;

  PlotChartBtnClick(Sender);
end;

procedure TfrmChart.Chk2DwnChange(Sender: TObject);
begin
  if Chk2Dwn.Checked then
    Total_Chk := Total_Chk+1
  else
    Total_Chk := Total_Chk-1;

  PlotChartBtnClick(Sender);
end;

procedure TfrmChart.Chk3UpChange(Sender: TObject);
begin
  if Chk3Up.Checked then
    Total_Chk := Total_Chk+1
  else
    Total_Chk := Total_Chk-1;

  PlotChartBtnClick(Sender);
end;

end.
