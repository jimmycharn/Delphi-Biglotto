unit uPrintCutPrev;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NicePreview, ExtCtrls, NiceGrid, Buttons, ImgList, ComCtrls,RpDevice, StdCtrls,
  ToolWin, SortListViews, sCustomComboBox, Printers;

type
  TfrmPrintCutPrev = class(TForm)
    NicePreview: TNicePreview;
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
    PrintDialog: TPrintDialog;
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
    procedure NicePreviewChange(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure RenderGrids(SumGrid,Grid1,Grid2,Grid3,Grid4,Grid5: TNiceGrid; aDates:TDateTime; Hui: String; HLine: Integer);
    Procedure InputPageCut(CutListNums: TSortListView; LotDate: TDate; ComboType: TComboBox; NumName:String; SendName: String);
    Procedure InputItems(InputItem: TNiceGrid; LotDate: TDate; ComboType: TComboBox; ComboNum: TsCombobox; SendName, BookNo: String; Status: Integer);
    Procedure Translate(InputItem: TNiceGrid; SeltType: integer; LotDate: TDate; ComboType: TComboBox; NumName, SendName, BookNo: String; Status, GridCol: Integer);
    Procedure Translate1(InputItem: TNiceGrid; SeltType: integer; LotDate: TDate; ComboType: TComboBox; NumName, SendName, BookNo: String; Status, GridCol: Integer);
  end;

var
  frmPrintCutPrev: TfrmPrintCutPrev;
  Dates : TDateTime;

implementation

uses Utils;


{$R *.dfm}

Procedure TfrmPrintCutPrev.InputPageCut(CutListNums: TSortListView; LotDate: TDate; ComboType: TComboBox; NumName:String; SendName: String);
const
  Str1 = '';
  Str2 = 'งวดวันที่ ';
var
  L1,L2,L3,L4,L5,L6,L7,L8,Ofst1,Ofst2: Integer;
  x, y, w, h, i, j, Rw, Workwidth, Items, WorkHeight,LeftSide,RightSide: Integer;
  R: TRect;
  ax, ay, txtHigh, LastPage: Integer;
  DeltaX: Integer;
  aYear,aMonth,aDate : Word;
  StrDate,DealerName: String;
  Pricelen : Array[0..5] of integer;
  ACanVas : TCanvas;
  SumCutPrice: Extended;
  lDate: TDateTime;
  //Printers : TPrinter;
begin
  DecodeDate(LotDate,aYear,aMonth,aDate);
  StrDate := IntToStr(aDate)+'/'+IntToStr(aMonth)+'/'+IntToStr(aYear+543);
  NicePreview.Clear;
  //TxtHigh := 0;
  if sendName = '' then
    DealerName := '.........................................' //Copy(CutList.Items[CutList.itemindex].SubItems[1],8,length(CutList.Items[CutList.itemindex].SubItems[1]));
  else
    DealerName := ' : '+SendName;

  NicePreview.ReadPrinterConfig;
  ACanvas := NicePreview.BeginPage;
  with ACanvas do
  begin
    WorkWidth  := NicePreview.PageWidth;
    WorkHeight := NicePreview.PageHeight;
    leftSide   := 0;
    RightSide  := NicePreview.PageWidth;


    Font.Name := 'AngsanaUPC';
    Font.Size := 22;
    Font.Style := [fsBold];
    Font.Color := clBlack;

    w := TextWidth(Str1+' '+ComboType.Items[ComboType.ItemIndex]+' '+NumName);
    h := TextHeight(Str1+' '+ComboType.Items[ComboType.ItemIndex]+' '+NumName);
    x := (NicePreview.PageWidth - w) div 2;
    y := NicePreview.MarginTop-10;
    TextOut(x, y, Str1+' '+ComboType.Items[ComboType.ItemIndex]+' '+NumName);
    y := y + h - 5;

    Font.Name := 'AngsanaUPC';
    Font.Size := 20;
    Font.Style := [];
    w := TextWidth(Str2+StrDate+'  [ผู้ส่ง '+DealerName+']');

    h := TextHeight(Str2);
    x := (NicePreview.PageWidth - w) div 2;
    TextOut(x, y,Str2+StrDate+'  [ผู้ส่ง '+DealerName+']');

    y := y + h + 15;

    Font.Name := 'AngsanaUPC';
    Font.Size := 20;
    Font.Style := [];
    Font.Color := clBlack;
    w := (NicePreview.PageWidth - NicePreview.MarginLeft - NicePreview.MarginRight) div 3;//(CustList.Columns.Count+1);
    h := TextHeight('Ag') + 3;
    DeltaX := (NicePreview.PageWidth - (w * (3))) div 2;
    Brush.Style := bsClear;

    WorkHeight := NicePreview.PageHeight - (NicePreview.MarginTop + (NicePreview.MarginBottom+25) + y);

      L1 := 15;
      L2 := L1+1;
      L3 := L1+10;
      L4 := 55;
      L5 := 70;
      L6 := 82;
      L7 := 95;

      Ofst1 := 30;
      Ofst2 := 120;

      for j := Trunc((((Workwidth*L1/100) - textwidth('ลำดับ')) / 2)) to Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2 do // Round(WorkWidth*L3 / 100) do
      begin
        TextOut(j,y-33,'-');
        TextOut(j,y-8,'-');
      end;
      TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2)),y-20,'เลข');
      TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2-textwidth('จำนวนเงิน'),y-20,'จำนวนเงิน');

      SumCutPrice := 0;
      Items := 1;
      for i := 0 to CutListNums.Items.Count-1 do
      begin
        if (CutListNums.Items[i].Checked) then
        begin
          //TextOut(round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2)),y+4,CutListNums.Items[i].Caption);
          TextOut(round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2)),y+4,CutListNums.Items[i].Caption+'    =');

          //TextOut(round( (((Workwidth*L1 / 100) ) - textwidth('ลำดับ')) / 2) - textwidth('    =    '+CutListNums.Items[i].SubItems[0])+Ofst2,y+4,'    =    '+CutListNums.Items[i].SubItems[0]);
          TextOut(round( (((Workwidth*L1 / 100) ) - textwidth('ลำดับ')) / 2) - textwidth(CutListNums.Items[i].SubItems[0])+Ofst2,y+4,CutListNums.Items[i].SubItems[0]);

          SumCutPrice := SumCutPrice + txtToFloat(CutListNums.Items[i].SubItems[0]);
          txtHigh := TextHeight(CutListNums.Items[i].SubItems[0])-12;//Items[i].Caption);
          Inc(y,txtHigh);
          WorkHeight := WorkHeight-txtHigh;
          Inc(Items);
        end;

        if (WorkHeight <= 0) then
        begin

        if i < CutListNums.Items.Count-1 then
        begin
          for j := Trunc((((Workwidth*L1/100) - textwidth('ลำดับ')) / 2)) to Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2 do // Round(WorkWidth*L3 / 100) do
          begin
            TextOut(j,y+1,'-');
            TextOut(j,y+25,'-');
          end;
          TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2)),y+12,'รวม');
          TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2-textwidth(formatfloat('#,##0',SumCutPrice)),y+12,formatfloat('#,##0',SumCutPrice));
          SumCutPrice := 0;
        
              WorkWidth  := NicePreview.PageWidth;
              Leftside := 0;
              y := NicePreview.MarginTop+76;
              WorkHeight := NicePreview.PageHeight - (NicePreview.MarginTop + (NicePreview.MarginBottom+25)+y);

              L1 := L1+37;
              L2 := L1+1;
              L3 := L1+15;

            Rw := 0; // Rw is Right width
            for j := round( (((Workwidth*L1/100) - textwidth('ลำดับ')) / 2)) to Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2 do // Round(WorkWidth*L3 / 100) do
            begin
              Rw := j;
            end;
            if (Rw >= (NicePreview.PageWidth - NicePreview.MarginRight)) and (i < (CutListNums.Items.Count-1)) then
            begin
              NicePreview.EndPage;
              ACanvas := NicePreview.BeginPage;
              with ACanvas do
              begin
                NicePreview.ReadPrinterConfig;
                WorkWidth  := NicePreview.PageWidth;
                leftSide   := 0;
                RightSide  := NicePreview.PageWidth;

                Font.Name := 'AngsanaUPC';
                Font.Size := 22;
                Font.Style := [fsBold];
                Font.Color := clBlack;

                w := TextWidth(Str1+' '+ComboType.Items[ComboType.ItemIndex]+' '+NumName);
                h := TextHeight(Str1+' '+ComboType.Items[ComboType.ItemIndex]+' '+NumName);

                x := (NicePreview.PageWidth - w) div 2;
                y := NicePreview.MarginTop-10;
                //TextOut(x, y, Str1+' '+ComboType.Items[ComboType.ItemIndex]+' '+ComboNum.Items[ComboNum.ItemIndex]);
                TextOut(x, y, Str1+' '+ComboType.Items[ComboType.ItemIndex]+' '+NumName);
                y := y + h - 5;

                Font.Name := 'AngsanaUPC';
                Font.Size := 20;
                Font.Style := [];
                //Font.Color := clRed;

                w := TextWidth(Str2+StrDate+'  [ผู้ส่ง '+DealerName+']');
                h := TextHeight(Str2);
                x := (NicePreview.PageWidth - w) div 2;
                TextOut(x, y,Str2+StrDate+'  [ผู้ส่ง '+DealerName+']');

                y := y + h + 15;

                Font.Name := 'AngsanaUPC';
                Font.Size := 20;
                Font.Style := [];
                Font.Color := clBlack;

                w := (NicePreview.PageWidth - NicePreview.MarginLeft - NicePreview.MarginRight) div 3;//(CustList.Columns.Count+1);
                h := TextHeight('Ag') + 3;
                DeltaX := (NicePreview.PageWidth - (w * (3))) div 2;
                Brush.Style := bsClear;

                L1 := 15;
                L2 := L1+1;
                L3 := L1+10;
                L4 := 55;
                L5 := 70;
                L6 := 82;
                L7 := 95;

                Ofst1 := 30;
                Ofst2 := 120;
              end;

              for j := Trunc((((Workwidth*L1/100) - textwidth('ลำดับ')) / 2)) to Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2 do // Round(WorkWidth*L3 / 100) do
              begin
                TextOut(j,y-33,'-');
                TextOut(j,y-8,'-');
              end;
            end;


            for j := round( (((Workwidth*L1/100) - textwidth('ลำดับ')) / 2)) to Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2 do // Round(WorkWidth*L3 / 100) do
            begin
              TextOut(j,y-33,'-');
              TextOut(j,y-8,'-');
            end;

            Font.Name := 'AngsanaUPC';
            Font.Size := 20;
            Font.Style := [];
            Font.Color := clBlack;
            Brush.Style := bsClear;

            TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2)   ) ,y-20,'เลข');
            TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2-textwidth('จำนวนเงิน'),y-20,'จำนวนเงิน');
          end;

        end;
      end;

      for j := round( (((Workwidth*(L1/100)) - textwidth('ลำดับ')) / 2)) to Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2 do // Round(WorkWidth*(L3 / 100)) do
      begin
        TextOut(j,y+1,'-');
        TextOut(j,y+25,'-');
      end;

      TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2)),y+12,'รวม');
      TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2-textwidth(formatfloat('#,##0',SumCutPrice)),y+12,formatfloat('#,##0',SumCutPrice));

  end;
  NicePreview.EndPage;
end;


Procedure TfrmPrintCutPrev.InputItems(InputItem: TNiceGrid; LotDate: TDate; ComboType: TComboBox; ComboNum: TsCombobox; SendName, BookNo: String; Status: Integer);
const
  Str1 = 'รายการป้อนข้อมูล ';
  Str2 = 'งวดวันที่ ';
var
  L1,L2,L3,L4,L5,L6,L7,L8,Ofst1,Ofst2: Integer;
  x, y, w, h, i, j, Rw, Workwidth, Items, WorkHeight,LeftSide,RightSide: Integer;
  R: TRect;
  ax, ay, txtHigh, LastPage: Integer;
  DeltaX: Integer;
  aYear,aMonth,aDate : Word;
  StrDate,DealerName,StrLine2: String;
  Pricelen : Array[0..5] of integer;
  ACanVas : TCanvas;
  SumCutPrice: Extended;
  lDate: TDateTime;
  //Printers : TPrinter;
begin
  //LastPage := 13;
  DecodeDate(LotDate,aYear,aMonth,aDate);
  StrDate := IntToStr(aDate)+'/'+IntToStr(aMonth)+'/'+IntToStr(aYear+543);
  NicePreview.Clear;
  //TxtHigh := 0;
  if sendName = '' then
    DealerName := '.........................................' //Copy(CutList.Items[CutList.itemindex].SubItems[1],8,length(CutList.Items[CutList.itemindex].SubItems[1]));
  else
    DealerName := ' : '+SendName;

  Case Status of
      0: StrLine2 := (Str2+StrDate+'  [ลูกค้า '+DealerName+' เล่มที่ '+BookNo+']');
      1: StrLine2 := (Str2+StrDate+'  [ลูกค้า '+DealerName+' รวมทุกเล่ม]');
      2: StrLine2 := (Str2+StrDate+'  [ลูกค้าทุกคน'+' เล่มที่ '+BookNo+']');
      3: StrLine2 := (Str2+StrDate+'  [ข้อมูลทั้งหมด]');
  end;


  NicePreview.ReadPrinterConfig;
  ACanvas := NicePreview.BeginPage;
  with ACanvas do
  begin
    WorkWidth  := NicePreview.PageWidth;
    WorkHeight := NicePreview.PageHeight;
    leftSide   := 0;
    RightSide  := NicePreview.PageWidth;


    Font.Name := 'AngsanaUPC';
    Font.Size := 16;
    Font.Style := [fsBold];
    Font.Color := clBlack;
    //w := TextWidth(Str1+' '+ComboType.Items[ComboType.ItemIndex]+' '+ComboNum.Items[ComboNum.ItemIndex]);
    //h := TextHeight(Str1+' '+ComboType.Items[ComboType.ItemIndex]+' '+ComboNum.Items[ComboNum.ItemIndex]);

    w := TextWidth(Str1+' '+ComboType.Items[ComboType.ItemIndex]);
    h := TextHeight(Str1+' '+ComboType.Items[ComboType.ItemIndex]);

    x := (NicePreview.PageWidth - w) div 2;
    y := NicePreview.MarginTop-10;
    TextOut(x, y, Str1+' '+ComboType.Items[ComboType.ItemIndex]);
    y := y + h - 5;

    Font.Name := 'AngsanaUPC';
    Font.Size := 18;
    Font.Style := [];
    //Font.Color := clRed;
    w := TextWidth(StrLine2);
    h := TextHeight(Str2);
    x := (NicePreview.PageWidth - w) div 2;
    TextOut(x, y, StrLine2);
    y := y + h + 15;

    Font.Name := 'AngsanaUPC';
    Font.Size := 16;
    Font.Style := [];
    Font.Color := clBlack;
    w := (NicePreview.PageWidth - NicePreview.MarginLeft - NicePreview.MarginRight) div 3;//(CustList.Columns.Count+1);
    h := TextHeight('Ag') + 3;
    DeltaX := (NicePreview.PageWidth - (w * (3))) div 2;
    Brush.Style := bsClear;
    y := NicePreview.MarginTop+76;

    WorkHeight := NicePreview.PageHeight - (NicePreview.MarginTop + (NicePreview.MarginBottom+25) + y);

      L1 := 15;
      L2 := L1+1;
      L3 := L1+10;
      L4 := 55;
      L5 := 70;
      L6 := 82;
      L7 := 95;

      Ofst1 := 30;
      Ofst2 := 130;

      for j := Trunc((((Workwidth*L1/100) - textwidth('ลำดับ')) / 2)) to Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2 do // Round(WorkWidth*L3 / 100) do
      begin
        TextOut(j,y-33,'-');
        TextOut(j,y-8,'-');
      end;

      //TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ที่')) / 2)),y-20,'ที่');
      TextOut(Round( (((Workwidth*L1 / 100) - textwidth('เลข')) / 2)),y-20,'เลข');
      //TextOut(Round( (((Workwidth*(L1+4) / 100) - textwidth('ลำดับ')) / 2))+Ofst1-10,y-20,'เลข');
      TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2+4-textwidth('บน   -   ล่าง'),y-20,'บน   -    ล่าง');

      Items := 1;
      //for i := 0 to InputItem.RowCount -1 do
      for i := (InputItem.RowCount -1) DownTo 0 do
      begin
        //TextOut(round( (((Workwidth*L1 / 100) - textwidth(IntToStr(Items))) / 2)),y+4,IntToStr(Items));
        TextOut(round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2)),y+4,InputItem[0,i]+'    =');
        //TextOut(round( (((Workwidth*(L1+4) / 100) - textwidth('ลำดับ')) / 2))+Ofst1-10,y+4,InputItem[0,i]);
        if Trim(InputItem[1,i]) = '' then
          TextOut(round( (((Workwidth*L1 / 100) ) - textwidth('ลำดับ')) / 2) - textwidth(InputItem[2,i])+Ofst2,y+4,InputItem[2,i]+']')
        else
          TextOut(round( (((Workwidth*L1 / 100) ) - textwidth('ลำดับ')) / 2) - textwidth(InputItem[1,i])+Ofst2+4-(textwidth('บน   -   ล่าง')-textwidth(InputItem[1,i]) ),y+4,'['+InputItem[1,i]);

        txtHigh := TextHeight(InputItem[1,i])-12;//Items[i].Caption);
        Inc(y,14);
        WorkHeight := WorkHeight-14;
        Inc(Items);

        if (WorkHeight <= 0) then
        begin

        if i < InputItem.RowCount-1 then
        begin
          for j := Trunc((((Workwidth*L1/100) - textwidth('ลำดับ')) / 2)) to Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2 do // Round(WorkWidth*L3 / 100) do
          begin
            TextOut(j,y+1,'-');
          end;
              SumCutPrice := 0;

              WorkWidth  := NicePreview.PageWidth;
              Leftside := 0;
              y := NicePreview.MarginTop+76;
              WorkHeight := NicePreview.PageHeight - (NicePreview.MarginTop + (NicePreview.MarginBottom+25)+y);

              L1 := L1+37;
              L2 := L1+1;
              L3 := L1+15;

            Rw := 0;
            for j := round( (((Workwidth*L1/100) - textwidth('ลำดับ')) / 2)) to Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2 do // Round(WorkWidth*L3 / 100) do
            begin
              Rw := j;
            end;
            if (Rw >= (NicePreview.PageWidth - NicePreview.MarginRight)) and (i < (InputItem.RowCount-1)) then
            begin
              NicePreview.EndPage;
              ACanvas := NicePreview.BeginPage;
              with ACanvas do
              begin
                NicePreview.ReadPrinterConfig;
                WorkWidth  := NicePreview.PageWidth;
                leftSide   := 0;
                RightSide  := NicePreview.PageWidth;

                Font.Name := 'AngsanaUPC';
                Font.Size := 16;
                Font.Style := [fsBold];
                Font.Color := clBlack;

                w := TextWidth(Str1+' '+ComboType.Items[ComboType.ItemIndex]+' '+ComboNum.Items[ComboNum.ItemIndex]);
                h := TextHeight(Str1+' '+ComboType.Items[ComboType.ItemIndex]+' '+ComboNum.Items[ComboNum.ItemIndex]);
                x := (NicePreview.PageWidth - w) div 2;
                y := NicePreview.MarginTop-10;
                TextOut(x, y, Str1+' '+ComboType.Items[ComboType.ItemIndex]+' '+ComboNum.Items[ComboNum.ItemIndex]);
                y := y + h - 5;

                Font.Name := 'AngsanaUPC';
                Font.Size := 16;
                Font.Style := [];
                //Font.Color := clRed;

                w := TextWidth(StrLine2);
                h := TextHeight(Str2);
                x := (NicePreview.PageWidth - w) div 2;
                //TextOut(x, y,Str2+StrDate+'  [ผู้ส่ง '+DealerName+']');
                TextOut(x, y, StrLine2);

                y := y + h + 15;

                Font.Name := 'AngsanaUPC';
                Font.Size := 16;
                Font.Style := [];
                Font.Color := clBlack;

                w := (NicePreview.PageWidth - NicePreview.MarginLeft - NicePreview.MarginRight) div 3;//(CustList.Columns.Count+1);
                h := TextHeight('Ag') + 3;
                DeltaX := (NicePreview.PageWidth - (w * (3))) div 2;
                Brush.Style := bsClear;
                y := NicePreview.MarginTop+76;

                L1 := 15;
                L2 := L1+1;
                L3 := L1+10;
                L4 := 55;
                L5 := 70;
                L6 := 82;
                L7 := 95;

                Ofst1 := 30;
                Ofst2 := 130;
              end;

              for j := Trunc((((Workwidth*L1/100) - textwidth('ลำดับ')) / 2)) to Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2 do // Round(WorkWidth*L3 / 100) do
              begin
                TextOut(j,y-33,'-');
                TextOut(j,y-8,'-');
              end;
            end;


            for j := round( (((Workwidth*L1/100) - textwidth('ลำดับ')) / 2)) to Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2 do // Round(WorkWidth*L3 / 100) do
            begin
              TextOut(j,y-33,'-');
              TextOut(j,y-8,'-');
            end;

            Font.Name := 'AngsanaUPC';
            Font.Size := 16;
            Font.Style := [];
            Font.Color := clBlack;
            Brush.Style := bsClear;

            //TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ที่')) / 2)),y-20,'ที่');
            TextOut(Round( (((Workwidth*L1 / 100) - textwidth('เลข')) / 2)),y-20,'เลข');
            //TextOut(Round( (((Workwidth*(L1+4) / 100) - textwidth('ลำดับ')) / 2))+Ofst1-10,y-20,'เลข');
            TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2+4-textwidth('บน   -   ล่าง'),y-20,'บน   -    ล่าง');
          end;

        end;
      end;

      for j := round( (((Workwidth*(L1/100)) - textwidth('ลำดับ')) / 2)) to Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2 do // Round(WorkWidth*(L3 / 100)) do
      begin
        TextOut(j,y+1,'-');
      end;
  end;
  NicePreview.EndPage;
end;


Procedure TfrmPrintCutPrev.Translate(InputItem: TNiceGrid; SeltType: integer; LotDate: TDate; ComboType: TComboBox; NumName, SendName, BookNo: String; Status, GridCol: Integer);
const
  //Str1 = 'รายการเลขตีออก ';
  Str1 = '';
  Str2 = 'งวดวันที่ ';
var
  L1,L2,L3,L4,L5,L6,L7,L8,Ofst1,Ofst2: Integer;
  x, y, w, h, i, j, Rw, Workwidth, Items, WorkHeight,LeftSide,RightSide: Integer;
  R: TRect;
  ax, ay, txtHigh, LastPage: Integer;
  DeltaX: Integer;
  aYear,aMonth,aDate : Word;
  StrDate,DealerName,StrLine2, SeltCaption: String;
  Pricelen : Array[0..5] of integer;
  ACanVas : TCanvas;
  SumCutPrice: Extended;
  lDate: TDateTime;
  //Printers : TPrinter;
begin
  //LastPage := 13;
  DecodeDate(LotDate,aYear,aMonth,aDate);
  StrDate := IntToStr(aDate)+'/'+IntToStr(aMonth)+'/'+IntToStr(aYear+543);
  NicePreview.Clear;
  //TxtHigh := 0;
  if sendName = '' then
    DealerName := '.........................................' //Copy(CutList.Items[CutList.itemindex].SubItems[1],8,length(CutList.Items[CutList.itemindex].SubItems[1]));
  else
    DealerName := ' : '+SendName;

  Case SeltType of //ประเภทยอด ทั้งหมด, เหลือในมือ, เกินอั้น, ตัดส่งเจ้ามือ
    0 : SeltCaption := '[ยอดทั้งหมด] ';
    1 : SeltCaption := '[ยอดเหลือในมือ] ';
    2 : SeltCaption := '[ยอดเกินอั้น] ';
    3 : SeltCaption := '[ยอดตีออก] ';
    4 : SeltCaption := '';
  end;

  Case Status of // สถานะการเลือกเช็คบ๊อค ในหน้าป้อนข้อมูล
    0: StrLine2 := (SeltCaption+Str2+StrDate+'  [ลูกค้า '+DealerName+' เล่มที่ '+BookNo+']');
    1: StrLine2 := (SeltCaption+Str2+StrDate+'  [ลูกค้า '+DealerName+' รวมทุกเล่ม]');
    2: StrLine2 := (SeltCaption+Str2+StrDate+'  [ลูกค้าทุกคน'+' เล่มที่ '+BookNo+']');
    3: StrLine2 := (SeltCaption+Str2+StrDate+'  [ข้อมูลทั้งหมด]');
    4: StrLine2 := (SeltCaption+Str2+StrDate);
  end;


  NicePreview.ReadPrinterConfig;
  ACanvas := NicePreview.BeginPage;
  with ACanvas do
  begin
    WorkWidth  := NicePreview.PageWidth;
    WorkHeight := NicePreview.PageHeight;
    leftSide   := 0;
    RightSide  := NicePreview.PageWidth;


    Font.Name := 'AngsanaUPC';
    Font.Size := 18;
    Font.Style := [fsBold];
    Font.Color := clBlack;
    //w := TextWidth(Str1+' '+ComboType.Items[ComboType.ItemIndex]+' '+ComboNum.Items[ComboNum.ItemIndex]);
    //h := TextHeight(Str1+' '+ComboType.Items[ComboType.ItemIndex]+' '+ComboNum.Items[ComboNum.ItemIndex]);
    w := TextWidth(Str1+' '+ComboType.Items[ComboType.ItemIndex]+' '+NumName);
    h := TextHeight(Str1+' '+ComboType.Items[ComboType.ItemIndex]+' '+NumName);

    x := (NicePreview.PageWidth - w) div 2;
    y := NicePreview.MarginTop-10;
    //TextOut(x, y, Str1+' '+ComboType.Items[ComboType.ItemIndex]+' '+ComboNum.Items[ComboNum.ItemIndex]);
    TextOut(x, y, Str1+' '+ComboType.Items[ComboType.ItemIndex]+' '+NumName);
    y := y + h - 5;

    Font.Name := 'AngsanaUPC';
    Font.Size := 18;
    Font.Style := [];
    //Font.Color := clRed;
    //w := TextWidth(Str2+StrDate+' '); //Name
    //w := TextWidth(Str2+DateToStr(DatePick.Date));
    //w := TextWidth(Str2+CutList.Items[CutList.itemindex].Caption+'  [เจ้ามือ '+DealerName+']');
    //w := TextWidth(Str2+StrDate+'  [ผู้ส่ง '+DealerName+']');

    w := TextWidth(StrLine2);

    h := TextHeight(Str2);
    x := (NicePreview.PageWidth - w) div 2;
    //TextOut(x, y, Str2+StrDate+' '); //Name
    TextOut(x, y, StrLine2); //Name

  {  
    Case Status of
      0: TextOut(x, y,Str2+StrDate+'  [ลูกค้า '+DealerName+' เล่มที่ '+BookNo+']' );
      1: TextOut(x, y,Str2+StrDate+'  [ลูกค้า '+DealerName+' รวมทุกเล่ม]');
      2: TextOut(x, y,Str2+StrDate+'  [ลูกค้าทุกคน'+' เล่มที่ '+BookNo+']');
      3: TextOut(x, y,Str2+StrDate+'  [ข้อมูลทั้งหมด]');
    end;
  }

    y := y + h + 15;

    Font.Name := 'AngsanaUPC';
    Font.Size := 18;
    Font.Style := [];
    Font.Color := clBlack;
    w := (NicePreview.PageWidth - NicePreview.MarginLeft - NicePreview.MarginRight) div 3;//(CustList.Columns.Count+1);
    h := TextHeight('Ag') + 3;
    //DeltaX := (NicePreview.PageWidth - (w * (CustList.Columns.Count+1))) div 2;
    DeltaX := (NicePreview.PageWidth - (w * (3))) div 2;
    Brush.Style := bsClear;
    y := NicePreview.MarginTop+76;

    WorkHeight := NicePreview.PageHeight - (NicePreview.MarginTop + (NicePreview.MarginBottom+25) + y);

      //L1 := 20;
      L1 := 15;
      L2 := L1+1;
      L3 := L1+10;
      L4 := 55;
      L5 := 70;
      L6 := 82;
      L7 := 95;

      Ofst1 := 30;
      Ofst2 := 130;
    {
      for j := Trunc((((Workwidth*L1/100) - textwidth('ลำดับ')) / 2)) to Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2 do // Round(WorkWidth*L3 / 100) do
      begin
        TextOut(j,y-33,'-');
        TextOut(j,y-8,'-');
      end;
    }
      for j := Trunc((((Workwidth*L1/100) - textwidth('ลำดับ')) / 2)) to Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2 do // Round(WorkWidth*L3 / 100) do
      begin
        TextOut(j,y-33,'-');
        TextOut(j,y-8,'-');
      end;

      TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ที่')) / 2)),y-20,'ที่');
      TextOut(Round( (((Workwidth*(L1+5) / 100) - textwidth('ลำดับ')) / 2))+Ofst1-10,y-20,'เลข');
      TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2-textwidth('จำนวน'),y-20,'จำนวน');
     {
      TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2)),y-20,'ลำดับ');
      TextOut(Round( (((Workwidth*(L1+3) / 100) - textwidth('ลำดับ')) / 2))+Ofst1-10,y-20,'เลข');
      TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2-textwidth('บน   -   ล่าง'),y-20,'บน   -   ล่าง');
     }
      //TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2)),y-20,'เลข');
      ////TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst1-10,y-20,'เลข');
      //TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2-textwidth('จำนวนเงิน'),y-20,'จำนวนเงิน');


      SumCutPrice := 0;
      Items := 1;
      //for i := 0 to CutListNum.Items.Count-1 do


      for i := 0 to InputItem.RowCount -1 do 
      begin
        //if (CutListNum.Items[i].Checked) then
       if InputItem[GridCol,i] <> '' then
       begin
        begin
          //TextOut(round( (((Workwidth*L1 / 100) - textwidth(IntToStr(i+1))) / 2)),y+4,IntToStr(i+1));

          TextOut(round( (((Workwidth*L1 / 100) - textwidth(IntToStr(Items))) / 2)),y+4,IntToStr(Items));
          TextOut(round( (((Workwidth*(L1+5) / 100) - textwidth('ลำดับ')) / 2))+Ofst1-10,y+4,InputItem[0,i]);
          //if Trim(InputItem[1,i]) = '' then
            TextOut(round( (((Workwidth*L1 / 100) ) - textwidth('ลำดับ')) / 2) - textwidth(InputItem[GridCol,i])+Ofst2,y+4,InputItem[GridCol,i]);
          //else
            //TextOut(round( (((Workwidth*L1 / 100) ) - textwidth('ลำดับ')) / 2) - textwidth(InputItem[1,i])+Ofst2-(textwidth('บน   -   ล่าง')-textwidth(InputItem[1,i]) ),y+4,'['+InputItem[1,i]);

          //TextOut(round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2)),y+4,CutListNum.Items[i].Caption);
          ////TextOut(round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst1-10,y+4,CutListNum.Items[i].Caption);
          //TextOut(round( (((Workwidth*L1 / 100) ) - textwidth('ลำดับ')) / 2) - textwidth(CutListNum.Items[i].SubItems[0])+Ofst2,y+4,CutListNum.Items[i].SubItems[0]);




          SumCutPrice := SumCutPrice + txtToFloat(InputItem[GridCol,i]);
          txtHigh := TextHeight(InputItem[1,i])-12;//Items[i].Caption);
          //Inc(y,txtHigh);
          Inc(y,18);
          //WorkHeight := WorkHeight-txtHigh;
          WorkHeight := WorkHeight-18;
          Inc(Items);
        end;

        if (WorkHeight <= 0) then
        begin

        //if i < CutListNum.Items.Count-1 then
        if i < InputItem.RowCount-1 then
        begin
          for j := Trunc((((Workwidth*L1/100) - textwidth('ลำดับ')) / 2)) to Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2 do // Round(WorkWidth*L3 / 100) do
          begin
            TextOut(j,y+1,'-');
            TextOut(j,y+25,'-');
          end;
          TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2)),y+12,'รวม');
          TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2-textwidth(formatfloat('#,##0',SumCutPrice)),y+12,formatfloat('#,##0',SumCutPrice));
          SumCutPrice := 0;

              WorkWidth  := NicePreview.PageWidth;
              Leftside := 0;
              y := NicePreview.MarginTop+76;
              WorkHeight := NicePreview.PageHeight - (NicePreview.MarginTop + (NicePreview.MarginBottom+25)+y);

              //L1 := L1+55;
              //L2 := L1+1;
              //L3 := L1+15;

              L1 := L1+37;
              L2 := L1+1;
              L3 := L1+15;

            Rw := 0; // Rw is Right width
            for j := round( (((Workwidth*L1/100) - textwidth('ลำดับ')) / 2)) to Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2 do // Round(WorkWidth*L3 / 100) do
            begin
              Rw := j;
            end;
            if (Rw >= (NicePreview.PageWidth - NicePreview.MarginRight)) and (i < (InputItem.RowCount-1)) then
            begin
              NicePreview.EndPage;
              ACanvas := NicePreview.BeginPage;
              with ACanvas do
              begin
                NicePreview.ReadPrinterConfig;
                WorkWidth  := NicePreview.PageWidth;
                leftSide   := 0;
                RightSide  := NicePreview.PageWidth;

                Font.Name := 'AngsanaUPC';
                Font.Size := 18;
                Font.Style := [fsBold];
                Font.Color := clBlack;

                w := TextWidth(Str1+' '+ComboType.Items[ComboType.ItemIndex]+' '+NumName);
                h := TextHeight(Str1+' '+ComboType.Items[ComboType.ItemIndex]+' '+NumName);
                x := (NicePreview.PageWidth - w) div 2;
                y := NicePreview.MarginTop-10;
                TextOut(x, y, Str1+' '+ComboType.Items[ComboType.ItemIndex]+' '+NumName);
                y := y + h - 5;

                Font.Name := 'AngsanaUPC';
                Font.Size := 18;
                Font.Style := [];
                //Font.Color := clRed;

                //w := TextWidth(Str2+StrDate+'  [ผู้ส่ง '+DealerName+']');
                w := TextWidth(StrLine2);
                h := TextHeight(Str2);
                x := (NicePreview.PageWidth - w) div 2;
                //TextOut(x, y,Str2+StrDate+'  [ผู้ส่ง '+DealerName+']');
                TextOut(x, y, StrLine2);

                y := y + h + 15;

                Font.Name := 'AngsanaUPC';
                Font.Size := 18;
                Font.Style := [];
                Font.Color := clBlack;

                w := (NicePreview.PageWidth - NicePreview.MarginLeft - NicePreview.MarginRight) div 3;//(CustList.Columns.Count+1);
                h := TextHeight('Ag') + 3;
                DeltaX := (NicePreview.PageWidth - (w * (3))) div 2;
                Brush.Style := bsClear;
                y := NicePreview.MarginTop+76;

                //L1 := 20;
                L1 := 15;
                L2 := L1+1;
                L3 := L1+10;
                L4 := 55;
                L5 := 70;
                L6 := 82;
                L7 := 95;

                //Ofst1 := 70;
                //Ofst2 := 180;

                Ofst1 := 30;
                Ofst2 := 130;
              end;

              for j := Trunc((((Workwidth*L1/100) - textwidth('ลำดับ')) / 2)) to Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2 do // Round(WorkWidth*L3 / 100) do
              begin
                TextOut(j,y-33,'-');
                TextOut(j,y-8,'-');
              end;
            end;


            for j := round( (((Workwidth*L1/100) - textwidth('ลำดับ')) / 2)) to Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2 do // Round(WorkWidth*L3 / 100) do
            begin
              TextOut(j,y-33,'-');
              TextOut(j,y-8,'-');
            end;

            Font.Name := 'AngsanaUPC';
            Font.Size := 18;
            Font.Style := [];
            Font.Color := clBlack;
            Brush.Style := bsClear;

            TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ที่')) / 2)),y-20,'ที่');
            TextOut(Round( (((Workwidth*(L1+5) / 100) - textwidth('ลำดับ')) / 2))+Ofst1-10,y-20,'เลข');
            TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2-textwidth('จำนวน'),y-20,'จำนวน');

          {
            TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2)   ) ,y-20,'ลำดับ');
            TextOut(Round( (((Workwidth*(L1+3) / 100) - textwidth('ลำดับ')) / 2))+Ofst1-10,y-20,'เลข');
            TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2-textwidth('บน   -   ล่าง'),y-20,'บน   -   ล่าง');
          }
            //TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2)   ) ,y-20,'เลข');
            ////TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst1-10,y-20,'เลข');
            //TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2-textwidth('จำนวนเงิน'),y-20,'จำนวนเงิน');


          end;

        end;


       end; //---------------------------------

      end;

      for j := round( (((Workwidth*(L1/100)) - textwidth('ลำดับ')) / 2)) to Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2 do // Round(WorkWidth*(L3 / 100)) do
      begin
        TextOut(j,y+1,'-');
        TextOut(j,y+25,'-');
      end;

      TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2)),y+12,'รวม');
      TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2-textwidth(formatfloat('#,##0',SumCutPrice)),y+12,formatfloat('#,##0',SumCutPrice));

  end;
  NicePreview.EndPage;

end;


Procedure TfrmPrintCutPrev.Translate1(InputItem: TNiceGrid; SeltType: integer; LotDate: TDate; ComboType: TComboBox; NumName, SendName, BookNo: String; Status, GridCol: Integer);
const
  Str1 = '';
  Str2 = 'งวดวันที่ ';
var
  L1,L2,L3,L4,L5,L6,L7,L8,Ofst1,Ofst2: Integer;
  x, y, w, h, i, j, Rw, Workwidth, Items, WorkHeight,LeftSide,RightSide: Integer;
  R: TRect;
  ax, ay, txtHigh, LastPage: Integer;
  DeltaX: Integer;
  aYear,aMonth,aDate : Word;
  StrDate,DealerName,StrLine2, SeltCaption: String;
  Pricelen : Array[0..5] of integer;
  ACanVas : TCanvas;
  SumCutPrice: Extended;
  lDate: TDateTime;
begin
  DecodeDate(LotDate,aYear,aMonth,aDate);
  StrDate := IntToStr(aDate)+'/'+IntToStr(aMonth)+'/'+IntToStr(aYear+543);
  NicePreview.Clear;
  if sendName = '' then
    DealerName := '.........................................' //Copy(CutList.Items[CutList.itemindex].SubItems[1],8,length(CutList.Items[CutList.itemindex].SubItems[1]));
  else
    DealerName := ' : '+SendName;

  Case SeltType of //ประเภทยอด ทั้งหมด, เหลือในมือ, เกินอั้น, ตัดส่งเจ้ามือ
    0 : SeltCaption := ' [ยอดทั้งหมด] ';
    1 : SeltCaption := ' [ยอดเหลือในมือ] ';
    2 : SeltCaption := ' [ยอดเกินอั้น] ';
    3 : SeltCaption := ' [ผู้ส่ง : '+SendName+'] ';
    4 : SeltCaption := '';
  end;

  Case Status of // สถานะการเลือกเช็คบ๊อค ในหน้าป้อนข้อมูล
    0: StrLine2 := (SeltCaption+Str2+StrDate+'  [ลูกค้า '+DealerName+' เล่มที่ '+BookNo+']');
    1: StrLine2 := (SeltCaption+Str2+StrDate+'  [ลูกค้า '+DealerName+' รวมทุกเล่ม]');
    2: StrLine2 := (SeltCaption+Str2+StrDate+'  [ลูกค้าทุกคน'+' เล่มที่ '+BookNo+']');
    3: StrLine2 := (SeltCaption+Str2+StrDate+'  [ข้อมูลทั้งหมด]');
    4: StrLine2 := (Str2+StrDate+SeltCaption);
  end;

  NicePreview.ReadPrinterConfig;
  ACanvas := NicePreview.BeginPage;
  with ACanvas do
  begin
    WorkWidth  := NicePreview.PageWidth;
    WorkHeight := NicePreview.PageHeight;
    leftSide   := 0;
    RightSide  := NicePreview.PageWidth;

    Font.Name := 'AngsanaUPC';
    Font.Size := 22;
    Font.Style := [fsBold];
    Font.Color := clBlack;
    w := TextWidth(Str1+' '+ComboType.Items[ComboType.ItemIndex]+' '+NumName);
    h := TextHeight(Str1+' '+ComboType.Items[ComboType.ItemIndex]+' '+NumName);

    x := (NicePreview.PageWidth - w) div 2;
    y := NicePreview.MarginTop-10;
    TextOut(x, y, Str1+' '+ComboType.Items[ComboType.ItemIndex]+' '+NumName);
    y := y + h - 5;

    Font.Name := 'AngsanaUPC';
    Font.Size := 20;
    Font.Style := [];

    w := TextWidth(StrLine2);

    h := TextHeight(Str2);
    x := (NicePreview.PageWidth - w) div 2;
    TextOut(x, y, StrLine2); //Name

    y := y + h + 15;

    Font.Name := 'AngsanaUPC';
    Font.Size := 20;
    Font.Style := [];
    Font.Color := clBlack;
    w := (NicePreview.PageWidth - NicePreview.MarginLeft - NicePreview.MarginRight) div 3;//(CustList.Columns.Count+1);
    h := TextHeight('Ag') + 3;
    //DeltaX := (NicePreview.PageWidth - (w * (CustList.Columns.Count+1))) div 2;
    DeltaX := (NicePreview.PageWidth - (w * (3))) div 2;
    Brush.Style := bsClear;
    y := NicePreview.MarginTop+76;

    WorkHeight := NicePreview.PageHeight - (NicePreview.MarginTop + (NicePreview.MarginBottom+25) + y);

      L1 := 15;
      L2 := L1+1;
      L3 := L1+10;
      L4 := 55;
      L5 := 70;
      L6 := 82;
      L7 := 95;

      Ofst1 := 30;
      Ofst2 := 130;

      for j := Trunc((((Workwidth*L1/100) - textwidth('ลำดับ')) / 2)) to Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2 do // Round(WorkWidth*L3 / 100) do
      begin
        TextOut(j,y-33,'-');
        TextOut(j,y-8,'-');
      end;

      //TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ที่')) / 2)),y-20,'ที่');
      TextOut(Round( (((Workwidth*(L1) / 100) - textwidth('ลำดับ')) / 2))+Ofst1-20,y-20,'เลข');
      TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2-textwidth('จำนวนเงิน'),y-20,'จำนวนเงิน');

      SumCutPrice := 0;
      Items := 1;

      for i := 0 to InputItem.RowCount -1 do 
      begin
       if InputItem[GridCol,i] <> '' then
       begin
        begin
          //TextOut(round( (((Workwidth*L1 / 100) - textwidth(IntToStr(i+1))) / 2)),y+4,IntToStr(i+1));

          //TextOut(round( (((Workwidth*L1 / 100) - textwidth(IntToStr(Items))) / 2)),y+4,IntToStr(Items));
          TextOut(round( (((Workwidth*(L1) / 100) - textwidth('ลำดับ')) / 2))+Ofst1-20,y+4,InputItem[0,i]);
          TextOut(round( (((Workwidth*L1 / 100) ) - textwidth('ลำดับ')) / 2) - textwidth(InputItem[GridCol,i])+Ofst2,y+4,InputItem[GridCol,i]);

          SumCutPrice := SumCutPrice + txtToFloat(InputItem[GridCol,i]);
          txtHigh := TextHeight(InputItem[0,i])-12;
          Inc(y,txtHigh);
          WorkHeight := WorkHeight-txtHigh;
          //Inc(y,20);
          //WorkHeight := WorkHeight-20;
          Inc(Items);
        end;

        if (WorkHeight <= 0) then
        begin

        if i < InputItem.RowCount-1 then
        begin
          for j := Trunc((((Workwidth*L1/100) - textwidth('ลำดับ')) / 2)) to Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2 do // Round(WorkWidth*L3 / 100) do
          begin
            TextOut(j,y+1,'-');
            TextOut(j,y+25,'-');
          end;
          TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2)),y+12,'รวม');
          TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2-textwidth(formatfloat('#,##0',SumCutPrice)),y+12,formatfloat('#,##0',SumCutPrice));
          SumCutPrice := 0;

              WorkWidth  := NicePreview.PageWidth;
              Leftside := 0;
              y := NicePreview.MarginTop+76;
              WorkHeight := NicePreview.PageHeight - (NicePreview.MarginTop + (NicePreview.MarginBottom+25)+y);

              L1 := L1+37;
              L2 := L1+1;
              L3 := L1+15;

            Rw := 0; // Rw is Right width
            for j := round( (((Workwidth*L1/100) - textwidth('ลำดับ')) / 2)) to Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2 do // Round(WorkWidth*L3 / 100) do
            begin
              Rw := j;
            end;
            if (Rw >= (NicePreview.PageWidth - NicePreview.MarginRight)) and (i < (InputItem.RowCount-1)) then
            begin
              NicePreview.EndPage;
              ACanvas := NicePreview.BeginPage;
              with ACanvas do
              begin
                NicePreview.ReadPrinterConfig;
                WorkWidth  := NicePreview.PageWidth;
                leftSide   := 0;
                RightSide  := NicePreview.PageWidth;

                Font.Name := 'AngsanaUPC';
                Font.Size := 22;
                Font.Style := [fsBold];
                Font.Color := clBlack;

                w := TextWidth(Str1+' '+ComboType.Items[ComboType.ItemIndex]+' '+NumName);
                h := TextHeight(Str1+' '+ComboType.Items[ComboType.ItemIndex]+' '+NumName);
                x := (NicePreview.PageWidth - w) div 2;
                y := NicePreview.MarginTop-10;
                TextOut(x, y, Str1+' '+ComboType.Items[ComboType.ItemIndex]+' '+NumName);
                y := y + h - 5;

                Font.Name := 'AngsanaUPC';
                Font.Size := 20;
                Font.Style := [];
                //Font.Color := clRed;

                w := TextWidth(StrLine2);
                h := TextHeight(Str2);
                x := (NicePreview.PageWidth - w) div 2;
                TextOut(x, y, StrLine2);

                y := y + h + 15;

                Font.Name := 'AngsanaUPC';
                Font.Size := 20;
                Font.Style := [];
                Font.Color := clBlack;

                w := (NicePreview.PageWidth - NicePreview.MarginLeft - NicePreview.MarginRight) div 3;//(CustList.Columns.Count+1);
                h := TextHeight('Ag') + 3;
                DeltaX := (NicePreview.PageWidth - (w * (3))) div 2;
                Brush.Style := bsClear;
                y := NicePreview.MarginTop+76;

                //L1 := 20;
                L1 := 15;
                L2 := L1+1;
                L3 := L1+10;
                L4 := 55;
                L5 := 70;
                L6 := 82;
                L7 := 95;

                Ofst1 := 30;
                Ofst2 := 130;
              end;

              for j := Trunc((((Workwidth*L1/100) - textwidth('ลำดับ')) / 2)) to Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2 do // Round(WorkWidth*L3 / 100) do
              begin
                TextOut(j,y-33,'-');
                TextOut(j,y-8,'-');
              end;
            end;

            for j := round( (((Workwidth*L1/100) - textwidth('ลำดับ')) / 2)) to Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2 do // Round(WorkWidth*L3 / 100) do
            begin
              TextOut(j,y-33,'-');
              TextOut(j,y-8,'-');
            end;

            Font.Name := 'AngsanaUPC';
            Font.Size := 20;
            Font.Style := [];
            Font.Color := clBlack;
            Brush.Style := bsClear;

            //TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ที่')) / 2)),y-20,'ที่');
            TextOut(Round( (((Workwidth*(L1) / 100) - textwidth('ลำดับ')) / 2))+Ofst1-20,y-20,'เลข');
            TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2-textwidth('จำนวนเงิน'),y-20,'จำนวนเงิน');

          end;
        end;
       end; //---------------------------------

      end;

      for j := round( (((Workwidth*(L1/100)) - textwidth('ลำดับ')) / 2)) to Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2 do // Round(WorkWidth*(L3 / 100)) do
      begin
        TextOut(j,y+1,'-');
        TextOut(j,y+25,'-');
      end;

      TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2)),y+12,'รวม');
      TextOut(Round( (((Workwidth*L1 / 100) - textwidth('ลำดับ')) / 2))+Ofst2-textwidth(formatfloat('#,##0',SumCutPrice)),y+12,formatfloat('#,##0',SumCutPrice));
  end;
  NicePreview.EndPage;
end;


procedure TfrmPrintCutPrev.RenderGrids(SumGrid,Grid1,Grid2,Grid3,Grid4,Grid5: TNiceGrid; aDates:TDateTime; Hui: String; HLine: Integer);
const
  //Str1 = 'สรุปยอดผลการถูกหวย';
  Str2 = 'ประจำงวดวันที่ ';
  StrNum1 = 'เลขวิ่ง, เลขตำแหน่ง  งวดวันที่ ';
  StrNum2 = 'เลข 2 ตัว  งวดวันที่ ';
  StrNum3 = 'เลข 3 ตัว  งวดวันที่ ';
  StrNum4 = 'เลข 4 ตัว  งวดวันที่ ';
  StrNum5 = 'เลข 5 ตัว  งวดวันที่ ';

var
  x, y, w, h: Integer;
  R,Rct: TRect;
  ax, ay, fstRow: Integer;
  DeltaX: Integer;
  ACanvas: TCanvas;
  Ar,RowAr,i,th,j,yy,Rh: integer;
  Str1,StrDate : String;
  aYear,aMonth,aDate: Word;
begin
  DecodeDate(aDates,aYear,aMonth,aDate);
  StrDate := IntToStr(aDate)+'/'+IntToStr(aMonth)+'/'+IntToStr(aYear+543);

  Case Hline of
   0: Str1 := 'ยอดขาย';
   1: Str1 := 'ยอดในมือ';
   2: Str1 := 'ยอดเกิน';
   3: Str1 := 'ส่งยอด';
  end;
  NicePreview.Clear;

  //----------------------------------------------------------------------//
  with NicePreview do
  begin
    th := PageHeight - MarginTop - MarginBottom;
  end;

  i:=-1;
  h:=0;
  yy := 0;
  ACanvas := nil;

  if Grid1.RowCount > 0 then
  begin
    for j := 0 to Grid1.RowCount+1 do
    begin
      if (i < 0) then
      begin
         if (ACanvas <> nil)
            then NicePreview.EndPage;
         ACanvas := NicePreview.BeginPage;
         with ACanvas do
         begin
            if yy = 0 then
            begin
               y := NicePreview.MarginTop;
               Font.Name := 'AngsanaUPC';
               Font.Size := 22;
               Font.Style := [fsBold];
               Font.Color := clBlack;
               w := TextWidth(Str1+' '+Hui);
               h := TextHeight(Str1+' '+Hui);
               x := (NicePreview.PageWidth - w) div 2;
               y := NicePreview.MarginTop;
               TextOut(x, y, Str1+' '+Hui);
               y := y + h + 5;

               Font.Name := 'AngsanaUPC';
               Font.Size := 20;
               Font.Style := [];
               Font.Color := clRed;
               w := TextWidth(StrNum1+StrDate);
               h := TextHeight(StrNum1);
               x := (NicePreview.PageWidth - w) div 2;
               TextOut(x, y, StrNum1+StrDate);
               y := y + h + (h div 3);
            end
            else
               y := NicePreview.MarginTop;

            Font.Name := 'AngsanaUPC';
            Font.Size := 22;
            Font.Style := [];
            Font.Color := clBlack;
            w := (NicePreview.PageWidth - NicePreview.MarginLeft - NicePreview.MarginRight) div (Grid1.ColCount-1);
            h := TextHeight('Ag') -3;
            DeltaX := (NicePreview.PageWidth - (w * (Grid1.ColCount-1))) div 2;
            Brush.Style := bsClear;
            Rct := Rect(0, 0, ((0 + 1) * w) + 1, ((0 + 1) * (h-10)) + 1);
            rh := rct.Bottom - rct.Top;
            RowAr := (th-y) div rh;

         end;
         i := RowAr;
         ay := 0;
      end;

      for ax := 0 to Grid1.ColCount-2 do
      begin
        R := Rect(ax * w, ay * (h-10), ((ax + 1) * w) + 1, ((ay + 1) * (h-10)) + 1);
        OffsetRect(R, DeltaX, y);
        aCanvas.Brush.Style := bsSolid;
        aCanvas.Rectangle(R);
        aCanvas.Brush.Style := bsClear;
        if ax = 0 then //คอลัมพ์แรก
        begin
         if yy = 0 then //ที่คอลัพมพ์แรก และ แถวแรก
            ACanVas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth('เลข')div 2), R.Top - 6, 'เลข')
         else //พิมพ์หัวแถว
            if yy < Grid1.RowCount + 1 then
               ACanVas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth(Grid1[ax,yy-1])div 2), R.Top - 6, Grid1[ax,yy-1])
            else
               ACanvas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth('รวม')div 2), R.Top - 6, 'รวม')
        end
        else
        begin
         if yy = 0 then //แถวแรก
         begin
            //พอเลยคอลับมพ์แรกให้พิมพ์หัวคอลัมพ์ใน Grid ที่ส่งมา
            Case ax of
             1:aCanvas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth('วิ่งบน')div 2), R.Top - 5, 'วิ่งบน');
             2:aCanvas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth('หน้าบน')div 2), R.Top - 5, 'หน้าบน');
             3:aCanvas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth('กลางบน')div 2), R.Top - 5, 'กลางบน');
             4:aCanvas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth('หลังบน')div 2), R.Top - 5, 'หลังบน');
             5:aCanvas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth('วิ่งล่าง')div 2), R.Top - 5, 'วิ่งล่าง');
             6:aCanvas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth('หน้าล่าง')div 2), R.Top - 5, 'หน้าล่าง');
             7:aCanvas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth('หลังล่าง')div 2), R.Top - 5, 'หลังล่าง');
            end;
         end
         else  //พิมพ์เนื้อหา
            if yy < Grid1.RowCount + 1 then
            begin
               if (Grid1[ax,yy-1] <> '0')and(Grid1[ax,yy-1] <> '') then
                  aCanvas.TextRect(R, R.Right-aCanvas.TextWidth(Grid1[ax,yy-1])-3, R.Top - 6, Grid1[ax,yy-1])
               else
                  aCanvas.TextRect(R, R.Right-aCanvas.TextWidth(Grid1[ax,yy-1])-13, R.Top - 6, '-');
            end
            else
            begin
               Case ax of
                1:aCanvas.TextRect(R, R.Right-aCanvas.TextWidth(SumGrid[0,0])-3, R.Top - 8, SumGrid[0,0]);
                2:aCanvas.TextRect(R, R.Right-aCanvas.TextWidth(SumGrid[0,1])-3, R.Top - 8, SumGrid[0,1]);
                3:aCanvas.TextRect(R, R.Right-aCanvas.TextWidth(SumGrid[0,2])-3, R.Top - 8, SumGrid[0,2]);
                4:aCanvas.TextRect(R, R.Right-aCanvas.TextWidth(SumGrid[0,3])-3, R.Top - 8, SumGrid[0,3]);
                5:aCanvas.TextRect(R, R.Right-aCanvas.TextWidth(SumGrid[0,4])-3, R.Top - 8, SumGrid[0,4]);
                6:aCanvas.TextRect(R, R.Right-aCanvas.TextWidth(SumGrid[0,5])-3, R.Top - 8, SumGrid[0,5]);
                7:aCanvas.TextRect(R, R.Right-aCanvas.TextWidth(SumGrid[0,6])-3, R.Top - 8, SumGrid[0,6]);
              end;
            end;
        end;
      end;
      inc(yy);
      inc(ay);
      Dec(i);
    end;
    NicePreview.EndPage;
  end;


  //----------------------------------------------------------------------//
  with NicePreview do
  begin
    th := PageHeight - MarginTop - MarginBottom;
  end;

  i:=-1;
  h:=0;
  yy := 0;
  ACanvas := nil;

  if Grid2.RowCount > 0 then
  begin
    for j := 0 to Grid2.RowCount+1 do
    begin
      if (i < 0) then
      begin
         if (ACanvas <> nil)
            then NicePreview.EndPage;
         ACanvas := NicePreview.BeginPage;
         with ACanvas do
         begin
            if yy = 0 then
            begin
               y := NicePreview.MarginTop;
               Font.Name := 'AngsanaUPC';
               Font.Size := 22;
               Font.Style := [fsBold];
               Font.Color := clBlack;
               w := TextWidth(Str1+' '+Hui);
               h := TextHeight(Str1+' '+Hui);
               x := (NicePreview.PageWidth - w) div 2;
               y := NicePreview.MarginTop;
               TextOut(x, y, Str1+' '+Hui);
               y := y + h + 5;

               Font.Name := 'AngsanaUPC';
               Font.Size := 20;
               Font.Style := [];
               Font.Color := clRed;
               w := TextWidth(StrNum2+StrDate);
               h := TextHeight(StrNum2);
               x := (NicePreview.PageWidth - w) div 2;
               TextOut(x, y, StrNum2+StrDate);
               y := y + h + (h div 3);
            end
            else
               y := NicePreview.MarginTop;

            Font.Name := 'AngsanaUPC';
            Font.Size := 22;
            Font.Style := [];
            Font.Color := clBlack;
            w := (NicePreview.PageWidth - NicePreview.MarginLeft - NicePreview.MarginRight) div (Grid2.ColCount-1);
            h := TextHeight('Ag') -3;
            DeltaX := (NicePreview.PageWidth - (w * (Grid2.ColCount-1))) div 2;
            Brush.Style := bsClear;
            Rct := Rect(0, 0, ((0 + 1) * w) + 1, ((0 + 1) * (h-10)) + 1);
            rh := rct.Bottom - rct.Top;
            RowAr := (th-y) div rh;

         end;
         i := RowAr;
         ay := 0;
      end;

      for ax := 0 to Grid2.ColCount-2 do
      begin
        R := Rect(ax * w, ay * (h-10), ((ax + 1) * w) + 1, ((ay + 1) * (h-10)) + 1);
        OffsetRect(R, DeltaX, y);
        aCanvas.Brush.Style := bsSolid;
        aCanvas.Rectangle(R);
        aCanvas.Brush.Style := bsClear;
        if ax = 0 then //คอลัมพ์แรก
        begin
         if yy = 0 then //ที่คอลัพมพ์แรก และ แถวแรก
            ACanVas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth('เลข')div 2), R.Top - 6, 'เลข')
         else //พิมพ์หัวแถว
            if yy < Grid2.RowCount + 1 then
               ACanVas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth(Grid2[ax,yy-1])div 2), R.Top - 6, Grid2[ax,yy-1])
            else
               ACanvas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth('รวม')div 2), R.Top - 6, 'รวม')
        end
        else
        begin
         if yy = 0 then //แถวแรก
         begin
            //พอเลยคอลับมพ์แรกให้พิมพ์หัวคอลัมพ์ใน Grid ที่ส่งมา
            Case ax of
             1:aCanVas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanVas.TextWidth('2 ตัวบน')div 2), R.Top - 6, '2 ตัวบน');
             2:aCanvas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanVas.TextWidth('2 ตัวโต๊ด')div 2), R.Top - 6, '2 ตัวโต๊ด');
             3:aCanvas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanVas.TextWidth('2 ตัวมี')div 2), R.Top - 6, '2 ตัวมี');
             4:aCanvas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanVas.TextWidth('2 ตัวหน้า')div 2), R.Top - 6, '2 ตัวหน้า');
             5:aCanvas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanVas.TextWidth('2 ตัวหลัง')div 2), R.Top - 6, '2 ตัวถ่าง');
             6:aCanvas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanVas.TextWidth('2 ตัวล่าง')div 2), R.Top - 6, '2 ตัวล่าง');
            end;
         end
         else  //พิมพ์เนื้อหา
            if yy < Grid2.RowCount + 1 then
            begin
               if (Grid2[ax,yy-1] <> '0')and(Grid2[ax,yy-1] <> '') then
                  aCanvas.TextRect(R, R.Right-aCanvas.TextWidth(Grid2[ax,yy-1])-3, R.Top - 6, Grid2[ax,yy-1])
               else
                  aCanvas.TextRect(R, R.Right-aCanvas.TextWidth(Grid2[ax,yy-1])-13, R.Top - 6, '-');
            end
            else
            begin
               Case ax of
                1:aCanvas.TextRect(R, R.Right-aCanVas.TextWidth(SumGrid[0,7])-3, R.Top - 7, SumGrid[0,7]);
                2:aCanvas.TextRect(R, R.Right-aCanVas.TextWidth(SumGrid[0,8])-3, R.Top - 7, SumGrid[0,8]);
                3:aCanvas.TextRect(R, R.Right-aCanVas.TextWidth(SumGrid[0,9])-3, R.Top - 7, SumGrid[0,9]);
                4:aCanvas.TextRect(R, R.Right-aCanVas.TextWidth(SumGrid[0,10])-3, R.Top - 7, SumGrid[0,10]);
                5:aCanvas.TextRect(R, R.Right-aCanVas.TextWidth(SumGrid[0,11])-3, R.Top - 7, SumGrid[0,11]);
                6:aCanvas.TextRect(R, R.Right-aCanVas.TextWidth(SumGrid[0,12])-3, R.Top - 7, SumGrid[0,12]);
              end;
            end;
        end;
      end;
      inc(yy);
      inc(ay);
      Dec(i);
    end;
    NicePreview.EndPage;
  end;


  //----------------------------------------------------------------------//
  with NicePreview do
  begin
    th := PageHeight - MarginTop - MarginBottom+30;
  end;

  i:=-1;
  h:=0;
  yy := 0;
  fstRow := 0;
  ACanvas := nil;

  if Grid3.RowCount > 0 then
  begin
    for j := 0 to Grid3.RowCount+1 do
    begin
      if (i < 0) then
      begin
         if (ACanvas <> nil) then
            NicePreview.EndPage;
            
         ACanvas := NicePreview.BeginPage;
         fstRow := 1;
         with ACanvas do
         begin
            if yy = 0 then
            begin
               y := NicePreview.MarginTop;
               Font.Name := 'AngsanaUPC';
               Font.Size := 22;
               Font.Style := [fsBold];
               Font.Color := clBlack;
               w := TextWidth(Str1+' '+Hui);
               h := TextHeight(Str1+' '+Hui);
               x := (NicePreview.PageWidth - w) div 2;
               y := NicePreview.MarginTop;
               TextOut(x, y, Str1+' '+Hui);
               y := y + h + 5;

               Font.Name := 'AngsanaUPC';
               Font.Size := 20;
               Font.Style := [];
               Font.Color := clRed;
               w := TextWidth(StrNum3+StrDate);
               h := TextHeight(StrNum3);
               x := (NicePreview.PageWidth - w) div 2;
               TextOut(x, y, StrNum3+StrDate);
               y := y + h + (h div 3);
            end
            else
               y := NicePreview.MarginTop;

            Font.Name := 'AngsanaUPC';
            Font.Size := 22;
            Font.Style := [];
            Font.Color := clBlack;
            w := (NicePreview.PageWidth - NicePreview.MarginLeft - NicePreview.MarginRight) div (Grid3.ColCount-1);
            h := TextHeight('Ag')-3;
            DeltaX := (NicePreview.PageWidth - (w * (Grid3.ColCount-1))) div 2;
            Brush.Style := bsClear;
            Rct := Rect(0, 0, ((0 + 1) * w) + 1, ((0 + 1) * (h-10)) + 1);
            rh := rct.Bottom - rct.Top;
            RowAr := (th-y) div rh;

         end;
         i := RowAr;
         ay := 0;
      end;

      for ax := 0 to Grid3.ColCount-2 do
      begin
        R := Rect(ax * w, ay * (h-10), ((ax + 1) * w) + 1, ((ay + 1) * (h-10)) + 1);
        OffsetRect(R, DeltaX, y);
        aCanvas.Brush.Style := bsSolid;
        aCanvas.Rectangle(R);
        aCanvas.Brush.Style := bsClear;
        if ax = 0 then //คอลัมพ์แรก
        begin
         if yy = 0 then //ที่คอลัพมพ์แรก และ แถวแรก
            ACanVas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth('เลข')div 2), R.Top-6, 'เลข')
         else //พิมพ์หัวแถว
            if yy < Grid3.RowCount + 1 then
               ACanVas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth(Grid3[ax,yy-1])div 2), R.Top -6, Grid3[ax,yy-1])
            else
               ACanvas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth('รวม')div 2), R.Top -6, 'รวม')
        end
        else
        begin
         if yy = 0 then //แถวแรก
         begin
            //พอเลยคอลับมพ์แรกให้พิมพ์หัวคอลัมพ์ใน Grid ที่ส่งมา
            Case ax of
             1:aCanvas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth('3 ตัวบน (ราคา)')div 2), R.Top -6, '3 ตัวบน (ราคา)');
             2:aCanvas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth('3 ตัวโต๊ด (ราคา)')div 2), R.Top -6, '3 ตัวโต๊ด (ราคา)');
             3:aCanvas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth('3 ตัวล่าง (ราคา)')div 2), R.Top -6, '3 ตัวล่าง (ราคา)');
            end;
         end
         else  //พิมพ์เนื้อหา
         begin
            if yy < Grid3.RowCount + 1 then
            begin
               if (Grid3[ax,yy-1] <> '0')and(Grid3[ax,yy-1] <> '') then
                  aCanvas.TextRect(R, R.Right-aCanvas.TextWidth(Grid3[ax,yy-1])-3, R.Top -7, Grid3[ax,yy-1])
               else
                  aCanvas.TextRect(R, R.Right-aCanvas.TextWidth(Grid3[ax,yy-1])-13, R.Top -7, '-');
            end
            else
            begin
               Case ax of
                1:aCanvas.TextRect(R, R.Right-aCanvas.TextWidth(SumGrid[0,13])-3, R.Top -7, SumGrid[0,13]);
                2:aCanvas.TextRect(R, R.Right-aCanvas.TextWidth(SumGrid[0,14])-3, R.Top -7, SumGrid[0,14]);
                3:aCanvas.TextRect(R, R.Right-aCanvas.TextWidth(SumGrid[0,15])-3, R.Top -7, SumGrid[0,15]);
               end;
            end;
         end;
        end;
      end;
      inc(yy);
      inc(ay);
      Dec(i);
    end;
    NicePreview.EndPage;
  end;


  //----------------------------------------------------------------------//
  with NicePreview do
  begin
    th := PageHeight - MarginTop - MarginBottom;
  end;

  i:=-1;
  h:=0;
  yy := 0;
  ACanvas := nil;

  if Grid4.RowCount > 0 then
  begin
    for j := 0 to Grid4.RowCount+1 do
    begin
      if (i < 0) then
      begin
         if (ACanvas <> nil)
            then NicePreview.EndPage;
         ACanvas := NicePreview.BeginPage;
         with ACanvas do
         begin
            if yy = 0 then
            begin
               y := NicePreview.MarginTop;
               Font.Name := 'AngsanaUPC';
               Font.Size := 22;
               Font.Style := [fsBold];
               Font.Color := clBlack;
               w := TextWidth(Str1+' '+Hui);
               h := TextHeight(Str1+' '+Hui);
               x := (NicePreview.PageWidth - w) div 2;
               y := NicePreview.MarginTop;
               TextOut(x, y, Str1+' '+Hui);
               y := y + h + 5;

               Font.Name := 'AngsanaUPC';
               Font.Size := 20;
               Font.Style := [];
               Font.Color := clRed;
               w := TextWidth(StrNum4+StrDate);
               h := TextHeight(StrNum4);
               x := (NicePreview.PageWidth - w) div 2;
               TextOut(x, y, StrNum4+StrDate);
               y := y + h + (h div 3);
            end
            else
               y := NicePreview.MarginTop;

            Font.Name := 'AngsanaUPC';
            Font.Size := 22;
            Font.Style := [];
            Font.Color := clBlack;
            w := (NicePreview.PageWidth - NicePreview.MarginLeft - NicePreview.MarginRight) div (Grid4.ColCount-1); //3
            h := TextHeight('Ag') -3;
            DeltaX := (NicePreview.PageWidth - (w * (Grid4.ColCount-1))) div 2;
            Brush.Style := bsClear;
            Rct := Rect(0, 0, ((0 + 1) * w) + 1, ((0 + 1) * (h-10)) + 1);
            rh := rct.Bottom - rct.Top;
            RowAr := (th-y) div rh;

         end;
         i := RowAr;
         ay := 0;
      end;

      for ax := 0 to Grid4.ColCount-2 do
      begin
        R := Rect(ax * w, ay * (h-10), ((ax + 1) * w) + 1, ((ay + 1) * (h-10)) + 1);
        OffsetRect(R, DeltaX, y);
        aCanvas.Brush.Style := bsSolid;
        aCanvas.Rectangle(R);
        aCanvas.Brush.Style := bsClear;
        if ax = 0 then //คอลัมพ์แรก
        begin
         if yy = 0 then //ที่คอลัพมพ์แรก และ แถวแรก
            ACanVas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth('เลข')div 2), R.Top-6, 'เลข')
         else //พิมพ์หัวแถว
            if yy < Grid4.RowCount + 1 then
               ACanVas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth(Grid4[ax,yy-1])div 2), R.Top -6, Grid4[ax,yy-1])
            else
               ACanvas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth('รวม')div 2), R.Top -6, 'รวม')
        end
        else
        begin
         if yy = 0 then //แถวแรก
         begin
            //พอเลยคอลับมพ์แรกให้พิมพ์หัวคอลัมพ์ใน Grid ที่ส่งมา
            Case ax of
             1:aCanvas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth('4 ตัวบน')div 2), R.Top -6, '4 ตัวบน');
             2:aCanvas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth('4/3 โต๊ด')div 2), R.Top -6, '4/3 โต๊ด');
            end;
         end
         else  //พิมพ์เนื้อหา
         begin
            if yy < Grid4.RowCount + 1 then
            begin
               if (Grid4[ax,yy-1] <> '0')and(Grid4[ax,yy-1] <> '') then
                  aCanvas.TextRect(R, R.Right-aCanvas.TextWidth(Grid4[ax,yy-1])-3, R.Top -7, Grid4[ax,yy-1])
               else
                  aCanvas.TextRect(R, R.Right-aCanvas.TextWidth(Grid4[ax,yy-1])-13, R.Top -7, '-');
            end
            else
            begin
               Case ax of
                1:aCanvas.TextRect(R, R.Right-aCanvas.TextWidth(SumGrid[0,16])-3, R.Top - 8, SumGrid[0,16]);
                2:aCanvas.TextRect(R, R.Right-aCanvas.TextWidth(SumGrid[0,17])-3, R.Top - 8, SumGrid[0,17]);
               end;
            end;
         end;
        end;
      end;
      inc(yy);
      inc(ay);
      Dec(i);
    end;
    NicePreview.EndPage;
  end;

  //----------------------------------------------------------------------//
  with NicePreview do
  begin
    th := PageHeight - MarginTop - MarginBottom;
  end;

  i:=-1;
  h:=0;
  yy := 0;
  ACanvas := nil;

  if Grid5.RowCount > 0 then
  begin
    for j := 0 to Grid5.RowCount+1 do
    begin
      if (i < 0) then
      begin
         if (ACanvas <> nil)
            then NicePreview.EndPage;
         ACanvas := NicePreview.BeginPage;
         with ACanvas do
         begin
            if yy = 0 then
            begin
               y := NicePreview.MarginTop;
               Font.Name := 'AngsanaUPC';
               Font.Size := 22;
               Font.Style := [fsBold];
               Font.Color := clBlack;
               w := TextWidth(Str1+' '+Hui);
               h := TextHeight(Str1+' '+Hui);
               x := (NicePreview.PageWidth - w) div 2;
               y := NicePreview.MarginTop;
               TextOut(x, y, Str1+' '+Hui);
               y := y + h + 5;

               Font.Name := 'AngsanaUPC';
               Font.Size := 20;
               Font.Style := [];
               Font.Color := clRed;
               w := TextWidth(StrNum5+StrDate);
               h := TextHeight(StrNum5);
               x := (NicePreview.PageWidth - w) div 2;
               TextOut(x, y, StrNum5+StrDate);
               y := y + h + (h div 3);
            end
            else
               y := NicePreview.MarginTop;

            Font.Name := 'AngsanaUPC';
            Font.Size := 22;
            Font.Style := [];
            Font.Color := clBlack;
            w := (NicePreview.PageWidth - NicePreview.MarginLeft - NicePreview.MarginRight) div (Grid5.ColCount-1); //3;
            h := TextHeight('Ag') - 3;
            DeltaX := (NicePreview.PageWidth - (w * (Grid5.ColCount-1))) div 2;
            Brush.Style := bsClear;
            Rct := Rect(0, 0, ((0 + 1) * w) + 1, ((0 + 1) * (h-10)) + 1);
            rh := rct.Bottom - rct.Top;
            RowAr := (th-y) div rh;

         end;
         i := RowAr;
         ay := 0;
      end;

      for ax := 0 to Grid5.ColCount-2 do
      begin
        R := Rect(ax * w, ay * (h-10), ((ax + 1) * w) + 1, ((ay + 1) * (h-10)) + 1);
        OffsetRect(R, DeltaX, y);
        aCanvas.Brush.Style := bsSolid;
        aCanvas.Rectangle(R);
        aCanvas.Brush.Style := bsClear;

        if ax = 0 then //คอลัมพ์แรก
        begin
         if yy = 0 then //ที่คอลัพมพ์แรก และ แถวแรก
            ACanVas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth('เลข')div 2), R.Top-6, 'เลข')
         else //พิมพ์หัวแถว
            if yy < Grid5.RowCount + 1 then
               ACanVas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth(Grid5[ax,yy-1])div 2), R.Top -6, Grid5[ax,yy-1])
            else
               ACanvas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth('รวม')div 2), R.Top -6, 'รวม')
        end
        else
        begin
         if yy = 0 then //แถวแรก
         begin
            //พอเลยคอลับมพ์แรกให้พิมพ์หัวคอลัมพ์ใน Grid ที่ส่งมา
            Case ax of
             1:aCanvas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth('5 ตัวบน')div 2), R.Top -6, '5 ตัวบน');
             2:aCanvas.TextRect(R, R.Right-((R.Right-R.Left)div 2)-(aCanvas.TextWidth('5/3 โต๊ด')div 2), R.Top -6, '5/3 โต๊ด');
            end;
         end
         else  //พิมพ์เนื้อหา
         begin
            if yy < Grid5.RowCount + 1 then
            begin
               if (Grid5[ax,yy-1] <> '0')and(Grid5[ax,yy-1] <> '') then
                  aCanvas.TextRect(R, R.Right-aCanvas.TextWidth(Grid5[ax,yy-1])-3, R.Top -7, Grid5[ax,yy-1])
               else
                  aCanvas.TextRect(R, R.Right-aCanvas.TextWidth(Grid5[ax,yy-1])-13, R.Top -7, '-');
            end
            else
            begin
               Case ax of
                1:aCanvas.TextRect(R, R.Right-aCanvas.TextWidth(SumGrid[0,18])-3, R.Top - 8, SumGrid[0,18]);
                2:aCanvas.TextRect(R, R.Right-aCanvas.TextWidth(SumGrid[0,19])-3, R.Top - 8, SumGrid[0,19]);
               end;
            end;
         end;
        end;
      end;
      inc(yy);
      inc(ay);
      Dec(i);
    end;
    NicePreview.EndPage;
  end;
end;

procedure TfrmPrintCutPrev.PrintBtnClick(Sender: TObject);
Var
    i: integer;
begin
   With PrintDialog do
   begin
      if printrange = prAllPages then  NicePreview.PrintAll
      else
      if printrange=prPageNums then
      begin
        for i:=frompage to topage do NicePreview.printpage(i-1);
        //if sender = printbtn then displaypage(topage);
      end;
   end;
end;


procedure TfrmPrintCutPrev.ToolButton1Click(Sender: TObject);
begin
  NicePreview.PreviewMode := pmNormal;
  NicePreview.PreviewMode := pmZoomIn;
end;

procedure TfrmPrintCutPrev.ToolButton2Click(Sender: TObject);
begin
  NicePreview.PreviewMode := pmNormal;  
  NicePreview.PreviewMode := pmZoomOut;
end;

procedure TfrmPrintCutPrev.ToolButton3Click(Sender: TObject);
begin
  NicePreview.PreviewMode := pmDrag;
end;

procedure TfrmPrintCutPrev.ToolButton4Click(Sender: TObject);
begin
  NicePreview.ViewActualSize;
end;

procedure TfrmPrintCutPrev.ToolButton5Click(Sender: TObject);
begin
  NicePreview.ViewFitToWidth;
end;

procedure TfrmPrintCutPrev.ToolButton6Click(Sender: TObject);
begin
  NicePreview.ViewWholePage;
end;

procedure TfrmPrintCutPrev.ToolButton7Click(Sender: TObject);
begin
  NicePreview.ViewTwoPage;
end;

procedure TfrmPrintCutPrev.ToolButton8Click(Sender: TObject);
begin
  NicePreview.ViewFourPage;
end;

procedure TfrmPrintCutPrev.ToolButton9Click(Sender: TObject);
begin
   Close;
end;

procedure TfrmPrintCutPrev.ToolButton10Click(Sender: TObject);
var i:integer;
begin
  with PrintDialog,NicePreview do
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
  {If PrintDialog.execute then PrintAll;}
end;

procedure TfrmPrintCutPrev.NicePreviewChange(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'Page ' + IntToStr(NicePreview.PageIndex + 1) +
    ' of ' + IntToStr(NicePreview.PageCount);
  StatusBar1.Panels[1].Text := 'Magnification ' + IntToStr(Round(NicePreview.Magnification * 100)) + '%';

end;

end.
