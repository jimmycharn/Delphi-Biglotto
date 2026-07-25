unit uPrintAllPrev;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NicePreview, ExtCtrls, NiceGrid, Buttons, ImgList, ComCtrls,
  ToolWin,RpDevice, StdCtrls;

type
  TfrmPrintAllPrev = class(TForm)
    NicePreview1: TNicePreview;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    PrintBtn: TToolButton;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    PrintDialog1: TPrintDialog;
    ToolButton10: TToolButton;
    StatusBar1: TStatusBar;
    procedure PrintBtnClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure NicePreview1Change(Sender: TObject);
  private
    { Private declarations }
    procedure SetDate(Date: TDateTime);
    function GetDate: TDateTime;
  public
    { Public declarations }
    procedure RenderGrids(Grid: TNiceGrid; Hui,Name: String);
    property Date: TDateTime read GetDate write SetDate;
  end;

var
  frmPrintAllPrev: TfrmPrintAllPrev;
  Dates : TDateTime;

implementation

uses uPrintDlg, uMain;

{$R *.dfm}

procedure TfrmPrintAllPrev.SetDate(Date: TDateTime);
begin
 //DateTimePicker1.Date := Date;
 Dates := Date;
end;

function TfrmPrintAllPrev.GetDate: TDateTime;
begin
  //Result := DateTimePicker1.Date;
  Result := Dates;
end;

procedure TfrmPrintAllPrev.RenderGrids(Grid: TNiceGrid; Hui,Name: String);
const
  Str1 = 'สรุปผล';
  Str2 = 'ประจำงวดวันที่ ';
var
  L1,L2,L3,L4,L5,L6,L7,L8: Integer;
  x, y, w, h, i, j, Workwidth, WorkHeight,LeftSide,RightSide: Integer;
  R: TRect;
  ax, ay, txtHigh: Integer;
  DeltaX: Integer;
  aYear,aMonth,aDate : Word;
  StrDate: String;
  Pricelen : Array[0..5] of integer;
  ACanVas : TCanvas;
begin

  DecodeDate(Dates,aYear,aMonth,aDate);
  StrDate := IntToStr(aDate)+'/'+IntToStr(aMonth)+'/'+IntToStr(aYear+543);
  NicePreview1.Clear;

  WorkWidth  := NicePreview1.PageWidth - (NicePreview1.MarginLeft + NicePreview1.MarginRight);
  WorkHeight := NicePreview1.PageHeight - (NicePreview1.MarginTop + NicePreview1.MarginBottom);
  leftSide   := NicePreview1.MarginLeft;
  RightSide  := NicePreview1.PageWidth - NicePreview1.MarginRight; 

  ACanVas := NicePreview1.BeginPage;
  //with NicePreview1.BeginPage do
  with ACanVas do
  begin

    Font.Name := 'AngsanaUPC';
    Font.Size := 22;
    Font.Style := [fsBold];
    Font.Color := clBlack;
    w := TextWidth(Str1+' '+Hui);
    h := TextHeight(Str1+' '+Hui);
    x := (NicePreview1.PageWidth - w) div 2;
    y := NicePreview1.MarginTop;
    TextOut(x, y, Str1+' '+Hui);
    y := y + h + 5;

    Font.Name := 'AngsanaUPC';
    Font.Size := 20;
    Font.Style := [];
    Font.Color := clRed;
    w := TextWidth(Str2+StrDate+' '+Name);
    h := TextHeight(Str2);
    x := (NicePreview1.PageWidth - w) div 2;
    TextOut(x, y, Str2+StrDate+' '+Name);
    y := y + h + 30;

    Font.Name := 'AngsanaUPC';
    Font.Size := 16;
    Font.Style := [];
    Font.Color := clBlack;
    w := (NicePreview1.PageWidth - NicePreview1.MarginLeft - nicePreview1.MarginRight) div (Grid.ColCount+1);
    h := TextHeight('Ag') + 3;
    DeltaX := (NicePreview1.PageWidth - (w * (Grid.ColCount+1))) div 2;
    Brush.Style := bsClear;

    //x := NicePreview1.MarginLeft;
    //y := 700;
    with Grid do
    begin
      //Font.Name := 'AngsanaUPC';
      //Font.Size := 16;
      //Font.Style := [];
      //Font.Color := clBlack;

      L1 := 5;
      L2 := 7;
      L3 := 33;
      L4 := 45;
      L5 := 60;
      L6 := 72;
      L7 := 85;



      for j := LeftSide to  RightSide do
      begin
        TextOut(j,y-33,'-');
        TextOut(j,y-10,'-');
      end;

      TextOut(round(leftside + (((Workwidth*(L1/100)) - textwidth('ลำดับ')) / 2)   )  ,y-20,'ลำดับ');
      TextOut(Round(leftside + WorkWidth*(L2 / 100)),y-20,'ลูกค้า');
      TextOut(Round(leftside + WorkWidth*(L3 / 100)-textwidth('ยอดขาย')),y-20,'ยอดขาย');
      TextOut(Round(leftside + WorkWidth*(L4 / 100)-textwidth('คอมมิชชั่น')),y-20,'คอมมิชชั่น');
      TextOut(Round(leftside + WorkWidth*(L5 / 100)-textwidth('ยอดรับสุทธิ')),y-20,'ยอดรับสุทธิ');
      TextOut(Round(leftside + WorkWidth*(L6 / 100)-textwidth('ยอดถูก')),y-20,'ยอดถูก');
      TextOut(Round(leftside + WorkWidth*(L7 / 100)-textwidth('ยอดจ่าย')),y-20,'ยอดจ่าย');
      TextOut(Round(RightSide - textwidth('กำไร / ขาดทุน')),y-20,'กำไร / ขาดทุน');

      for i := 0 to RowCount-1 do
      begin
             {
               if Grid[ax-1,ay-1] <> '0' then
                  TextRect(R, R.Right-TextWidth(Grid[ax-1,ay-1])-3, R.Top + 3, Grid[ax-1,ay-1])
               else
                  TextRect(R, R.Right-TextWidth(Grid[ax-1,ay-1])-3, R.Top + 3, '-');
             }

        TextOut(round(leftside + (((Workwidth*(L1/100)) - textwidth(IntToStr(i+1))) / 2)),y+4,IntToStr(i+1));
        TextOut(Round(Leftside + WorkWidth*(L2  / 100)),y+4,Grid[0,i]);
        TextOut(Round(leftside + WorkWidth*(L3  / 100)-textwidth(Grid[1,i])),y+4,Grid[1,i]);

       if Grid[2,i] <> '0' then
        TextOut(Round(leftside + WorkWidth*(L4  / 100)-textwidth(Grid[2,i])),y+4,Grid[2,i])
       else
        TextOut(Round(leftside + WorkWidth*(L4  / 100)-textwidth(Grid[2,i])),y+4,'-');

       if Grid[3,i] <> '0' then
        TextOut(Round(leftside + WorkWidth*(L5  / 100)-textwidth(Grid[3,i])),y+4,Grid[3,i])
       else
        TextOut(Round(leftside + WorkWidth*(L5  / 100)-textwidth(Grid[3,i])),y+4,'-');

       if Grid[4,i] <> '0' then
        TextOut(Round(leftside + WorkWidth*(L6  / 100)-textwidth(Grid[4,i])),y+4,Grid[4,i])
       else
        TextOut(Round(leftside + WorkWidth*(L6  / 100)-textwidth(Grid[4,i])),y+4,'-');

       if Grid[5,i] <> '0' then
        TextOut(Round(leftside + WorkWidth*(L7  / 100)-textwidth(Grid[5,i])),y+4,Grid[5,i])
       else
        TextOut(Round(leftside + WorkWidth*(L7  / 100)-textwidth(Grid[5,i])),y+4,'-');

       if Grid[6,i] <> '0' then
        TextOut(Round(RightSide -textwidth(Grid[6,i])),y+3,Grid[6,i])
       else
        TextOut(Round(RightSide -textwidth(Grid[6,i])),y+3,'-');
       
        txtHigh := TextHeight(Grid[0,i]);
        Inc(y,txtHigh);

       
        if Y >= (NicePreview1.PageHeight-NicePreview1.MarginBottom) then
        begin
          y := NicePreview1.MarginTop+TextHeight(Str1);
          WorkHeight := NicePreview1.PageHeight - (NicePreview1.MarginTop + NicePreview1.MarginBottom);
          txtHigh := TextHeight(Grid[0,i]);

          
          NicePreview1.EndPage;
          ACanVas := NicePreview1.BeginPage;
          with ACanVas do
          begin
            Font.Name := 'AngsanaUPC';
            Font.Size := 16;
            Font.Style := [];
            Font.Color := clBlack;
            Brush.Style := bsClear;
          end;


          for j := LeftSide to  RightSide do
          begin
            TextOut(j,y-33,'-');
            TextOut(j,y-10,'-');
          end;

          TextOut(round(leftside + (((Workwidth*(L1/100)) - textwidth('ลำดับ')) / 2)   )  ,y-20,'ลำดับ');
          TextOut(Round(leftside + WorkWidth*(L2 / 100)),y-20,'ลูกค้า');
          TextOut(Round(leftside + WorkWidth*(L3 / 100)-textwidth('ยอดขาย')),y-20,'ยอดขาย');
          TextOut(Round(leftside + WorkWidth*(L4 / 100)-textwidth('คอมมิชชั่น')),y-20,'คอมมิชชั่น');
          TextOut(Round(leftside + WorkWidth*(L5 / 100)-textwidth('ยอดรับสุทธิ')),y-20,'ยอดรับสุทธิ');
          TextOut(Round(leftside + WorkWidth*(L6 / 100)-textwidth('ยอดถูก')),y-20,'ยอดถูก');
          TextOut(Round(leftside + WorkWidth*(L7 / 100)-textwidth('ยอดจ่าย')),y-20,'ยอดจ่าย');
          TextOut(Round(RightSide - textwidth('กำไร / ขาดทุน')),y-20,'กำไร / ขาดทุน');
        end;



        if (((i+1) mod (WorkHeight-160)) = 0) then
        begin
          y := NicePreview1.MarginTop+25;
          NicePreview1.EndPage;
          ACanVas := NicePreview1.BeginPage;
          with ACanVas do
          begin
            Font.Name := 'AngsanaUPC';
            Font.Size := 16;
            Font.Style := [];
            Font.Color := clBlack;
            Brush.Style := bsClear;

            TextOut(round(leftside + (((Workwidth*(L1/100)) - textwidth('ลำดับ')) / 2)   )  ,y-20,'ลำดับ');
            TextOut(Round(Leftside + WorkWidth*(L2  / 100)),y-20,'ลูกค้า');
            TextOut(Round(leftside + WorkWidth*(L3 / 100)-textwidth('ยอดขาย')),y-20,'ยอดขาย');
            TextOut(Round(leftside + WorkWidth*(L4 / 100)-textwidth('คอมมิชชั่น')),y-20,'คอมมิชชั่น');
            TextOut(Round(leftside + WorkWidth*(L5 / 100)-textwidth('ยอดรับสุทธิ')),y-20,'ยอดรับสุทธิ');
            TextOut(Round(leftside + WorkWidth*(L6 / 100)-textwidth('ยอดถูก')),y-20,'ยอดถูก');
            TextOut(Round(leftside + WorkWidth*(L7 / 100)-textwidth('ยอดจ่าย')),y-20,'ยอดจ่าย');
            TextOut(Round(RightSide - textwidth('กำไร / ขาดทุน')),y-20,'กำไร / ขาดทุน');

            for j := LeftSide to  RightSide do
            begin
              TextOut(j,y-33,'-');
              TextOut(j,y-10,'-');
            end;
          end;
        end;

      end;
      

      for j := NicePreview1.MarginLeft to  (NicePreview1.PageWidth - NicePreview1.MarginRight) do
      begin
        TextOut(j,y-10,'-');
        TextOut(j,y+10,'-');
      end;

      TextOut(Round(Leftside + WorkWidth*(L2   / 100)),y,'รวม');
      TextOut(Round(leftside + WorkWidth*(L3 / 100)-textwidth(Columns[1].Footer)),y,Columns[1].Footer);
      TextOut(Round(leftside + WorkWidth*(L4 / 100)-textwidth(Columns[2].Footer)),y,Columns[2].Footer);
      TextOut(Round(leftside + WorkWidth*(L5 / 100)-textwidth(Columns[3].Footer)),y,Columns[3].Footer);
      TextOut(Round(leftside + WorkWidth*(L6 / 100)-textwidth(Columns[4].Footer)),y,Columns[4].Footer);
      TextOut(Round(leftside + WorkWidth*(L7 / 100)-textwidth(Columns[5].Footer)),y,Columns[5].Footer);
      TextOut(Round(RightSide - textwidth(Columns[6].Footer)),y,Columns[6].Footer);

    end;
  end;
  NicePreview1.EndPage;
end;

procedure TfrmPrintAllPrev.PrintBtnClick(Sender: TObject);
Var
    i: integer;
begin
   With PrintDialog1, NicePreview1 do
   begin
      if printrange = prAllPages then  PrintAll
      else
      if printrange=prPageNums then
      begin
        for i:=frompage to topage do printpage(i-1);
        //if sender = printbtn then displaypage(topage);
      end;
   end;
end;


procedure TfrmPrintAllPrev.ToolButton1Click(Sender: TObject);
begin
  NicePreview1.PreviewMode := pmNormal;
  NicePreview1.PreviewMode := pmZoomIn;
end;

procedure TfrmPrintAllPrev.ToolButton2Click(Sender: TObject);
begin
  NicePreview1.PreviewMode := pmNormal;  
  NicePreview1.PreviewMode := pmZoomOut;
end;

procedure TfrmPrintAllPrev.ToolButton3Click(Sender: TObject);
begin
  NicePreview1.PreviewMode := pmDrag;
end;

procedure TfrmPrintAllPrev.ToolButton4Click(Sender: TObject);
begin
  NicePreview1.ViewActualSize;
end;

procedure TfrmPrintAllPrev.ToolButton5Click(Sender: TObject);
begin
  NicePreview1.ViewFitToWidth;
end;

procedure TfrmPrintAllPrev.ToolButton6Click(Sender: TObject);
begin
  NicePreview1.ViewWholePage;
end;

procedure TfrmPrintAllPrev.ToolButton7Click(Sender: TObject);
begin
  NicePreview1.ViewTwoPage;
end;

procedure TfrmPrintAllPrev.ToolButton8Click(Sender: TObject);
begin
  NicePreview1.ViewFourPage;
end;

procedure TfrmPrintAllPrev.ToolButton9Click(Sender: TObject);
begin
   Close;
end;

procedure TfrmPrintAllPrev.ToolButton10Click(Sender: TObject);
var i:integer;
begin
  with printdialog1,NicePreview1,fmain do
  begin
    Options:=[poPageNums,poHelp]; {allow page selection}
    frompage:=1;
    minpage:=1;
    maxpage:=pagecount;
    topage:=PageCount;
    if execute then
    begin
        ReadPrinterConfig;
        //refresh;
    end;
  end;
  {If printdialog1.execute then PrintAll;}
end;

procedure TfrmPrintAllPrev.NicePreview1Change(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'Page ' + IntToStr(NicePreview1.PageIndex + 1) +
    ' of ' + IntToStr(NicePreview1.PageCount);
  StatusBar1.Panels[1].Text := 'Magnification ' + IntToStr(Round(NicePreview1.Magnification * 100)) + '%';
end;

end.
