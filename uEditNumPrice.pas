unit uEditNumPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, se_controls, KsSkinButtons, NiceGrid, ExtCtrls, Clipbrd,
  StdCtrls, sCustomComboBox;

type
  TfrmPasteNumPrice = class(TForm)
    Panel1: TPanel;
    EditGrid: TNiceGrid;
    Panel4: TPanel;
    BtnCopy: TSeSkinButton;
    SeSkinButton3: TSeSkinButton;
    SeSkinButton1: TSeSkinButton;
    Panel3: TPanel;
    Panel2: TPanel;
    CbNumType: TsComboBox;
    BtnDelEditGrid: TSeSkinButton;
    SeSkinButton2: TSeSkinButton;
    SeSkinButton4: TSeSkinButton;
    SeSkinButton5: TSeSkinButton;
    SeSkinButton6: TSeSkinButton;
    procedure BtnCopyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SeSkinButton3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnDelEditGridClick(Sender: TObject);
    procedure EditGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SeSkinButton2Click(Sender: TObject);
    procedure EditGridKeyPress(Sender: TObject; var Key: Char);
    procedure SeSkinButton4Click(Sender: TObject);
    procedure SeSkinButton5Click(Sender: TObject);
    procedure SeSkinButton6Click(Sender: TObject);
  private
    { Private declarations }
    procedure PasteColumnMultiLine(ACol: Integer);
  public
    { Public declarations }
  end;

var
  frmPasteNumPrice: TfrmPasteNumPrice;

implementation

{$R *.dfm}

procedure TfrmPasteNumPrice.PasteColumnMultiLine(ACol: Integer);
var
  SL: TStringList;
  r, rowStart: Integer;
begin
  SL := TStringList.Create;
  try
    SL.Text := Clipboard.AsText;
    if SL.Count = 0 then Exit;

    if (EditGrid[0,0] = '') and (EditGrid.RowCount = 1) then
      rowStart := 0
    else
      rowStart := EditGrid.RowCount;

    if (EditGrid[0,0] = '') and (EditGrid.RowCount = 1) then
      EditGrid.RowCount := SL.Count
    else
      EditGrid.RowCount := (EditGrid.RowCount+SL.Count);

    for r := rowStart to EditGrid.RowCount - 1 do
      //if (rowStart + r < EditGrid.RowCount) then
        EditGrid[ACol,r] := SL[r-rowStart];
  finally
    SL.Free;
  end;
end;

procedure TfrmPasteNumPrice.BtnCopyClick(Sender: TObject);
Var i,Cnt: integer;
    Txt: String;
begin
   PasteColumnMultiLine(0);
end;

procedure TfrmPasteNumPrice.FormShow(Sender: TObject);
begin
  //EditGrid.RowCount := 0;
  EditGrid.SetFocus;
end;

procedure TfrmPasteNumPrice.SeSkinButton3Click(Sender: TObject);
var
  NiceGrid: TNiceGrid;
  R: Integer; // แถว
  C: Integer; // คอลัมน์
begin
  NiceGrid := EditGrid;
    // วนลูปผ่านช่วงเซลล์ที่ถูกเลือกทั้งหมด
    for R := NiceGrid.SelectArea.Top to NiceGrid.SelectArea.Bottom do
    begin
      for C := NiceGrid.SelectArea.Left to NiceGrid.SelectArea.Right do
      begin
        // เคลียร์ค่าของเซลล์
        NiceGrid.Cells[C, R] := ''; 
      end;
    end;

   //EditGrid.Clear;
   //EditGrid.RowCount := 1;
end;

procedure TfrmPasteNumPrice.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmPasteNumPrice.BtnDelEditGridClick(Sender: TObject);
Var i: integer;
begin
  With EditGrid do
  begin
    for i := SelectArea.Bottom Downto SelectArea.Top  do
    begin
      DeleteRow(i);
    end;
    if RowCount = 0 then
      RowCount := 1;
  end;
end;

procedure TfrmPasteNumPrice.EditGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  CurrentCol: Integer; // คอลัมน์ที่เคอร์เซอร์อยู่
  CurrentRow: Integer; // แถวที่เคอร์เซอร์อยู่
  i: Integer;
begin
  //if Key = VK_INSERT then // ตรวจสอบว่ากดปุ่ม Insert
  if (Key = VK_INSERT) and (ssCtrl in Shift) then
  begin
    Key := 0;
    // 1. เพิ่มจำนวนแถวของ NiceGrid
    EditGrid.RowCount := EditGrid.RowCount + 1;

    // หาตำแหน่งของเซลล์ที่ถูกเลือก (หรือเคอร์เซอร์)
    CurrentCol := EditGrid.Col;
    CurrentRow := EditGrid.Row;

    // 2. วนลูปเพื่อเลื่อนข้อมูลในคอลัมน์นั้นลงไป 1 แถว
    // ให้เริ่มจากแถวก่อนสุดท้าย (ก่อนแถวที่เพิ่มใหม่) ลงมาถึงแถวที่เคอร์เซอร์อยู่
    // NiceGrid.Cells[Col, Row] ใช้สำหรับเข้าถึงข้อมูลเซลล์
    for i := EditGrid.RowCount - 2 downto CurrentRow do
    begin
      // คัดลอกค่าจากแถวบน (i) ไปยังแถวล่าง (i + 1) ในคอลัมน์ CurrentCol
      EditGrid.Cells[CurrentCol, i + 1] := EditGrid.Cells[CurrentCol, i];
    end;

    // 3. เคลียร์เซลล์ในแถวที่ CurrentRow ของคอลัมน์ CurrentCol
    // เพื่อสร้าง "ช่องว่าง" (แถวใหม่) ตรงตำแหน่งที่เคอร์เซอร์อยู่
    EditGrid.Cells[CurrentCol, CurrentRow] := '';

    // (ทางเลือก) หากต้องการเคลียร์ทั้งแถวสำหรับทุกคอลัมน์
    
    {
    for i := 0 to NiceGrid1.ColCount - 1 do
    begin
      NiceGrid1.Cells[i, CurrentRow] := '';
    end;
    }

    // (ทางเลือก) ย้ายเคอร์เซอร์ไปยังแถวใหม่ที่เพิ่มเข้ามา
    EditGrid.Row := CurrentRow;
    EditGrid.SetFocus; // มั่นใจว่า Grid ยังมีโฟกัสอยู่
  end;

  if (Key = VK_RETURN) then
  begin
    Key := 0;
    with EditGrid do
    begin
      // ถ้าอยู่แถวสุดท้าย  เพิ่มแถวใหม่
      if Row = RowCount-1 then
      begin
        Key := 0;
        AddRow;//RowCount := RowCount + 1;
        if ((RowCount-1) - Row) = 1 then
          Row := Row+1;
      end;
    end;
  end;

  if Key = VK_DELETE then
  begin
    BtnDelEditGridClick(Sender);
  end;
end;

procedure TfrmPasteNumPrice.SeSkinButton2Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmPasteNumPrice.EditGridKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then   // = Enter key
  begin
    Key := #0;        // ปิดการทำงานระดับ KeyPress
  end;
end;

procedure TfrmPasteNumPrice.SeSkinButton4Click(Sender: TObject);
var
  ClipList: TStringList;
  NiceGrid: TNiceGrid; // ใช้ตัวแปรนี้เพื่ออ้างถึง NiceGrid
  CurrentCol: Integer;
  CurrentRow: Integer;
  i: Integer;
  PasteRowCount: Integer;
begin
  // 1. ตรวจสอบว่า NiceGrid ถูกสร้างขึ้นและมีโฟกัสอยู่หรือไม่
  if not Assigned(EditGrid) then
    Exit;

  NiceGrid := EditGrid; // กำหนดตัวแปร NiceGrid ให้ชี้ไปที่ NiceGrid1

  // 2. ตรวจสอบว่า Clipboard มีข้อมูลเป็นข้อความหรือไม่
  if not Clipboard.HasFormat(CF_TEXT) then
  begin
    ShowMessage('Clipboard ไม่มีข้อมูลประเภทข้อความ');
    Exit;
  end;

  // 3. เตรียม TStringList เพื่อแยกข้อมูลจาก Clipboard
  ClipList := TStringList.Create;
  try
    // นำข้อมูลข้อความจาก Clipboard มาใส่ใน StringList (จะถูกแยกด้วย #13#10 โดยอัตโนมัติ)
    ClipList.Text := Clipboard.AsText;
    PasteRowCount := ClipList.Count;

    // 4. กำหนดตำแหน่งเริ่มต้น
    CurrentCol := NiceGrid.Col;
    CurrentRow := NiceGrid.Row;

    // 5. เพิ่มแถวใน Grid ให้พอดีกับจำนวนบรรทัดที่จะวาง (ถ้าจำเป็น)
    if (CurrentRow + PasteRowCount) > NiceGrid.RowCount then
      NiceGrid.RowCount := CurrentRow + PasteRowCount;

    // 6. วนลูปวางข้อมูลทีละบรรทัดลงในคอลัมน์ที่เลือก ตั้งแต่แถวปัจจุบันลงไป
    for i := 0 to PasteRowCount - 1 do
    begin
      // ตรวจสอบว่าไม่เกินจำนวนแถวที่มีอยู่
      if (CurrentRow + i) < NiceGrid.RowCount then
      begin
        // วางค่าลงในคอลัมน์และแถวที่ถูกต้อง
        NiceGrid.Cells[CurrentCol, CurrentRow + i] := ClipList.Strings[i];
      end
      else
        Break; // ออกจากลูป หากแถวหมดแล้ว
    end;

    // 7. (ทางเลือก) ย้ายเคอร์เซอร์ไปที่เซลล์สุดท้ายที่วาง และให้ Grid มีโฟกัส
    NiceGrid.Row := CurrentRow + PasteRowCount - 1;
    NiceGrid.SetFocus;

  finally
    ClipList.Free;
  end;
end;

procedure TfrmPasteNumPrice.SeSkinButton5Click(Sender: TObject);
const
  // เปลี่ยนไปใช้ String แทน Set of Char
  OPERATORS = '=*\/+-<>{}[]#'; 
var
  NiceGrid: TNiceGrid;
  R: Integer; // แถวปัจจุบัน
  C: Integer; // คอลัมน์ปัจจุบัน
  i: Integer; // ตัวแปรสำหรับวนลูปใน String (OPERATORS)
  CellText: string;
  PosOperator: Integer; // ตำแหน่งของเครื่องหมายที่พบ
  OpChar: Char; // ตัวอักษรเครื่องหมายที่พบ
begin
  NiceGrid := EditGrid;

  // วนลูปผ่านช่วงเซลล์ที่ถูกเลือกทั้งหมด
  for R := NiceGrid.SelectArea.Top to NiceGrid.SelectArea.Bottom do
  begin
    for C := NiceGrid.SelectArea.Left to NiceGrid.SelectArea.Right do
    begin
      // 1. ดึงข้อความปัจจุบันของเซลล์
      CellText := NiceGrid.Cells[C, R];

      // Reset ตำแหน่งที่พบ ให้เป็นค่าที่ใหญ่กว่าความยาวของสตริงเสมอ
      PosOperator := 0; 

      // 2. วนหาเครื่องหมายโอเปอเรเตอร์ตัวแรกที่พบ โดยใช้การวนลูปแบบดัชนี (i)
      for i := 1 to Length(OPERATORS) do
      begin
        OpChar := OPERATORS[i]; // ดึงตัวอักษรเครื่องหมายทีละตัว
        
        // หาตำแหน่งของเครื่องหมาย
        PosOperator := Pos(OpChar, CellText); 
        
        // หากพบเครื่องหมาย
        if PosOperator > 0 then
        begin
          // 3. ตัดข้อความให้เหลือเฉพาะส่วนที่อยู่ "หน้า" เครื่องหมาย
          // (PosOperator - 1) คือจำนวนตัวอักษรที่อยู่หน้าเครื่องหมาย
          CellText := Copy(CellText, 1, PosOperator - 1);
          Break; // พบแล้ว ให้ออกจากลูปค้นหาเครื่องหมายทันที
        end;
      end;
      
      // 4. อัปเดตค่ากลับเข้าไปในเซลล์ (ใช้ Trim เพื่อตัดช่องว่าง)
      NiceGrid.Cells[C, R] := Trim(CellText); 
    end;
  end;
end;

procedure TfrmPasteNumPrice.SeSkinButton6Click(Sender: TObject);
var
  NiceGrid: TNiceGrid;
  R: Integer; // ดัชนีแถว (Row Index)
  C: Integer; // ดัชนีคอลัมน์ (Column Index)
  IsEmptyRow: Boolean;
begin
  NiceGrid := EditGrid;

  // วนลูปจากแถวล่างสุดย้อนขึ้นไปจนถึงแถวที่มีข้อมูล (ไม่รวม FixedRows)
  // NiceGrid1.FixedRows คือจำนวนแถวส่วนหัวที่ไม่ควรลบ
  for R := NiceGrid.RowCount - 1 downto 0 do
  begin
    IsEmptyRow := True; // ตั้งสมมติฐานว่าแถวนี้ว่าง
    
    // วนลูปตรวจสอบทุกคอลัมน์ในแถวปัจจุบัน (ไม่รวม FixedCols)
    for C := 0 to NiceGrid.ColCount - 1 do
    begin
      // ตรวจสอบว่าเซลล์มีข้อความหรือไม่ (หลังจากตัดช่องว่างหน้าหลังด้วย Trim)
      if Trim(NiceGrid.Cells[C, R]) <> '' then
      begin
        IsEmptyRow := False; // พบข้อมูล! แถวนี้ไม่ว่าง
        Break; // ออกจากลูปคอลัมน์ทันที เพื่อไปตรวจสอบแถวถัดไป
      end;
    end;
    
    // หากตรวจสอบครบทุกคอลัมน์แล้วพบว่า IsEmptyRow ยังเป็น True
    if IsEmptyRow then
    begin
      // ลบแถวที่ว่าง
      NiceGrid.DeleteRow(R);
    end;
  end;
end;

end.
