unit uPrintPrev;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NicePreview, ExtCtrls, NiceGrid, Buttons, ImgList, ComCtrls,
  ToolWin,RpDevice, StdCtrls;

type
  TfrmPrintPrev = class(TForm)
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
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
  frmPrintPrev: TfrmPrintPrev;
  Dates : TDateTime;

implementation

uses uPrintDlg;

{$R *.dfm}

procedure TfrmPrintPrev.SetDate(Date: TDateTime);
begin
 //DateTimePicker1.Date := Date;
 Dates := Date;
end;

function TfrmPrintPrev.GetDate: TDateTime;
begin
  //Result := DateTimePicker1.Date;
  Result := Dates;
end;

procedure TfrmPrintPrev.RenderGrids(Grid: TNiceGrid; Hui,Name: String);
const
  Str1 = 'สรุปผล';
  Str2 = 'ประจำงวดวันที่ ';
var
  x, y, w, h: Integer;
  R: TRect;
  ax, ay: Integer;
  DeltaX: Integer;
  aYear,aMonth,aDate : Word;
  StrDate: String;
begin

  DecodeDate(Dates,aYear,aMonth,aDate);
  StrDate := IntToStr(aDate)+'/'+IntToStr(aMonth)+'/'+IntToStr(aYear+543);
  NicePreview1.Clear;

  with NicePreview1.BeginPage do
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

    for ax := 0 to Grid.ColCount do
    begin
      for ay := 0 to Grid.RowCount+1 do
      begin
        R := Rect(ax * w, ay * h, ((ax + 1) * w) + 1, ((ay + 1) * h) + 1);
        OffsetRect(R, DeltaX, y);
        Brush.Style := bsSolid;
        Rectangle(R);
        Brush.Style := bsClear;
        if ax = 0 then //คอลัมพ์แรก
        begin
         if ay = 0 then //ที่คอลัพมพ์แรก และ แถวแรก
            TextRect(R, R.Left+10, R.Top + 3, 'รายการ')
         else //พิมพ์หัวแถว
            //if ay < Grid.RowCount + 1 then
            if ay < Grid.RowCount+1 then
               TextRect(R, R.Left+5, R.Top + 3, Grid.GutterStrings[ay-1])
            else
               TextRect(R, R.Left+10, R.Top + 3, 'รวม')
        end
        else
        begin
         if ay = 0 then //แถวแรก
         begin
            if ax > 0 then //พอเลยคอลับมพ์แรกให้พิมพ์หัวคอลัมพ์ใน Grid ที่ส่งมา
               TextRect(R, R.Right-TextWidth(Grid.Columns[ax-1].Title)-5, R.Top + 3, Grid.Columns[ax-1].Title)
         end
         else  //พิมพ์เนื้อหา
            //if ay < Grid.RowCount + 1 then
            if ay < Grid.RowCount+1 then
            begin
               if Grid[ax-1,ay-1] <> '0' then
                  TextRect(R, R.Right-TextWidth(Grid[ax-1,ay-1])-3, R.Top + 3, Grid[ax-1,ay-1])
               else
                  TextRect(R, R.Right-TextWidth(Grid[ax-1,ay-1])-3, R.Top + 3, '-');
            end
            else
               TextRect(R, R.Right-TextWidth(Grid.Columns[ax-1].Footer)-3, R.Top + 3, Grid.Columns[ax-1].Footer)
        end;

      end;
    end;                            

  end;
  
  NicePreview1.EndPage;

end;

procedure TfrmPrintPrev.PrintBtnClick(Sender: TObject);
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


procedure TfrmPrintPrev.ToolButton1Click(Sender: TObject);
begin
  NicePreview1.PreviewMode := pmNormal;
  NicePreview1.PreviewMode := pmZoomIn;
end;

procedure TfrmPrintPrev.ToolButton2Click(Sender: TObject);
begin
  NicePreview1.PreviewMode := pmNormal;  
  NicePreview1.PreviewMode := pmZoomOut;
end;

procedure TfrmPrintPrev.ToolButton3Click(Sender: TObject);
begin
  NicePreview1.PreviewMode := pmDrag;
end;

procedure TfrmPrintPrev.ToolButton4Click(Sender: TObject);
begin
  NicePreview1.ViewActualSize;
end;

procedure TfrmPrintPrev.ToolButton5Click(Sender: TObject);
begin
  NicePreview1.ViewFitToWidth;
end;

procedure TfrmPrintPrev.ToolButton6Click(Sender: TObject);
begin
  NicePreview1.ViewWholePage;
end;

procedure TfrmPrintPrev.ToolButton7Click(Sender: TObject);
begin
  NicePreview1.ViewTwoPage;
end;

procedure TfrmPrintPrev.ToolButton8Click(Sender: TObject);
begin
  NicePreview1.ViewFourPage;
end;

procedure TfrmPrintPrev.ToolButton9Click(Sender: TObject);
begin
   Close;
end;

procedure TfrmPrintPrev.ToolButton10Click(Sender: TObject);
var i:integer;
begin
  with printdialog1,NicePreview1 do
  begin
    Options:=[poPageNums,poHelp]; {allow page selection}
    frompage:=1;
    minpage:=1;
    maxpage:=pagecount;
    topage:=PageCount;
    if execute then
    begin
        ReadPrinterConfig;
        refresh;
    end;
  end;
  {If printdialog1.execute then PrintAll;}
end;

procedure TfrmPrintPrev.NicePreview1Change(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'Page ' + IntToStr(NicePreview1.PageIndex + 1) +
    ' of ' + IntToStr(NicePreview1.PageCount);
  StatusBar1.Panels[1].Text := 'Magnification ' + IntToStr(Round(NicePreview1.Magnification * 100)) + '%';
end;

procedure TfrmPrintPrev.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Close;
end;

procedure TfrmPrintPrev.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = $50 then
  begin
    PrintBtnClick(Sender);
    Key := 0;
  end;
end;

end.
