unit uFInputText;

interface           
                 
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, se_controls, KsSkinButtons, AppEvnts, Mask, IniFiles,
  sCustomComboEdit, sComboEdit, ABSMain, KsSkinSpeedButtons, sEdit, sMemo,Clipbrd,
  Menus, sCurrEdit, sCurrencyEdit, ComCtrls, KsSkinSpinButtons, KsSkinTabs, StrUtils,
  KsSkinCheckBoxs, RegExpr, sCustomComboBox;

const  myprog = 'โปรแกรมแปลภาษาอังกฤษ  โดย นายยุทธศักดิ์ ทองมั่นคง';
       TKsize = 500;
const LimitRunPerDay = 24;
const LimitFreeInput = 50;
const SeedKey = 10162;

type
  TIntArray = Array of Integer;

  TfrmInputText = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    BtnClear: TSeSkinButton;
    lbTotalNum: TLabel;
    SeSkinButton4: TSeSkinButton;
    ApplicationEvents1: TApplicationEvents;
    Panel1: TPanel;
    eng: TMemo;
    PasteBtn: TSeSkinButton;
    PMenuNumList: TPopupMenu;
    N41: TMenuItem;
    N42: TMenuItem;
    N19: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    BtnSaveImport: TSeSkinButton;
    BtnCopy: TSeSkinButton;
    NumList: TRichEdit;
    Panel5: TPanel;
    LbCust: TLabel;
    Label4: TLabel;
    edCust: TsComboEdit;
    PanelCustName: TPanel;
    ChkFoundCust: TCheckBox;
    edBookNo: TsCurrencyEdit;
    SpinBook: TSeSkinSpinButton;
    Panel6: TPanel;
    Label3: TLabel;
    ChkAddPercent: TCheckBox;
    edPercent: TsCurrencyEdit;
    ChkClpBrdFilter: TCheckBox;
    Panel7: TPanel;
    Bevel1: TBevel;
    ChkLockMoney: TCheckBox;
    ChkTod: TCheckBox;
    Panel8: TPanel;
    PcNumType: TSeSkinPageControl;
    SeCustomTabSheet1: TSeCustomTabSheet;
    SeCustomTabSheet2: TSeCustomTabSheet;
    Tab3: TSeCustomTabSheet;
    SeCustomTabSheet4: TSeCustomTabSheet;
    SeCustomTabSheet5: TSeCustomTabSheet;
    ChkSetNum: TCheckBox;
    ChkMovePanel: TSeSkinCheckBox;
    BtnEditGrid: TSeSkinButton;
    Btn3Up: TSeSkinButton;
    Up3TodBtn: TSeSkinButton;
    Up3DwnBtn: TSeSkinButton;
    Up2Btn: TSeSkinButton;
    Mee2Btn: TSeSkinButton;
    Left2Btn: TSeSkinButton;
    Tang2Btn: TSeSkinButton;
    Dwn2Btn: TSeSkinButton;
    RunUpBtn: TSeSkinButton;
    LeftUpBtn: TSeSkinButton;
    CenterUpBtn: TSeSkinButton;
    RightUpBtn: TSeSkinButton;
    RunDwnBtn: TSeSkinButton;
    LeftDwnBtn: TSeSkinButton;
    RightDwnBtn: TSeSkinButton;
    Up4Btn: TSeSkinButton;
    Float4Btn: TSeSkinButton;
    Btn423: TSeSkinButton;
    Up5Btn: TSeSkinButton;
    Float5Btn: TSeSkinButton;
    Btn523: TSeSkinButton;
    ChkAlt: TCheckBox;
    CbAlt: TsComboBox;
    ChkOverPr: TCheckBox;
    edtOverPr: TsCurrencyEdit;
    Label1: TLabel;
    ChkAddBook: TCheckBox;
    ChkNamePaste: TCheckBox;
    lbSum: TLabel;
    procedure BtnClearClick(Sender: TObject);
    procedure NumListChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure edCustButtonClick(Sender: TObject);
    procedure edCustKeyPress(Sender: TObject; var Key: Char);
    procedure PasteBtnClick(Sender: TObject);
    procedure NumListKeyPress(Sender: TObject; var Key: Char);
    procedure N41Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure BtnSaveImportClick(Sender: TObject);
    procedure NumListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnCopyClick(Sender: TObject);
    procedure NumListEnter(Sender: TObject);
    procedure edBookNoKeyPress(Sender: TObject; var Key: Char);
    procedure RunUpBtnClick(Sender: TObject);
    procedure LeftUpBtnClick(Sender: TObject);
    procedure CenterUpBtnClick(Sender: TObject);
    procedure RightUpBtnClick(Sender: TObject);
    procedure RunDwnBtnClick(Sender: TObject);
    procedure LeftDwnBtnClick(Sender: TObject);
    procedure RightDwnBtnClick(Sender: TObject);
    procedure Up2BtnClick(Sender: TObject);
    procedure Mee2BtnClick(Sender: TObject);
    procedure Left2BtnClick(Sender: TObject);
    procedure Tang2BtnClick(Sender: TObject);
    procedure Dwn2BtnClick(Sender: TObject);
    procedure Up3TodBtnClick(Sender: TObject);
    procedure Up3DwnBtnClick(Sender: TObject);
    procedure Up4BtnClick(Sender: TObject);
    procedure Float4BtnClick(Sender: TObject);
    procedure Up5BtnClick(Sender: TObject);
    procedure Float5BtnClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ChkLockMoneyClick(Sender: TObject);
    procedure ChkTodClick(Sender: TObject);
    procedure ChkMovePanelClick(Sender: TObject);
    procedure BtnEditGridClick(Sender: TObject);
    procedure Btn3UpClick(Sender: TObject);
    procedure Btn423Click(Sender: TObject);
    procedure Btn523Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function FindCust(CustID:String):Boolean;
    function GetMaxBookForCust(CustID: String): Integer;
    Procedure ReadWord(InputString: string);//เก็บข้อความทีละประโยค
    //Function IsNum(aChars: char): Boolean;
    //Function IsChar(aChars: char): Boolean;
    //Function IsNumOnly(str: string): Boolean;
    //Function IsSymbolOnly(str: string): Boolean;
    //Function CountStar(str: string): integer;
    //Function CountCharInStr(aChars: char; str: string): integer;
    //Function CountSymbol(str: string): integer;
    //Function CountNum(str: string): integer;
    Function PosSymbol(str: string): integer;
    //Function GetNum(str: string): string;
    function  GetClpBrd_Num(Num: String):String;
    Function  GetPrFromSetNum(Num: String):String;
    function  GetNumFromClpBrd(Str: String):String;
    function  GetNumFromCB(Str: String):String;
    function  GetNumFromLineApp(Str: String):String;
    function  GetNumFromLineApp1(Str: String):String;
    procedure AltNum;
  public
    { Public declarations }
  end;

var
  frmInputText: TfrmInputText;
  ServerDBFile,AppKey: String;
  MainDate,DateSpecNum, LastInputDate: TDateTime;
  RunAppPerDay: integer;
  Regis, CanLockPr: Boolean;
  IpDate: TDate;
  IpRefID, IpEmpID, IpCustID, LastPrice: String;
  IpLotType: Integer;

  //Token: tk;
  //StopT: Boolean;
  //mrks : Array[1..tkSize] of String[255];
  //Marks : Array of String[255];
  //Vocabs : Array of TkRecord;
implementation

uses
uFindCust, uDm, uRegis, hddinfo, MyUnit, UEncrypt, uEditNumPrice,
  SerialGenerator, uMain;

{$R *.dfm}

Function GetNum(str: string): String;
var i,Count: integer;
    Nums: String;
begin
  Nums := '';
  for i := 1 to length(Str) do
  begin
    if (Str[i] in [ '0'..'9' ]) then
      Nums := Nums+Str[i];
  end;
  Result := Nums;
end;

function CountOccur( const SubText: string; const Text: string): Integer;
begin
  if (SubText = '') OR (Text = '') OR (Pos(SubText, Text) = 0) then
    Result := 0
  else
    Result := (Length(Text) - Length(StringReplace(Text, SubText, '', [rfReplaceAll]))) div  Length(subtext);
end;  { CountOccurences }

function AlterNum(Number:String): String;
var
  N,ValNum: String;
  i,j,ValTmp,Valitem: integer;
  Val : TIntArray;
  A: Set of 0..100;
begin
  N := Number;

 if (N[1] in ['0'..'9']) then
 begin

  for i := 1 to length(N) do
    if Not (N[i] in ['0'..'9']) then
      break;
  N := Copy(Number,1,i-1);

  Setlength(Val,length(N));
  for i:= 0 to length(Val)-1 do
    Val[i] := StrToInt(N[i+1]);

  ValItem := 10;
  ValTmp := 10;
  A := [];
  for i := 0 to length(Val)-1 do
  begin
      for j := 0 to length(Val)-1 do
      begin
        if Not (j in A) then
        if (Val[j] <= ValTmp) then
        begin
          ValTmp := Val[j];
          ValItem := j;
        end;

      end;
    ValNum := ValNum+IntToStr(ValTmp);
    ValTmp := 10;
    Include(A, ValItem);
  end;
  A := [];
  Result := ValNum;
 end
 else
  Result := N;
end;

function CountNumberGroups(const Text: string): Integer;
var
  i: Integer;
  InNumber: Boolean;
begin
  Result := 0;
  InNumber := False;
  
  for i := 1 to Length(Text) do
  begin
    // ตรวจสอบว่าตัวอักษรในตำแหน่งปัจจุบันเป็นตัวเลขหรือไม่
    if Text[i] in ['0'..'9'] then
    begin
      if not InNumber then
      begin
        Inc(Result); // เพิ่มจำนวนชุดตัวเลข
        InNumber := True;
      end;
    end
    else
      InNumber := False; // ไม่ใช่ตัวเลข
  end;
end;

function LineToExtract(Text : String):String;
Var i,FstNum,LstNum: integer;

begin
  FstNum := 0;
  LstNum := 0;
  for i := 1 to Length(Text) do
  begin
    if Text[i] in ['0'..'9'] then
    begin
        if FstNum = 0 then
          FstNum := i;

        LstNum := i;
    end
  end;
  Result := Copy(Text,FstNum,LstNum-FstNum+1);
end;

procedure ExtractStartNumGroups(const Text: string; var Groups: TStringList);
var
  i: Integer;
  isNum: Boolean;
begin
  Groups.Clear; // เคลียร์ข้อมูลใน Groups ก่อน
  isNum := false;
  for i := 1 to Length(Text) do
  begin
    if Text[i] in ['0'..'9'] then
    begin
        if Not(isNum) then
        begin
          Groups.Add(IntToStr(i));
          isNum := true;
        end;
    end
    else
      isNum := false;
  end;
end;


procedure ExtractNumberGroups(const Text: string; var Groups: TStringList);
var
  i: Integer;
  CurrentGroup: string;
begin
  Groups.Clear; // เคลียร์ข้อมูลใน Groups ก่อน
  CurrentGroup := '';

  for i := 1 to Length(Text) do
  begin
    if Text[i] in ['0'..'9','*'] then
    begin
      // สะสมตัวเลขในกลุ่มปัจจุบัน
      CurrentGroup := CurrentGroup + Text[i];
    end
    else
    begin
      // หากเจอตัวอักษรที่ไม่ใช่ตัวเลขและมีกลุ่มตัวเลขอยู่
      if CurrentGroup <> '' then
      begin
        if GetNum(CurrentGroup) <> '' then
          Groups.Add(CurrentGroup); // เพิ่มกลุ่มลงในลิสต์

        CurrentGroup := ''; // เริ่มต้นใหม่
      end;
    end;
  end;

  // เพิ่มกลุ่มตัวเลขสุดท้ายถ้ามี
  if CurrentGroup <> '' then
    if GetNum(CurrentGroup) <> '' then
     Groups.Add(CurrentGroup);
end;

procedure ExtractGroupsNumSym(const Text: string; var Groups: TStringList);
var
  i: Integer;
  CurrentGroup: string;
begin
  Groups.Clear; // เคลียร์ข้อมูลใน Groups ก่อน
  CurrentGroup := '';

  for i := 1 to Length(Text) do
  begin
    if Text[i] in ['=','*',':','#','x','X','-','+','/','0'..'9'] then
    begin
      // สะสมตัวเลขในกลุ่มปัจจุบัน
      CurrentGroup := CurrentGroup + Text[i];
    end
    else
    begin
      // หากเจอตัวอักษรที่ไม่ใช่ตัวเลขและมีกลุ่มตัวเลขอยู่
      if CurrentGroup <> '' then
      begin
        if GetNum(CurrentGroup) <> '' then
          Groups.Add(CurrentGroup); // เพิ่มกลุ่มลงในลิสต์

        CurrentGroup := ''; // เริ่มต้นใหม่
      end;
    end;
  end;

  // เพิ่มกลุ่มตัวเลขสุดท้ายถ้ามี
  if CurrentGroup <> '' then
    if GetNum(CurrentGroup) <> '' then
     Groups.Add(CurrentGroup);
end;

function FilterNumSym(const Input: string): string;
const
  AllowedChars = ['=', '*', ':', '#', 'x', 'X', '-', '+', '/', '0'..'9'];
var
  i, FirstPos, LastPos: Integer;
  ResultStr: string;
begin
  FirstPos := 0;
  LastPos := 0;

  // หา index ของตัวแรกและตัวสุดท้ายที่อยู่ใน AllowedChars
  for i := 1 to Length(Input) do
  begin
    if Input[i] in AllowedChars then
    begin
      if FirstPos = 0 then
        FirstPos := i;
      LastPos := i;
    end;
  end;

  // ถ้าไม่เจอเลย
  if (FirstPos = 0) or (LastPos = 0) then
    Exit;

  // ประมวลผลระหว่างตัวแรกถึงตัวสุดท้าย
  ResultStr := '';
  for i := FirstPos to LastPos do
  begin
    if Input[i] in AllowedChars then
      ResultStr := ResultStr + Input[i]
    else
      ResultStr := ResultStr + ' ';
  end;

  Result := ResultStr;
end;

function FilterNumSymSpace(const Input: string): string;
const
  AllowedChars = [' ','=', '*', ':', '#', 'x', 'X', '-', '+', '/', '0'..'9'];
var
  i, FirstPos, LastPos: Integer;
  ResultStr: string;
begin
  FirstPos := 0;
  LastPos := 0;

  // หา index ของตัวแรกและตัวสุดท้ายที่อยู่ใน AllowedChars
  for i := 1 to Length(Input) do
  begin
    if Input[i] in AllowedChars then
    begin
      if FirstPos = 0 then
        FirstPos := i;
      LastPos := i;
    end;
  end;

  // ถ้าไม่เจอเลย
  if (FirstPos = 0) or (LastPos = 0) then
    Exit;

  // ประมวลผลระหว่างตัวแรกถึงตัวสุดท้าย
  ResultStr := '';
  for i := FirstPos to LastPos do
  begin
    if Input[i] in AllowedChars then
      ResultStr := ResultStr + Input[i]
    else
      ResultStr := ResultStr + ' ';
  end;

  Result := ResultStr;
end;

procedure SplitGroups(const InputText: string; var WordList: TStringList);
var
  i: Integer;
begin
  //InputText := '724/632/267=10*ชุด  767=20*ชุด 123=100 697=100*20 123/784/362=30*20';

  WordList := TStringList.Create;
  try
    WordList.Delimiter := ' ';
    WordList.DelimitedText := InputText;

    // ลบช่องว่างๆ ที่เกิดจากการเว้นหลาย space
    for i := WordList.Count - 1 downto 0 do
      if Trim(WordList[i]) = '' then
        WordList.Delete(i);
  finally
    //WordList.Free;
  end;
end;


procedure ExtractGroupsNum(const Text: string; var Groups: TStringList);
var
  i: Integer;
  CurrentGroup: string;
begin
  Groups.Clear; // เคลียร์ข้อมูลใน Groups ก่อน
  CurrentGroup := '';

  for i := 1 to Length(Text) do
  begin
    if Text[i] in ['0'..'9','*','='] then
    begin
      // สะสมตัวเลขในกลุ่มปัจจุบัน
      CurrentGroup := CurrentGroup + Text[i];
    end
    else
    begin
      // หากเจอตัวอักษรที่ไม่ใช่ตัวเลขและมีกลุ่มตัวเลขอยู่
      if CurrentGroup <> '' then
      begin
        if GetNum(CurrentGroup) <> '' then
          Groups.Add(CurrentGroup); // เพิ่มกลุ่มลงในลิสต์

        CurrentGroup := ''; // เริ่มต้นใหม่
      end;
    end;
  end;

  // เพิ่มกลุ่มตัวเลขสุดท้ายถ้ามี
  if CurrentGroup <> '' then
    if GetNum(CurrentGroup) <> '' then
     Groups.Add(CurrentGroup);
end;


procedure ExtractNumberOnly(const Text: string; var Groups: TStringList);
var
  i: Integer;
  CurrentGroup: string;
begin
  Groups.Clear; // เคลียร์ข้อมูลใน Groups ก่อน
  CurrentGroup := '';

  for i := 1 to Length(Text) do
  begin
    if Text[i] in ['0'..'9'] then
    begin
      // สะสมตัวเลขในกลุ่มปัจจุบัน
      CurrentGroup := CurrentGroup + Text[i];
    end
    else
    begin
      // หากเจอตัวอักษรที่ไม่ใช่ตัวเลขและมีกลุ่มตัวเลขอยู่
      if CurrentGroup <> '' then
      begin
        Groups.Add(CurrentGroup); // เพิ่มกลุ่มลงในลิสต์
        CurrentGroup := ''; // เริ่มต้นใหม่
      end;
    end;
  end;

  // เพิ่มกลุ่มตัวเลขสุดท้ายถ้ามี
  if CurrentGroup <> '' then
    Groups.Add(CurrentGroup);
end;

procedure ExtractStrGroups(const Text: string; var Groups: TStringList);
var
  i: Integer;
  CurrentGroup: string;
begin
  Groups.Clear; // เคลียร์ข้อมูลใน Groups ก่อน
  CurrentGroup := '';

  for i := 1 to Length(Text) do
  begin
    if Not (Text[i] in ['0'..'9','*','=']) then
    begin
      // สะสมตัวอักษรในกลุ่มปัจจุบัน
      CurrentGroup := CurrentGroup + Text[i];
    end
    else
    begin
      // หากเจอตัวอักษรที่ไม่ใช่ตัวเลขและมีกลุ่มตัวเลขอยู่
      if CurrentGroup <> '' then
      begin
        Groups.Add(CurrentGroup); // เพิ่มกลุ่มลงในลิสต์
        CurrentGroup := ''; // เริ่มต้นใหม่
      end;
    end;
  end;

  // เพิ่มกลุ่มตัวเลขสุดท้ายถ้ามี
  if CurrentGroup <> '' then
    Groups.Add(CurrentGroup);
end;

function IsNumericWithComma(const Word: string): Boolean;
var
  i: Integer;
  WithoutComma: string;
begin
  // ลบเครื่องหมาย ',' ชั่วคราวเพื่อเช็คว่าคำที่เหลือเป็นตัวเลขทั้งหมดหรือไม่
  WithoutComma := StringReplace(Word, ',', '', [rfReplaceAll]);
  Result := True;
  for i := 1 to Length(WithoutComma) do
  begin
    if not (WithoutComma[i] in ['0'..'9']) then
    begin
      Result := False;
      Break;
    end;
  end;
end;

function RemoveCommasFromNumbers(const Text: string): string;
var
  Words: TStringList;
  i: Integer;
begin
  Words := TStringList.Create;
  try
    Words.Delimiter := ' ';  // ใช้ช่องว่างเป็นตัวแบ่งคำ
    //Words.StrictDelimiter := True;
    Words.DelimitedText := Text;

    for i := 0 to Words.Count - 1 do
    begin
      // ถ้าคำเป็นตัวเลขที่มีคอมม่าคั่น ให้ลบคอมม่าออก
      if IsNumericWithComma(Words[i]) then
        Words[i] := StringReplace(Words[i], ',', '', [rfReplaceAll]);
    end;

    Result := StringReplace(Words.DelimitedText, ',', '', [rfReplaceAll]); // รวมคำกลับพร้อมช่องว่าง
  finally
    Words.Free;
  end;
end;

Function CountSymbol(str: string): integer;
var i,Count: integer;
    StrOK: boolean;
begin
  Count := 0;
  for i := 1 to length(Str) do
  begin
    if (Str[i] in [ ' ','*',':','#','x','X','-','+',#32,'.' ]) then
      Count := Count+1;
  end;
  Result := Count;
end;

Function CountNum(str: string): integer;
var i,Count: integer;
    StrOK: boolean;
begin
  Count := 0;
  for i := 1 to length(Str) do
  begin
    if (Str[i] in [ '0'..'9' ]) then
      Count := Count+1;
  end;
  Result := Count;
end;

Function CountToLastNum(str: string): integer;
var i,Count: integer;
    StrOK: boolean;
begin
  Count := 0;
  for i := 1 to length(Str) do
  begin
    if (Str[i] in [ '0'..'9' ]) then
      Count := i;
  end;
  Result := Count;
end;

Function PosFirstSymbol(str: string): integer;
var i,Count: integer;
begin
  Count := 0;
  for i := 1 to length(Str) do
  begin
    if (Str[i] in [ ' ','*',':','#','x','X','-','+',#32 ]) then
    begin
      Count := i;
      Break;
    end;
  end;
  Result := Count;
end;

Function PosLastSymbol(str: string): integer;
var i,Count: integer;
begin
  Count := 0;
  for i := 1 to length(Str) do
  begin
    if (Str[i] in [ ' ','*',':','#','x','X','-','+',#32 ]) then
      Count := i;
  end;
  Result := Count;
end;

function IsStrANumber(const S: string): Boolean;
var
  P: PChar;
begin
  P      := PChar(S);
  Result := False;
  while P^ <> #0 do
  begin
    if not (P^ in ['0'..'9']) then Exit;
    Inc(P);
  end;
  Result := True;
end;

function TfrmInputText.GetMaxBookForCust(CustID: String): Integer;
var QrMaxBook: TABSQuery;
    MaxNo: Integer;
begin
  Result := 1;
  if Trim(CustID) = '' then Exit;
  with Dm do
  begin
    QrMaxBook := TABSQuery.Create(nil);
    try
    except
    end;
    try
      QrMaxBook.DatabaseName := Database.DatabaseName;
      try
        QrMaxBook.Close;
      except
      end;
      QrMaxBook.SQL.Clear;
      QrMaxBook.SQL.Add('Select Max(CAST(RefNo AS integer)) as mxn from Data');
      QrMaxBook.SQL.Add('Where (CustNo = "' + CustID + '")');
      try
        try
          QrMaxBook.Open;
        except
        end;
      except
      end;

      MaxNo := QrMaxBook.fieldByName('mxn').AsInteger;
      if MaxNo > 0 then
        Result := MaxNo + 1
      else
        Result := 1;
    except
      Result := 1;
    end;
    QrMaxBook.Free;
  end;
end;

function TfrmInputText.FindCust(CustID:String):Boolean;
Var QrFindCust: TABSQuery;
    i: Integer;
begin
  result := false;
  With Dm do
  begin
    QrFindCust := TABSQuery.Create(nil);
    try
    except
    end;
    QrFindCust.DatabaseName := Database.DatabaseName;
    try
      QrFindCust.Close;
    except
    end;
    QrFindCust.SQL.Clear;
    QrFindCust.SQL.Add('Select * from Cust Where CustID like "%'+CustID+'%"');
    try
      try
        QrFindCust.Open;
      except
      end;
    except
    end;
    if QrFindCust.RecordCount = 0 then
    begin
      Showmessage('ไม่พบลูกค้าที่ต้องการ กรุณากรอกรหัสลูกให้ถูกต้อง');
      PanelCustName.Caption := '';
      result := false;
    end
    else
    begin
      edCust.Text := QrFindCust.FieldByName('CustID').AsString;
      PanelCustName.Caption := ' '+QrFindCust.FieldByName('fName').AsString+' '+QrFindCust.FieldByName('lName').AsString;
      edBookNo.Value := GetMaxBookForCust(edCust.Text);

      if Pos('แถม',QrFindCust.FieldByName('Comment').AsString) > 0 then
        ChkAddPerCent.Checked := true
      else
        ChkAddPerCent.Checked := false;

      Result := true;
    end;
    QrFindCust.Free;
  end;
end;


Function IsMultiSet(str: string): Boolean;
var i: integer;
    StrOK: boolean;
begin
  if Pos('*',Str) = Length(Str) then
    StrOK := true
  else
    StrOK := false;

  Result := StrOK;
end;

Function IsMinusSet(str: string): Boolean;
var i: integer;
    StrOK: boolean;
begin
  if Pos('-',Str) = Length(Str) then
    StrOK := true
  else
    StrOK := false;

  Result := StrOK;
end;

Function IsTod(str: string): Boolean;
var i: integer;
    StrOK: boolean;
begin
  if Pos('-',Str) = 1 then
    StrOK := true
  else
    StrOK := false;

  Result := StrOK;
end;

Function IsTengTod(str: string): Boolean;
var i: integer;
    StrOK: boolean;
begin
  if (Length(Str) - Pos('-',Str) >=2) and (Pos('-',Str) <> 0) then
    StrOK := true
  else
    StrOK := false;

  Result := StrOK;
end;

Function Is15Set(str: string): Boolean;
var i: integer;
    StrOK: boolean;
begin
  if (Length(Str) - Pos('*',Str) >= 1) and (Pos('*',Str) <> 0) then
    StrOK := true
  else
    StrOK := false;

  Result := StrOK;
end;

Function Replace(Str: String; OldStr: String; NewStr: String):String;
begin
  Result := StringReplace(Str, OldStr, NewStr,[rfReplaceAll, rfIgnoreCase]);
end;

Function ReplaceChr(Str: String; OldChr: Char; NewChr: Char):String;
Var i,Count: integer;
begin
  Str := Trim(Str);
  for i := 1 to length(Str) do
  begin
    if (LowerCase(Str[i]) = LowerCase(OldChr)) and ((Str[i-1] <> '=')) and ((Str[i+1] <> '=')) and (i < Length(Str)) then
    begin
      if i > 1 then
      begin
        Str[i] := NewChr;
      end;
    end
  end;
  Result := Str;
end;

function ReplaceAtPos(Str:String; PosNew:Integer; SubStr:String; NewStr:Char):String;
Var
   RpStr: String;
   i,Count: Integer;
begin
  Count := 0;
  for i := 1 to Length(Str) do
  begin
    if (Str[i] = SubStr) then
      Inc(Count);

    if (Count = PosNew) then
    begin
      Str[i] := NewStr;
      Break;
    end;
  end;
  Result := Str;
end;

function ReplaceIsolatedCharacter(const Text: string; const TargetChar, ReplaceWord: string): string;
var
  Words: TStringList;
  i: Integer;

  // ฟังก์ชันตรวจสอบว่าคำที่ให้มาถือว่าเป็นตัวอักษรเดี่ยวหรือไม่
  function IsIsolatedChar(const Word: string): Boolean;
  const
    AllowedSymbols = ['.', '-', '+']; // สัญลักษณ์ที่อนุญาตให้ติดกับ "บ"
  var
    Len: Integer;
  begin
    Len := Length(Word);
    if Len = 1 then
      Result := Word = TargetChar // เป็น "บ" ตัวเดียว
    else if (Len = 2) and ((Word[1] = TargetChar) and (Word[2] in AllowedSymbols) or
                           (Word[Len] = TargetChar) and (Word[1] in AllowedSymbols)) then
      Result := True // "บ" ติดสัญลักษณ์ข้างหน้า/ข้างหลัง
    else
      Result := False;
  end;

begin
  Words := TStringList.Create;
  try
    Words.Delimiter := ' ';  // ใช้ช่องว่างเป็นตัวแบ่งคำ
    //Words.StrictDelimiter := True;
    Words.DelimitedText := Text;

    for i := 0 to Words.Count - 1 do
    begin
      // ตรวจสอบว่าเป็น "บ" หรือติดกับสัญลักษณ์ที่อนุญาต
      if IsIsolatedChar(Words[i]) then
        Words[i] := ReplaceWord;  // แทนที่ด้วย ReplaceWord
    end;

    Result := StringReplace(Words.DelimitedText, ',', ' ', [rfReplaceAll]); // รวมคำกลับพร้อมช่องว่าง
  finally
    Words.Free; // ปล่อยหน่วยความจำ
  end;
end;

Function ReplaceSpaceToEQ(Str:String):String;
Var i,iNum,Count: integer;
    NewStr: String;
begin
  Str := Trim(Str);
  Count := 0;
  NewStr := '';
  iNum := 0;
  for i := 1 to length(Str) do
  begin
    if Str[i] in ['0'..'9'] then
      inc(iNum);

    if (LowerCase(Str[i]) = ' ') and (i > 1) and (i < Length(Str)) and (iNum > 0) then
    begin
      if Count = 0 then
      begin
        Str[i] := '=';
        Break;
      end
    end
  end;
  Result := Replace(Str,' ','');
end;

Function ReplaceFirst(Str: String; OldChr: Char; NewChr: Char):String;
Var i: integer;
begin
  Str := Trim(Str);
  for i := 1 to length(Str) do
  begin
    if (LowerCase(Str[i]) = LowerCase(OldChr)) and (Str[i-1] in ['0'..'9']) and (Str[i+1] in ['0'..'9']) and (i < Length(Str)) then
    begin
      Str[i] := NewChr;
      Break;
    end;
  end;
  Result := Str;
end;

Function ReplaceNext(Str: String; OldChr: Char; NewChr: Char):String;
Var i,Count: integer;
begin
  Str := Trim(Str);
  Count := 0;
  for i := 1 to length(Str) do
  begin
    if (LowerCase(Str[i]) = LowerCase(OldChr)) and (i < Length(Str)) then
    begin
      Count := Count+1;
      if Count > 1 then
      begin
        Str[i] := NewChr;
        Break;
      end;
    end;
  end;
  Result := Str;
end;

Function ReplaceLeft(Str: String; OldStr: String; NewStr: String):String;
Var LenOldStr: integer;
    LeftStr: String;
begin
  LenOldStr := Length(OldStr);
  LeftStr := Copy(Str,1,LenOldStr);//+1,LenOldStr);
  if (LeftStr = OldStr) then
    Result := NewStr+Copy(Str,LenOldStr+1,Length(Str)-LenOldStr)
  else
    Result := Str;
end;

Function ReplaceLast(Str: String; OldStr: String; NewStr: String):String;
Var LenOldStr: integer;
    LastStr: String;
begin
  LenOldStr := Length(OldStr);
  LastStr := Copy(Str,Length(Str)-LenOldStr+1,LenOldStr);
  if (LastStr = OldStr) then
    //Result := StringReplace(Str, OldStr, NewStr,[rfReplaceAll, rfIgnoreCase])
    Result := trim(Copy(Str,1, Length(Str)-LenOldStr)+NewStr)
  else
    Result := Str;
end;

Function ReplaceLastStr(Str: String; OldStr: String; NewStr: String):String;
Var LenOldStr,i: integer;
    LastStr,RemainStr: String;
begin
  LenOldStr := Length(OldStr);
  LastStr := Copy(Str,Length(Str)-LenOldStr+1,LenOldStr);
  if (LastStr = OldStr) then
  begin
    RemainStr := Copy(Str,1,Length(Str)-LenOldStr);
    Result := RemainStr+NewStr;
  end
  else
    Result := Str;
end;

Function IsLeftStr(Str: String; LStr: String):Boolean;
Var LenLStr: integer;
    LeftStr: String;
begin
  LenLStr := Length(LStr);
  LeftStr := Copy(Str,1,LenLStr);
  if (LeftStr = LStr) then
    Result := true
  else
    Result := false;
end;

Function IsLastStr(Str: String; LStr: String):Boolean;
Var LenLStr: integer;
    LastStr: String;
begin
  LenLStr := Length(LStr);
  LastStr := Copy(Str,Length(Str)-LenLStr+1,LenLStr);
  if (LastStr = LStr) then
    Result := true
  else
    Result := false;
end;

Function IsNum15Set(Nums,Prs: string): Boolean; //ex 123
var i: integer;
    StrOK: boolean;
begin
  if (Length(Nums) = 3) and  (CountSymbol(Prs) = 1) and (Not IsLastStr(Prs,'*6')) and (Not IsLastStr(Prs,'*3'))  then
    StrOK := true
  else
    StrOK := false;

  Result := StrOK;
end;

Function SplitPrice(Left: string; Sym: string; Str: String): string;
Var PL,PR: String;
begin
  if Left = 'L' then
    Result := Copy(Str,1,Pos(Sym,Str)-1)
  else
    Result := Copy(Str,Pos(Sym,Str)+1,Length(Str)-Pos(Sym,Str));
end;

function TimeFilter(Str: String): String;
Var Time,Items,StrClrTime: String;
    PosColon,i,Count: Integer;
begin
//-----------------------กรองเอาเวลาในข้อความออก-------------------------//
  PosColon := Pos(':',Str);
  if (Str[PosColon-2] in ['0'..'9']) and (Str[PosColon-1] in ['0'..'9']) and
     (Str[PosColon+1] in ['0'..'9']) and (Str[PosColon+2] in ['0'..'9']) and (Str[PosColon+3] =' ') then
  begin
    Count := 0;
    for i := 1 to Length(Str) do
    begin
      if (Str[i] = ' ') then
      begin
        Inc(Count);
        if count = 2 then
          Break;
      end;
    end;

    Time    := Copy(Str,PosColon-2,i);
    //StrClrTime := Replace(Str,Time,'<----------------------------->'+#13#10);
    StrClrTime := Replace(Str,Time,'');
  end
  else
    StrClrTime := Replace(Str,':','=');
//-----------------------กรองเอาเวลาในข้อความออก-------------------------//
  Result := StrClrTime;//StrItems;
end;

function GetLastLine(const S: string): string;
var
  LastPos: Integer;
begin
  // หาตำแหน่ง CRLF หรือ LF ล่าสุด
  LastPos := LastDelimiter(#10#13, S);

  if LastPos > 0 then
    Result := Copy(S, LastPos + 1, Length(S) - LastPos)
  else
    Result := S; // ถ้าไม่มีตัวแบ่งบรรทัด แสดงว่าเป็นบรรทัดเดียว
end;

function GetSecondLastLine(const S: string): string;
var
  LastPos, SecondLastPos: Integer;
begin
  LastPos := LastDelimiter(#10#13, S); // หาบรรทัดสุดท้าย

  if LastPos > 0 then
  begin
    // หาจากข้อความด้านหน้า LastPos
    SecondLastPos := LastDelimiter(#10#13, Copy(S, 1, LastPos - 1));

    if SecondLastPos > 0 then
      Result := Copy(S, SecondLastPos + 1, LastPos - SecondLastPos - 1)
    else
      Result := Copy(S, 1, LastPos - 1); // มีแค่ 2 บรรทัด
  end
  else
    Result := ''; // ไม่มีบรรทัดที่สอง
end;

function foundTime(Const LineTime: String): Boolean;
Var StrTime: String;
begin
  StrTime := LineTime;
  Result := false;
  if (StrTime[1] in ['0'..'9']) and (StrTime[2] in ['0'..'9']) and  (StrTime[3]= ':') and (StrTime[4] in ['0'..'9']) and (StrTime[5] in ['0'..'9']) and (StrTime[6] in [' ']) then
    Result := true;
end;

function RemoveTime1(const LineTime: string): string;
var
  i,Cnt: Integer;
  StrTime,TimeName,RemainStr,TrimStr: String;
begin
  StrTime := Trim(LineTime);
  TrimStr := '';
  Cnt := 0;
  if StrTime <> '' then
  begin
    if (StrTime[1] in ['0'..'9']) and (StrTime[2] in ['0'..'9']) and  (StrTime[3]= ':') and (StrTime[4] in ['0'..'9']) and (StrTime[5] in ['0'..'9']) and (StrTime[6] in [' ']) then
    begin
      for i := 1 to Length(StrTime) do
      begin
        TrimStr := TrimStr+StrTime[i];
        if StrTime[i] = ' ' then
        begin
          inc(Cnt);
          if Cnt = 2 then
            Break;
        end;
      end;
      StrTime := Trim(Replace(StrTime,TrimStr,''));

      if (StrTime <> '') and Not(StrTime[1] in ['0'..'9'])  then
      begin
        TrimStr := '';
        for i := 1 to Length(StrTime) do
        begin
          if Not(StrTime[i] in [' ','*']) then
            Break;

          TrimStr := TrimStr+StrTime[i];
        end;
        StrTime := Copy(StrTime,Length(TrimStr)+1,Length(StrTime)+Length(TrimStr));

      end;
    end;
    RemainStr := StrTime;
  end;
  Result := RemainStr;
end;

function RemoveTime(const Text: string): string;
var
  RegEx: TRegExpr;
begin
  // กำหนดรูปแบบที่่ต้องการค้นหาเช่น HH:MM หรือ H:MM
  RegEx := TRegExpr.Create;
  try
    RegEx.Expression := '\b\d{1,2}:\d{2}\b'; // รูปแบบเวลาคือ ตัวเลข 1-2 หลักตามด้วย ":" และตัวเลข 2 หลัก
    Result := RegEx.Replace(Text, '', True); // ลบเวลาที่พบออกจากข้อความ
  finally
    RegEx.Free;
  end;
end;

function RemoveDateAndTime(const Text: string): string;
var
  RegEx: TRegExpr;
begin
  RegEx := TRegExpr.Create;
  try
    // Regular Expression สำหรับค้นหา วันที่ และ เวลา
    RegEx.Expression := '\b(\d{1,2}/\d{1,2}/\d{2,4}|\d{4}-\d{2}-\d{2}|\d{1,2}:\d{2})\b';
    if (Pos('/',Text) = 2) then
      Result := RegEx.Replace(Text, '', True) // ลบวันที่หรือเวลาที่พบ
    else
    begin
      RegEx.Expression := '\b\d{1,2}:\d{2}\b'; // รูปแบบเวลาคือ ตัวเลข 1-2 หลักตามด้วย ":" และตัวเลข 2 หลัก
      Result := RegEx.Replace(Text, '', True)
    end;
  finally
    RegEx.Free;
  end;
end;

function DateFilter(Str: String): String;
Var NewStr: String;
begin
//-----------------------กรองเอาวันที่ในข้อความออก-------------------------//
  NewStr := Str;
  if (Pos('Sunday',Str) > 0) or (Pos('Monday',Str) > 0) or (Pos('Tuesday',Str) > 0) or
     (Pos('Wednesday',Str) > 0) or (Pos('Thursday',Str) > 0) or (Pos('Friday',Str) > 0) or (Pos('Saturday',Str) > 0) then
    NewStr := '';
//-----------------------กรองเอาเวลาในข้อความออก-------------------------//
  Result := NewStr;
end;

function PrFilter(Str: String): String;
Var Pr: String;
    i: integer;
begin
  Pr := '';
  for i := 1 to Length(Str) do
  begin
    if (Str[i] in ['0'..'9','=','*','-',' ','ช','ุ','ด']) then
      Pr := Pr+Str[i];
  end;
  Result := Pr;
end;

function PrFilter2(Str: String): String;
Var Pr: String;
    i: integer;
begin
  Pr := '';
  for i := 1 to Length(Str) do
  begin
    if (Str[i] in ['0'..'9','*','-']) then
      Pr := Pr+Str[i];
  end;
  Result := Pr;
end;

function PrFilter3(Str: String): String;
Var Pr: String;
    i: integer;
begin
  Pr := '';
  for i := 1 to Length(Str) do
  begin
    if (Str[i] in ['0'..'9','*','-',' ']) then
      Pr := Pr+Str[i];
  end;
  Result := Pr;
end;

Function IsChar(Ch: char): Boolean;
begin
  Result := True;
  if Not(Ch in ['a'..'z','A'..'Z']) then
    Result := false;
end;

Function IsNumSym(Ch: char): Boolean;
begin
  Result := True;
  if Not(Ch in ['=','*',':','#','x','X','-','+',#32,'0'..'9']) then
    Result := false;
end;

Function StrFilter(Str: String): String;
Var i,iNum: integer;
    NewStr: String;
begin
  NewStr := '';
  Result := Str;
  iNum := 0;
  For i := 1 to Length(Str) do
  begin
    if Str[i] in ['0'..'9'] then
      inc(iNum);

  if (Str[i] in ['=','*',':','#','x','X','-','+',#32,'0'..'9']) and (iNum > 0) then
    NewStr := NewStr+Str[i];
  end;
  Result := NewStr;
end;

Function IsLonelyThaiStr(str: String; ChStr: String): Boolean;
Var i,PosFNum,PosLNum: integer;
    LChStr,UChStr: String;
begin
  Result := false;
  PosFNum := 0;
  PosLNum := 0;
  if (Pos(ChStr,Str) > 0) then
  begin
    for i := 1 to Length(Str) do
    begin
      if (i = 1) then
      begin
        if Length(Str) = 1 then
        begin
          Result := true;
          Break;
        end
        else
        if (String(Str[i]) = ChStr) then
        begin
          if (Str[i+1] = ' ') Or (Str[i+1] in ['0'..'9']) then
          begin
            Result := true;
            Break;
          end;
        end;
      end;

      if (i > 1) and (i < Length(Str)) then
      begin
        if (String(Str[i]) = ChStr) then
        begin
          if (Str[i-1] = ' ') then
          begin
            if (Str[i+1] = ' ') then
            begin
              Result := true;
              Break;
            end;
          end;
        end;
      end;

      if (i = Length(Str)) then
      begin
        if Length(Str) = 1 then
        begin
          Result := true;
          Break;
        end
        else
        if (String(Str[i]) = ChStr) then
        begin
          if (Str[i-1] = ' ') then
          begin
            Result := true;
            Break;
          end;
        end;
      end;
    end;
  end;
end;


Function IsLonelyLetter(str: String; Ch: Char): Boolean;
Var i,PosFNum,PosLNum: integer;
    LChStr,UChStr: String;
begin
  Result := false;
  PosFNum := 0;
  PosLNum := 0;
  LChStr := LowerCase(Ch);
  UChStr := UpperCase(Ch);
  if ((Pos(LChStr,Str) > 0) Or (Pos(UChStr,Str) > 0))  then
  begin
    for i := 1 to Length(Str) do
    begin
      if (Str[i] in ['0'..'9']) and (PosFNum = 0) then
        PosFNum := i;

      if (Str[i] in ['0'..'9']) then
        PosLNum := i;
    end;

    for i := 1 to Length(Str) do
    begin
      if (PosFNum > 0) and (i > PosFNum) and (LowerCase(Str[i]) = LowerCase(Ch)) and (Not (Str[i-1] in ['a'..'z','A'..'Z'])) and (Not(Str[i+1] in ['a'..'z','A'..'Z'])) and (i < PosLNum) then //Length(Str)) then
      begin
        Result := true;
        Break;
      end;
    end;
  end;
end;

Function ReplaceLonelyLetter(str: String; OldCh: Char; NewCh: Char): String;
Var i,PosFNum,PosLNum: integer;
    LChStr,UChStr: String;
begin
  Result := Str;
  PosFNum := 0;
  PosLNum := 0;
  LChStr := LowerCase(OldCh);
  UChStr := UpperCase(OldCh);
  if ((Pos(LChStr,Str) > 0) Or (Pos(UChStr,Str) > 0))  then
  begin
    for i := 1 to Length(Str) do
    begin
      if (Str[i] in ['0'..'9']) and (PosFNum = 0) then
        PosFNum := i;

      if (Str[i] in ['0'..'9']) then
        PosLNum := i;
    end;

    for i := 1 to Length(Str) do
    begin
      if (PosFNum > 0) and (i > PosFNum) and (LowerCase(Str[i]) = LowerCase(OldCh)) and (Not (Str[i-1] in ['a'..'z','A'..'Z'])) and (Not(Str[i+1] in ['a'..'z','A'..'Z'])) and (i < PosLNum) then //Length(Str)) then
      begin
        Str[i] := NewCh;
        Break;
      end;
    end;
  end;
  Result := Str;
end;

Function IsLonelyNum(str: String): Boolean;
Var i: integer;
begin
  Result := false;
  for i := 1 to Length(Str) do
  begin
    if (Str[i] in ['3','6']) and ((Str[i-1] in ['*'])) and ((Str[i+1] in ['*'])) and (i < Length(Str)) then
    begin
      Result := true;
      Break;
    end;
  end;
end;

Function IsEqlAstr(str: String; Ch: char): Boolean; // any symbol next equal example =*, =/
Var FoundIt: Boolean;
    i: integer;
begin
  FoundIt := false;
  Str := Trim(Str);
  for i := 1 to length(Str) do
  begin
    if (LowerCase(Str[i]) = LowerCase(Ch)) and (Str[i-1] in ['=']) and (i < Length(Str)) then
    begin
      FoundIt := true;
      Break;
    end;
  end;
  Result := FoundIt;
end;

Function IsNumOnly(str: string): Boolean;
var i: integer;
    St: String;
begin
  St := Trim(Str);
  Result := true;
  for i := 1 to length(St) do
  begin
    if Not(St[i] in [ '0'..'9' ]) then
    begin
      Result := false;
      Break;
    end;
  end;
end;

Function IsNumAndEQOnly(str: string): Boolean;
var i: integer;
    St: String;
    IsEqNum: Boolean;
begin
  St := Trim(Str);
  IsEqNum := true;
  for i := 1 to length(St) do
  begin
    if Not(St[i] in [ '0'..'9','=' ]) then
    begin
      Result := false;
      Break;
      IsEqNum := false;
    end;
  end;
  if IsEqNum then
  begin
    if St[1] = '=' then
      Result := true;
  end;
end;

Function GetEnglishOnly(str: string): String;
var i: integer;
    St,EngStr: String;
begin
  St := Trim(Str);
  EngStr := '';
  for i := 1 to length(St) do
  begin
    if (St[i] in [ 'a'..'z','A'..'Z' ]) then
    begin
      EngStr := EngStr+St[i];
    end;
  end;
  Result := EngStr;
end;

function FoundDayName(const InputText: string): Boolean;
var
  Days: array[0..6] of string;
  I: Integer;
begin
  Days[0] := 'Monday';
  Days[1] := 'Tuesday';
  Days[2] := 'Wednesday';
  Days[3] := 'Thursday';
  Days[4] := 'Friday';
  Days[5] := 'Saturday';
  Days[6] := 'Sunday';
  Result := false;
  for I := 0 to 6 do
  begin
    if InputText = Days[I] then
    begin
      Result := true;
      Break;
    end;
  end;
end;

Function IsNumAndSlashOnly(str: string): Boolean;
var i: integer;
    St: String;
    GroupsNum : TStringList;
begin
  St := Replace(Str,' ','');
  if Pos('/',St) > 0 then
  begin
    Result := true;
    for i := 1 to length(St) do
    begin
      if Not(St[i] in ['0'..'9','/']) then
      begin
        Result := false;
        Break;
      end;
    end;
  end
  else
    Result := false;
end;

Function IsFoundNum(str: string): Boolean;
var i: integer;
    StrOK: boolean;
begin
  Result := false;
  for i := 1 to length(Str) do
  begin
    if (Str[i] in [ '0'..'9' ]) then
    begin
      Result := true;
      Break;
    end;
  end;
end;

Function IsOnlyNum(str: string): Boolean;
var i: integer;
    StrOK: boolean;
begin
  for i := 1 to length(Str) do
  begin
    if (Str[i] in [ '0','1','2','3','4','5','6','7','8','9' ]) then
      StrOK := True
    else
    begin
      StrOK := false;
      Break;
    end;
  end;
  Result := StrOK;
end;

Function CountCharInStr(aChars: char; str: string): integer;
var i,Count: integer;
begin
  Count := 0;
  for i := 1 to length(Str) do
  begin
    if (Str[i] in [ aChars ]) then
      Count := Count+1;
  end;
  Result := Count;
end;

function CountPermutations(const Number: string): Integer;
var
  i, j, k: Integer;
  UsedCombination: TStringList;
  CurrentCombination: string;
begin
  if Length(Number) <> 3 then
  begin
    Result := 0; // รองรับเฉพาะเลข 3 หลัก
    Exit;
  end;

  UsedCombination := TStringList.Create;
  try
    UsedCombination.Sorted := True; // เพื่อการค้นหาเร็วขึ้น
    UsedCombination.Duplicates := dupIgnore; // ไม่บันทึกค่าซ้ำ

    // สร้างชุดค่าที่เป็นไปได้
    for i := 1 to 3 do
      for j := 1 to 3 do
        for k := 1 to 3 do
        begin
          if (i <> j) and (j <> k) and (i <> k) then
          begin
            CurrentCombination := Number[i] + Number[j] + Number[k];
            UsedCombination.Add(CurrentCombination); // เพิ่มชุดใหม่
          end;
        end;

    Result := UsedCombination.Count; // จำนวนที่ไม่ซ้ำกัน
  finally
    UsedCombination.Free; // ปล่อยหน่วยความจำ
  end;
end;

Function Permutation(Str: String):integer;
Var Num, SubNum, TmpStr,StrAll: String;
    i, k, i1, j, Grp, Count : Integer;
begin
  Num := Str;
  Grp := 3;
  SubNum := '';
  Count := 0;
  StrAll := '';
  For i := 1 to Length(Num) do
  begin
    for k := 1 to Length(Num) do
    begin
      For J := k to k+Length(Num) do
      begin
        if j > Length(Num) then
          i1 := j-Length(Num)
        else
          i1 := j;

        SubNum := Num[i]+Num[k]+Num[i1];
        if (CountNum(SubNum) >= 3) and (Pos(SubNum,StrAll) = 0) and
           (CountCharInStr(Num[i],SubNum)  <= CountCharInStr(Num[i],Num)) and
           (CountCharInStr(Num[k],SubNum)  <= CountCharInStr(Num[k],Num)) and
           (CountCharInStr(Num[i1],SubNum) <= CountCharInStr(Num[i1],Num))
        then
        begin
          StrAll := StrAll+SubNum+#13#10;
          Count := Count+1;
        end;
        SubNum := '';
      end;
    end;
  end;
  Result := Count;
end;

Function PermutationStr(Str: String):String;
Var Num, SubNum, TmpStr,StrAll: String;
    i, k, i1, j, Grp, Count : Integer;
begin
  Num := Str;
  Grp := 3;
  SubNum := '';
  Count := 0;
  For i := 1 to Length(Num) do
  begin
    for k := 1 to Length(Num) do
    begin
      For J := k to k+Length(Num) do
      begin
        if j > Length(Num) then
          i1 := j-Length(Num)
        else
          i1 := j;

        SubNum := Num[i]+Num[k]+Num[i1];
        if (CountNum(SubNum) >= 3) and (Pos(SubNum,StrAll) = 0) and
           (CountCharInStr(Num[i],SubNum)  <= CountCharInStr(Num[i],Num)) and
           (CountCharInStr(Num[k],SubNum)  <= CountCharInStr(Num[k],Num)) and
           (CountCharInStr(Num[i1],SubNum) <= CountCharInStr(Num[i1],Num))
        then
        begin
          StrAll := StrAll+SubNum+#13#10;
          Count := Count+1;
        end;
        SubNum := '';
      end;
    end;
  end;
  Result := StrAll;
end;

Function ChangeLonelyNum(str: String):String;
Var i,PEQ,PEQ2,PSTAR1,PSTAR2,Count: integer;
    P1,P2,P12,NewStr,Num: String;
begin
  //Showmessage(Str);
  Count := 0;
  if (CountOccur('=',Str) = 2) then
  begin
    for i := 1 to Length(Str) do
    begin
      if str[i] = '=' then
      begin
        Inc(Count);
        if Count = 2 then
        begin
          Str[i] := '*';
          Break;
        end;
      end;
    end;
  end;

  Result := Str;
  Num := Copy(Str,1,Pos('=',Str)-1);
  PEQ := 0; // ตำแหน่ง = ตัวที่ 1
  PEQ2 := 0; // ตำแหน่ง = ตัวที่ 2
  PSTAR1 := 0; // pos star
  for i := 1 to Length(Str) do
  begin
    if (PEQ = 0) and (Str[i] = '=') then
      PEQ := i;

    if Str[i] = '=' then  //หาเท่ากับตัวที่ 2 ในข้อความ เช่น 123 =100=20*6
      PEQ2 := i;

    if (PSTAR1 = 0) and (Str[i] = '*') then
      PSTAR1 := i;

    if Str[i] = '*' then  //หาเท่ากับตัวที่ 2 ในข้อความ เช่น 123 =100*20*6
      PSTAR2 := i;

  end;

  if (PerMutation(Num) = 3) then
  begin
    if  (IsLastStr(Str,'*3')) and (Pos('*3*',Str) = 0) then
    begin
      P1 := Copy(Str,PEQ+1,PSTAR1-PEQ-1);
      P2 := Copy(Str,PSTAR1+1,Length(Str)-PSTAR1-2);
      P12 := IntToStr(StrToInt(P1)+StrToInt(P2));
      Result := Replace(Str,P1+'*'+P2+'*3',P12+'*2*'+P2);  //122=100*40*3 ---> 122=140*2*40
    end
    else
    if (Pos('*3*',Str) > 0) and Not(IsLastStr(Str,'*3')) then
    begin
      P1 := Copy(Str,PEQ+1,PSTAR1-PEQ-1);
      P2 := Copy(Str,PSTAR2+1,Length(Str)-PSTAR2);
      P12 := IntToStr(StrToInt(P1)+StrToInt(P2));
      Result := Replace(Str,P1+'*'+P2+'*3',P12+'*2*'+P2);  //122=100*40*3 ---> 122=140*2*40
      Result := Replace(Str,P1+'*3*'+P2,P12+'*2*'+P2);  //122=100*40*3 ---> 122=140*2*40
    end
    else
    if  (IsLastStr(Str,'*3')) and (Pos('*3*',Str) > 0) then
    begin
      P1 := Copy(Str,PEQ+1,PSTAR1-PEQ-1);
      P2 := Copy(Str,PSTAR1+1,Length(Str)-PSTAR1-2);
      P12 := IntToStr(StrToInt(P1)+StrToInt(P2));
      Result := Replace(Str,P1+'*'+P2+'*6',P12+'*5*'+P2);  //122=100*40*6 ---> 122=140*5*40
    end
  end
  else
  if (PerMutation(Num) = 6) then
  begin
    if  (IsLastStr(Str,'*6')) and (Pos('*6*',Str) = 0) then
    begin
      P1 := Copy(Str,PEQ+1,PSTAR1-PEQ-1);
      P2 := Copy(Str,PSTAR1+1,Length(Str)-PSTAR1-2);
      P12 := IntToStr(StrToInt(P1)+StrToInt(P2));
      Result := Replace(Str,P1+'*'+P2+'*6',P12+'*5*'+P2);  //122=100*40*6 ---> 122=140*5*40
    end
    else
    if (Pos('*6*',Str) > 0) and Not(IsLastStr(Str,'*6')) then
    begin
      P1 := Copy(Str,PEQ+1,PSTAR1-PEQ-1);
      P2 := Copy(Str,PSTAR2+1,Length(Str)-PSTAR2);
      P12 := IntToStr(StrToInt(P1)+StrToInt(P2));
      Result := Replace(Str,P1+'*6*'+P2,P12+'*5*'+P2);  //122=100*40*3 ---> 122=140*2*40
    end
    else
    if  (IsLastStr(Str,'*6')) and (Pos('*6*',Str) > 0) then
    begin
      P1 := Copy(Str,PEQ+1,PSTAR1-PEQ-1);
      P2 := Copy(Str,PSTAR1+1,Length(Str)-PSTAR1-2);
      P12 := IntToStr(StrToInt(P1)+StrToInt(P2));
      Result := Replace(Str,P1+'*'+P2+'*6',P12+'*5*'+P2);  //122=100*40*6 ---> 122=140*5*40
    end
  end;

end;


Function IsNumStarNum(Str: String):Boolean; //ex 122=100*33*33 , 122=100+33*33
Var LenStr,LenLast,PosStar: integer;
    LastStr,LeftNum,RightNum,TrimStr: String;
begin
  Result := false;
  TrimStr := Trim(Str);
  if (CountSymbol(TrimStr) >= 1) and (Pos('=',TrimStr) = 0) then
  begin
    if  (Pos(' ',TrimStr) = 0) then
    begin
      Result := true;

    end
    else
    begin
       if (Str[Pos('*',Str)-1] = ' ')  then
        Result := true;
    end;
  end;
end;

Function NumStarNum(Str: String):String; //ex 123*100 , 12x20
Var LenStr,PosStar,PerMu: integer;
    LeftNum,RightNum,NewStr: String;
begin
  NewStr := Replace(Str,' ','');
  PosStar  := Pos('*',NewStr);
  LenStr   := Length(NewStr);
  RightNum := Copy(NewStr,PosStar+1,LenStr-PosStar);
  LeftNum  := trim(Copy(NewStr,1,PosStar-1));
  if Length(LeftNum) >= 3 then
    Result := LeftNum+'='+RightNum+'*'+IntToStr(Permutation(LeftNum)) //  RightNum;
  else
    Result := LeftNum+'='+RightNum+'*'+RightNum;
end;

Function IsDoubleLast(Str: String):Boolean; //ex 122=100*33*33 , 122=100+33*33
Var LenStr,LenLast,FirstStar,LastStar: integer;
    LastStr,LeftStar,RightStar: String;
begin
  if CountSymbol(str) > 1 then
  begin
    if Pos('*',Str) > 0 then
    begin
      FirstStar := PosFirstSymbol(Str);//Pos('*',Str);
      LastStar  := PosLastSymbol(Str);//Pos('*',Str);
      LenStr    := Length(Str);
      RightStar := Copy(Str,LastStar+1,LenStr-LastStar);

      LenLast   := Length(RightStar);
      LeftStar  := Copy(Str,FirstStar+1,LastStar-FirstStar-1);
      if LeftStar = RightStar then
      begin
        Result := true;
      end
      else
        Result := false;
    end;
  end;
end;

Function ReplaceDoubleLast(Nums,Pri: String):String;
Var LenStr,LenLast,FirstStar,LastStar,Permu: integer;
    LastStr,LeftSym,LeftStar,RightStar: String;
begin
  Result := Pri;
  if CountSymbol(Pri) > 1 then
  begin
    if Pos('*',Pri) > 0 then
    begin
      FirstStar := PosFirstSymbol(Pri);//Pos('*',Str);
      LastStar  := PosLastSymbol(Pri);//Pos('*',Str);
      LenStr    := Length(Pri);
      RightStar := Copy(Pri,LastStar+1,LenStr-LastStar);

      LenLast   := Length(RightStar);
      LeftStar  := Copy(Pri,FirstStar+1,LastStar-FirstStar-1);
      Permu     := Permutation(Nums);
      LeftSym   := Copy(Pri,LastStar-LenLast-1,1);

      if LeftStar = RightStar then
        Result := Replace(Pri, LeftSym+LeftStar+'*','*'+IntToStr(Permu-1)+'*');
    end;
  end;
end;

Function PosNumInStr(str: string): integer;
var i,PosSym: integer;
    StrOK: boolean;
begin
  PosSym := 0;
  for i := 1 to length(Str) do
  begin
    if (Str[i] in [ '0'..'9' ]) then
    begin
      PosSym := i;
      Break;
    end;
  end;
  Result := PosSym;
end;

Function TfrmInputText.PosSymbol(str: string): integer;
var i,PosSym: integer;
    StrOK: boolean;
begin
  PosSym := 0;
  for i := 1 to length(Str) do
  begin
    if (Str[i] in [ ' ','*',':','#','x','X','-','+',#32 ]) then
    begin
      PosSym := i;
      Break;
    end;
  end;
  Result := PosSym;
end;

Function GetStr(str: string): String;
var i,Count: integer;
    StrGet: String;
begin
  StrGet := '';
  if (CountOccur('[2 ตัว',Str) = 0) and (CountOccur('[3 ตัว',Str) = 0) and (CountOccur('[4 ตัว',Str) = 0) and (CountOccur('[5 ตัว',Str) = 0) then
  begin
    for i := 1 to length(Str) do
    begin
      if Not(Str[i] in [ '0'..'9','*','=','/' ]) then
        StrGet := StrGet+Str[i];
    end;
    Result := StrGet;
  end
  else
    Result := Str;
end;

Function GetStar(str: string): String;
var i,Count: integer;
    StrGet: String;
begin
  StrGet := '';
  for i := 1 to length(Str) do
  begin
    if (Str[i] in ['*']) then
      StrGet := StrGet+Str[i];
  end;
  Result := StrGet;
end;

Function DelCommaInNum(str: string): String;
var i,Count: integer;
    StrGet: String;
begin
  StrGet := '';
  for i := 1 to length(Str) do
  begin
    if (Str[i-1] in ['0'..'9']) and (Str[i] in [',']) and (Str[i+1] in ['0'..'9']) then
      StrGet := StrGet+''
    else
      StrGet := StrGet+Str[i];
  end;
  Result := StrGet;
end;

Function DelComma(str: string; EqPos: Integer): String;
var i: integer;
    LnNew: String;
begin
  LnNew := '';
  for i := 1 to length(Str) do
  begin
    if (Str[i] in [',','.']) then
    begin
      if i < EqPos then
        LnNew := LnNew+'/'
      else
        LnNew := LnNew+'';
    end
    else
      LnNew := LnNew+Str[i];
  end;
  Result := LnNew;
end;

Function IsSymbolOnly(str: string): Boolean;
var i: integer;
    St:String;
begin
  Result := true;
  for i := 1 to length(Str) do
  begin
    if Not(Str[i] in ['=','*',':','#','x','X','-','+',#32 ]) then
    begin
      Result := false;
      Break;
    end;
  end;
end;

Function IsKlub(Nums,Prs: string): Boolean;
var i,LenPr: integer;
    Pri: String;
    StrOK: boolean;
begin
  if (CountNum(Nums) = 2) and (Length(Prs) - Pos('*',Prs) >= 1) and (Pos('*',Prs) > 0) and (CountSymbol(Prs) = 1) then
    StrOK := true
  else
    StrOK := false;

  Result := StrOK;
end;

Function IsTengStarTod(Nums,Prs: string): Boolean;
var i: integer;
    StrOK: boolean;
begin
  if (CountNum(Nums) = 3) and  (CountSymbol(Prs) = 1) and (Length(Prs) - Pos('*',Prs) >= 1) and
     (Pos('*',Prs) > 0) and Not(IsLastStr(Prs,'*3')) and Not(IsLastStr(Prs,'*6')) then
    StrOK := true
  else
    StrOK := false;

  Result := StrOK;
end;

Function IsSetMulti(Nums,Prs: string): Boolean;
var i: integer;
    StrOK: boolean;
begin
  if (CountNum(Nums) = 3) and  (CountSymbol(Prs) = 1) and (Length(Prs) - Pos('*',Prs) >= 1) and
     (Pos('*',Prs) > 0) and ((IsLastStr(Prs,'*3')) Or (IsLastStr(Prs,'*6'))) then
    StrOK := true
  else
    StrOK := false;

  Result := StrOK;
end;

Function Is4Trans(Nums,Prs: string): Boolean;
var i: integer;
    StrOK: boolean;
begin
  if (CountNum(Nums) = 4) and  (CountSymbol(Prs) = 1) and (Length(Prs) - Pos('*',Prs) >= 1) and
     (Pos('*',Prs) > 0) and ((IsLastStr(Prs,'*4')) Or (IsLastStr(Prs,'*6')) Or (IsLastStr(Prs,'*12')) Or (IsLastStr(Prs,'*24'))) then
    StrOK := true
  else
    StrOK := false;

  Result := StrOK;
end;

Function Is5Trans(Nums,Prs: string): Boolean;
var i: integer;
    StrOK: boolean;
begin
  if (CountNum(Nums) = 5) and  (CountSymbol(Prs) = 1) and (Length(Prs) - Pos('*',Prs) >= 1) and
     (Pos('*',Prs) > 0) and ((IsLastStr(Prs,'*4')) Or (IsLastStr(Prs,'*7')) Or (IsLastStr(Prs,'*13')) Or (IsLastStr(Prs,'*33')) Or (IsLastStr(Prs,'*60'))) then
    StrOK := true
  else
    StrOK := false;

  Result := StrOK;
end;

Function IsMulti1512(Nums,Prs: string): Boolean;
var i: integer;
    StrOK: boolean;
begin
  if (CountNum(Nums) = 3) and  (CountSymbol(Prs) = 2) and ((Pos('*2*',Prs) > 0) Or (Pos('*5*',Prs) > 0) )
     and ((Pos('*2*',Prs) < Length(Prs)) Or (Pos('*5*',Prs) < Length(Prs))) then
    StrOK := true
  else
    StrOK := false;

  Result := StrOK;
end;


// ฟังก์ชันหา Factorial (เช่น 3! = 6)
function Factorial(N: Integer): Int64;
var
  K: Integer;
begin
  Result := 1;
  for K := 2 to N do
    Result := Result * K;
end;

// ฟังก์ชันคำนวณ Permutation สำหรับ Delphi 7 (คำนึงถึงตัวเลขซ้ำ)
function GetUniquePermutationsCount(const S: string): Integer;
var
  Counts: array[Char] of Integer;
  Ch: Char;
  I, Len: Integer;
  FactLen, FactDiv: Int64;
begin
  Len := Length(S);
  if Len = 0 then
  begin
    Result := 0;
    Exit;
  end;

  FillChar(Counts, SizeOf(Counts), 0);

  for I := 1 to Len do
    Inc(Counts[S[I]]);

  FactLen := Factorial(Len);
  FactDiv := 1;

  for Ch := Low(Char) to High(Char) do
  begin
    if Counts[Ch] > 0 then
      FactDiv := FactDiv * Factorial(Counts[Ch]);
  end;

  Result := FactLen div FactDiv;
end;

// ฟังก์ชันแยกคำด้วยตัวแยกที่กำหนด (ใช้บน Delphi 7)
procedure SplitString(const S: string; Delimiters: array of Char; Parts: TStringList);
var
  I, J, StartIdx: Integer;
  IsDelim: Boolean;
  SubStr: string;
begin
  Parts.Clear;
  StartIdx := 1;

  for I := 1 to Length(S) do
  begin
    IsDelim := False;

    for J := Low(Delimiters) to High(Delimiters) do
    begin
      if S[I] = Delimiters[J] then
      begin
        IsDelim := True;
        Break;
      end;
    end;

    if IsDelim then
    begin
      SubStr := Trim(Copy(S, StartIdx, I - StartIdx));
      if SubStr <> '' then
        Parts.Add(SubStr);
      StartIdx := I + 1;
    end;
  end;

  if StartIdx <= Length(S) then
  begin
    SubStr := Trim(Copy(S, StartIdx, Length(S) - StartIdx + 1));
    if SubStr <> '' then
      Parts.Add(SubStr);
  end;
end;

// ฟังก์ชันหลักคำนวณยอดเงินรวม
function CalculateTotalAmount(RichEdit: TRichEdit): Double;
var
  I, PermCount: Integer;
  Line, NumStr, Arg1, Arg2, Arg3: string;
  Parts: TStringList;
  Val1, Val2, Val3: Double;
  TotalSum, LineAmount: Double;
  Code1, Code2, Code3: Integer;
begin
  TotalSum := 0;
  Parts := TStringList.Create;
  try
    for I := 0 to RichEdit.Lines.Count - 1 do
    begin
      Line := Trim(RichEdit.Lines[I]);

      // ข้ามบรรทัดที่ไม่มีเครื่องหมายเท่ากับ
      if (Line = '') or (Pos('=', Line) = 0) then
        Continue;

      // แยกข้อความด้วยเครื่องหมาย = และ *
      SplitString(Line, ['=', '*'], Parts);
      LineAmount := 0;

      // -------------------------------------------------------------
      // เงื่อนไขที่ 5: มีเลข 2 ชุด (เช่น 123=20 หรือ 1=2000)
      // -------------------------------------------------------------
      if Parts.Count = 2 then
      begin
        Val(Parts[1], Val1, Code1);
        if Code1 = 0 then
          LineAmount := Val1;
      end
      // -------------------------------------------------------------
      // กรณีมีเลข 3 ชุด (เช่น 123=20*6, 123=20*20)
      // -------------------------------------------------------------
      else if Parts.Count = 3 then
      begin
        NumStr := Parts[0]; // ชุดตัวเลขหน้า เช่น "123", "1234", "12"
        Arg1 := Parts[1];   // เลขหลัง =
        Arg2 := Parts[2];   // เลขหลัง *

        Val(Arg1, Val1, Code1);
        Val(Arg2, Val2, Code2);

        if (Code1 = 0) and (Code2 = 0) then
        begin
          // เงื่อนไขที่ 4: เลขหน้าเป็น 2 digit -> เอาเลขหลัง = มาบวกกัน (12=20*20 -> 20+20)
          if Length(NumStr) = 2 then
          begin
            LineAmount := Val1 + Val2;
          end
          // เลขหน้าเป็น 3 digit หรือ 4 digit
          else if (Length(NumStr) = 3) or (Length(NumStr) = 4) then
          begin
            PermCount := GetUniquePermutationsCount(NumStr);

            // เช็คว่าเลขตัวหลังสุดเท่ากับ Permutation ของเลขชุดหน้าหรือไม่
            if Round(Val2) = PermCount then
            begin
              // เงื่อนไขที่ 1: เลขหลังสุดเป็น Permutation -> เอาเลขหลัง = มาคูณกัน
              LineAmount := Val1 * Val2;
            end
            else
            begin
              if Length(NumStr) = 3 then
              begin
                // เงื่อนไขที่ 2: เลขหน้า 3 digit + ไม่ใช่ Permutation -> เอาเลขหลัง = มาบวกกัน
                LineAmount := Val1 + Val2;
              end
              else if Length(NumStr) = 4 then
              begin
                // เงื่อนไขที่ 3: เลขหน้า 4 digit + ไม่ใช่ Permutation ->
                // เอาเลขติด = (Val1) คูณกับ Permutation ของเลข 4 ตัว
                LineAmount := Val1 * PermCount;
              end;
            end;
          end;
        end;
      end
      // -------------------------------------------------------------
      // เพิ่มเติม: กรณีมีเลข 4 ชุด (เช่น 123=20*5*10 หรือ 122=20*2*10)
      // -------------------------------------------------------------
      else if Parts.Count = 4 then
      begin
        NumStr := Parts[0]; // ชุดตัวเลขหน้า เช่น "123", "122"
        Arg1 := Parts[1];   // เลขหลัง = เช่น "20"
        Arg2 := Parts[2];   // เลขหลัง * ตัวแรก เช่น "5" หรือ "2"
        Arg3 := Parts[3];   // เลขหลัง * ตัวสอง เช่น "10"

        Val(Arg1, Val1, Code1);
        Val(Arg2, Val2, Code2);
        Val(Arg3, Val3, Code3);

        if (Code1 = 0) and (Code2 = 0) and (Code3 = 0) then
        begin
          // เช็คว่าเป็นเลข 3 digit
          if Length(NumStr) = 3 then
          begin
            PermCount := GetUniquePermutationsCount(NumStr);

            // เช็คว่าเลขชุดที่ 3 (Arg2) เท่ากับ Permutation - 1 หรือไม่
            if Round(Val2) = (PermCount - 1) then
            begin
              // คำนวณตามสูตร: ชุดที่ 2 + (ชุดที่ 3 * ชุดที่ 4)
              LineAmount := Val1 + (Val2 * Val3);
            end;
          end;
        end;
      end;

      TotalSum := TotalSum + LineAmount;
    end;
  finally
    Parts.Free;
  end;

  Result := TotalSum;
end;


Procedure TfrmInputText.ReadWord(InputString: string);//เก็บข้อความทีละประโยค
var
     i,j,lenDwn,NumLen: integer;
     aChar: char;
     InpStr,StrOut,Items,Time,Num,NumLine,Pr,Price,StrDwn,StrUp,StrRun,P1,StrLeft,StrRight,
     StrTop,StrDown,StrUpDwn,StrDwnUp,StrSym,Str,HeadStr,Head,HeadPrn,PerMu,Separator1,Separator2: string;
     PrLeft,PrCenter,PrRight, PrNumOnly : String;
     ItemsOK,NumOK,SymOK,SCopy: Boolean;
     Heads: array[0..29] of String;
begin
  Separator1 := '################';
  Separator2 := '<----------------------------->';

  InpStr  := InputString;
  HeadStr := 'Top';
  Head := '';
  NumLen := 0;

  Heads[0] := '1 Float'; //วิ่งบน
  Heads[1] := 'Left-Top';  //ปักหนัาบน
  Heads[2] := 'Center-Top'; //ปักกลางบน
  Heads[3] := 'Right-Top'; //ปักขวาบน
  Heads[4] := 'FD'; //วิ่งล่าง
  Heads[5] := 'Left-Down'; //ปักหน้าล่าง
  Heads[6] := 'Right-Down'; //ปักหลังล่าง
  Heads[7] := '2 Top'; //2 ตัวบน
  Heads[8] := '2 Tod'; //2 ตัวโต๊ด
  Heads[9] := '2 Float'; //2 ตัวมี
  Heads[10] := 'Left-Top'; //2 ตัวหน้า
  Heads[11] := 'Split-Top'; //2 ตัวถ่าง
  Heads[12] := '2 Down'; //2 ตัวล่าง
  Heads[13] := '3 Top'; //3 ตัวเต็ง
  Heads[14] := '3 Float';  //3 ตัวโต๊ด
  Heads[15] := '3 Top';  //3 ตัวเต็งโต๊ด
  Heads[16] := '3 Down'; //3 ตัวล่าง เลิกใช้ไปแล้ว
  Heads[17] := '4 Top';  //4 ตัวตรง
  Heads[18] := '4 Float'; //4 ตัวลอยแพ
  Heads[19] := '4 Translate'; //4 ตัวลอยแพ
  Heads[20] := '5 Top';   //5 ตัวตรง
  Heads[21] := '5 Float'; //5 ตัวลอยแพ
  Heads[22] := '5 Translate'; //4 ตัวลอยแพ
  Heads[23] := 'เธเธ'; //คำว่า บน
  Heads[24] := 'เธฅเนเธฒเธ'; //คำว่า ล่าง
  Heads[25] := 'เธงเธดเนเธ'; //คำว่าวิ่ง
  Heads[26] := 'เนเธ'; //คำว่าแพ
  Heads[27] := 'เธฅเธญเธข'; //คำว่าลอย
  Heads[28] := 'Top-Down';
  Heads[29] := 'Float';

  lenDwn := length(StrDwn);
  if trim(NumList.Text) = '' then
  begin
    NumList.Lines.Add(Separator1);
  end
  else
    NumList.Lines.Add(Separator1);

    Str := '';
    StrOut := '';
    NumLen := 0;
    for i := 0 to Length(InpStr) do
    begin
       aChar := InpStr[i];
       if i > 0 then
        Str := Str+String(aChar);

       Application.ProcessMessages;

       if ( (aChar=#10) ) then //จบบรรทัด
       begin
        Str := Trim(Str);
        Str := Replace(Str,'...',''); //อักขระที่ไม่รู้โผล่มาจากไหน
        Str := DateFilter(Str); //กรองเอาวันที่ในข้อความใน Line ออก
        for j := 1 to CountOccur(':',Str) do
          Str := TimeFilter(Str); //กรองเอาเวลาในข้อความใน Line ออก
        //Showmessage(Str);

         if Str <> '' then
         begin
           Str := Replace(Str,'*5=','*5*');
           Str := Replace(Str,'*2=','*2*');

           if (IsLastStr(Str,'/')) then
             Str := ReplaceLast(Str,'/','');
           if (IsLastStr(Str,'-')) then
             Str := ReplaceLast(Str,'-','');
           if (IsLastStr(Str,'+')) then
             Str := ReplaceLast(Str,'+','');

           if CountOccur('*',Str) > 1 then
             if (IsLastStr(Str,'*')) then
               Str := ReplaceLast(Str,'*','');

           if CountOccur('*',Str) > 1 then
             if (Pos('=*',Str) > 0) then
               Str := Replace(Str,'=*','=');

           if CountOccur(':',Str) = 1 then
             Str := Replace(Str,':','=');

           if CountOccur('/',Str) > 0 then
           begin
            if CountOccur('=',Str) > 0 then
            begin
              Str := ReplaceChr(Str,'/','*')
            end;
           end;

           if IsLonelyLetter(Str,'T') then //Ex 123=110t100, 122=110T100, 123=110/100
             Str := ReplaceLonelyLetter(str,'T','*');

           if IsLonelyLetter(Str,'ต') then //Ex 123=110t100, 122=110T100, 123=110/100
             Str := ReplaceLonelyLetter(str,'ต','*');

           if IsLonelyLetter(Str,'.') then //Ex 123.110*50
             Str := ReplaceLonelyLetter(str,'.','=');

           //Showmessage(Str);

           StrOut := StrFilter(Str);

           if CountOccur('=',StrOut) = 0 then
            StrOut := ReplaceSpaceToEQ(StrOut);

           //Showmessage(StrOut);

           if CountOccur('-',StrOut) = 1 then
           begin
            StrLeft  := Copy(StrOut,1,Pos('-',StrOut)-1);
            StrRight := Copy(StrOut,Pos('-',StrOut)+1,Length(StrOut)-Pos('-',StrOut));

            if IsFoundNum(StrLeft) and IsFoundNum(StrRight) then
            begin
              if (StrOut[1]+StrOut[2] <> StrOut[5]+StrOut[4]) then
                StrOut := Replace(StrOut,'-','=');
            end;
            //else
            if CountOccur('=',StrOut) > 0 then
            begin
              P1 := Copy(StrOut,Pos('=',StrOut)+1,Length(StrOut)-Pos('=',StrOut));
              StrOut := StrOut[1]+StrOut[2]+'='+P1+'*'+P1;
            end;
           end;

           if Not((Pos('*2*',StrOut) > 0) Or (Pos('*5*',StrOut) > 0)) then
           begin
            if CountOccur('=',StrOut) > 1 then  //Ex 123=100=40*6 ,122=100=40*3
              if Not IsLeftStr(StrOut,'=') then
                StrOut := ChangeLonelyNum(StrOut); //Ex 123=140*5*40 ,122=140*2*40

            if (CountOccur('*',StrOut) > 1) and (CountOccur('=',StrOut) > 0) then
               StrOut := ChangeLonelyNum(StrOut); //Ex 123=140*5*40 ,122=140*2*40
           end;

           if CountOccur('*',StrOut) > 1 then
             if (IsLastStr(StrOut,'*')) then
               StrOut := ReplaceLast(StrOut,'*','');

           if CountOccur('=',StrOut) > 1 then
             if IsLeftStr(StrOut,'=') then
               StrOut := ReplaceLeft(StrOut,'=','');

           //Showmessage(StrOut);

           if IsNumStarNum(StrOut) then  //Ex 79*100 , 123x100
           begin
             StrOut := NumStarNum(StrOut);
           end;

           if IsEqlAstr(StrOut,'*') then //=*  When the asterisk is found Look at the last letter to see if it is an equal sign or not.
           begin
             if (IsLastStr(StrOut,'*6') or IsLastStr(StrOut,'*3'))  then
               StrOut := Replace(StrOut,'=*','=');
           end;

           if (CountOccur( '*',StrOut) > 1) and (CountOccur( '=',StrOut) = 0) then //123*100*6, 122*100*3
           begin
             if (IsLastStr(StrOut,'*6') or IsLastStr(StrOut,'*3'))  then
               StrOut := ReplaceFirst(StrOut,'*','=');
           end;

           if (CountOccur( '=',StrOut) > 1) and  (CountOccur( '*',StrOut) = 0) then //????????????? = ??????? 1 ??? ???????? *
           begin
             if (Pos('=',Trim(StrOut)) = 1)  then
               StrOut := ReplaceLeft(Trim(StrOut),'=','');

             if (Pos('=',Trim(StrOut)) > 1)  then
               StrOut := ReplaceNext(Trim(StrOut),'=','*');
           end;
         end;

         //Showmessage(Str);
         if (Pos('5 Float',Str)   > 0) then HeadStr := '5 Float' else
         if (Pos('5 Top',Str)   > 0) then HeadStr := '5 Top' else
         if (Pos('4 Float',Str)   > 0) then HeadStr := '4 Float' else
         if (Pos('4 Top',Str)   > 0) then HeadStr := '4 Top' else
         if (Pos('3 Float',Str)   > 0) then HeadStr := '3F' else
         if (Pos('3 Down',Str)  > 0) then HeadStr := '3D' else
         if (Pos('Left-Top',Str)   > 0) then HeadStr := 'LT' else
         if (Pos('Split-Top',Str)  > 0) then HeadStr := '2ST' else
         if (Pos('Top-Down',Str)     > 0) then HeadStr := 'TD' else
         if (Pos('Top',Str) > 0) and (Pos('Down',Str) > 0) then HeadStr := 'TD' else
         if (Pos('Left-Top',Str)     > 0) then HeadStr := 'LT' else
         //if (Pos('Left',Str)     > 0) then HeadStr := 'LT' else
         if (Pos('Center-Top',Str)   > 0) then HeadStr := 'CT' else
         if (Pos('Right-Top',Str)    > 0) then HeadStr := 'RT' else
         if (Pos('Right-Top',Str)    > 0) then HeadStr := 'RT' else
         if (Pos('FD',Str)           > 0) then HeadStr := 'Float-Down' else
         if (Pos('Left-Down',Str)    > 0) then HeadStr := 'LD' else
         if (Pos('Right-Down',Str)   > 0) then HeadStr := 'RD' else

         if (Pos('Top',Str)  = 0) and (Pos('Down',Str)   = 0) and (Pos('Float',Str) > 0) and
            (Pos('Left',Str) = 0) and (Pos('Center',Str) = 0) and (Pos('Right',Str) = 0) then HeadStr := 'Float' else
         if (Pos('Top',Str)  > 0) and (Pos('Down',Str)   = 0) and (Pos('Float',Str) > 0) and
            (Pos('Left',Str) = 0) and (Pos('Center',Str) = 0) and (Pos('Right',Str) = 0) then HeadStr := 'Float' else
         if (Pos('Top',Str)  = 0) and (Pos('Down',Str)   > 0) and (Pos('Float',Str) > 0) and
            (Pos('Left',Str) = 0) and (Pos('Center',Str) = 0) and (Pos('Right',Str) = 0) then HeadStr := 'Float-Down' else
         if (Pos('Top',Str)  > 0) and (Pos('Down',Str)   > 0) and (Pos('Float',Str) = 0) and
            (Pos('Left',Str) = 0) and (Pos('Center',Str) = 0) and (Pos('Right',Str) = 0) then HeadStr := 'Top-Down' else
         if (Pos('Top',Str)  > 0) and (Pos('Down',Str)   = 0) and (Pos('Float',Str) = 0) and
            (Pos('Left',Str) = 0) and (Pos('Center',Str) = 0) and (Pos('Right',Str) = 0) then HeadStr := 'Top' else
         if (Pos('Top',Str)  = 0) and (Pos('Down',Str)   > 0) and (Pos('Float',Str) = 0) and
            (Pos('Left',Str) = 0) and (Pos('Center',Str) = 0) and (Pos('Right',Str) = 0) then HeadStr := 'Down' else

         if (Pos('Top',Str)  > 0) and (Pos('Split',Str)  > 0) and (Pos('Float',Str) = 0) and
            (Pos('Left',Str) = 0) and (Pos('Center',Str) = 0) and (Pos('Right',Str) = 0) then HeadStr := '2ST' else
         if (Pos('Top',Str)  > 0) and (Pos('Down',Str)   = 0) and (Pos('Float',Str) = 0) and
            (Pos('Left',Str) > 0) and (Pos('Center',Str) = 0) and (Pos('Right',Str) = 0) then HeadStr := 'LT' else
         if (Pos('Top',Str)  = 0) and (Pos('Down',Str)   > 0) and (Pos('Float',Str) = 0) and
            (Pos('Left',Str) > 0) and (Pos('Center',Str) = 0) and (Pos('Right',Str) = 0) then HeadStr := 'LD' else
         if (Pos('Top',Str)  = 0) and (Pos('Down',Str)   = 0) and (Pos('Float',Str) = 0) and
            (Pos('Left',Str) > 0) and (Pos('Center',Str) = 0) and (Pos('Right',Str) = 0) then HeadStr := 'LT' else
         if (Pos('Top',Str)  > 0) and (Pos('Down',Str)   = 0) and (Pos('Float',Str) = 0) and
            (Pos('Left',Str) = 0) and (Pos('Center',Str) > 0) and (Pos('Right',Str) = 0) then HeadStr := 'CT' else
         if (Pos('Top',Str)  = 0) and (Pos('Down',Str)   = 0) and (Pos('Float',Str) = 0) and
            (Pos('Left',Str) = 0) and (Pos('Center',Str) > 0) and (Pos('Right',Str) = 0) then HeadStr := 'CT' else
         if (Pos('Top',Str)  > 0) and (Pos('Down',Str)   = 0) and (Pos('Float',Str) = 0) and
            (Pos('Left',Str) = 0) and (Pos('Center',Str) = 0) and (Pos('Right',Str) > 0) then HeadStr := 'RT' else
         if (Pos('Top',Str)  = 0) and (Pos('Down',Str)   > 0) and (Pos('Float',Str) = 0) and
            (Pos('Left',Str) = 0) and (Pos('Center',Str) = 0) and (Pos('Right',Str) > 0) then HeadStr := 'RD' else
         if (Pos('Top',Str)  = 0) and (Pos('Down',Str)   = 0) and (Pos('Float',Str) = 0) and
            (Pos('Left',Str) = 0) and (Pos('Center',Str) = 0) and (Pos('Right',Str) > 0) then HeadStr := 'RT';// else

         Items := trim(StrOut);

         //------------กรองเอาสิ่งที่ไม่ต้องการออก และะปลี่ยนข้อความให้ถูกต้อง-----------//
         if (CountCharInStr('-',Items) = 1) and (CountCharInStr('=',Items) = 0) then
           Replace(Items, '-', '=');

         if IsSymbolOnly(Items) then
           Replace(Items, Items, '');

         Replace(Items, ':', '=');

         //------------กรองเอาสิ่งที่ไม่ต้องการออก และะปลี่ยนข้อความให้ถูกต้อง-----------//


            if (Pos('=',Items) > 0) and (CountCharInStr('=',Items) = 1) then
            begin
                 Num := trim(Copy(Items,1,Pos('=',Items)-1)); //เก็บดิบๆมา ส่วนที่อยู่ก่อนเครื่องหมาย =
                 Num := Replace(trim(Num), ' ', ''); //เคลียร์ช่องว่างออก


                 Pr  := trim(Copy(Items,Pos('=',Items)+1,length(Items)-Pos('=',Items)));
                 
                 Pr  := Replace(trim(Pr), '+', '*'); //เปลี่ยนเครื่องหมาย + เป็น *

                 if CountCharInStr(' ',Pr) < 4 then
                  Pr  := Replace(trim(Pr), ' ', ''); //เคลียร์ช่องว่างออก

                 if IsDoubleLast(Pr) and (Not(IsLastStr(Pr,'*5')) Or Not(IsLastStr(Pr,'*2')) )  then  //ex 123=44+33*33,  23=44*33*33
                  Pr := ReplaceDoubleLast(Num,Pr);
            end
            else
            if (Pos(' ',Items) <> 0) then
            begin
                 Num   := trim(Copy(Items,1,Pos(' ',Items)-1));
                 Num := Replace(trim(Num), ' ', ''); //เคลียร์ช่องว่างออก

                 Pr  := trim(Copy(Items,Pos(' ',Items)+1,length(Items)-Pos(' ',Items)));
                 Pr  := Replace(trim(Pr), '+', '*'); //เปลี่ยนเครื่องหมาย + เป็น *
                 if CountCharInStr(' ',Pr) < 4 then
                  Pr  := Replace(trim(Pr), ' ', ''); //เคลียร์ช่องว่างออก

                 if IsDoubleLast(Pr) and (Not(IsLastStr(Pr,'*5')) Or Not(IsLastStr(Pr,'*2')) ) then //ex 123=44+33*33,  23=44*33*33
                  Pr := ReplaceDoubleLast(Num,Pr);
            end
            else
            if (Pos('-',Items) <> 0) and (CountCharInStr('-',Items) = 1) then
            begin
                 Num   := trim(Copy(Items,1,Pos('-',Items)-1));
                 Num := Replace(trim(Num), ' ', ''); //เคลียร์ช่องว่างออก

                 Pr  := trim(Copy(Items,Pos('-',Items)+1,length(Items)-Pos('-',Items)));
                 Pr  := Replace(trim(Pr), '+', '*'); //เปลี่ยนเครื่องหมาย + เป็น *
                 if CountCharInStr(' ',Pr) < 4 then
                  Pr  := Replace(trim(Pr), ' ', ''); //เคลียร์ช่องว่างออก
                 if IsDoubleLast(Pr) and (Not(IsLastStr(Pr,'*5')) Or Not(IsLastStr(Pr,'*2')) ) then //ex 123=44+33*33,  23=44*33*33
                  Pr := ReplaceDoubleLast(Num,Pr);
            end
            else
            if (CountCharInStr('-',Items) > 1) then
            begin
              Num := Items;
              Pr  := '';
            end;
            Pr  := Trim(Pr);

            if (IsLastStr(Pr,'*')) and (Length(Num) = 2) and (CountSymbol(Pr) = 1) then //ex 23=20*
            begin
              Pr := ReplaceLast(Pr,'*','');
              Pr := Pr+'*'+Pr;
            end;

            if (Length(Num) = 3) and (CountSymbol(Pr) = 1) then //ex 123=20-10
            begin
              Pr := Replace(Pr,'-','*');
            end;

            if (IsLastStr(Pr,'*5')) and (Length(Num) = 3) and (CountSymbol(Pr) > 1) then //ex 123=20*10*5
            begin
              if (Pos('*5*',Pr) = 0) and (Pos('*2*',Pr) = 0) then
              begin
                Pr := ReplaceLast(Pr,'*5','');
                Pr := Replace(Pr,'*','*5*');
              end;
            end;

            if (IsLastStr(Pr,'*2')) and (Length(Num) = 3) and (CountSymbol(Pr) > 1)  then //ex 122=20*10*2
            begin
              if (Pos('*5*',Pr) = 0) and (Pos('*2*',Pr) = 0) then
              begin
                Pr := ReplaceLast(Pr,'*2','');
                Pr := Replace(Pr,'*','*2*');
              end;
            end;

            if (IsLastStr(Pr,'*')) and (Length(Num) = 3) and (CountSymbol(Pr) = 1) then //ex 123=20*
            begin
              PerMu := IntToStr(Permutation(Num));
              Pr := Pr+PerMu;
            end;

            if (IsLastStr(Pr,'*')) and (Length(Num) = 4) and (CountSymbol(Pr) = 1) then //ex 1234=20*
            begin
              PerMu := IntToStr(Permutation(Num));
              Pr := Pr+PerMu;
            end;

            if (IsLastStr(Pr,'*')) and (Length(Num) = 5) and (CountSymbol(Pr) = 1) then //ex 12345=20*
            begin
              PerMu := IntToStr(Permutation(Num));
              Pr := Pr+PerMu;
            end;

      //---------------------------------------------------------------------------------------------------//
            if IsNumOnly(Num) and Not(IsSymbolOnly(Pr)) then //ตรวจสอบความถูกต้องก่อนนำไป Add to Memo
            begin
              if CountNum(Num) = 1 then
              begin
                if IsNumOnly(Num) and IsNumOnly(Pr) then
                  NumLine := Num+'='+Pr
              end
              else
              if CountNum(Num) = 2 then
              begin
                if (IsNumOnly(Num) and IsNumOnly(Pr)) Or (IsKlub(Num,Pr)) then
                  NumLine := Num+'='+Pr
              end
              else
              if CountNum(Num) = 3 then
              begin
                if (IsNumOnly(Num) and IsNumOnly(Pr)) Or IsTengStarTod(Num,Pr) Or IsSetMulti(Num,Pr) Or IsMulTi1512(Num,Pr) then
                  NumLine := Num+'='+Pr
              end
              else
              if CountNum(Num) = 4 then
              begin
                if (IsNumOnly(Num) and IsNumOnly(Pr)) Or Is4Trans(Num,Pr) then
                  NumLine := Num+'='+Pr
              end
              else
              if CountNum(Num) = 5 then
              begin
                if (IsNumOnly(Num) and IsNumOnly(Pr)) Or Is5Trans(Num,Pr) then
                  NumLine := Num+'='+Pr
              end
              else
                NumLine := Num;
            end
            else
              NumLine := Num;

            if Length(NumLine) > CountToLastNum(NumLine) then
              NumLine := Copy(NumLine,1,Length(NumLine)-(Length(NumLine)-CountToLastNum(NumLine))); //ถ้าตัวสุดท้ายไม่เป็นตัวเลขให้ตัดออก

            //Showmessage(Numline);  

      //---------------------------------------------------------------------------------------------------//
            if (Pos('=', NumLine) > 0) then //เพิ่มเปอร์เซ็นให้เลข 3 ตัว
            Begin
              Num := Trim(Copy(NumLine,1,Pos('=',NumLine)-1));
              Pr  := Trim(Copy(NumLine,Pos('=',NumLine)+1,length(NumLine)-Pos('=',NumLine)));
              if (CountNum(Num) = 3) and (ChkAddPercent.Checked) then
              begin
                if (CountOccur('*',NumLine) = 0) then
                begin
                  PrLeft := Copy(NumLine,Pos('=',NumLine)+1,Length(NumLine)-Pos('=',NumLine));
                  NumLine := Num+'='+FormatFloat('##0.#',Round(StrToInt(PrLeft)*(100+edPercent.Value)/100));
                end
                else
                if (CountOccur('*',NumLine) = 1) then
                begin
                  PrLeft := Copy(NumLine,Pos('=',NumLine)+1,PosFirstSymbol(NumLine)-Pos('=',NumLine)-1);
                  PrRight:= Copy(NumLine,PosFirstSymbol(NumLine)+1,Length(NumLine)-PosFirstSymbol(NumLine)+1);
                  NumLine := Num+'='+FormatFloat('##0.#',Round(StrToInt(PrLeft)*(100+edPercent.Value)/100))+'*'+PrRight
                end
                else
                if (CountOccur('*',NumLine) = 2) then
                begin
                  PrLeft := Copy(NumLine,Pos('=',NumLine)+1,PosFirstSymbol(NumLine)-Pos('=',NumLine)-1);
                  PrCenter := Copy(NumLine,PosFirstSymbol(NumLine),3);
                  PrRight:= Copy(NumLine,PosLastSymbol(NumLine)+1,Length(NumLine)-PosLastSymbol(NumLine)+1);
                  NumLine := Num+'='+FormatFloat('##0.#',Round(StrToInt(PrLeft)*(100+edPercent.Value)/100))+PrCenter+FormatFloat('##0.#',Round(StrToInt(PrRight)*(100+edPercent.Value)/100));
                end;
              end;
            end;

          //<----------------------------------------------------------------------->
          if CountCharInStr('=',NumLine) = 1 then
          begin
            if ChkOverPr.Checked then
            begin
              PrNumOnly := Copy(Numline,Pos('=',NumLine)+1,Length(NumLine)-Pos('=',NumLine));
              if IsNumOnly(PrNumOnly) then
                if (StrToInt(PrNumOnly) >= edtOverPr.Value) then
                  Showmessage('ตรวจพบราคาผิดปกติจาก '+Numline);
            end;

            if (HeadStr <> Head) then //เจอหัวประเภทเลข แต่เปลี่ยนจากอันเดิม
            begin
              if NumList.Lines[NumList.Lines.Count-1] <> Separator2 then
                NumList.Lines.Add(Separator2);

              if (CountNum(Num) = 1) then
              begin
                if (HeadStr = 'Top') Or (HeadStr = 'Float') then
                begin
                  HeadPrn := 'วิ่งบน';
                  //HeadStr := 'Top';
                  HeadStr := 'Float';
                end;

                if (HeadStr = 'LT') Or (HeadStr = '2LT') then
                begin
                  HeadPrn := 'ปักหน้าบน';
                  HeadStr := 'LT';
                end;

                if (HeadStr = 'CT') then
                begin
                  HeadPrn := 'ปักกลางบน';
                  HeadStr := 'CT';
                end;

                if (HeadStr = 'RT') then
                begin
                  HeadPrn := 'ปักหลังบน';
                  HeadStr := 'RT';
                end;

                if (HeadStr = 'Down') Or (HeadStr = 'Float-Down') then
                begin
                  HeadPrn := 'วิ่งล่าง';
                  HeadStr := 'Down';
                end;

                if (HeadStr = 'LD') then
                begin
                  HeadPrn := 'ปักหน้าล่าง';
                  HeadStr := 'LD';
                end;

                if (HeadStr = 'RD') then
                begin
                  HeadPrn := 'ปักหลังล่าง';
                  HeadStr := 'RD';
                end;
              end;

              if (CountNum(Num) = 2) then
              begin
                if HeadStr = 'Top' then
                begin
                  HeadPrn := '2 ตัวบน';
                  HeadStr := 'Top';
                end;

                //if (HeadStr = '2LT') Or (HeadStr = 'LT') Or (HeadStr = 'LD') then
                if (HeadStr = 'LT') then // Or (HeadStr = 'LD') then
                begin
                  HeadPrn := '2 ตัวหน้าบน';
                  HeadStr := 'LT';
                end;

                if (HeadStr = '2ST') then
                begin
                  HeadPrn := '2 ตัวถ่างบน';
                  HeadStr := '2ST';
                end;

                if HeadStr = 'Down' then
                begin
                  HeadPrn := '2 ตัวล่าง';
                  HeadStr := 'Down';
                end;

                if (HeadStr = Heads[0]) Or (HeadStr = 'Float') then
                begin
                  HeadPrn := '2 ตัวมี';
                  HeadStr := 'Float';
                end;
              end;

              if (CountNum(Num) = 3) then
              begin
                if (HeadStr = '3F') Or (HeadStr = '3 FLoat') then
                begin
                  HeadPrn := '3 ตัวโต๊ด';
                  HeadStr := '3F';
                end
                else
                if (HeadStr = '3D') then
                begin
                  HeadPrn := '3 ตัวล่าง';
                  HeadStr := '3D';
                end
                else
                if (HeadStr = 'Tod') then
                begin
                  HeadPrn := '3 ตัวโต๊ด';
                  HeadStr := 'Tod';
                end
                else
                if (HeadStr = 'Float') then
                begin
                  HeadPrn := '3 ตัวโต๊ด';
                  HeadStr := 'Float';
                end
                else
                if HeadStr = 'Down' then
                begin
                  HeadPrn := '3 ตัวล่าง';
                  HeadStr := 'Down';
                end
                else
                begin
                  HeadPrn := '3 ตัวบน';
                  HeadStr := 'Top';
                end;
              end;

              if (CountNum(Num) = 4) then
              begin
                if IsNumOnly(Pr) then
                begin
                  if (HeadStr = 'Float') then// or (HeadStr = 'Top')  then
                  begin
                    HeadPrn := '4 ตัวลอยแพ';
                    if (HeadStr = 'Float') then
                      HeadStr := 'Float'
                  end
                  else
                  begin
                    if (HeadStr = 'Top')  then
                    begin
                      HeadPrn := '4 ตัวบน';
                      HeadStr := 'Top'
                    end;
                  end;
                end
                else
                begin
                  HeadPrn := '3 ตัวบน';
                  HeadStr := 'Top';
                end;
              end;

              if (CountNum(Num) = 5) then
              begin
                if IsNumOnly(Pr) then
                begin
                  if (HeadStr = 'Float') then// or (HeadStr = 'Top')  then
                  begin
                    HeadPrn := '5 ตัวลอยแพ';
                    if (HeadStr = 'Float') then
                      HeadStr := 'Float'
                  end
                  else
                  begin
                    if (HeadStr = 'Top')  then
                    begin
                      HeadPrn := '5 ตัวบน';
                      HeadStr := 'Top'
                    end;
                  end;
                end
                else
                begin
                  //HeadPrn := '3 Top';
                  HeadPrn := '3 ตัวบน';
                  HeadStr := 'Top';
                end;
              end;
              NumLen := CountNum(Num);
              Head := HeadStr;

              if (HeadStr = 'TD') then
              begin
                if NumLen > 1 then
                begin
                  NumList.Lines.Add('['+IntToStr(NumLen)+' ตัวบน]');
                  NumList.Lines.Add(NumLine);
                  NumList.Lines.Add('<----------------------------->');

                  NumList.Lines.Add('['+IntToStr(NumLen)+' ตัวล่าง]');
                  NumList.Lines.Add(NumLine);
                  NumList.Lines.Add('<----------------------------->');
                end
                else
                begin
                  NumList.Lines.Add('[วิ่งบน]');
                  NumList.Lines.Add(NumLine);
                  NumList.Lines.Add('<----------------------------->');

                  NumList.Lines.Add('[วิ่งล่าง]');
                  NumList.Lines.Add(NumLine);
                  NumList.Lines.Add('<----------------------------->');
                end;
              end
              else
              begin
                NumList.Lines.Add('['+HeadPrn+']');
                NumList.Lines.Add(NumLine);
              end;
            end
            else //หัวประเภทเลขเดิม
            begin
              if (CountNum(Num) <> NumLen) then //จำนวนตัวเลขไม่เท่ากับเลขล่าสุด
              begin
                if NumList.Lines[NumList.Lines.Count-1] <> '<----------------------------->' then
                  NumList.Lines.Add('<----------------------------->');

                  if (CountNum(Num) = 1) then
                  begin
                    if (HeadStr = 'Top') Or (HeadStr = 'Float') then
                    begin
                      HeadPrn := 'วิ่งบน';
                      //HeadStr := 'Top';
                      HeadStr := 'Float';
                    end;

                    if (HeadStr = 'LT') then
                    begin
                      HeadPrn := 'ปักหน้าบน';
                      HeadStr := 'LT';
                    end;

                    if (HeadStr = 'CT') then
                    begin
                      HeadPrn := 'ปักกลางบน';
                      HeadStr := 'CT';
                    end;

                    if (HeadStr = 'RT') then
                    begin
                      HeadPrn := 'ปักหลังบน';
                      HeadStr := 'RT';
                    end;

                    if (HeadStr = 'LD') then
                    begin
                      HeadPrn := 'ปักหน้าล่าง';
                      HeadStr := 'LD';
                    end;

                    if (HeadStr = 'RD') then
                    begin
                      HeadPrn := 'ปักหลังล่าง';
                      HeadStr := 'RD';
                    end;

                    if (HeadStr = 'Down') Or (HeadStr = 'FD') Or (HeadStr = 'Float-Down') then
                    begin
                      HeadPrn := 'วิ่งล่าง';
                      HeadStr := HeadStr;
                    end;
                  end;

                  if (CountNum(Num) = 2) then
                  begin
                    if (HeadStr = 'Top') then //Or (HeadStr = 'Float') then
                    begin
                      HeadPrn := '2 ตัวบน';
                      HeadStr := 'Top';
                    end;

                    if HeadStr = 'LT' then
                    begin
                      HeadPrn := '2 ตัวหน้าบน';
                      HeadStr := '2LT';
                    end;

                    if HeadStr = '2ST' then
                    begin
                      HeadPrn := '2 ตัวถ่างบน';
                      HeadStr := '2ST';
                    end;

                    if (HeadStr = 'Down') Or (HeadStr = 'FD')  then
                    begin
                      HeadPrn := '2 ตัวล่าง';
                      HeadStr := 'Down';
                    end;

                    if HeadStr = 'Float' then
                    begin
                      HeadPrn := '2 ตัวมี';
                      HeadStr := 'Float';
                    end;
                  end;

                  if (CountNum(Num) = 3) then
                  begin
                    HeadPrn := '3 ตัวบน';
                    HeadStr := 'Top'
                  end;

                  if (CountNum(Num) = 4) then // and IsNumOnly(Pr) then
                  begin
                    if IsNumOnly(Pr) then
                    begin
                      HeadPrn := '4 ตัวลอยแพ';
                      if (HeadStr = 'Float') then
                        HeadStr := 'Float'
                      else
                        HeadStr := 'Top'
                    end
                    else
                    begin
                      HeadPrn := '3 ตัวบน';
                      HeadStr := 'Top';
                    end;
                  end;

                  if (CountNum(Num) = 5) then// and IsNumOnly(Pr) then
                  begin
                    if IsNumOnly(Pr) then
                    begin
                      HeadPrn := '5 ตัวลอยแพ';
                      if (HeadStr = 'Float') then
                        HeadStr := 'Float'
                      else
                        HeadStr := 'Top'
                    end
                    else
                    begin
                      HeadPrn := '3 ตัวบน';
                      HeadStr := 'Top';
                    end;
                  end;

                NumLen := CountNum(Num);
                Head := HeadStr;

                if (HeadStr = 'TD') then
                begin
                  if NumLen > 1 then
                  begin
                    NumList.Lines.Add('['+IntToStr(NumLen)+' ตัวบน]');
                    NumList.Lines.Add(NumLine);
                    NumList.Lines.Add('<----------------------------->');

                    NumList.Lines.Add('['+IntToStr(NumLen)+' ตัวล่าง]');
                    NumList.Lines.Add(NumLine);
                    NumList.Lines.Add('<----------------------------->');
                  end
                  else
                  begin
                    NumList.Lines.Add('[วิ่งบน]');
                    NumList.Lines.Add(NumLine);
                    NumList.Lines.Add('<----------------------------->');

                    NumList.Lines.Add('[วิ่งล่าง]');
                    NumList.Lines.Add(NumLine);

                    NumList.Lines.Add('<----------------------------->');
                  end;
                end
                else  // เจอ HeadStr
                begin
                  NumList.Lines.Add('['+HeadPrn+']');
                  NumList.Lines.Add(NumLine);
                end;

              end
              else //จำนวนเลขเท่ากับอันล่าสุด
              begin
                NumLen := CountNum(Num);
                Head := HeadStr;
                if (HeadStr = 'TD') then
                begin
                  if NumLen > 1 then
                  begin
                    NumList.Lines.Add('['+IntToStr(NumLen)+' ตัวบน]');
                    NumList.Lines.Add(NumLine);
                    NumList.Lines.Add('<----------------------------->');

                    NumList.Lines.Add('['+IntToStr(NumLen)+' ตัวล่าง]');
                    NumList.Lines.Add(NumLine);
                    NumList.Lines.Add('<----------------------------->');
                  end
                  else
                  begin
                    NumList.Lines.Add('[วิ่งบน]');
                    NumList.Lines.Add(NumLine);
                    NumList.Lines.Add('<----------------------------->');

                    NumList.Lines.Add('[วิ่งล่าง]');
                    NumList.Lines.Add(NumLine);
                    NumList.Lines.Add('<----------------------------->');
                  end;
                end
                else  // ไม่เจอ HeadStr ใหม่ และ จำนวนเลขเท่าเดิม
                begin
                  NumList.Lines.Add(NumLine);
                end;
              end;
            end;
          end;
          Str := '';
          StrOut :='';
          Items := '';
          Num := '';
          Price := '';
          Pr := '';
        end;
      //end;
    end;
    if NumList.Lines[NumList.Lines.Count-1] <> Separator2 then
      NumList.Lines.Add(Separator2);

    lbSum.caption := 'ยอดรวม: '+FloatToStr(CalculateTotalAmount(NumList))+' บาท';
end;


procedure TfrmInputText.BtnClearClick(Sender: TObject);
begin
    if Not NumList.Enabled then
      NumList.Enabled := true;
      
    NumList.Clear;
    NumListChange(Sender);
    lbTotalNum.Caption := '0 รายการ';
    lbSum.Caption := 'ยอดรวม: 0 บาท';
    ChkTod.Checked := false;
    NumList.SetFocus;
end;

procedure TfrmInputText.NumListChange(Sender: TObject);
Var i, ToTalNum: integer;
    txtLine: string;
    foundPrice: Boolean;
begin
  if NumLIst.Focused then
  begin
    TotalNum := 0;
    With NumLIst do
    begin
        for i := 0 to Lines.Count-1 do
        begin
           txtLine := Lines[i];
           if txtLine <> '' then
           begin
              if (Pos('=',txtLine) > 0) then
              begin
                TotalNum := TotalNum+1;
              end;
              lbSum.caption := 'ยอดรวม: '+FloatToStr(CalculateTotalAmount(NumList))+' บาท';
           end;
        end;
        lbTotalNum.Caption := IntToStr(TotalNum)+' รายการ';
    end;
  end;
end;

procedure TfrmInputText.FormShow(Sender: TObject);
Var i, ToTalNum, LenDate : integer;
    QrLotType: TABSQuery;
    IniFile : TIniFile;
    Found: Boolean;
    CurCust,StrLastDate, StrKeyDate: String;
    ExprKeyDate: TDateTime;
    HardwareID: String;
    SerialNo: String;
    SerialInfo: TSerialInfo;
begin
  Try
    IniFile := TIniFile.Create(
             ChangeFileExt(Application.ExeName,'.ini'));

    edPercent.Value := IniFile.ReadFloat('INPUT','AddPercent',10);
    edtOverPr.Value := IniFile.ReadFloat('INPUT','PrWarn',5000);
    CanLockPr       := IniFile.ReadBool('Setting','LockMoney',false);
  finally
    IniFile.Free;
  end;

  HardwareID := GetHardwareID;
  SerialNo     := Read_RegistKey('Register','RegisKey');
  if (SerialNo = '') then
  begin
      Regis := False;
  end
  else
  begin
    Regis := True;
    SerialInfo := ValidateSerialWithExpiry(HardwareID, SerialNo);
    if not SerialInfo.IsValid then
    begin
      Regis := false;
    end;

    if SerialInfo.IsExpired then
    begin
      Regis := False;
    end;
  end;

  NumListChange(Sender);
  edCust.Text := IpCustID;
  if FindCust(edCust.Text) then
    ChkFoundCust.Checked := true
  else
    ChkFoundCust.Checked := false;

  edBookNo.Value := GetMaxBookForCust(edCust.Text);

  NumList.SetFocus;
end;

procedure TfrmInputText.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  //BtnImport.Enabled := (trim(NumList.Text) <> '')and(ChkFoundCust.Checked);
  BtnClear.Enabled  := NumList.Lines.Count > 0;
  BtnSaveImport.Enabled := NumList.Lines.Count > 0;
  BtnCopy.Enabled := NumList.Lines.Count > 0;
  N1.Enabled := length(trim(NumList.Text)) > 0;
  N41.Enabled := length(NumList.SelText)  > 0;
  N3.Enabled := length(NumList.SelText)  > 0;
end;

procedure TfrmInputText.edCustButtonClick(Sender: TObject);
begin
  with frmFindCust,Dm do
  begin
    if Showmodal = mrOk then
    begin
      Application.ProcessMessages;
      with CustList do
      begin
        ChkFoundCust.Checked := true;
        EdCust.Text := Items[selected.index].Caption;
        PanelCustName.Caption := ' '+Items[Selected.index].SubItems[0];
        edBookNo.Value := GetMaxBookForCust(edCust.Text);
        EdCust.SetFocus;

        if Pos('แถม',Items[ItemIndex].SubItems[2]) > 0 then
          ChkAddPerCent.Checked := true
        else
          ChkAddPerCent.Checked := false;
      end;
      NumList.SetFocus;
      if ChkNamePaste.Checked then
      begin
        NumList.Clear;
        PasteBtnClick(Sender);
      end;
    end;
  end;
end;

procedure TfrmInputText.edCustKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['0'..'9'] then
  begin
    ChkFoundCust.Checked := false;
    if Key = #13 then
    begin
      if FindCust(edCust.Text) then
        ChkFoundCust.Checked := true
      else
        ChkFoundCust.Checked := false;
      edCust.SetFocus;
      edCust.SelectAll;
      Key := #0;
    end;
  end
  else Key := #0;
end;

function TfrmInputText.GetClpBrd_Num(Num: String):String;
Var i,j,k,l,StartNum,StarPos,StarPos1,StarPos2,LastNumPos,NextNumPos,SpPos,TotalStar,TotalNumAr,CntEQ,
    LastLine_i,PosEQ,CountEQ1,CountStar,LineNo,StrEnd,StartStr,CountNum,CntGrpNum,EqPoint,LastNumPoint,StartChr: integer;
    Pri,P1,P2,P12,Str,SetStr,RemainStr,NumSet,NumState,LineStr,AllStr,Numb,Head,MidHead,Head2,LastLinePr,NumGrp: String;
    MultiSet,MultiSet2,Teng1512,FoundPr,Stoped: Boolean;
    Ch: Char;
    NumAr: Array of String;
    RedSet: TRichEdit;
    foundEQ: Boolean;
begin
  if Num = '' then
  begin
    exit;
  end;
  LastLine_i := 0;
  LineNo := 1;
  NumSet := '';
  LineStr := ''; //ข้อความแต่ละบรรทัด
  AllStr := '';  //ข้อความทั้งหมด
  SetStr := '';
  StartNum := 1;
  StartChr := 1;
  Setlength(NumAr,0);
  TotalNumAr := 0;

  for i := 1 to Length(Num) do
  begin
    if (Num[i] = #10) Or (i = Length(Num)) then //เมื่ออ่านข้อมความทีจะตัวอักษรจนจบบรรทัด หรือหมดข้อมความ
    begin
      foundEQ  := false; //กำหนดให้เจอเครื่องหมายเท่ากับ (=) เท่ากับ false
      LineStr  := trim(Copy(Num,StartChr,i-StartChr+1)); //เก็บข้อความบรรทัดนั้นไว้ในตัวแปร LineStr

      //Showmessage(LineStr);
     //--------------------------------------------------------------------------//
      LineStr := DateFilter(LineStr); //กรองเอาวันที่ในข้อความใน LineStr ออก
      for j := 1 to CountOccur(':',LineStr) do
        LineStr := TimeFilter(LineStr); //กรองเอาเวลาในข้อความใน LineStr ออก

      //Showmessage('LineStr1 '+LineStr);
      //--------------------------------------------------------------------------//

      //--------------------------------------------------------------------------//
      if (Trim(LineStr) = '') then //เปลี่ยนหัวบรรทัดว่างให้เป็นประเภท บน
        LineStr  := 'Top'+#13#10;

      if IsLonelyThaiStr(LineStr, 'บ') then  //เปลี่ยน (บ ใบไม้) โดดๆให้เป็นประเภท บน
        LineStr  := Replace(LineStr, 'บ', 'Top');

      if IsLonelyThaiStr(LineStr, 'ล') then  //เปลี่ยน (ล ลิง) โดดๆให้เป็นประเภท บน
        LineStr  := Replace(LineStr, 'ล', 'Down');

      if Pos('Top-Down',LineStr) > 0 then
      begin
        LineStr  := Replace(LineStr, 'Top-Down', '');
        LineStr  := Trim('Top-Down '+LineStr);
      end
      else
      if Pos('Down',LineStr) > 0 then
      begin
        LineStr  := Replace(LineStr, 'Down', '');
        LineStr  := Trim('Down '+LineStr);
      end;

      if Pos('=',LineStr) = 0 then
      begin
        LineStr  := Replace(LineStr, 'ชุดละ', '=');
        LineStr  := Replace(LineStr, 'ตัวละ', '=');
      end;

      if (CountOccur('=',LineStr) = 2) then
      begin

        if IsLastStr(LineStr,'=') then
          LineStr  := Replace(LineStr, '=', '') //ถ้าเครื่องหมาย / ตัวสุดท้ายให้ลบทิ้ง
        else
        begin
          CntEQ := 0;
          for j := 1 to Length(LineStr) do
          begin
            if LineStr[j] = '=' then
              Inc(CntEQ);

            if CntEQ = 2 then
              Break;
          end;
          LineStr[j] := '*';
        end;
      end;

      if (CountOccur('/',LineStr) = 1) then
      begin

        if IsLastStr(LineStr,'/') then
          LineStr  := Replace(LineStr, '/', ''); //ถ้าเครื่องหมาย / ตัวสุดท้ายให้ลบทิ้ง

        if (Pos('=',LineStr)) < (Pos('/',LineStr)) then
          LineStr  := Replace(LineStr, '/', '*')
        else
          LineStr  := Replace(LineStr, '/', ' ')
      end;

      if (CountOccur('/',LineStr) > 1) Or (CountOccur(',',LineStr) > 1) Or (CountOccur('-',LineStr) > 1) Or
         (CountOccur('''',LineStr) > 1) Or (CountOccur(' ',LineStr) > 1) then
      begin
        if Not IsLastStr(LineStr,'ชุด') then
          if Pos('=',LineStr) = 0 then
            LineStr  := Replace(LineStr, 'ชุด', '=');

        if Pos('=',LineStr) = 0 then
          LineStr  := Replace(LineStr, ' ', '=');

        LineStr  := Replace(LineStr, '/', ' ');
        //LineStr  := Replace(LineStr, ',', ' ');
        LineStr  := Replace(LineStr, '-', ' ');
        LineStr  := Replace(LineStr, '''', ' ');
      end;

      //Showmessage(LineStr);
     //--------------------------------------------------------------------------//
      StartChr := i+1;//StartChr+Length(LineStr);

      CntGrpNum := 0;
      LastNumPoint := 0;
      for j := 1 to Length(LineStr) do
      begin
        if (LineStr[1] in ['0'..'9']) and (CntGrpNum = 0) then //ตัวแรกของแถวเป็นตัวเลข และยังไม่เริ่มนับ
          inc(CntGrpNum)
        else
        if ((j > 1) and (LineStr[j] in ['0'..'9']) and Not(LineStr[j-1] in ['0'..'9','*']))  then //หาตำแหน่งเครื่องหมายเท่ากับ (=)
        begin
          inc(CntGrpNum);
          if CntGrpNum = 2 then
            EqPoint := j-1; //ตำแหน่งเครื่องหมายเท่ากับ (=)
        end;
        
        if ((LineStr[j] in ['0'..'9']) and Not(LineStr[j+1] in ['0'..'9','*'])) and (j>0) and (j < Length(LineStr)) then
        begin
          if (LastNumPoint = 0) then
          begin
            LastNumPoint := j;  //ตัวเลขตัวสุดท้ายของเลชชุดแรก ในบรรทัด
            //Showmessage(IntTostr(LastNumPoint));
          end;
        end;
      end;
      //Showmessage('Cnt '+IntToStr(CntGrpNum));
    //--------------------------------------------------------------------------//

      //--------------------------------------------------------------------------//
      if (Pos('=',LineStr) > 0) and (Pos('.',LineStr) > 0) and (CntGrpNum = 2) then //123.=100*50
      begin
        LineStr  := Replace(LineStr, '.', ' '); //123=100*50
      end;

      if (Pos('=',LineStr) > 0) and (Pos('.',LineStr) > 0) and (CntGrpNum > 2) then //123.456=100*50
      begin
        LineStr  := Replace(LineStr, '.', ','); //123-456=100*50
      end;

      if (Pos('=',LineStr) = 0) and (Pos('.',LineStr) = 1) and (CntGrpNum = 2) then //123.100*50
        LineStr  := Replace(LineStr, '.', '='); //123=100*50

      if (CountOccur('-',LineStr) = 1) and (CountOccur('=',LineStr) = 0)  then //123-100*50 , 123 456 789-100*100
        LineStr  := Replace(LineStr, '-', '='); //123=100*50

      if (Pos('/',LineStr) > 0) then //123=100/50/
      begin
        if LineStr[Length(LineStr)] = '/' then //123=100*50/
          LineStr := ReplaceLast(LineStr,'/','');

        LineStr  := Replace(LineStr, '/', '*'); //123=100/50
      end;
      
      //LineStr  := trim(LineStr);
      if (Pos('ชุด',LineStr) > 0) and (CountOccur('*',LineStr)=0) and IsLastStr(LineStr,'ชุด') and (CntGrpNum = 2) then //123=100 ชุด
      begin
        LineStr  := ReplaceLast(LineStr, 'ชุด', '*ชุด'); //123=100*ชุด
      end;

      if (Pos('ชุด',LineStr) > 0) and (CountOccur('*',LineStr) > 0) and IsLastStr(LineStr,'ชุด') and Not(IsLastStr(LineStr,'*ชุด')) and (CntGrpNum = 2) then //123=100*3ชุด
      begin
        LineStr  := ReplaceLast(LineStr, 'ชุด', ''); //123=100*ชุด
      end;

      if (Pos('3 ตัวโต๊ด',LineStr) = 0) and (Pos('โต๊ด',LineStr) > 0) and (CountOccur('*',LineStr) = 0) and (CntGrpNum = 3) then //123=100 โต๊ด 100
      begin
        LineStr  := Replace(LineStr, 'โต๊ด', '*'); //123=100 * 100
      end;

      //--------------------------------------------------------------------------//

      //Showmessage(LineStr);

        if CntGrpNum = 1 then
        begin
          if ((Pos('=',LineStr)=0) and (CountOccur('*',LineStr)=1) and (Pos('ชุด',LineStr) = 0)) and (Length(GetNum(LineStr)) > 1) then  //23*100
          begin
            LineStr    := Replace(LineStr,'*','=');
            LastLinePr := Copy(LineStr,Pos('=',LineStr)+1,Length(LineStr)-Pos('=',LineStr));
            //LineStr    := Replace(LineStr,LastLinePr,LastLinePr+'*'+LastLinePr);
            LineStr    := LineStr + '*'+LastLinePr;
          end;
        end
        else
        if CntGrpNum = 2 then
        begin
          //Showmessage('dfldjfldjfd');
          //Showmessage('LastNum '+IntToStr(LastNumPoint)+' '+ IntToStr(EqPoint));
          if ((CountOccur('=',LineStr) <= 1) and (CountOccur('*',LineStr) <= 1) and (CountOccur('ชุด',LineStr) = 0)) then // ex  12 20, 12 มีบน 100, 12 100*20, 12 หน้าบน 20*10
          begin
            
            if EqPoint-LastNumPoint > 1 then
            begin
              MidHead := Copy(LineStr,LastNumPoint+1,EqPoint-LastNumPoint);
              LineStr := Replace(LineStr,MidHead,'=');

              if (CountOccur('=',LineStr) = 0) then
              begin
                if trim(MidHead) <> '' then //แทรกหัวประเภทเลขเข้าไป
                  AllStr := AllStr+trim(MidHead)+#13#10;
              end
              else
              begin
                MidHead := Replace(MidHead,'=','');
                if trim(MidHead) <> '' then //แทรกหัวประเภทเลขเข้าไป
                  AllStr := AllStr+trim(MidHead)+#13#10;
              end

            end;
          end
          else
          if ((LastNumPoint = 3) and (CountOccur('=',LineStr) <= 1) and (CountOccur('*',LineStr) <= 1) and (CountOccur('ชุด',LineStr) = 1)) then // ex  123 100*ชุด
          begin
            if EqPoint-LastNumPoint > 1 then
            begin
              MidHead := Copy(LineStr,LastNumPoint+1,EqPoint-LastNumPoint);
              LineStr := Replace(LineStr,MidHead,'=');
              LineStr := Replace(LineStr,'ชุด',IntToStr(PerMutation(Copy(LineStr,1,LastNumPoint))));

              if (CountOccur('=',LineStr) = 0) then
              begin
                if trim(MidHead) <> '' then //แทรกหัวประเภทเลขเข้าไป
                  AllStr := AllStr+trim(MidHead)+#13#10;
              end
              else
              begin
                MidHead := Replace(MidHead,'=','');
                if trim(MidHead) <> '' then //แทรกหัวประเภทเลขเข้าไป
                  AllStr := AllStr+trim(MidHead)+#13#10;
              end

            end;
          end;

        end
        else
        begin
          //AllStr := AllStr+LineStr+#13#10;

        end;
        Showmessage('CGN '+IntToStr(CntGrpNum));

      if
        //((CntGrpNum = 1) and (CountOccur( '=',LineStr) = 0) and (CountOccur( '*',LineStr) = 1)) Or //123*6
        ((CntGrpNum = 2) and (Pos('มี',LineStr) > 0 ) ) Or // 25 มีบน 100
        ((CntGrpNum = 2) and (Pos('Float',LineStr) > 0 ) ) Or // 25 มีบน 100
        ((CntGrpNum = 2) and (CountOccur( '*',LineStr) >= 2)) Or //123=100*5*10
        ((CntGrpNum = 2) and (CountOccur('-',LineStr) <= 1 ) and (CountOccur( '=',LineStr) <= 1) and (CountOccur( '*',LineStr) <= 1) and (Pos('ชุด',LineStr)=0) ) Or //123-100, 123-100*50
        ((CntGrpNum = 2) and (CountOccur('-',LineStr) <= 1 ) and (CountOccur( '=',LineStr) <= 1) and (CountOccur( '*',LineStr) <= 1) and (Pos('ชุด',LineStr) > 0) and IsLastStr(LineStr,'ชุด') ) //Or //123-100, 123-100*50
      then  //by pass
      begin
        AllStr := AllStr+LineStr+#13#10;
      end
      else
      begin
       try
        if (Pos('ชุด',LineStr) > 0 ) and (Pos('ชุด*',LineStr) = 0 ) and Not(IsLastStr(LineStr,'ชุด')) then
        begin
          if Length(GetNum(Copy(LineStr,Pos('ชุด',LineStr),Length(LineStr)-Pos('ชุด',LineStr)))) > 0 then
          begin
            LineStr := Replace(LineStr,'ชุด','ชุด*');
            LineStr := Replace(LineStr,' ','');
          end;
        end;

        Head := '';
        Stoped := false;
        for j := 1 to Length(LineStr) do
        begin
          //Head := Head+LineStr[j];
          if ((j = 1) and (LineStr[j] in ['0'..'9','='])) then
            Break
          else
          if ((LineStr[j] in ['0'..'9']) and Not(LineStr[j-1] in ['0'..'9'])) and (j>1) then  //มีบน 12=200
            Break
          else
            Head := Head+LineStr[j];
        end;
        //--------------------------------------------------------------------------//
        if Not((CntGrpNum = 1) and ((Pos('=',LineStr)=0) and (Pos('*',LineStr)=0) and (Pos('ชุด',LineStr) = 0)) and (Length(GetNum(LineStr))=1)) then  //[3 ตัวโต๊ด]
          LineStr := Copy(LineStr,j,Length(LineStr)-j+1) // ถ้ามีข้อความประเภทเลขข้าหน้า ให้เก็บเลขตั้งแต่เจอเลขตัวแรกถึงสิ้นสุดบรรทัด
        else
        begin
          AllStr := AllStr+LineStr+#13#10;
          Continue;
        end;
        //--------------------------------------------------------------------------//
        Head2 := '';
        for j := Length(LineStr) DownTo 1 do
        begin
          if ((j = Length(LineStr)) and (LineStr[j] in ['0'..'9'])) then
            Break
          else
          if ((LineStr[j] in ['0'..'9']) and Not(LineStr[j+1] in ['0'..'9'])) and (j < Length(LineStr)) then // 25=200 มีบน
          begin
            Head2   := Copy(LineStr,j+1,Length(LineStr)-j);
            if Pos('ชุด',LineStr) = 0 then
              LineStr := Copy(LineStr,1,j)
            else
              LineStr := Copy(LineStr,1,j+Length('*ชุด'));

            Break;
          end;
        end;
        LineStr := Trim(LineStr);

        //--------------------------------------------------------------------------//
        if trim(Head) <> '' then //แทรกหัวประเภทเลขเข้าไป
          AllStr := AllStr+Head+#13#10;

        if trim(Head2) <> '' then //แทรกหัวประเภทเลขเข้าไป
          AllStr := AllStr+Head2+#13#10;
        //--------------------------------------------------------------------------//

        LineStr := Trim(LineStr);
        Str := '';
        StartStr := 1;
        Stoped := true;
        
        for k := 1 to Length(trim(LineStr)) do
        begin
          if foundEQ = false then
            if (LineStr[k] = '=') then
              foundEQ := true;

          if Not(foundEQ) then
          begin
            if (LineStr[k] in ['0'..'9']) and Not(LineStr[k-1] in ['0'..'9']) and (K > 1) then
            begin
              StartStr := k;
            end;

            if ( (LineStr[k] in ['0'..'9']) and Not(LineStr[k+1] in ['0'..'9','*']) and (k > 0) and (k <> Length(LineStr)) ) Or ((k = Length(LineStr)) and IsNumOnly(LineStr)) Or ((k = Length(LineStr)) and (CntGrpNum > 2)) then
            begin
              Str := Copy(LineStr,StartStr,k-StartStr+1);
              Setlength(NumAr,Length(NumAr)+1);
              NumAr[Length(NumAr)-1] := Str;
              inc(TotalNumAr);
            end;
          end;

          if (k=Length(LineStr)) and (((CountOccur('=',LineStr) = 0) and (CountOccur('*',LineStr) > 0)  ) Or (CountOccur('=',LineStr) > 0)) then
          begin
            TotalNumAr := 0;
            MultiSet2 := false;
            MultiSet  := false;

            if (CountOccur('=',LineStr) = 1) then //กรณีในบรรทัดจบพบเครื่องหมาย = ตัวเดียว
            begin
              Pri := trim(PrFilter(LineStr));  // กรองเอาราคาขั้นแรก
              Pri := Copy(Pri,Pos('=',Pri)+1,Length(Pri)-Pos('=',Pri)); //เก็บราคาหลังเครื่องหมาย = ไว้ในตัวแปร Pri

              if (Pos('*ชุด*',Pri) > 0) then  //ถ้าในข้อมความที่เก็บมีคำว่า *ชุด*
                MultiSet2 := true
              else
              if (Pos('*ชุด',Pri) > 0) then   //ถ้าในข้อมความที่เก็บมีคำว่า *ชุด
                MultiSet := true;
            end
            else
            if CountOccur('=',LineStr) = 0 then  //กรณีในบรรทัดไม่จบพบเครื่องหมาย =
            begin
              Pri := trim(PrFilter(LineStr));  // กรองหยาบเอาราคาขั้นแรก
              if (Pos('*ชุด*',Pri) > 0) then  //ถ้าในข้อมความที่เก็บมีคำว่า *ชุด*
                MultiSet2 := true
              else
              if (Pos('*ชุด',Pri) > 0) then   //ถ้าในข้อมความที่เก็บมีคำว่า *ชุด
                MultiSet := true;

              if CountOccur('*',Pri) = 0 then  //กรณีไม่พบเครื่องหมาย * ในตัวแปร Pri ex 123 100,  123 2
              begin
                for j := 1 to Length(Pri) do
                begin
                  if (Pri[j] in ['0'..'9']) and (Pri[j-1] in [' '])  then  //ถ้าตัวอักษรปัจจุบันเป็นตัวเลข และตัวอักษรที่แล้วเป็นช่องว่าง
                  begin
                    Pri := Copy(Pri,j,Length(Pri)-j+1);
                    Break;
                  end;
                end;
              end
              else
              begin
                Pri := Replace(Pri,'ด  ','ด ');
                Pri := Replace(Pri,'ด ','ด');
                if (Pos(' ',Pri) >0) then
                begin
                  for j := 1 to Length(Pri) do
                  begin
                    if (Pri[j] in ['0'..'9']) and (Pri[j-1] in [' '])  then
                    begin
                      Pri := Copy(Pri,j,Length(Pri)-j+1);
                      Break;
                    end;
                  end;
                end;
              end;
            end;
            Pri := PrFilter2(Pri); //กรองละเอียดเพื่อตัดอักขระที่ไม่ต้องการออก

            if MultiSet then
            begin
              if Pri[Length(Pri)] <> '*' then  //อักษรสุดท้ายไม่เท่ากับ * ex 123 125 548 =100*ชุด 2 หรือ 123 125 548 100*ชุด 2
              begin
                Multiset  := false;
                MultiSet2 := true;
              end;
            end;

            if (MultiSet2) then  // 123 125 548 =100*ชุด*20
            begin
              Pri := Replace(Pri,'**','*');
              P1  := Copy(Pri,1,Pos('*',Pri)-1);
              P2  := Copy(Pri,Pos('*',Pri)+1,Length(Pri)-Pos('*',Pri));
              P12 := IntToStr(StrToInt(P1)+StrToInt(P2));
            end;

            for l := 0 to length(NumAr)-1 do
            begin
              if (MultiSet2) then
              begin
                AllStr := AllStr+NumAr[l]+'='+P12+'*'+IntToStr(PerMutation(NumAr[l])-1)+'*'+P2+#13#10;
              end
              else
              if (MultiSet) then
              begin
                AllStr := AllStr+NumAr[l]+'='+Pri+'ชุด'+#13#10;
              end
              else
              begin
                AllStr := AllStr+NumAr[l]+'='+Pri+#13#10;
              end;
            end;

            Setlength(NumAr,0);
            Break;
          end;

          Str := '';
          CountNum := k;
        end;
        LineStr := '';

       except
        AllStr := AllStr+LineStr+#13#10;
       end;
       
      end; // ไม่มีเครื่องหมาย = สองตัว
    end;
  end;
  Showmessage(AllStr);
  Result := AllStr;
end;

function TfrmInputText.GetPrFromSetNum(Num: String):String;
Var i,j,k,l,StartNum,StarPos,StarPos1,StarPos2,LastNumPos,NextNumPos,SpPos,TotalStar,TotalNumAr,CntEQ,
    LastLine_i,PosEQ,CountEQ1,CountStar,LineNo,StrEnd,StartStr,CountNum,CntGrpNum,EqPoint,LastNumPoint,StartChr: integer;
    Pri,P1,P2,P12,Str,SetStr,RemainStr,NumSet,NumState,LineStr,AllStr,Numb,Head,
    MidHead,Head2,LastLinePr,NumGrp,Today,StrLeft,StrRight: String;
    MultiSet,MultiSet2,Teng1512,FoundPr,Stoped: Boolean;
    Ch: Char;
    NumAr: Array of String;
    RedSet: TRichEdit;
    foundEQ: Boolean;
    Days,Monts,EYears,TYears: Word;
begin

  if Num = '' then
  begin
    exit;
  end;
  Today := FormatDateTime('dd/mm/yy', Date);
  Num  := Replace(Num, Today, '');
  Today := FormatDateTime('dd/mm/yyyy', Date);
  Num  := Replace(Num, Today, '');

  DecodeDate(Date,EYears,Monts,Days);
  ToDay := IntToStr(Days)+'/'+IntToStr(Monts)+'/'+IntToStr(EYears+543);
  Num  := Replace(Num, Today, '');
  ToDay := IntToStr(Days)+'/'+IntToStr(Monts)+'/'+Copy(IntToStr(EYears+543),3,2);
  Num  := Replace(Num, Today, '');

  Num  := Replace(Num, 'x', '*');
  Num  := Replace(Num, '?', '*'); //x ในภาษาไทย
  Num  := Replace(Num, 'คูณ', '*');
  Num  := Replace(Num, 'คูน', '*');
  Num  := Replace(Num, 'คุณ', '*');
  Num  := Replace(Num, 'คุน', '*');
  Num  := Replace(Num, '+', '*');

  Num  := Replace(Num,'* ', '*');
  Num  := Replace(Num,' *', '*');
  Num  := Replace(Num,'/ ', '/');
  Num  := Replace(Num,' /', '/');
  Num  := Replace(Num,', ', ',');
  Num  := Replace(Num,' ,', ',');
  Num  := Replace(Num,''' ', '''');
  Num  := Replace(Num,' ''', '''');

  Num  := Replace(Num,'= ', '=');
  Num  := Replace(Num,' =', '=');

  Num  := Replace(Num, '2 ตัว', 'สองตัว');
  Num  := Replace(Num, '3 ตัวล่าง', '3 Down');
  Num  := Replace(Num, '4 ตัว', 'สี่ตัว');
  Num  := Replace(Num, '5 ตัว', 'ห้าตัว');

  Num  := Replace(Num, '2ตัว', 'สองตัว');
  Num  := Replace(Num, '3ตัว', 'สามตัว');
  Num  := Replace(Num, '4ตัว', 'สี่ตัว');
  Num  := Replace(Num, '5ตัว', 'ห้าตัว');

  LastLine_i := 0;
  LineNo := 1;
  NumSet := '';
  LineStr := '';
  AllStr := '';
  SetStr := '';
  StartNum := 1;
  StartChr := 1;
  Setlength(NumAr,0);
  TotalNumAr := 0;

  for i := 1 to Length(Num) do
  begin
    if (Num[i] = #10) Or (i = Length(Num)) then
    begin
      foundEQ := false;
      LineStr  := trim(Copy(Num,StartChr,i-StartChr+1));

      //Showmessage(LineStr);
     //--------------------------------------------------------------------------//
      LineStr := DateFilter(LineStr); //กรองเอาวันที่ในข้อความใน Line ออก
      for j := 1 to CountOccur(':',LineStr) do
        LineStr := TimeFilter(LineStr); //กรองเอาเวลาในข้อความใน Line ออก

      //Showmessage('LineStr1 '+LineStr);
      //--------------------------------------------------------------------------//
      

      //--------------------------------------------------------------------------//
      if (Trim(LineStr) = '') then //เปลี่ยนหัวบรรทัดว่างให้เป็นประเภท บน
      begin
        LineStr  := 'Top'+#13#10;
        AllStr := AllStr + 'Top'+#13#10;
        Continue;
      end;
    //--------------------------------------------------------------------------//

      LineStr  := Replace(LineStr, 'ปักหน้าบน', 'Left-Top');
      LineStr  := Replace(LineStr, 'หน้าบน', 'Left-Top');
      LineStr  := Replace(LineStr, 'ปักกลางบน', 'Center-Top');
      LineStr  := Replace(LineStr, 'กลางบน', 'Center-Top');
      LineStr  := Replace(LineStr, 'ปักหลังบน', 'Right-Top');
      LineStr  := Replace(LineStr, 'หลังบน', 'Right-Top');
      LineStr  := Replace(LineStr, 'ปักหน้าล่าง', 'Left-Down');
      LineStr  := Replace(LineStr, 'หน้าล่าง', 'Left-Down');
      LineStr  := Replace(LineStr, 'ปักหลังล่าง', 'Right-Down');
      LineStr  := Replace(LineStr, 'หลังล่าง', 'Right-Down');

      LineStr  := Replace(LineStr, 'มีบน', 'Float-Top');
      LineStr  := Replace(LineStr, 'มีล่าง', 'Float-Down');

      LineStr  := Replace(LineStr, 'บนล่าง', 'Top-Down');
      LineStr  := Replace(LineStr, 'บน,ล่าง', 'Top-Down');
      LineStr  := Replace(LineStr, 'บน ล่าง', 'Top-Down');
      LineStr  := Replace(LineStr, 'บน-ล่าง', 'Top-Down');
      LineStr  := Replace(LineStr, 'บน/ล่าง', 'Top-Down');
      LineStr  := Replace(LineStr, 'บน', 'Top ');
      LineStr  := Replace(LineStr, 'ลาง', 'Down');
      LineStr  := Replace(LineStr, 'ล่าง', 'Down');
      LineStr  := Replace(LineStr, 'ล้าง', 'Down');
      //LineStr  := Replace(LineStr, 'ลอยแพ', 'Float');
      LineStr  := Replace(LineStr, 'ลอย', 'Float');
      //LineStr  := Replace(LineStr, 'โต๊ด', 'Float');
      LineStr  := Replace(LineStr, 'โต้ด', 'โต๊ด');
      LineStr  := Replace(LineStr, 'วิ่ง', 'Float');
      LineStr  := Replace(LineStr, 'แพ', 'Float');
      LineStr  := Replace(LineStr, 'สมี', 'สมิ๋');
      LineStr  := Replace(LineStr, 'หมี', 'หมิ๋');
      LineStr  := Replace(LineStr, 'มี', 'Float');
      LineStr  := Replace(LineStr, '*หน้า', '');
      LineStr  := Replace(LineStr, '* หน้า', '');
      LineStr  := Replace(LineStr, 'หน้า', 'Left');
      LineStr  := Replace(LineStr, 'กลาง', 'Center');
      LineStr  := Replace(LineStr, 'หลัง', 'Right');
      LineStr  := Replace(LineStr, 'ประตูละ', '=');
      LineStr  := Replace(LineStr, 'ตูละ', '=');
      LineStr  := Replace(LineStr, 'บ,ล', 'Top-Down');
      LineStr  := Replace(LineStr, 'บ-ล', 'Top-Down');
      LineStr  := Replace(LineStr, 'บ+ล', 'Top-Down');
      LineStr  := Replace(LineStr, 'บ-', 'Top');
      LineStr  := Replace(LineStr, '-บ', 'Top');
      LineStr  := Replace(LineStr, ',บ', 'Top');
      LineStr  := Replace(LineStr, 'ล-', 'Top');
      LineStr  := Replace(LineStr, '-ล', 'Top');
      LineStr  := Replace(LineStr, ',ล', 'Top');
      LineStr  := Replace(LineStr, 'FloatFloat', 'Float');

      if IsLonelyThaiStr(LineStr, 'บ') then
        LineStr  := Replace(LineStr, 'บ', 'Top');

      if IsLonelyThaiStr(LineStr, 'ล') then
        LineStr  := Replace(LineStr, 'ล', 'Down');
    //--------------------------------------------------------------------------//


    //----------------- ย้าบประเภทตัวเลขไปไว้ด้านหน้าบรรทัด --------------------//
      if Pos('Top-Down',LineStr) > 0 then
      begin
        LineStr  := Replace(LineStr, 'Top-Down', '');
        LineStr  := Trim('Top-Down '+LineStr);
      end
      else
      if Pos('Left-Top',LineStr) > 0 then
      begin
        LineStr  := Replace(LineStr, 'Left-Top', '');
        LineStr  := Trim('Left-Top '+LineStr);
      end
      else
      if Pos('Center-Top',LineStr) > 0 then
      begin
        LineStr  := Replace(LineStr, 'Center-Top', '');
        LineStr  := Trim('Center-Top '+LineStr);
      end
      else
      if Pos('Right-Top',LineStr) > 0 then
      begin
        LineStr  := Replace(LineStr, 'Right-Top', '');
        LineStr  := Trim('Right-Top '+LineStr);
      end
      else
      if Pos('Left-Down',LineStr) > 0 then
      begin
        LineStr  := Replace(LineStr, 'Left-Down', '');
        LineStr  := Trim('Left-Down '+LineStr);
      end
      else
      if Pos('Right-Down',LineStr) > 0 then
      begin
        LineStr  := Replace(LineStr, 'Right-Down', '');
        LineStr  := Trim('Right-Down '+LineStr);
      end
      else
      if Pos('Float-Top',LineStr) > 0 then
      begin
        LineStr  := Replace(LineStr, 'Float-Top', '');
        LineStr  := Trim('Float-Top '+LineStr);
      end
      else
      if Pos('Float-Down',LineStr) > 0 then
      begin
        LineStr  := Replace(LineStr, 'Float-Down', '');
        LineStr  := Trim('Float-Down '+LineStr);
      end
      else
      if Pos('Top',LineStr) > 0 then
      begin
        LineStr  := Replace(LineStr, 'Top', '');
        LineStr  := Trim('Top '+LineStr);
      end
      else
      if Pos('Down',LineStr) > 0 then
      begin
        LineStr  := Replace(LineStr, 'Down', '');
        LineStr  := Trim('Down '+LineStr);
      end
      else
      if Pos('Float',LineStr) > 0 then
      begin
        LineStr  := Replace(LineStr, 'Float', '');
        LineStr  := Trim('Float '+LineStr);
      end;
    //--------------------------------------------------------------------------//

      if Pos('=',LineStr) = 0 then
      begin
        LineStr  := Replace(LineStr, 'ชุดละ', '=');
        LineStr  := Replace(LineStr, 'ตัวละ', '=');
      end;

      if (CountOccur('=',LineStr) = 2) then
      begin

        if IsLastStr(LineStr,'=') then
          LineStr  := Replace(LineStr, '=', '') //ถ้าเครื่องหมาย / ตัวสุดท้ายให้ลบทิ้ง
        else
        begin
          CntEQ := 0;
          for j := 1 to Length(LineStr) do
          begin
            if LineStr[j] = '=' then
              Inc(CntEQ);

            if CntEQ = 2 then
              Break;
          end;
          LineStr[j] := '*';
        end;
      end;

      if (CountOccur('/',LineStr) = 1) then
      begin

        if IsLastStr(LineStr,'/') then
          LineStr  := Replace(LineStr, '/', ''); //ถ้าเครื่องหมาย / ตัวสุดท้ายให้ลบทิ้ง

        if (Pos('=',LineStr)) < (Pos('/',LineStr)) then
          LineStr  := Replace(LineStr, '/', '*')
        else
          LineStr  := Replace(LineStr, '/', ' ')
      end;

      if (CountOccur('/',LineStr) > 1) Or (CountOccur(',',LineStr) > 1) Or (CountOccur('-',LineStr) > 1) Or
         (CountOccur('''',LineStr) > 1) Or (CountOccur(' ',LineStr) > 1) then
      begin
        if Not IsLastStr(LineStr,'ชุด') then
          if Pos('=',LineStr) = 0 then
            LineStr  := Replace(LineStr, 'ชุด', '=');

        if Pos('=',LineStr) = 0 then
          LineStr  := Replace(LineStr, ' ', '=');

        LineStr  := Replace(LineStr, '/', ' ');
        LineStr  := Replace(LineStr, ',', ' ');

        StrLeft  := Copy(LineStr,1,Pos('-',LineStr)-1);
        StrRight := Copy(LineStr,Pos('-',LineStr)+1,Length(LineStr)-Pos('-',LineStr));

        if IsFoundNum(StrLeft) and IsFoundNum(StrRight) then
          LineStr := Replace(LineStr,'-',' ');

        LineStr  := Replace(LineStr, '''', ' ');
      end;

      //Showmessage(LineStr);
     //--------------------------------------------------------------------------//
      StartChr := i+1;//StartChr+Length(LineStr);

      CntGrpNum := 0;
      LastNumPoint := 0;
      for j := 1 to Length(LineStr) do
      begin
        if (LineStr[1] in ['0'..'9']) and (CntGrpNum = 0) then
          inc(CntGrpNum)
        else
        if ((j > 1) and (LineStr[j] in ['0'..'9']) and Not(LineStr[j-1] in ['0'..'9','*']))  then
        begin
          inc(CntGrpNum);
          if CntGrpNum = 2 then
            EqPoint := j-1;
        end;
        if ((LineStr[j] in ['0'..'9']) and Not(LineStr[j+1] in ['0'..'9','*'])) and (j>0) and (j < Length(LineStr)) then
        begin
          if (LastNumPoint = 0) then
            LastNumPoint := j;
        end;
      end;
      //--------------------------------------------------------------------------//

      //--------------------------------------------------------------------------//
      if (Pos('=',LineStr) > 0) and (Pos('.',LineStr) > 0) and (CntGrpNum = 2) then //123.=100*50
      begin
        LineStr  := Replace(LineStr, '.', ' '); //123=100*50
      end;

      if (Pos('=',LineStr) > 0) and (Pos('.',LineStr) > 0) and (CntGrpNum > 2) then //123.456=100*50
      begin
        LineStr  := Replace(LineStr, '.', ','); //123-456=100*50
      end;

      if (Pos('=',LineStr) = 0) and (Pos('.',LineStr) = 1) and (CntGrpNum = 2) then //123.100*50
        LineStr  := Replace(LineStr, '.', '='); //123=100*50

      if (CountOccur('-',LineStr) = 1) and (CountOccur('=',LineStr) = 0)  then //123-100*50 , 123 456 789-100*100
        LineStr  := Replace(LineStr, '-', '='); //123=100*50

      if (Pos('/',LineStr) > 0) then //123=100/50/
      begin
        if LineStr[Length(LineStr)] = '/' then //123=100*50/
          LineStr := ReplaceLast(LineStr,'/','');

        LineStr  := Replace(LineStr, '/', '*'); //123=100/50
      end;
      
      //LineStr  := trim(LineStr);
      if (Pos('ชุด',LineStr) > 0) and (CountOccur('*',LineStr)=0) and IsLastStr(LineStr,'ชุด') and (CntGrpNum = 2) then //123=100 ชุด
      begin
        LineStr  := ReplaceLast(LineStr, 'ชุด', '*ชุด'); //123=100*ชุด
      end;

      if (Pos('ชุด',LineStr) > 0) and (CountOccur('*',LineStr) > 0) and IsLastStr(LineStr,'ชุด') and Not(IsLastStr(LineStr,'*ชุด')) and (CntGrpNum = 2) then //123=100*3ชุด
      begin
        LineStr  := ReplaceLast(LineStr, 'ชุด', ''); //123=100*ชุด
      end;

      if (Pos('3 ตัวโต๊ด',LineStr) = 0) and (Pos('โต๊ด',LineStr) > 0) and (CountOccur('*',LineStr) = 0) and (CntGrpNum = 3) then //123=100 โต๊ด 100
      begin
        LineStr  := Replace(LineStr, 'โต๊ด', '*'); //123=100 * 100
      end;

      //--------------------------------------------------------------------------//

        if CntGrpNum = 1 then
        begin
          if ((Pos('=',LineStr)=0) and (CountOccur('*',LineStr)=1) and (Pos('ชุด',LineStr) = 0)) and (Length(GetNum(LineStr)) > 1) then  //23*100
          begin
            LineStr := Replace(LineStr,'*','=');
            LastLinePr := Copy(LineStr,Pos('=',LineStr)+1,Length(LineStr)-Pos('=',LineStr));
            //LineStr := Replace(LineStr,LastLinePr,LastLinePr+'*'+LastLinePr);
            LineStr    := LineStr + '*'+LastLinePr;
          end;
        end
        else
        if CntGrpNum = 2 then
        begin
          if ((CountOccur('=',LineStr) <= 1) and (CountOccur('*',LineStr) <= 1) and (CountOccur('ชุด',LineStr) = 0)) then // ex  12 20, 12 มีบน 100, 12 100*20, 12 หน้าบน 20*10
          begin
            
            if EqPoint-LastNumPoint > 1 then
            begin
              MidHead := Copy(LineStr,LastNumPoint+1,EqPoint-LastNumPoint);
              LineStr := Replace(LineStr,MidHead,'=');

              if (CountOccur('=',LineStr) = 0) then
              begin
                if trim(MidHead) <> '' then //แทรกหัวประเภทเลขเข้าไป
                  AllStr := AllStr+trim(MidHead)+#13#10;
              end
              else
              begin
                MidHead := Replace(MidHead,'=','');
                if trim(MidHead) <> '' then //แทรกหัวประเภทเลขเข้าไป
                  AllStr := AllStr+trim(MidHead)+#13#10;
              end

            end;
          end
          else
          if ((LastNumPoint = 3) and (CountOccur('=',LineStr) <= 1) and (CountOccur('*',LineStr) <= 1) and (CountOccur('ชุด',LineStr) = 1)) then // ex  123 100*ชุด
          begin
            if EqPoint-LastNumPoint > 1 then
            begin
              MidHead := Copy(LineStr,LastNumPoint+1,EqPoint-LastNumPoint);
              LineStr := Replace(LineStr,MidHead,'=');
              LineStr := Replace(LineStr,'ชุด',IntToStr(PerMutation(Copy(LineStr,1,LastNumPoint))));

              if (CountOccur('=',LineStr) = 0) then
              begin
                if trim(MidHead) <> '' then //แทรกหัวประเภทเลขเข้าไป
                  AllStr := AllStr+trim(MidHead)+#13#10;
              end
              else
              begin
                MidHead := Replace(MidHead,'=','');
                if trim(MidHead) <> '' then //แทรกหัวประเภทเลขเข้าไป
                  AllStr := AllStr+trim(MidHead)+#13#10;
              end

            end;
          end;

        end
        else
        begin
          //AllStr := AllStr+LineStr+#13#10;

        end;

      if
        ((CntGrpNum = 2) and (Pos('มี',LineStr) > 0 ) ) Or // 25 มีบน 100
        ((CntGrpNum = 2) and (Pos('Float',LineStr) > 0 ) ) Or // 25 มีบน 100
        ((CntGrpNum = 2) and (CountOccur( '*',LineStr) >= 2)) Or //123=100*5*10
        ((CntGrpNum = 2) and (CountOccur('-',LineStr) <= 1 ) and (CountOccur( '=',LineStr) <= 1) and (CountOccur( '*',LineStr) <= 1) and (Pos('ชุด',LineStr)=0) ) Or //123-100, 123-100*50
        ((CntGrpNum = 2) and (CountOccur('-',LineStr) <= 1 ) and (CountOccur( '=',LineStr) <= 1) and (CountOccur( '*',LineStr) <= 1) and (Pos('ชุด',LineStr) > 0) and IsLastStr(LineStr,'ชุด') ) //Or //123-100, 123-100*50
      then  //by pass
      begin
        AllStr := AllStr+LineStr+#13#10;

      end
      else
      begin
       try
        if (Pos('ชุด',LineStr) > 0 ) and (Pos('ชุด*',LineStr) = 0 ) and Not(IsLastStr(LineStr,'ชุด')) then
        begin
          if Length(GetNum(Copy(LineStr,Pos('ชุด',LineStr),Length(LineStr)-Pos('ชุด',LineStr)))) > 0 then
          begin
            LineStr := Replace(LineStr,'ชุด','ชุด*');
            LineStr := Replace(LineStr,' ','');
          end;
        end;

        Head := '';
        Stoped := false;
        for j := 1 to Length(LineStr) do
        begin
          if ((j = 1) and (LineStr[j] in ['0'..'9','='])) then
            Break
          else
          if ((LineStr[j] in ['0'..'9']) and Not(LineStr[j-1] in ['0'..'9'])) and (j>1) then  //มีบน 12=200
            Break
          else
            Head := Head+LineStr[j];
        end;
        //--------------------------------------------------------------------------//
        if Not((CntGrpNum = 1) and ((Pos('=',LineStr)=0) and (Pos('*',LineStr)=0) and (Pos('ชุด',LineStr) = 0)) and (Length(GetNum(LineStr))=1)) then  //[3 ตัวโต๊ด]
          LineStr := Copy(LineStr,j,Length(LineStr)-j+1) // ถ้ามีข้อความประเภทเลขข้าหน้า ให้เก็บเลขตั้งแต่เจอเลขตัวแรกถึงสิ้นสุดบรรทัด
        else
        begin
          AllStr := AllStr+LineStr+#13#10;
          Continue;
        end;
        //--------------------------------------------------------------------------//
        Head2 := '';
        for j := Length(LineStr) DownTo 1 do
        begin
          if ((j = Length(LineStr)) and (LineStr[j] in ['0'..'9'])) then
            Break
          else
          if ((LineStr[j] in ['0'..'9']) and Not(LineStr[j+1] in ['0'..'9'])) and (j < Length(LineStr)) then // 25=200 มีบน
          begin
            Head2   := Copy(LineStr,j+1,Length(LineStr)-j);
            if Pos('ชุด',LineStr) = 0 then
              LineStr := Copy(LineStr,1,j)
            else
              LineStr := Copy(LineStr,1,j+Length('*ชุด'));

            Break;
          end;
        end;
        //--------------------------------------------------------------------------//
        LineStr := Trim(LineStr);

        //--------------------------------------------------------------------------//
        if trim(Head) <> '' then //แทรกหัวประเภทเลขเข้าไป
          AllStr := AllStr+Head+#13#10;

        if trim(Head2) <> '' then //แทรกหัวประเภทเลขเข้าไป
          AllStr := AllStr+Head2+#13#10;
        //--------------------------------------------------------------------------//

        LineStr := Trim(LineStr);
        Str := '';
        StartStr := 1;
        Stoped := true;

        for k := 1 to Length(trim(LineStr)) do
        begin
          if foundEQ = false then
            if (LineStr[k] = '=') then
              foundEQ := true;

          if Not(foundEQ) then
          begin
            if (LineStr[k] in ['0'..'9']) and Not(LineStr[k-1] in ['0'..'9']) and (K > 1) then
            begin
              StartStr := k;
            end;

            if ( (LineStr[k] in ['0'..'9']) and Not(LineStr[k+1] in ['0'..'9','*']) and (k > 0) and (k <> Length(LineStr)) ) Or ((k = Length(LineStr)) and IsNumOnly(LineStr)) Or ((k = Length(LineStr)) and (CntGrpNum > 2)) then
            begin
              Str := Copy(LineStr,StartStr,k-StartStr+1);
              Setlength(NumAr,Length(NumAr)+1);
              NumAr[Length(NumAr)-1] := Str;
              inc(TotalNumAr);
            end;
          end;

          if (k=Length(LineStr)) and (((CountOccur('=',LineStr) = 0) and (CountOccur('*',LineStr) > 0)  ) Or (CountOccur('=',LineStr) > 0)) then
          begin
            TotalNumAr := 0;
            MultiSet2 := false;
            MultiSet  := false;

            if (CountOccur('=',LineStr) = 1) then //กรณีในบรรทัดจบพบเครื่องหมาย = ตัวเดียว
            begin
              Pri := trim(PrFilter(LineStr));  // กรองเอาราคาขั้นแรก
              Pri := Copy(Pri,Pos('=',Pri)+1,Length(Pri)-Pos('=',Pri)); //เก็บราคาหลังเครื่องหมาย = ไว้ในตัวแปร Pri

              if (Pos('*ชุด*',Pri) > 0) then  //ถ้าในข้อมความที่เก็บมีคำว่า *ชุด*
                MultiSet2 := true
              else
              if (Pos('*ชุด',Pri) > 0) then   //ถ้าในข้อมความที่เก็บมีคำว่า *ชุด
                MultiSet := true;
            end
            else
            if CountOccur('=',LineStr) = 0 then  //กรณีในบรรทัดไม่จบพบเครื่องหมาย =
            begin
              Pri := trim(PrFilter(LineStr));  // กรองหยาบเอาราคาขั้นแรก
              if (Pos('*ชุด*',Pri) > 0) then  //ถ้าในข้อมความที่เก็บมีคำว่า *ชุด*
                MultiSet2 := true
              else
              if (Pos('*ชุด',Pri) > 0) then   //ถ้าในข้อมความที่เก็บมีคำว่า *ชุด
                MultiSet := true;

              if CountOccur('*',Pri) = 0 then  //กรณีไม่พบเครื่องหมาย * ในตัวแปร Pri ex 123 100,  123 2
              begin
                for j := 1 to Length(Pri) do
                begin
                  if (Pri[j] in ['0'..'9']) and (Pri[j-1] in [' '])  then  //ถ้าตัวอักษรปัจจุบันเป็นตัวเลข และตัวอักษรที่แล้วเป็นช่องว่าง
                  begin
                    Pri := Copy(Pri,j,Length(Pri)-j+1);
                    Break;
                  end;
                end;
              end
              else
              begin
                Pri := Replace(Pri,'ด  ','ด ');
                Pri := Replace(Pri,'ด ','ด');
                if (Pos(' ',Pri) >0) then
                begin
                  for j := 1 to Length(Pri) do
                  begin
                    if (Pri[j] in ['0'..'9']) and (Pri[j-1] in [' '])  then
                    begin
                      Pri := Copy(Pri,j,Length(Pri)-j+1);
                      Break;
                    end;
                  end;
                end;
              end;
            end;
            Pri := PrFilter2(Pri); //กรองละเอียดเพื่อตัดอักขระที่ไม่ต้องการออก

            if MultiSet then
            begin
              if Pri[Length(Pri)] <> '*' then  //อักษรสุดท้ายไม่เท่ากับ * ex 123 125 548 =100*ชุด 2 หรือ 123 125 548 100*ชุด 2
              begin
                Multiset  := false;
                MultiSet2 := true;
              end;
            end;

            
            if (MultiSet2) then  // 123 125 548 =100*ชุด*2
            begin
              Pri := Replace(Pri,'**','*');
              P1  := Copy(Pri,1,Pos('*',Pri)-1);
              P2  := Copy(Pri,Pos('*',Pri)+1,Length(Pri)-Pos('*',Pri));
              P12 := IntToStr(StrToInt(P1)+StrToInt(P2));
            end;

            for l := 0 to length(NumAr)-1 do
            begin
              if (MultiSet2) then
              begin
                AllStr := AllStr+NumAr[l]+'='+P12+'*'+IntToStr(PerMutation(NumAr[l])-1)+'*'+P2+#13#10;
              end
              else
              if (MultiSet) then
              begin
                AllStr := AllStr+NumAr[l]+'='+Pri+'ชุด'+#13#10;
              end
              else
              begin
                AllStr := AllStr+NumAr[l]+'='+Pri+#13#10;
              end;
            end;
            Setlength(NumAr,0);
            Break;
          end;
          Str := '';
          CountNum := k;
        end;
        LineStr := '';

       except
        AllStr := AllStr+LineStr+#13#10;
        //break;
       end;
      end; // ไม่มีเครื่องหมาย = สองตัว
    end;
  end;
  Result := AllStr;
end;


function GetNumFromClp(MyStr: String):String;
Var NumGroups,StrGroups: TStringList;
    LnStr,LnAll,LnNumType,Str,StrTemp,GetStaStr,StrLine,MStr: String;
    i,j,k,iSt: Integer;
    foundEnd,FoundNumType,FoundNum,StartGetSta: Boolean;
begin
  Str := '';
  StrTemp := '';
  StrGroups := TStringList.Create;
  NumGroups := TStringList.Create;
  Try
    for i := 1 to Length(MyStr) do
    begin
      StrTemp := StrTemp+MyStr[i];
      if (MyStr[i] = #10) Or (i = Length(MyStr)) then
      begin
        StrTemp := ReplaceLeft(StrTemp,'*','');
        Str := Str+Trim(StrTemp)+' ';
        StrTemp := '';
      end;
    end;
    Str := Trim(Str);
    Str := RemoveDateAndTime(Str);
    
    Str  := ReplaceIsolatedCharacter(Str, 'บ', 'บน');
    Str  := ReplaceIsolatedCharacter(Str, 'ล', 'ล่าง');
    Str  := Replace(Str, 'ว.บ', 'ลอยบน');
    Str  := Replace(Str, 'ว.ล', 'ลอยล่าง');
    Str  := Replace(Str, 'ว-บ', 'ลอยบน');
    Str  := Replace(Str, 'ว-ล', 'ลอยล่าง');
    Str  := Replace(Str, 'ว,บ', 'ลอยบน');
    Str  := Replace(Str, 'ว,ล', 'ลอยล่าง');

    Str  := Replace(Str, 'บ.ล', 'บนล่าง');
    Str  := Replace(Str, 'บ,ล', 'บนล่าง');
    Str  := Replace(Str, 'บ-ล', 'บนล่าง');

    Str  := Replace(Str, 'ล.บ', 'ลอยบน');
    Str  := Replace(Str, 'ล,บ', 'ลอยบน');
    Str  := Replace(Str, 'ล-บ', 'ลอยบน');

    Str  := Replace(Str, 'ล.ล', 'ลอยล่าง');
    Str  := Replace(Str, 'ล,ล', 'ลอยล่าง');
    Str  := Replace(Str, 'ล-ล', 'ลอยล่าง');
    Str  := Replace(Str, 'โต๊ด', 'ลอย');
    Str  := Replace(Str, 'โต้ด', 'ลอย');

    Str  := Replace(Str, '?', '*');
    Str  := Replace(Str, 'X', '*');
    Str  := Replace(Str, '#', '=');
    Str  := Replace(Str, 'ตัวละ', '=');
    Str  := Replace(Str, 'คูณ', '*');
    Str  := Replace(Str, 'คูน', '*');
    Str  := Replace(Str, 'คุณ', '*');
    Str  := Replace(Str, 'คุน', '*');
    Str  := Replace(Str, 'คุน', '*');
    Str  := Replace(Str, '-', '*');
    

    for k := 1 to 10 do  //กระชับพื้นที่
    begin
        Str  := Replace(Str, '  ', ' ');
        Str  := Replace(Str, ' = ', '=');
        Str  := Replace(Str, ' =', '=');
        Str  := Replace(Str, '= ', '=');
        Str  := Replace(Str, ' * ', '*');
        Str  := Replace(Str, ' *', '*');
        Str  := Replace(Str, '* ', '*');
        Str  := Replace(Str, ' - ', '-');
        Str  := Replace(Str, ' -', '-');
        Str  := Replace(Str, '- ', '-');

    end;

    //Showmessage(Str);

    iSt := 1; //ตัวอักษรตัวที่เริ่มต้น ข้อความใหม่

    FoundNumType := false;
    FoundNum := false;
    LnNumType := '';
    for i := 1 to Length(Str) do
    begin
      if Str[i] in ['0'..'9'] then
        StartGetSta := true;
      if StartGetSta then
        GetStaStr := GetStaStr+Str[i];

      if Not(Str[i] in ['0'..'9','*','=']) then //ถ้าอักขระไม่ใช่ตัวเลข * และ =
      begin
        LnNumType := LnNumType+Str[i];
        if Not FoundNumType then
        begin
          if (CountOccur('บน',GetStaStr) > 0) Or (CountOccur('ล่าง',GetStaStr) > 0) Or
             (CountOccur('โต๊ด',GetStaStr) > 0) Or (CountOccur('ชุด',GetStaStr) > 0) Or
             (CountOccur('-',GetStaStr) > 0) Or (CountOccur('ลอย',GetStaStr) > 0)
          then
          FoundNumType := true;
        end;

        LnAll := LnAll+Str[i];
      end;

      if FoundNumType then
        if Str[i] in ['0'..'9'] then
          FoundNum := true;

      if (Str[i] in ['=','*','-']) Or (FoundNumType and FoundNum) Or (i = Length(Str))   then
        foundEnd := true;

      LnStr := '';
      if (foundEnd and (Str[i] = ' ')) Or (i = Length(Str)) then
      begin
        LnAll := LnAll+#13#10;
        if foundEnd then
        begin
          StartGetSta := false;
          FoundNumType := false;
          FoundNum := false;
          LnNumType := '';

          LnStr := Trim(Copy(Str,iSt,i-iSt+1)); //Copy ออกมาทีละจบ โดยไม่ได้ copy จากบรรทัด
          iSt := i+1; //ลำดับที่ ของตัวอักขระเริ่มต้น บรรทัดถัดไป
          ExtractNumberGroups(LnStr, NumGroups);

          With NumGroups do
          begin
            for j := 0 to NumGroups.Count-2 do
            begin
              //Showmessage('"'+NumGroups[j]+'='+NumGroups[NumGroups.Count-1]+'"');
              if (CountOccur('ชุด',LnStr) > 0) then
              begin

                if IsLastStr(trim(NumGroups[NumGroups.Count-1]),'ชุด') then
                  LnAll := LnAll+NumGroups[j]+'='+NumGroups[Count-1]+IntToStr(CountPermutations(NumGroups[j]))+#13#10
                else
                  LnAll := LnAll+NumGroups[j]+'='+NumGroups[Count-1]+'*'+IntToStr(CountPermutations(NumGroups[j]))+#13#10
              end
              else
                LnAll := LnAll+NumGroups[j]+'='+NumGroups[Count-1]+#13#10;

            end;
            //Showmessage(LnAll);

          end;



          foundEnd := false;
        end;




      end;


    end;



  finally
    StrGroups.free;
    NumGroups.free;
  end;
  Result := LnAll;
end;

function ReplaceInText(const InputStr: string; OldStr,NewStr: String): string;
var
  i, BCount: Integer;
  ResultText,Str: string;
begin
  Str := Trim(InputStr);
  BCount := 0; // ตัวนับจำนวน "บ"
  ResultText := ''; // ข้อความผลลัพธ์

  for i := 1 to Length(Str) do
  begin
    if ((Str[i-1] in [' ','.',',','-','_','0'..'9']) Or (i = 1)) and (Str[i] = OldStr) and (Str[i+1] in [' ','.',',','-','_','0'..'9']) then
      ResultText := ResultText+NewStr
    else
      ResultText := ResultText+Str[i];

  end;
  Result := ResultText;
end;

function RpStr(Str:String):String;
Var LnStr: String;
    i: Integer;
begin
      LnStr := Trim(Str);

      LnStr  := Replace(LnStr, 'ชุด', '');
      LnStr  := Replace(LnStr, 'unsent.', '');

      LnStr := Replace(LnStr,'Stickers','');
      LnStr := Replace(LnStr,'unsent a message.','');
      LnStr := Replace(LnStr,'ตัวละ','');
      LnStr := Replace(LnStr,'ตูละ','');
      LnStr := Replace(LnStr,'ประตูละ','');
      LnStr := Replace(LnStr,':','');

      LnStr  := Replace(LnStr, 'ว.บ', 'ลอยบน');
      LnStr  := Replace(LnStr, 'ว-บ', 'ลอยบน');
      LnStr  := Replace(LnStr, 'ว,บ', 'ลอยบน');

      LnStr  := Replace(LnStr, 'ว.ล', 'ลอยล่าง');
      LnStr  := Replace(LnStr, 'ว-ล', 'ลอยล่าง');
      LnStr  := Replace(LnStr, 'ว,ล', 'ลอยล่าง');

      LnStr  := Replace(LnStr, 'ล.บ', 'บน-ล่าง');
      LnStr  := Replace(LnStr, 'ล-บ', 'บน-ล่าง');
      LnStr  := Replace(LnStr, 'ล,บ', 'บน-ล่าง');

      LnStr  := Replace(LnStr, 'ลบ', 'ลอยบน');
      LnStr  := Replace(LnStr, 'ลล', 'ลอยล่าง');
      LnStr  := Replace(LnStr, 'ล.ล', 'ลอยล่าง');
      LnStr  := Replace(LnStr, 'ล-ล', 'ลอยล่าง');
      LnStr  := Replace(LnStr, 'ล,ล', 'ลอยล่าง');

      LnStr  := Replace(LnStr, 'บ ล', 'บน-ล่าง');
      LnStr  := Replace(LnStr, 'บ.ล', 'บน-ล่าง');
      LnStr  := Replace(LnStr, 'บ,ล', 'บน-ล่าง');
      LnStr  := Replace(LnStr, 'บ-ล', 'บน-ล่าง');
      LnStr  := Replace(LnStr, 'บ/ล', 'บน-ล่าง');


      if Length(Trim(LnStr)) > 1  then
      begin
        LnStr  := ReplaceInText(LnStr, 'บ','บน');
        LnStr  := ReplaceInText(LnStr, 'ล','ล่าง');
      end
      else
      begin
        LnStr  := Replace(LnStr, 'บ','บน');
        LnStr  := Replace(LnStr, 'ล','ล่าง');
      end;
      LnStr := Replace(LnStr,'-','');
      LnStr := Replace(LnStr,'<>','');
      //LnStr := Replace(LnStr,'[','');
      //LnStr := Replace(LnStr,']','');

      Result := LnStr;
end;

function IsSetNumOnly(Str: String): Boolean;
begin
  Result := false;
  if (Pos('บน',Str) = 0) and (Pos('ล่าง',Str) = 0) and (Pos('วิ่ง',Str) = 0) and (Pos('ลอย',Str) = 0) and
     (Pos('แพ',Str) = 0) and (Pos('โต๊ด',Str) = 0) and (Pos('โต้ด',Str) = 0) then

  Result := true;
end;

function CurType(Digit: Integer; Str: String): String;
Var NumType: String;
begin
  NumType := 'บน';
  if Digit = 1 then
  begin
    if (Pos('วิ่ง',Str) > 0) then NumType := 'วิ่งบน';
    if (Pos('ลอย',Str) > 0)  then NumType := 'วิ่งบน';
    if (Pos('หน้า',Str) > 0) and (Pos('บน',Str) > 0) then NumType := 'ปักหน้าบน';
    if (Pos('กลาง',Str) > 0) and (Pos('บน',Str) > 0) then NumType := 'ปักกลางบน';
    if (Pos('หลัง',Str) > 0) and (Pos('บน',Str) > 0) then NumType := 'ปักหลังบน';
    if (Pos('หน้า',Str) > 0) and (Pos('ล่าง',Str) > 0) then NumType := 'ปักหน้าล่าง';
    if (Pos('หลัง',Str) > 0) and (Pos('ล่าง',Str) > 0) then NumType := 'ปักหลังล่าง';
  end
  else
  if Digit = 2 then
  begin
    if (Pos('วิ่ง',Str) > 0) then NumType := 'มี';
    if (Pos('ลอย',Str) > 0)  then NumType := 'มี';
    if (Pos('โต๊ด',Str) > 0) then NumType := 'มี';
    if (Pos('โต้ด',Str) > 0) then NumType := 'มี';
    if (Pos('โตด',Str) > 0) then NumType := 'มี';
  end;
  if Digit = 3 then
  begin
    if (Pos('โต๊ด',Str) > 0) then NumType := '[3 ตัวโต๊ด]';
    if (Pos('โต้ด',Str) > 0) then NumType := '[3 ตัวโต๊ด]';
    if (Pos('โตด',Str) > 0) then NumType := '[3 ตัวโต๊ด]';
  end;
  if Digit = 4 then
  begin
    if (Pos('ลอย',Str) > 0) Or (Pos('แพ',Str) > 0) then NumType := '[4 ตัวลอยแพ]';
  end;
  if Digit = 5 then
  begin
    if (Pos('ลอย',Str) > 0) Or (Pos('แพ',Str) > 0) then NumType := '[5 ตัวลอยแพ]';
  end;

  Result := NumType;
end;

function GetCurTypes(Str:String; LstType: String): String;
Var CurType: String;
begin
  CurType := LstType; //'Empty';
  //Showmessage(Str+'  '+LstType);
  if (CountOccur('บน',Str) > 0) then // Or (CountOccur('กลาง',Str) > 0) then // Or (Trim(Str) = 'บ') Or (Trim(Str) = 'บ.') then
  begin
    if (CountOccur('ล่าง',Str) > 0) Or (CountOccur('ล่า',Str) > 0) then
    begin
      CurType := 'บนล่าง';
    end
    else
    if CountOccur('หน้า',Str) > 0 then
    begin
      CurType := 'หน้าบน';
    end
    else
    if CountOccur('หลัง',Str) > 0 then
    begin
      CurType := 'หลังบน';
    end
    else
    if CountOccur('กลาง',Str) > 0 then
    begin
      CurType := 'กลางบน';
    end
    else
    if CountOccur('ถ่าง',Str) > 0 then
    begin
      CurType := 'ถ่างบน';
    end
    else
    if CountOccur('4 ตัวบน',Str) > 0 then
    begin
      CurType := '4 ตัวบน';
    end
    else
    if CountOccur('5 ตัวบน',Str) > 0 then
    begin
      CurType := '5 ตัวบน';
    end
    else
    begin
      if (CountOccur('มี',Str) > 0) Or (CountOccur('ลอย',Str) > 0) Or (CountOccur('วิ่ง',Str) > 0) Or (CountOccur('แพ',Str) > 0) then
      begin
        CurType := 'ลอยบน';
      end
      else
      if (CountOccur('โต๊ด',Str) > 0) Or (CountOccur('โต้ด',Str) > 0) Or (CountOccur('โตด',Str) > 0) then
      begin
        if (CountOccur('3 ตัวโต๊ด',Str) > 0) then
          CurType := '3 ตัวโต๊ด'
        else
          CurType := 'ลอยบน';
      end
      else
        CurType := 'บน'
    end;
  end
  else
  begin  //ไม่มีคำว่า บน
    if (CountOccur('ล่าง',Str) > 0) then//  Or (Trim(Str) = 'ล') Or (Trim(Str) = 'ล.') then  //มีคำว่าล่าง
    begin
      if (CountOccur('3 ตัวล่าง',Str) > 0) then
        CurType := '3 ตัวล่าง'
      else
      if (CountOccur('หน้า',Str) > 0) then
        CurType := 'หน้าล่าง'
      else
      if (CountOccur('หลัง',Str) > 0) then
        CurType := 'หลังล่าง'
      else
        CurType := 'ล่าง'
    end
    else
    begin //ไม่มีทั้งคำว่าบน และคำว่าล่าง
      if (CountOccur('มี',Str) > 0) Or (CountOccur('ลอย',Str) > 0) Or (CountOccur('วิ่ง',Str) > 0) Or (CountOccur('แพ',Str) > 0) then
        CurType := 'ลอยบน'
      else
      if (CountOccur('โต๊ด',Str) > 0) Or (CountOccur('โต้ด',Str) > 0) Or (CountOccur('โตด',Str) > 0) then
      begin
        if (CountOccur('3 ตัวโต๊ด',Str) > 0) then
          CurType := '3 ตัวโต๊ด'
        else
          CurType := 'ลอยบน';
      end
      else
      if (CountOccur('กลับ',Str) > 0) then
        CurType := 'กลับ'
      else
      if (CountOccur('3 ตัวล่าง',Str) > 0) then
        CurType := '3 ตัวล่าง'
      else
      if (CountOccur('ถ่าง',Str) > 0) then
        CurType := 'ถ่างบน'
    end;
  end;
  Result := CurType;
end;

function FoundNumType(Const Str:String): Boolean;
Var CurType: String;
    FoundType: Boolean;
begin
  FoundType := false;
  if (CountOccur('บน',Str) > 0)   Or (CountOccur('ล่าง',Str) > 0) Or (CountOccur('ลอย',Str) > 0) Or
     (CountOccur('วิ่ง',Str) > 0) Or (CountOccur('แพ',Str) > 0)   Or (CountOccur('มี',Str) > 0)  Or
     (CountOccur('โต๊ด',Str) > 0) Or (CountOccur('โต้ด',Str) > 0) then
  begin
     FoundType := true;
  end;
  Result := FoundType;
end;

function GetCurType(Str:String): String;
Var CurType: String;
begin
  CurType := 'Empty';
  if (CountOccur('บน',Str) > 0) Or (CountOccur('กลาง',Str) > 0) then // Or (Trim(Str) = 'บ') Or (Trim(Str) = 'บ.') then
  begin
    if CountOccur('ล่าง',Str) > 0 then
    begin
      CurType := 'บนล่าง';
    end
    else
    if CountOccur('หน้า',Str) > 0 then
    begin
      CurType := 'หน้าบน';
    end
    else
    if CountOccur('หลัง',Str) > 0 then
    begin
      CurType := 'หลังบน';
    end
    else
    if CountOccur('กลาง',Str) > 0 then
    begin
      CurType := 'กลางบน';
    end
    else
    if CountOccur('ถ่าง',Str) > 0 then
    begin
      CurType := 'ถ่างบน';
    end
    else
    begin
      if (CountOccur('มี',Str) > 0) Or (CountOccur('ลอย',Str) > 0) Or (CountOccur('วิ่ง',Str) > 0) Or (CountOccur('แพ',Str) > 0) then
        CurType := 'ลอยบน'
      else
      //if (CountOccur('โต๊ด',Str) > 0) Or (CountOccur('โต้ด',Str) > 0) Or (CountOccur('โตด',Str) > 0) then
        //CurType := 'ลอยบน'

      if (CountOccur('โต๊ด',Str) > 0) Or (CountOccur('โต้ด',Str) > 0) Or (CountOccur('โตด',Str) > 0) then
      begin
        if (CountOccur('3 ตัวโต๊ด',Str) > 0) then
          CurType := '3 ตัวโต๊ด'
        else
          CurType := 'ลอยบน';
      end
      else
      if (CountOccur('บน',Str) > 0) then
        CurType := 'บน'
      else
      if (CountOccur('3 ตัวล่าง',Str) > 0) then
        CurType := '3 ตัวล่าง'
      else
        CurType := 'Empty'
    end;
  end
  else
  begin
    if (CountOccur('ล่าง',Str) > 0) then//  Or (Trim(Str) = 'ล') Or (Trim(Str) = 'ล.') then
    begin
      if (CountOccur('3 ตัวล่าง',Str) > 0) then
        CurType := '3 ตัวล่าง'
      else
      if (CountOccur('หน้า',Str) = 0) and (CountOccur('หลัง',Str) = 0) then
        CurType := 'ล่าง'
      else
      begin
        if (CountOccur('หน้า',Str) > 0) then
          CurType := 'หน้าล่าง'
        else
        if (CountOccur('หลัง',Str) > 0) then
          CurType := 'หลังล่าง'
      end;
    end
    else
    begin
      if (CountOccur('มี',Str) > 0) Or (CountOccur('ลอย',Str) > 0) Or (CountOccur('วิ่ง',Str) > 0) Or (CountOccur('แพ',Str) > 0) then
        CurType := 'ลอยบน'
      else
      if (CountOccur('โต๊ด',Str) > 0) Or (CountOccur('โต้ด',Str) > 0) Or (CountOccur('โตด',Str) > 0) then
      begin
        if (CountOccur('3 ตัวโต๊ด',Str) > 0) then
          CurType := '3 ตัวโต๊ด'
        else
          CurType := 'ลอยบน';
      end
      else
      if (CountOccur('กลับ',Str) > 0) then
        CurType := 'กลับ'
      else
      if (CountOccur('3 ตัวล่าง',Str) > 0) then
        CurType := '3 ตัวล่าง'
      else
        CurType := 'Empty'
    end;
  end;
  Result := CurType;
end;


function ReplaceSpaces(const Input: string): string;
var
  i, EqualPos: Integer;
  ResultStr: string;
  LastSpacePos: Integer;
begin
  // ถ้าไม่มีช่องว่างเลย ก็คืนค่าคืนไปตรงๆ
  if Pos(' ', Input) = 0 then
  begin
    Result := Input;
    Exit;
  end;

  EqualPos := Pos('=', Input);

  if EqualPos > 0 then
  begin
    // มีเครื่องหมาย =: แทนที่ช่องว่างก่อน =
    ResultStr := '';
    for i := 1 to Length(Input) do
    begin
      if (Input[i] = ' ') and (i < EqualPos) then
        ResultStr := ResultStr + '/'
      else
        ResultStr := ResultStr + Input[i];
    end;
  end
  else
  begin
    // ไม่มีเครื่องหมาย =: แทนที่ช่องว่างทั้งหมดด้วย / ยกเว้นตัวสุดท้ายให้เป็น =
    // หาตำแหน่ง space สุดท้ายก่อนจบข้อความ
    LastSpacePos := 0;
    for i := Length(Input) downto 1 do
    begin
      if Input[i] = ' ' then
      begin
        LastSpacePos := i;
        Break;
      end;
    end;

    ResultStr := '';
    for i := 1 to Length(Input) do
    begin
      if Input[i] = ' ' then
      begin
        if i = LastSpacePos then
          ResultStr := ResultStr + '='
        else
          ResultStr := ResultStr + '/'
      end
      else
        ResultStr := ResultStr + Input[i];
    end;
  end;

  Result := ResultStr;
end;

function ExtractThaiText(const Input: string): string;
const
  ExcludeChars: set of Char = ['0'..'9','A'..'Z', 'a'..'z', '=', '+', '-', '*', '/', '#', ':'];
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(Input) do
  begin
    if not (Input[i] in ExcludeChars) then
      Result := Result + Input[i];
  end;
end;

function ConvertComma(const InputText: string): string;
var
  EqualPos, i: Integer;
  ResultStr: string;
begin
  ResultStr := '';
  EqualPos := Pos('=', InputText);

  // วนลูปทีละตัวอักษร
  for i := 1 to Length(InputText) do
  begin
    if InputText[i] = ',' then
    begin
      if i < EqualPos then
        ResultStr := ResultStr + '/'  // เปลี่ยน , ก่อน =
      else
        Continue; // ละทิ้ง , หลัง =
    end
    else
      ResultStr := ResultStr + InputText[i]; // คัดลอกตัวอักษรอื่นๆ
  end;

  Result := ResultStr;
end;

function ConvertFirstStarCondition(const InputText: string): string;
var
  i, Len, AsteriskPos, EqualPos: Integer;
  DigitCount, NumStart: Integer;
  ResultStr: string;
  Ch: Char;
begin
  ResultStr := InputText;
  AsteriskPos := 0;
  EqualPos := Pos('=', InputText);
  DigitCount := 0;
  NumStart := 0;

  // หาตำแหน่งของ * ที่อยู่ระหว่างเลขชุดที่ 1 กับ 2 เท่านั้น
  for i := 1 to Length(InputText) do
  begin
    Ch := InputText[i];

    if Ch in ['0'..'9'] then
    begin
      // เริ่มนับเลขชุด
      if (i = 1) or not (InputText[i-1] in ['0'..'9']) then
        Inc(DigitCount);
    end
    else if (Ch = '*') and (DigitCount = 1) and (AsteriskPos = 0) then
    begin
      AsteriskPos := i;
    end
    else if (DigitCount >= 2) then
      Break;
  end;

  if AsteriskPos > 0 then
  begin
    // ตรวจว่ามี = อยู่ก่อน * หรือไม่
    if (EqualPos > 0) and ((EqualPos < AsteriskPos) Or (EqualPos > AsteriskPos)) then
    begin
      // มี = อยู่ก่อน *  ลบ *
      Delete(ResultStr, AsteriskPos, 1);
    end
    else
    begin
      // เปลี่ยน * ตัวแรกเป็น =
      ResultStr[AsteriskPos] := '=';
    end;
  end;

  Result := ResultStr;
end;

function IsWordChar(C: Char): Boolean;
begin
  Result := (C in ['A'..'Z', 'a'..'z']) or (C in ['ก'..'๙']);
end;

function ReplaceIsolatedCharWithWord(const Input, Target, Replacement: string): string;
var
  i, L, TLen: Integer;
  Found: Boolean;
  BeforeChar, AfterChar: Char;
  Output: string;
begin
  Output := '';
  i := 1;
  TLen := Length(Target);
  L := Length(Input);

  while i <= L do
  begin
    Found := False;

    // ตรวจสอบว่าตรงกับ Target หรือไม่
    if (i + TLen - 1 <= L) and (Copy(Input, i, TLen) = Target) then
    begin
      // ตรวจสอบตัวก่อนหน้า
      if i = 1 then
        BeforeChar := ' '
      else
        BeforeChar := Input[i - 1];

      // ตรวจสอบตัวหลัง
      if i + TLen > L then
        AfterChar := ' '
      else
        AfterChar := Input[i + TLen];

      // ถ้าตัวก่อน/หลัง ไม่ใช่ตัวอักษรอังกฤษหรือไทย
      if not IsWordChar(BeforeChar) and not IsWordChar(AfterChar) then
        Found := True;
    end;

    if Found then
    begin
      Output := Output + Replacement;
      Inc(i, TLen);
    end
    else
    begin
      Output := Output + Input[i];
      Inc(i);
    end;
  end;

  Result := Output;
end;



function ReplaceIsolatedCharWithWord1(const Text, TargetChar, Replacement: string): string;
var
  i: Integer;
  c: Char;
  IsCharBeforeValid, IsCharAfterValid: Boolean;
begin
  Result := '';
  i := 1;
  while i <= Length(Text) do
  begin
    c := Text[i];
    if c = TargetChar then
    begin
      // ตรวจสอบด้านซ้าย
      IsCharBeforeValid := (i = 1) or (Text[i - 1] in ['0'..'9', '+', '-', '*', '/', '=', '.', ' ', #13, #10]);

      // ตรวจสอบด้านขวา
      IsCharAfterValid := (i = Length(Text)) or (Text[i + 1] in ['0'..'9', '+', '-', '*', '/', '=', '.', ' ', #13, #10]);

      // เฉพาะตัวเลขเครื่องหมายหรือช่องว่างเท่านั้นที่ติดได้
      if IsCharBeforeValid and IsCharAfterValid then
      begin
        Result := Result + Replacement;
        Inc(i);
        Continue;
      end;
    end;

    Result := Result + c;
    Inc(i);
  end;
end;

function IsCommaBeforeEQ(const Input: string): Boolean;
var
  i: Integer;
  EqualPos: Integer;
  ResultStr: string;
begin
  EqualPos := Pos('=', Input);  // หาตำแหน่งของ =
  Result := false;

  for i := 1 to Length(Input) do
  begin
    if Input[i] in [',','/',')','('] then
    begin
      if EqualPos > i then
        Result := true;
    end
  end;
end;

function ProcessComma(const Input: string): string;
var
  i: Integer;
  EqualPos: Integer;
  ResultStr: string;
begin
  EqualPos := Pos('=', Input);  // หาตำแหน่งของ =
  ResultStr := '';

  for i := 1 to Length(Input) do
  begin
    if Input[i] in [',','/',')','('] then
    begin
      if (EqualPos = 0) or (i < EqualPos) then
        ResultStr := ResultStr + '/'   // ถ้า , อยู่ก่อน = ให้แทนด้วย /
      else
        Continue;                      // ถ้า , อยู่หลัง = ให้ข้าม
    end
    else
      ResultStr := ResultStr + Input[i];
  end;

  Result := ResultStr;
end;

function ProcessCommaSymbol(const Input: string): string;
var
  i, EqualPos: Integer;
  Output: string;
begin
  EqualPos := Pos('=', Input);
  Output := '';

  for i := 1 to Length(Input) do
  begin
    if Input[i] = ',' then
    begin
      if EqualPos = 0 then
        Continue  // ไม่มี '='  ลบ , ทิ้ง
      else if i < EqualPos then
        Output := Output + '/'  // , ก่อน =  เปลี่ยนเป็น /
      else
        Continue;  // , หลัง =  ลบทิ้ง
    end
    else
      Output := Output + Input[i];
  end;

  Result := Output;
end;

function ProcessSymbols(const Input: string): string;
var
  i, EqualPos: Integer;
  Output: string;
begin
  EqualPos := Pos('=', Input);
  Output := '';

  for i := 1 to Length(Input) do
  begin
    if Input[i] in ['(',')',','] then
    begin
      if (EqualPos = 0) then
      begin
        //Continue  // ไม่มี '='  ลบ , ทิ้ง
        //else if i < EqualPos then
        if Input[i] in ['(',')'] then
          Output := Output + '/'  // , ก่อน =  เปลี่ยนเป็น /
        else
          Output := Output + '';
      end
      else
      if (i < EqualPos) then
      begin
        Output := Output + '/';  // , ก่อน =  เปลี่ยนเป็น /
      end
      else
      if (i > EqualPos) then
      begin
        //Continue;  // , หลัง =  ลบทิ้ง
        //Output := Output + Input[i];
        if Input[i] in ['('] then
          Output := Output + Input[i]//'*'
        else
        if Input[i] in [')',','] then
          Continue;  // , หลัง =  ลบทิ้ง
          //Output := Output + '';

      end;
    end
    else
      Output := Output + Input[i];
  end;
  Result := Output;
end;

function FormatNumberCommaString(const AMessage: string): string;
var
  s: string;
  i, digitCount, commaCount, dashCount: Integer;
  hasEquals, hasMultiply: Boolean;
  inNumber: Boolean;
  prevChar: Char;
begin
  s := Trim(AMessage);
  if s = '' then
  begin
    Result := s;
    Exit;
  end;

  // ?????????????????, ??????, ??? ?????????????????????
  digitCount := 0;
  commaCount := 0;
  dashCount := 0;
  hasEquals := Pos('=', s) > 0;
  hasMultiply := (Pos('*', s) > 0) or (Pos('x', LowerCase(s)) > 0);
  inNumber := False;
  prevChar := #0;
  
  for i := 1 to Length(s) do
  begin
    if s[i] in ['0'..'9'] then
    begin
      if not inNumber then
      begin
        Inc(digitCount);
        inNumber := True;
      end;
    end
    else
    begin
      inNumber := False;
      if s[i] = ',' then
        Inc(commaCount);
      if s[i] = '-' then
      begin
        // ???????????????????????? (???????????????????)
        if (i > 1) and (i < Length(s)) then
        begin
          // ???????????????????????????????????????????????
          if ((s[i-1] in ['0'..'9', ' ']) and (s[i+1] in ['0'..'9', ' '])) then
            Inc(dashCount);
        end;
      end;
    end;
    prevChar := s[i];
  end;

  // ??????????? 6: ????? (-) ?????????????? =
  if (dashCount >= 1) and hasEquals then
  begin
    Result := '';
    i := 1;
    
    while i <= Length(s) do
    begin
      if s[i] = '-' then
      begin
        // ???????????????????????? = ???????
        if Pos('=', Copy(s, i, Length(s))) > 0 then
        begin
          // ?????????????? = ???????? /
          Result := Result + '/';
        end
        else
        begin
          // ?????????????? = (?????) ??????????
          Result := Result + s[i];
        end;
      end
      else if s[i] = ' ' then
      begin
        // ????????????
      end
      else if (s[i] = 'x') or (s[i] = 'X') then
      begin
        Result := Result + '*';
      end
      else
      begin
        Result := Result + s[i];
      end;
      
      Inc(i);
    end;
    Exit;
  end;

  // ??????????? 5: ?????????????????????????????????????????????????????????
  if (digitCount >= 3) and (commaCount >= 2) then
  begin
    // ???????????????????????? = ????????????????????????????????
    if hasEquals or ((not hasEquals) and (Pos(' ', s) > 0)) then
    begin
      // ??????????????????????? = ???????????????????? /
      Result := '';
      i := 1;
      while i <= Length(s) do
      begin
        if s[i] = ',' then
        begin
          // ???????????????????????? = ????????????????/??????
          if (i < Length(s)) then
          begin
            if (s[i+1] = '=') or (s[i+1] = ' ') or (s[i+1] in ['0'..'9']) then
            begin
              // ???????????????????????????? =
              if Pos('=', Copy(s, 1, i)) > 0 then
                Result := Result + ','  // ?????????? = ????????? (??????)
              else
                Result := Result + '/';  // ?????????? = ???????? /
            end
            else
              Result := Result + ',';
          end
          else
            Result := Result + ',';
        end
        else if (s[i] = ' ') and (not hasEquals) and (i < Length(s)) and (s[i+1] in ['0'..'9']) then
          Result := Result + '='
        else if (s[i] = 'x') or (s[i] = 'X') then
          Result := Result + '*'
        else
          Result := Result + s[i];
        Inc(i);
      end;
      
      // ???????????????????? =
      i := Pos('=', Result);
      if i > 0 then
      begin
        s := Copy(Result, i+1, Length(Result));
        s := StringReplace(s, ',', '', [rfReplaceAll]);
        Result := Copy(Result, 1, i) + s;
      end;
      Exit;
    end;
  end;

  // ??????????? 4: 4 ???????????? ????????????????????? 2
  if (digitCount >= 4) and (commaCount >= 1) then
  begin
    Result := s;
    // ?????? x ???? *
    Result := StringReplace(Result, 'x', '*', [rfReplaceAll, rfIgnoreCase]);
    // ???????????????
    Result := StringReplace(Result, ',', '', [rfReplaceAll]);
    
    // ????? = ????????
    if not hasEquals then
    begin
      // ?????????????????? =
      i := 1;
      while (i <= Length(Result)) and not (Result[i] in ['0'..'9']) do
        Inc(i);
      while (i <= Length(Result)) and (Result[i] in ['0'..'9']) do
        Inc(i);
      // ???????????
      while (i <= Length(Result)) and not (Result[i] in ['0'..'9']) and (Result[i] <> '*') do
        Inc(i);
      if (i <= Length(Result)) and (Result[i] in ['0'..'9']) then
        Insert('=', Result, i);
    end;
    Exit;
  end;

  // ??????????? 3: 3 ?????? ???????????????? 2 ??? 3
  if (digitCount = 3) and (commaCount >= 1) and not hasMultiply then
  begin
    Result := '';
    inNumber := False;
    digitCount := 0;
    
    for i := 1 to Length(s) do
    begin
      if s[i] in ['0'..'9'] then
      begin
        if not inNumber then
        begin
          Inc(digitCount);
          inNumber := True;
        end;
        Result := Result + s[i];
      end
      else
      begin
        inNumber := False;
        if s[i] = ',' then
        begin
          // ????????
        end
        else if (s[i] = ' ') and (digitCount = 1) and (i < Length(s)) and 
                not (s[i+1] in ['0'..'9']) then
          Result := Result + '='
        else if (digitCount = 1) and not (s[i] in ['=']) and 
                (i < Length(s)) and (s[i+1] in ['0'..'9']) then
          Result := Result + '='
        else
          Result := Result + s[i];
      end;
    end;
    Exit;
  end;

  // ??????????? 2: 3 ?????? ???????????????? 1 ??? 2 ????? *
  if (digitCount >= 1) and (commaCount >= 1) and hasMultiply then
  begin
    Result := '';
    i := 1;
    
    // ????????????????????
    while i <= Length(s) do
    begin
      if s[i] = ',' then
      begin
        // ?????????????????????????????????????? * ??????????????
        // ????????????????????????????? * ???????
        if (i < Length(s)) then
        begin
          // ?????????????????????????????????????? *
          if (s[i+1] in ['0'..'9', ' ']) then
          begin
            // ?????????? * ???? x ???????????????
            if (Pos('*', Copy(s, i+1, Length(s))) > 0) or 
               (Pos('x', LowerCase(Copy(s, i+1, Length(s)))) > 0) then
            begin
              Result := Result + '=';
            end
            else
              Result := Result + ',';
          end
          else
            Result := Result + ''; // ?????????????????????????????????? ???? ??,????
        end
        else
          Result := Result + ',';
      end
      else if (s[i] = ' ') and (i < Length(s)) and (s[i+1] in ['0'..'9']) then
      begin
        // ????????????????????????????????? * ???????
        if (Pos('*', Copy(s, i+1, Length(s))) > 0) or 
           (Pos('x', LowerCase(Copy(s, i+1, Length(s)))) > 0) then
          Result := Result + '='
        else
          Result := Result + s[i];
      end
      else if (s[i] = 'x') or (s[i] = 'X') then
        Result := Result + '*'
      else
        Result := Result + s[i];
      
      Inc(i);
    end;
    Exit;
  end;

  // ??????????? 1: 2 ?????? ??????????????
  if (digitCount = 2) and (commaCount >= 1) then
  begin
    Result := StringReplace(s, ', ', '=', []);
    Result := StringReplace(Result, ',', '=', []);
    Exit;
  end;

  Result := s;
end;


function FixSlashToEqual(const Input: string): string;
var
  SlashCount, i, LastSlashPos: Integer;
  HasEqual: Boolean;
begin
  SlashCount := 0;
  LastSlashPos := 0;
  HasEqual := False;

  // นับจำนวน '/' และจำตำแหน่งล่าสุดไว้
  for i := 1 to Length(Input) do
  begin
    if Input[i] = '/' then
    begin
      Inc(SlashCount);
      LastSlashPos := i;
    end
    else if Input[i] = '=' then
      HasEqual := True;
  end;

  Result := Input;

  // ถ้ามี '/' มากกว่า 3 ตัว และไม่มี '=' ให้เปลี่ยน '/' ตัวสุดท้ายเป็น '='
  if (SlashCount >= 3) and (not HasEqual) and (LastSlashPos > 0) then
    Result[LastSlashPos] := '=';
end;

function ContainsDigit(const S: string): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 1 to Length(S) do
  begin
    if S[i] in ['0'..'9'] then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

function FilterAfterEqual(const Input: string): string;
var
  EqualPos, i: Integer;
  BeforeEqual, AfterEqualFiltered: string;
begin
  EqualPos := Pos('=', Input);

  if EqualPos = 0 then
  begin
    // ถ้าไม่มีเครื่องหมาย = ก็คืนข้อความเดิม
    Result := Input;
    Exit;
  end;

  // ข้อความก่อนและรวม '='
  BeforeEqual := Copy(Input, 1, EqualPos);

  // ข้อความหลัง '='
  AfterEqualFiltered := '';
  for i := EqualPos + 1 to Length(Input) do
  begin
    if Input[i] in ['0'..'9', '*'] then
      AfterEqualFiltered := AfterEqualFiltered + Input[i];
  end;

  Result := BeforeEqual + AfterEqualFiltered;
end;

function RemoveDatePattern(const Input: string): string;
const
  DaysOfWeek: array[0..6] of string =
    ('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
var
  i, StartPos, SpacePos: Integer;
  DatePart, DayPart, WordCandidate: string;
begin
  Result := Input;
  for i := 1 to Length(Input) - 10 do
  begin
    // ตรวจสอบว่าเป็นรูปแบบ YYYY.MM.DD (ความยาว 10 ตัวอักษร)
    DatePart := Copy(Input, i, 10);
    if (DatePart[5] = '.') and (DatePart[8] = '.') and
       (Copy(DatePart, 1, 4) >= '1900') and (Copy(DatePart, 1, 4) <= '2100') and
       (Copy(DatePart, 6, 2) >= '01') and (Copy(DatePart, 6, 2) <= '12') and
       (Copy(DatePart, 9, 2) >= '01') and (Copy(DatePart, 9, 2) <= '31') then
    begin
      // มองหาช่องว่างหลังวันที่
      SpacePos := i + 10;
      while (SpacePos <= Length(Input)) and (Input[SpacePos] = ' ') do
        Inc(SpacePos);

      // ดึงคำที่น่าจะเป็นชื่อวัน
      WordCandidate := '';
      while (SpacePos <= Length(Input)) and (Input[SpacePos] in ['A'..'Z', 'a'..'z']) do
      begin
        WordCandidate := WordCandidate + Input[SpacePos];
        Inc(SpacePos);
      end;

      // ตรวจสอบว่าเป็นชื่อวันหรือไม่
      for StartPos := Low(DaysOfWeek) to High(DaysOfWeek) do
      begin
        if SameText(WordCandidate, DaysOfWeek[StartPos]) then
        begin
          // ลบช่วงที่พบออกไปจากข้อความ
          Delete(Result, i, (SpacePos - i));
          Exit;
        end;
      end;
    end;
  end;
end;

function ReplaceSpacesIfOnlyDigitsAndSpaces(const Input: string): string;
var
  TrimmedText: string;
  i: Integer;
  IsValid: Boolean;
begin
  TrimmedText := Trim(Input);
  IsValid := True;

  // ตรวจสอบว่าเป็น ตัวเลขหรือช่องว่างเท่านั้น
  for i := 1 to Length(TrimmedText) do
  begin
    if not (TrimmedText[i] in ['0'..'9', ' ']) then
    begin
      IsValid := False;
      Break;
    end;
  end;

  if IsValid then
  begin
    // แทนที่ space ด้วย /
    Result := StringReplace(TrimmedText, ' ', '/', [rfReplaceAll]);
  end
  else
    Result := Input;  // คืนข้อความเดิมถ้ามีอักขระอื่น
end;

function BetweenPos12(const Str,Ch: String; const P1,P2: Integer): Boolean;
begin
  Result := false;
  if (Pos(Ch,Str) > P1) and (Pos(Ch,Str) < P2) then
    Result := true;
end;


function TfrmInputText.GetNumFromLineApp(Str: String):String;
Var NumOnlyGroups,StartGroups,NumOnlyGrps,GroupsNum,GrpsNumComma,GN_NumOnly,GroupsNumSym: TStringList;
    LastType,LnType,LnAll,LnStr,Ln_Str,LnStrs,LnStrTh,LnGroup,LnNumSym,LnTemp,LnNumSymSp,
    PreLnStr,LnStrGrps,SplitGrps,StrBfEQ,StrBhEQ: String;
    iSt,i,j,k,LastDigit,LastNumLen: Integer;
    FoundBlankLine,FoundType: Boolean;
    Grp0, Grp1, Grp2, GrpBfEnd, GrpEnd: Integer;
begin
  NumOnlyGroups := TStringList.Create;
  NumOnlyGrps   := TStringList.Create;
  StartGroups   := TStringList.Create;
  GroupsNum     := TStringList.Create;
  //GrpsNumComma  := TStringList.Create;
  GN_NumOnly    := TStringList.Create;
  GroupsNumSym  := TStringList.Create;

  LastType := 'บน';
  FoundBlankLine := false;
  FoundType := false;
  LastDigit := 0;
  LastNumLen := 0;
  try
    LnAll  := '';
    iSt := 1; //อักษรตัวแรกของบรรทัดใหม่
    LnGroup := '';
    LnStrGrps := '';

    for i := 1 to Length(Str) do
    begin
      LnStr := '';
      if (Str[i] = #10) Or (i = Length(Str)) then
      begin
        LnStr := Trim(Copy(Str,iSt,i-iSt+1)); //Copy ออกมาทีละบรรทัด โดยไม่ได้ copy จากบรรทัด
        iSt := i+1; //ลำดับที่ ของตัวอักขระเริ่มต้น บรรทัดถัดไป

        if (trim(LnStr) = '')  then
        begin
          if LnGroup = '' then
            FoundBlankLine := true;

          LastDigit := 0; //จำนวนตำแหน่งเลข
          Continue;
        end;

        LnStr := RemoveDatePattern(LnStr);
        //LnStr := RemoveTime1(LnStr);
        if LnStr = '' then
          LnStr := 'บน';

        if foundTime(LnStr) then
        begin
          LnStr := RemoveTime1(LnStr);
          LnGroup := '';
          LastType := 'บน';
        end;

        if (trim(LnStr) = '') Or (CountOccur('????',LnStr) > 0) then
          Continue;

        //LnStr := RemoveDateAndTime(LnStr);

        if (CountOccur('งวด',LnStr) > 0) Or (CountOccur('งวด',LnStr) > 0) Or (CountOccur('unsent',LnStr) > 0) Or (CountOccur('Stickers',LnStr) > 0) then
          Continue;

        LnStr  := Replace(LnStr, 'Top-Down', 'บน-ล่าง');
        LnStr  := Replace(LnStr, 'Top', 'บน');
        LnStr  := Replace(LnStr, 'Down', 'ล่าง');
        LnStr  := Replace(LnStr, 'Float', 'ลอย');

        LnStr  := Replace(LnStr, 'ประตูละ', '=');
        LnStr  := Replace(LnStr, 'ตูละ', '=');
        LnStr  := Replace(LnStr, 'ตัวละ', '=');
        LnStr  := Replace(LnStr, 'ประตู', '');
        LnStr  := Replace(LnStr, 'ตู', '');
        if (CountOccur('โต๊ด',LnStr) > 0) Or (CountOccur('โต้ด',LnStr) > 0) Or (CountOccur('โตด',LnStr) > 0) then
        begin
          if (CountOccur('ตรง',LnStr) > 0) then
          begin
            LnStr  := Replace(LnStr, 'ตรงโต๊ด', 'บน');
            LnStr  := Replace(LnStr, 'ตรง-โต๊ด', 'บน');
            LnStr  := Replace(LnStr, 'ตรง - โต๊ด', 'บน');
            LnStr  := Replace(LnStr, 'ตรงโต้ด', 'บน');
            LnStr  := Replace(LnStr, 'ตรง-โต้ด', 'บน');
            LnStr  := Replace(LnStr, 'ตรง - โต้ด', 'บน');
            LnStr  := Replace(LnStr, 'ตรงโตด', 'บน');
            LnStr  := Replace(LnStr, 'ตรง-โตด', 'บน');
            LnStr  := Replace(LnStr, 'ตรง - โตด', 'บน');
          end;
        end;

        LnStr  := Replace(LnStr, 'ยี่', '20');
        LnStr  := Replace(LnStr, 'สิบ', '10');
        LnStr  := Replace(LnStr, 'พลอย', 'Ploy');
        LnStr  := Replace(LnStr, 'กลอย', 'Kloy');
        LnStr  := Replace(LnStr, 'บัวลอย', 'Bualoy');
        LnStr  := Replace(LnStr, 'แพร', 'Pra');
        LnStr  := Replace(LnStr, 'แพล', 'Pla');
        LnStr  := Replace(LnStr, 'หมี', 'Mee');
        LnStr  := Replace(LnStr, 'มีม', 'Mim');
        LnStr  := Replace(LnStr, 'มีน', 'Min');
        LnStr  := Replace(LnStr, 'มีด', 'Mid');

        LnStr  := Replace(LnStr, '1ตัว', '');
        LnStr  := Replace(LnStr, '2ตัว', '');
        LnStr  := Replace(LnStr, '3ตัว', '');
        LnStr  := Replace(LnStr, '4ตัว', '');
        LnStr  := Replace(LnStr, '5ตัว', '');

        LnStr  := ReplaceIsolatedCharWithWord(LnStr, 'คูณ', '*');
        LnStr  := ReplaceIsolatedCharWithWord(LnStr, 'บล', 'บนล่าง');
        LnStr  := ReplaceIsolatedCharWithWord(LnStr, 'บล.', 'บนล่าง');
        LnStr  := ReplaceIsolatedCharWithWord(LnStr, 'บ-ล', 'บนล่าง');
        LnStr  := ReplaceIsolatedCharWithWord(LnStr, 'บ.ล', 'บนล่าง');
        LnStr  := ReplaceIsolatedCharWithWord(LnStr, 'บ*ล', 'บนล่าง');
        LnStr  := ReplaceIsolatedCharWithWord(LnStr, 'บ+ล', 'บนล่าง');
        LnStr  := ReplaceIsolatedCharWithWord(LnStr, 'บ', 'บน');  //เปลี่ยนแบบเฉพาะเจาะจง
        LnStr  := ReplaceIsolatedCharWithWord(LnStr, 'ล', 'ล่าง');
        LnStr  := ReplaceIsolatedCharWithWord(LnStr, 'บ.', 'บน');
        LnStr  := ReplaceIsolatedCharWithWord(LnStr, 'ล.', 'ล่าง');
        //Showmessage(LnStr);

        LnStr  := Replace(LnStr, '“', '*');
        LnStr  := Replace(LnStr, '”', '*');
        LnStr  := Replace(LnStr, '"', '*');
        LnStr  := Replace(LnStr, '&', '*');
        if Not(LnStr[1] = '?') then
          LnStr  := Replace(LnStr, '?', '*');
        LnStr  := Replace(LnStr, 'X', '*');
        LnStr  := Replace(LnStr, 'x', '*');
        LnStr  := Replace(LnStr, '#', '=');

        for k := 1 to 10 do  //กระชับพื้นที่
        begin
          LnStr  := Replace(LnStr, '  ', ' ');
          LnStr  := Replace(LnStr, ' = ', '=');
          LnStr  := Replace(LnStr, ' =', '=');
          LnStr  := Replace(LnStr, '= ', '=');
          LnStr  := Replace(LnStr, ' + ', '+');
          LnStr  := Replace(LnStr, ' +', '+');
          LnStr  := Replace(LnStr, '+ ', '+');
          LnStr  := Replace(LnStr, ' - ', '-');
          LnStr  := Replace(LnStr, ' -', '-');
          LnStr  := Replace(LnStr, '- ', '-');
          LnStr  := Replace(LnStr, ' * ', '*');
          LnStr  := Replace(LnStr, ' *', '*');
          LnStr  := Replace(LnStr, '* ', '*');
          LnStr  := Replace(LnStr, '***', '*');
          LnStr  := Replace(LnStr, '**', '*');
          LnStr  := Replace(LnStr, ' / ', '/');
          LnStr  := Replace(LnStr, ' /', '/');
          LnStr  := Replace(LnStr, '/ ', '/');
          LnStr  := Replace(LnStr, '/=', '=');
          LnStr  := Replace(LnStr, ' : ', ':');
          LnStr  := Replace(LnStr, ' :', ':');
          LnStr  := Replace(LnStr, ': ', ':');
          LnStr  := Replace(LnStr, ':=', '=');
          //LnStr  := Replace(LnStr, '*=', '=');
          LnStr  := Replace(LnStr, '=*', '=');
          LnStr  := Replace(LnStr, 'บน ', 'บน');
          LnStr  := Replace(LnStr, 'ล่าง ', 'ล่าง');
        end;
        if LnStr[1] = '*' then
          LnStr := Copy(LnStr,2,Length(LnStr)-1);

        if IsLastStr(LnStr,'*') then
          LnStr  := ReplaceLast(LnStr, '*', '');

        if IsLastStr(LnStr,'.') then
          LnStr  := ReplaceLast(LnStr, '.', '');

        if IsLeftStr(LnStr,'.') then
          LnStr  := ReplaceLast(LnStr, '.', '');

        //Showmessage(LnStr);
        if (CountOccur('ชุด',LnStr) = 0) then
          if (CountOccur('*ช',LnStr) = 1) then
            LnStr := Replace(LnStr,'*ช','*ชุด');

        LnStr := FormatNumberCommaString(LnStr);

        //Showmessage(LnStr);
        LnStr := ProcessSymbols(LnStr);

        ExtractStartNumGroups(LnStr, StartGroups);
        ExtractNumberOnly(LnStr, NumOnlyGroups);

        StrBfEQ := Copy(LnStr,1,Pos('=',LnStr)-1);
        if (CountNum(StrBfEQ) = 2) then
        begin
          StrBhEQ := Copy(LnStr,Pos('=',LnStr),Length(LnStr)-Pos('=',LnStr)+1);
          if (Length(NumOnlyGroups[0]) = 1) and (Length(NumOnlyGroups[1]) = 1) and
             BetweenPos12(LnStr,'*', StrToInt(StartGroups[0]), StrToInt(StartGroups[1]))  and
             BetweenPos12(LnStr,'=', StrToInt(StartGroups[1]), StrToInt(StartGroups[2])) then
          begin
            LnStr := 'ถ่างบน '+ NumOnlyGroups[0]+NumOnlyGroups[1]+StrBhEQ;
            ExtractStartNumGroups(LnStr, StartGroups);
            ExtractNumberOnly(LnStr, NumOnlyGroups);
          end
          else
          if (Length(NumOnlyGroups[0]) = 2) and BetweenPos12(LnStr,'*', StrToInt(StartGroups[0]), Pos('=',LnStr)) then
          begin
            LnStr := 'หน้าบน '+NumOnlyGroups[0]+StrBhEQ;
          end
          else
          begin
            if Not(FoundNumType(LnStr)) then
            begin
              if (LastNumLen <> 2) and (LastNumLen <> 0) then
              begin
                LastType := 'บน';
                LnStr := LastType+' '+LnStr;
              end
              else
              begin
                if (Length(StrBfEQ) = 2) Or ((Length(StrBfEQ) = 3) and (StrBfEQ[2] in ['0'..'9']) and (StrBfEQ[3] in ['0'..'9']))  then
                begin
                  if (LastType = 'ถ่างบน') Or (LastType = 'หน้าบน') then
                    LastType := 'บน'
                  else
                    LastType := GetCurTypes(LnStr, LastType);

                  LnStr := LastType+' '+LnStr;
                end
              end;
            end
          end;
        end
        else
        begin
          if (Pos('*=',LnStr) > 0) then
            LnStr := Replace(LnStr,'*=','=');
        end;

        if (NumOnlyGroups.Count > 2) then
          LnStr := ReplaceSpacesIfOnlyDigitsAndSpaces(LnStr);

        if (NumOnlyGroups.Count = 0) Or ((NumOnlyGroups.Count = 1) and (Length(NumOnlyGroups[0]) = 1) and ((CountOccur('2 ตัว',LnStr) = 1) Or (CountOccur('3 ตัว',LnStr) = 1) Or (CountOccur('4 ตัว',LnStr) = 1) Or (CountOccur('5 ตัว',LnStr) = 1) Or
           (CountOccur('2ตัว',LnStr) = 1) Or (CountOccur('3ตัว',LnStr) = 1) Or (CountOccur('4ตัว',LnStr) = 1) Or (CountOccur('5ตัว',LnStr) = 1))) then
        begin
          FoundType := true;
          //showmessage('1 '+Lnstr);
          LastNumLen := 0;
          if (CountOccur('บน',LnStr) > 0) then // Or (CountOccur('กลาง',LnStr) > 0) then //มีคำว่าบน
          begin
            if (CountOccur('ล่าง',LnStr) > 0) Or (CountOccur('ล่า',LnStr) > 0) then
            begin
              LastType := 'บนล่าง';
            end
            else
            if CountOccur('หน้า',LnStr) > 0 then
            begin
              LastType := 'หน้าบน';
            end
            else
            if CountOccur('หลัง',LnStr) > 0 then
            begin
              LastType := 'หลังบน';
            end
            else
            if CountOccur('กลาง',LnStr) > 0 then
            begin
              LastType := 'กลางบน';
            end
            else
            if CountOccur('ถ่าง',LnStr) > 0 then
            begin
              LastType := 'ถ่างบน';
            end
            else
            if (CountOccur('3 ตัวโต๊ด',LnStr) > 0) then
            begin
              LastType := '3 ตัวโต๊ด'
            end
            else
            if CountOccur('4 ตัว',LnStr) > 0 then
            begin
              LastType := '4 ตัวบน';
            end
            else
            if CountOccur('5 ตัว',LnStr) > 0 then
            begin
              LastType := '5 ตัวบน';
            end
            else
            begin
              if (CountOccur('มี',LnStr) > 0) Or (CountOccur('ลอย',LnStr) > 0) Or (CountOccur('วิ่ง',LnStr) > 0) Or (CountOccur('แพ',LnStr) > 0) then
                LastType := 'ลอยบน'
              else
              if (CountOccur('โต๊ด',LnStr) > 0) Or (CountOccur('โต้ด',LnStr) > 0) Or (CountOccur('โตด',LnStr) > 0) then
              begin
                LastType := 'ลอยบน';
              end
              else
                LastType := 'บน';
            end
          end
          else
          begin //ไม่มีคำว่าบน
            if (CountOccur('ล่าง',LnStr) > 0) then //มีคำว่าล่าง
            begin
              //Showmessage(LnStr);
              if (CountOccur('หน้า',LnStr) > 0) then
                LastType := 'หน้าล่าง'
              else
              if (CountOccur('หลัง',LnStr) > 0) then
                LastType := 'หลังล่าง'
              else
              if (CountOccur('3 ตัวล่าง',LnStr) > 0) then
                LastType := '3 ตัวล่าง'
              else
                LastType := 'ล่าง';
            end
            else
            begin //ไมีมีทั้งคำว่าบน และคำว่าล่าง
              if (CountOccur('มี',LnStr) > 0) Or (CountOccur('ลอย',LnStr) > 0) Or (CountOccur('วิ่ง',LnStr) > 0) Or (CountOccur('แพ',LnStr) > 0) then
                LastType := 'ลอยบน'
              else
              if (CountOccur('โต๊ด',LnStr) > 0) Or (CountOccur('โต้ด',LnStr) > 0) Or (CountOccur('โตด',LnStr) > 0) then
              begin
                if (CountOccur('3 ตัวโต๊ด',LnStr) > 0) then
                  LastType := '3 ตัวโต๊ด'
                else
                  LastType := 'ลอยบน';
              end
              else
                LastType := 'บน'
            end
          end;
        end
        else
        begin

          if (NumOnlyGroups.Count=4) then
          begin
            Grp0 := StrToInt(StartGroups[0]);
            Grp1 := StrToInt(StartGroups[1]);
            Grp2 := StrToInt(StartGroups[2]);
            GrpBfEnd := StrToInt(StartGroups[NumOnlyGroups.Count-2]);
            GrpEnd := StrToInt(StartGroups[NumOnlyGroups.Count-1]);

            if (CountOccur('(',LnStr) > 0) Or (CountOccur(')',LnStr) > 0) then
            begin
              if IsLastStr(LnStr,')') then
                LnStr := ReplaceLast(LnStr,')','');

              if ((Pos('(',LnStr) > Grp1) and (Pos('(',LnStr) < Grp2))then
                LnStr := Replace(LnStr,'(','*');
              LnStr := Replace(LnStr,' ','');
            end;
          end;

          if Not FoundType then
          begin
            if Length(NumOnlyGroups[0]) = 3 then
            begin
              if (LastNumLen <> 3)  then
                LastType := 'บน';

              if (LastType = '3 ตัวโต๊ด') then
                LastType := '3 ตัวโต๊ด'
              else
              if (LastType = '3 ตัวล่าง') then
                LastType := '3 ตัวล่าง'
            end
            else
            if Length(NumOnlyGroups[0]) = 4 then
            begin
              if NumOnlyGroups.Count = 2 then
              begin
                if LastType = 'ลอยบน' then
                  LastType := 'ลอยบน'
                else
                if LastType = '4 ตัวบน' then
                  LastType := '4 ตัวบน'
                else
                  LastType := 'บน'
              end
              else
                LastType := 'บน';
            end
            else
            if Length(NumOnlyGroups[0]) = 5 then
            begin
              if NumOnlyGroups.Count = 2 then
              begin
                if LastType = 'ลอยบน' then
                  LastType := 'ลอยบน'
                else
                if LastType = '5 ตัวบน' then
                  LastType := '5 ตัวบน'
                else
                  LastType := 'บน'
              end
              else
                LastType := 'บน';
            end;
          end;
          FoundType := false;
          if LnStrGrps = '' then // LnStrGrps คือกรณีที่มีเลขเป็นชุดหลายบรรทัด ก็เก็บข้อความทุกบรรทัดเพื่อเอามาหาประเภทเลข
            LnStrGrps := LnStr
          else
            LnStrGrps := LnStrGrps+' '+LnStr; //เก็บทุกข้อความในกลุ่มเลข

          if IsNumAndSlashOnly(LnStr) Or IsNumOnly(LnStr) then // Or IsNumAndEQOnly(LnStrs) then // 1/2, 12/25, 123/457, 123, 54
          begin
              if LnGroup = '' then
              begin
                LnGroup := LnStr;
                if NumOnlyGroups.Count = 3 then //  25/50/50, 457/100/20
                begin
                  LastType := GetCurTypes(LnStr, LastType);
                  LnAll := LnAll+LastType+' '+NumOnlyGroups[0]+'='+NumOnlyGroups[1]+'*'+NumOnlyGroups[2]+#13#10;
                  LastNumLen := Length(NumOnlyGroups[0]);
                  LnGroup := '';
                  LnStrGrps := '';
                end;
              end
              else
              begin
                if (LnGroup[Length(LnGroup)] <> '/') then
                  LnGroup := LnGroup+'/'+LnStr
                else
                  LnGroup := LnGroup+LnStr;
              end;
          end
          else // Not Num only and slash and num
          begin
            //Showmessage(LnStr);
            LnStr := FixSlashToEqual(LnStr);

            if LnGroup <> '' then
            begin
              //Showmessage(LnStr);
              if (NumOnlyGroups.Count = 1) then
              begin
                if (CountOccur('ชุด',LnStr) = 0) then // =20
                begin
                  LnGroup := LnGroup + '=' + NumOnlyGroups[0];

                  LastType := GetCurTypes(LnStrGrps, LastType);
                  ExtractNumberOnly(LnGroup, GN_NumOnly);
                  for k := 0 to GN_NumOnly.Count-2 do
                  begin
                    LnAll := LnAll+LastType+' '+GN_NumOnly[k]+'='+GN_NumOnly[GN_NumOnly.Count-1]+#13#10;
                    LastNumLen := Length(GN_NumOnly[k]);
                  end;
                  LnGroup := '';
                  LnStrGrps := '';
                  LastType := 'บน';
                end
                else
                begin
                  LnGroup := LnGroup + '=' + NumOnlyGroups[0];

                  LastType := GetCurTypes(LnStrGrps, LastType);
                  ExtractNumberOnly(LnGroup, GN_NumOnly);
                  for k := 0 to GN_NumOnly.Count-2 do
                  begin
                    if Length(GN_NumOnly[k]) = 2 then
                    begin
                      if GN_NumOnly[k][1] <> GN_NumOnly[k][2] then
                        LnAll := LnAll+LastType+' '+GN_NumOnly[k]+'='+GN_NumOnly[GN_NumOnly.Count-1]+'*'+GN_NumOnly[GN_NumOnly.Count-1]+#13#10
                      else
                        LnAll := LnAll+LastType+' '+GN_NumOnly[k]+'='+GN_NumOnly[GN_NumOnly.Count-1]+#13#10;
                      LastNumLen := Length(GN_NumOnly[k]);
                    end
                    else
                    begin
                      if Permutation(GN_NumOnly[k]) > 1 then
                        LnAll := LnAll+LastType+' '+GN_NumOnly[k]+'='+GN_NumOnly[GN_NumOnly.Count-1]+'*'+IntToStr(Permutation(GN_NumOnly[k]))+#13#10
                      else
                        LnAll := LnAll+LastType+' '+GN_NumOnly[k]+'='+GN_NumOnly[GN_NumOnly.Count-1]+#13#10;
                      LastNumLen := Length(GN_NumOnly[k]);
                    end;
                  end;
                  LnGroup := '';
                  LnStrGrps := '';
                  LastType := 'บน';
                end
              end
              else // LnGroup <> '' and  NumOnlyGroups.Count > 1
              begin
                if (NumOnlyGroups.Count = 2) then  // 20*20, 123=20, 123 20, 456=20*ชุด, 100-50
                begin
                  //Showmessage('fkdfjlfd');
                  if (CountOccur('ชุด',LnStr) = 0) then  // 20*20, 123=20, 123 20
                  begin
                    if (CountOccur('=',LnStr) = 1) then
                    begin
                      if (Pos('=',LnStr) < StrToInt(StartGroups[0])) then // =20*20, =22*6
                      begin
                        LnGroup := LnGroup + '=' + NumOnlyGroups[0]+'*'+NumOnlyGroups[1];

                        LastType := GetCurTypes(LnStrGrps, LastType);
                        ExtractNumberOnly(LnGroup, GN_NumOnly);
                        for k := 0 to GN_NumOnly.Count-3 do
                        begin
                          LnAll := LnAll+LastType+' '+GN_NumOnly[k]+'='+GN_NumOnly[GN_NumOnly.Count-2]+'*'+GN_NumOnly[GN_NumOnly.Count-1]+#13#10;
                          LastNumLen := Length(GN_NumOnly[k]);
                        end;
                        LnGroup := '';
                        LnStrGrps := '';
                        LastType := 'บน';
                      end
                      else
                      if (Pos('=',LnStr) > StrToInt(StartGroups[0])) and (Pos('=',LnStr) < StrToInt(StartGroups[1])) then // 20=20
                      begin
                        LnGroup := LnGroup + '/' + NumOnlyGroups[0]+'='+NumOnlyGroups[1];

                        LastType := GetCurTypes(LnStrGrps, LastType);
                        ExtractNumberOnly(LnGroup, GN_NumOnly);
                        for k := 0 to GN_NumOnly.Count-2 do
                        begin
                          LnAll := LnAll+LastType+' '+GN_NumOnly[k]+'='+GN_NumOnly[GN_NumOnly.Count-1]+#13#10;
                          LastNumLen := Length(GN_NumOnly[k]);
                        end;
                        LnGroup := '';
                        LnStrGrps := '';
                        LastType := 'บน';
                      end;
                    end
                    else
                    begin
                      if (CountOccur(' ',trim(LnStr)) > 0) and (CountOccur('*',trim(LnStr)) = 0) then
                      begin
                        LnGroup := LnGroup + '/' + NumOnlyGroups[0]+'='+NumOnlyGroups[1];  // 25 100

                        LastType := GetCurTypes(LnStrGrps, LastType);
                        ExtractNumberOnly(LnGroup, GN_NumOnly);
                        for k := 0 to GN_NumOnly.Count-2 do
                        begin
                          LnAll := LnAll+LastType+' '+GN_NumOnly[k]+'='+GN_NumOnly[GN_NumOnly.Count-1]+#13#10;
                          LastNumLen := Length(GN_NumOnly[k]);
                        end;
                        LnGroup := '';
                        LnStrGrps := '';
                        LastType := 'บน';
                      end
                      else
                      if (CountOccur('*',LnStr) = 1) or (CountOccur('-',LnStr) = 1) or (CountOccur('+',LnStr) = 1) then // 35*100, 100*50, 35-100, 100-50, 35+100, 100+50
                      begin
                        LnGroup := LnGroup + '=' + NumOnlyGroups[0]+'*'+NumOnlyGroups[1];  // 20*20

                        LastType := GetCurTypes(LnStrGrps, LastType);
                        ExtractNumberOnly(LnGroup, GN_NumOnly);
                        for k := 0 to GN_NumOnly.Count-3 do
                        begin
                          if Length(GN_NumOnly[k]) = 3 then
                          begin
                            if (CountOccur('3 ตัวโต๊ด',LnStrGrps) = 0) and (CountOccur('3 ตัวล่าง',LnStrGrps) = 0)  then
                              LastType := 'บน';

                            LnAll := LnAll+LastType+' '+GN_NumOnly[k]+'='+GN_NumOnly[GN_NumOnly.Count-2]+'*'+GN_NumOnly[GN_NumOnly.Count-1]+#13#10;
                          end
                          else
                          begin
                            LnAll := LnAll+LastType+' '+GN_NumOnly[k]+'='+GN_NumOnly[GN_NumOnly.Count-2]+'*'+GN_NumOnly[GN_NumOnly.Count-1]+#13#10;
                          end;
                          LastNumLen := Length(GN_NumOnly[k]);
                        end;
                        LnGroup := '';
                        LnStrGrps := '';
                        LastType := 'บน';
                      end;
                    end;
                  end
                  else // เลข 2 ชุด และมีคำว่า ชุด  30=20*ชุด, 35 100*ชุด
                  begin
                    LnGroup := LnGroup + '/' + NumOnlyGroups[0]+'='+NumOnlyGroups[1];

                    LastType := GetCurTypes(LnStrGrps, LastType);
                    ExtractNumberOnly(LnGroup, GN_NumOnly);
                    for k := 0 to GN_NumOnly.Count-2 do
                    begin
                      if Length(GN_NumOnly[k]) = 2 then
                      begin
                        if GN_NumOnly[k][1] <> GN_NumOnly[k][2] then
                          LnAll := LnAll+LastType+' '+GN_NumOnly[k]+'='+GN_NumOnly[GN_NumOnly.Count-1]+'*'+GN_NumOnly[GN_NumOnly.Count-1]+#13#10
                        else
                          LnAll := LnAll+LastType+' '+GN_NumOnly[k]+'='+GN_NumOnly[GN_NumOnly.Count-1]+#13#10;
                        LastNumLen := Length(GN_NumOnly[k]);
                      end
                      else
                      begin
                        if Permutation(NumOnlyGroups[0]) > 1 then
                          LnAll := LnAll+LastType+' '+GN_NumOnly[k]+'='+GN_NumOnly[GN_NumOnly.Count-1]+'*'+IntToStr(Permutation(GN_NumOnly[k]))+#13#10;
                        LastNumLen := Length(GN_NumOnly[k]);
                      end;
                    end;
                    LnGroup := '';
                    LnStrGrps := '';
                    LastType := 'บน';
                  end;
                end
                else
                if (NumOnlyGroups.Count = 3) then
                begin
                  LnGroup := LnGroup + '/' + NumOnlyGroups[0]+'='+NumOnlyGroups[1]+'*'+NumOnlyGroups[2];  // 123=20*20

                  LastType := GetCurTypes(LnStrGrps, LastType);
                  ExtractNumberOnly(LnGroup, GN_NumOnly);
                  for k := 0 to GN_NumOnly.Count-3 do
                  begin
                    LnAll := LnAll+LastType+' '+GN_NumOnly[k]+'='+GN_NumOnly[GN_NumOnly.Count-2]+'*'+GN_NumOnly[GN_NumOnly.Count-1]+#13#10;
                    LastNumLen := Length(GN_NumOnly[k]);
                  end;
                  LnGroup := '';
                  LnStrGrps := '';
                  LastType := 'บน';
                end;
              end;
            end   // LnGroup <> 'ว่างเปล่า'  //--------------------------------------------------------------------//
            else 
            begin // LnGroup = 'ว่างเปล่า'
                //Showmessage(LnStr);
                if (NumOnlyGroups.Count = 2) then
                begin
                  if (CountOccur('ชุด',LnStr) = 0) then // 123=20, 123 200
                  begin
                    LnGroup := NumOnlyGroups[0]+'='+NumOnlyGroups[1];
                    LastType := GetCurTypes(LnStrGrps, LastType);

                    if (Length(NumOnlyGroups[0]) = 4) Or (Length(NumOnlyGroups[0]) = 5)  then
                    begin
                      //LastType := GetCurTypes(LnStrGrps, LastType);
                      if (LastType <> '4 ตัวบน') and (LastType <> '5 ตัวบน') then
                      begin
                        LastType := 'ลอยบน';
                        LnAll := LnAll+LastType+' '+LnGroup+#13#10;
                      end
                      else
                        LnAll := LnAll+'บน '+LnGroup+#13#10;
                    end
                    else
                    begin
                      //LastType := GetCurTypes(LnStrGrps, LastType);
                      if (LastType = '3 ตัวโต๊ด') then
                      begin
                        LnAll := LnAll+'ลอยบน'+' '+LnGroup+#13#10;
                      end
                      else
                      if (LastType = '3 ตัวล่าง') then
                      begin
                        LnAll := LnAll+'ล่าง'+' '+LnGroup+#13#10;
                      end
                      else
                        LnAll := LnAll+LastType+' '+LnGroup+#13#10;
                    end;

                    LastNumLen := Length(NumOnlyGroups[0]);
                    LnGroup := '';
                    LnStrGrps := '';
                  end
                  else
                  begin
                    if Permutation(NumOnlyGroups[0]) > 1 then
                      LnGroup := NumOnlyGroups[0]+'='+NumOnlyGroups[1]+'*'+IntToStr(Permutation(NumOnlyGroups[0]))
                    else
                      LnGroup := NumOnlyGroups[0]+'='+NumOnlyGroups[1];

                    LastType := GetCurTypes(LnStrGrps, LastType);
                    LnAll := LnAll+LastType+' '+LnGroup+#13#10;
                    LastNumLen := Length(NumOnlyGroups[0]);
                    LnGroup := '';
                    LnStrGrps := '';
                  end
                end
                else
                if (NumOnlyGroups.Count = 3) then  // 123=20*20, 123/456=20, 123/456=20*ชุด, 25=20*20
                begin
                  if (CountOccur('ชุด',LnStr) = 0) then // 123=20*20, 123/456=20
                  begin
                    if (CountOccur('*',LnStr) = 1) then
                    begin
                      LnGroup := NumOnlyGroups[0]+'='+NumOnlyGroups[1]+'*'+NumOnlyGroups[2];
                      LastType := GetCurTypes(LnStrGrps, LastType);
                      if Length(NumOnlyGroups[0]) = 2 then
                      begin
                        if (LastType = 'ลอยบน') then
                        begin
                          LastType := 'บน';
                          LnAll := LnAll+LastType+' '+LnGroup+#13#10;
                        end
                        else
                        begin
                          LnAll := LnAll+LastType+' '+LnGroup+#13#10;
                        end;
                      end
                      else
                      if Length(NumOnlyGroups[0]) = 3 then
                      begin
                        if (LastType = 'ลอยบน') Or (LastType = 'ล่าง') Or (LastType = '3 ตัวล่าง') Or (LastType = '3 ตัวโต๊ด') then
                        begin
                          LastType := 'บน';
                          LnAll := LnAll+LastType+' '+LnGroup+#13#10;
                        end
                        else
                          LnAll := LnAll+LastType+' '+LnGroup+#13#10;
                      end
                      else
                      if Length(NumOnlyGroups[0]) = 4 then
                      begin
                        if (LastType = 'ลอยบน') Or (LastType = 'บน') then
                        begin
                          LastType := 'บน';
                          if (NumOnlyGroups[1] = '4') Or (NumOnlyGroups[1] = '6') Or (NumOnlyGroups[1] = '12') Or (NumOnlyGroups[1] = '24') then
                            LnAll := LnAll+LastType+' '+NumOnlyGroups[0]+'='+NumOnlyGroups[2]+'*'+IntToStr(Permutation(NumOnlyGroups[0]))+#13#10
                          else
                            LnAll := LnAll+LastType+' '+LnGroup+#13#10;
                        end
                        else
                          LnAll := LnAll+LastType+' '+LnGroup+#13#10;
                      end
                      else
                      if Length(NumOnlyGroups[0]) = 5 then
                      begin
                        if (LastType = 'ลอยบน') Or (LastType = 'บน') then
                        begin
                          LastType := 'บน';
                          if (NumOnlyGroups[1] = '4') Or (NumOnlyGroups[1] = '7') Or (NumOnlyGroups[1] = '13') Or (NumOnlyGroups[1] = '18') Or (NumOnlyGroups[1] = '33') Or (NumOnlyGroups[1] = '60') then
                            LnAll := LnAll+LastType+' '+NumOnlyGroups[0]+'='+NumOnlyGroups[2]+'*'+IntToStr(Permutation(NumOnlyGroups[0]))+#13#10
                          else
                            LnAll := LnAll+LastType+' '+LnGroup+#13#10;
                        end
                        else
                          LnAll := LnAll+LastType+' '+LnGroup+#13#10;
                      end
                      else
                      begin
                        if (LastType = 'ลอยบน') Or (LastType = 'บน') then
                        begin
                          LastType := 'บน';
                          LnAll := LnAll+LastType+' '+LnGroup+#13#10;
                        end
                        else
                          LnAll := LnAll+LastType+' '+LnGroup+#13#10;
                      end;


                      LastNumLen := Length(NumOnlyGroups[0]);
                      LnGroup := '';
                      LnStrGrps := '';
                    end
                    else
                    if (CountOccur('/',LnStr) = 1) and ((Pos('/',LnStr) > StrToInt(StartGroups[0]))) and ((Pos('/',LnStr) < StrToInt(StartGroups[1]))) then
                    begin
                        LnGroup := NumOnlyGroups[0]+'/'+NumOnlyGroups[1]+'='+NumOnlyGroups[2];

                        LastType := GetCurTypes(LnStrGrps, LastType);
                        ExtractNumberOnly(LnGroup, GN_NumOnly);
                        for k := 0 to GN_NumOnly.Count-2 do
                        begin
                          LnAll := LnAll+LastType+' '+GN_NumOnly[k]+'='+GN_NumOnly[GN_NumOnly.Count-1]+#13#10;
                          LastNumLen := Length(GN_NumOnly[k]);
                        end;
                        LnGroup := '';
                        LnStrGrps := '';
                    end
                    else
                    begin
                      LnGroup := NumOnlyGroups[0]+'='+NumOnlyGroups[1]+'*'+NumOnlyGroups[2];

                      LastType := GetCurTypes(LnStrGrps, LastType);
                      LnAll := LnAll+LastType+' '+LnGroup+#13#10;
                      LastNumLen := Length(NumOnlyGroups[0]);
                      LnGroup := '';
                      LnStrGrps := '';
                    end;
                  end
                  else
                  begin
                    LnGroup := LnStr;

                    LastType := GetCurTypes(LnStrGrps, LastType);
                    ExtractNumberOnly(LnGroup, GN_NumOnly);
                    for k := 0 to GN_NumOnly.Count-2 do
                    begin
                      if Permutation(GN_NumOnly[k]) > 1 then
                        LnAll := LnAll+LastType+' '+GN_NumOnly[k]+'='+GN_NumOnly[GN_NumOnly.Count-1]+'*'+IntToStr(Permutation(GN_NumOnly[k]))+#13#10
                      else
                        LnAll := LnAll+LastType+' '+GN_NumOnly[k]+'='+GN_NumOnly[GN_NumOnly.Count-1]+#13#10;
                      LastNumLen := Length(GN_NumOnly[k]);
                    end;
                    LnGroup := '';
                    LnStrGrps := '';
                  end;
                end
                else // NumOnlyGroups.Count > 3   327=50*10*5, 327=50=10*5, 327=50*5*10, 322=50*2*10
                begin
                  if (CountOccur('=',LnStr) > 1) then
                  begin
                    ExtractGroupsNumSym(LnStr, GroupsNumSym);

                    if Not((NumOnlyGroups.Count = 4) and ((IsLastStr(LnStr,'*5')) Or (IsLastStr(LnStr,'*2')) Or (CountOccur('*5*',LnStr) > 0) Or (CountOccur('*2*',LnStr) > 0)) ) then
                    begin
                      LastType := GetCurTypes(LnStrGrps, LastType);
                      for k := 0 to GroupsNumSym.Count-1 do
                      begin
                        ExtractNumberOnly(GroupsNumSym[k], GN_NumOnly);
                        LnAll := LnAll+LastType+' '+GroupsNumSym[k]+#13#10;
                        LastNumLen := Length(GN_NumOnly[0]);
                      end;
                      LnGroup := '';
                      LnStrGrps := '';
                    end;
                  end;

                  //364=100*5*20, 255=100*2*30
                  if (NumOnlyGroups.Count = 4) and (Length(NumOnlyGroups[0]) = 3) and ((CountOccur('*5*',LnStr) > 0) Or (CountOccur('*2*',LnStr) > 0)) and (CountOccur('*',LnStr)=2) then
                  begin
                    LnGroup := NumOnlyGroups[0]+'='+NumOnlyGroups[1]+'*'+IntToStr(Permutation(NumOnlyGroups[0])-1)+'*'+NumOnlyGroups[3];
                    LastType := GetCurTypes(LnStrGrps, LastType);
                    LnAll := LnAll+LastType+' '+LnGroup+#13#10;
                    LastNumLen := Length(NumOnlyGroups[0]);
                    LnGroup := '';
                    LnStrGrps := '';
                  end
                  else  //364=100*20*5, 255=100*20*2
                  if ((NumOnlyGroups.Count = 4) and (Length(NumOnlyGroups[0]) = 3)) and  (IsLastStr(LnStr,'*2') Or IsLastStr(LnStr,'*5')) and (CountOccur('*',LnStr)=2) then
                  begin
                    LnGroup := NumOnlyGroups[0]+'='+NumOnlyGroups[1]+'*'+IntToStr(Permutation(NumOnlyGroups[0])-1)+'*'+NumOnlyGroups[2];
                    LastType := GetCurTypes(LnStrGrps, LastType);
                    LnAll := LnAll+LastType+' '+LnGroup+#13#10;
                    LastNumLen := Length(NumOnlyGroups[0]);
                    LnGroup := '';
                    LnStrGrps := '';
                  end
                  else //364=100*20*6, 255=100*20*3
                  if ((NumOnlyGroups.Count = 4) and (Length(NumOnlyGroups[0]) = 3)) and  (IsLastStr(LnStr,'*3') Or IsLastStr(LnStr,'*6')) and (CountOccur('*',LnStr)=2) then
                  begin
                    LnGroup := NumOnlyGroups[0]+'='+IntToStr(StrToInt(NumOnlyGroups[1])+StrToInt(NumOnlyGroups[2]))+'*'+IntToStr(Permutation(NumOnlyGroups[0])-1)+'*'+NumOnlyGroups[2];
                    LastType := GetCurTypes(LnStrGrps, LastType);
                    LnAll := LnAll+LastType+' '+LnGroup+#13#10;
                    LastNumLen := Length(NumOnlyGroups[0]);
                    LnGroup := '';
                    LnStrGrps := '';
                  end
                  else //255=100*20*20
                  if ((NumOnlyGroups.Count = 4) and (Length(NumOnlyGroups[0]) = 3)) and (NumOnlyGroups[2]=NumOnlyGroups[3]) and (CountOccur('*',LnStr) = 2) then
                  begin
                    LnGroup := NumOnlyGroups[0]+'='+NumOnlyGroups[1]+'*'+IntToStr(Permutation(NumOnlyGroups[0])-1)+'*'+NumOnlyGroups[3];
                    LastType := GetCurTypes(LnStrGrps, LastType);
                    LnAll := LnAll+LastType+' '+LnGroup+#13#10;
                    LastNumLen := Length(NumOnlyGroups[0]);
                    LnGroup := '';
                    LnStrGrps := '';
                  end;

                  if (CountOccur('/', LnStr) > 0) and (CountOccur('=', LnStr) > 0) then
                  begin
                    if (CountOccur('ชุด',LnStr) = 0) then
                    begin
                      if (CountOccur('*',LnStr) = 0) then
                      begin
                        LnGroup := LnStr;

                        LastType := GetCurTypes(LnStrGrps, LastType);
                        ExtractNumberOnly(LnGroup, GN_NumOnly);
                        for k := 0 to GN_NumOnly.Count-2 do
                        begin
                          LnAll := LnAll+LastType+' '+GN_NumOnly[k]+'='+GN_NumOnly[GN_NumOnly.Count-1]+#13#10;
                          LastNumLen := Length(GN_NumOnly[k]);
                        end;
                        LnGroup := '';
                        LnStrGrps := '';
                      end
                      else
                      begin
                        LnGroup := LnStr;

                        LastType := GetCurTypes(LnStrGrps, LastType);
                        ExtractNumberOnly(LnGroup, GN_NumOnly);
                        for k := 0 to GN_NumOnly.Count-3 do
                        begin
                          LnAll := LnAll+LastType+' '+GN_NumOnly[k]+'='+GN_NumOnly[GN_NumOnly.Count-2]+'*'+GN_NumOnly[GN_NumOnly.Count-1]+#13#10;
                          LastNumLen := Length(GN_NumOnly[k]);
                        end;
                        LnGroup := '';
                        LnStrGrps := '';
                      end;
                    end
                    else
                    begin
                      LnGroup := LnStr;

                      LastType := GetCurTypes(LnStrGrps, LastType);
                      ExtractNumberOnly(LnGroup, GN_NumOnly);
                      for k := 0 to GN_NumOnly.Count-2 do
                      begin
                        if Permutation(GN_NumOnly[k]) > 1 then
                          LnAll := LnAll+LastType+' '+GN_NumOnly[k]+'='+GN_NumOnly[GN_NumOnly.Count-1]+'*'+IntToStr(Permutation(GN_NumOnly[k]))+#13#10
                        else
                          LnAll := LnAll+LastType+' '+GN_NumOnly[k]+'='+GN_NumOnly[GN_NumOnly.Count-1]+#13#10;
                        LastNumLen := Length(GN_NumOnly[k]);
                      end;
                      LnGroup := '';
                      LnStrGrps := '';
                    end;
                  end;

                end;

            end;

          end;

        end;

      end;

    end; //end for
  finally
    NumOnlyGroups.Free;
    NumOnlyGrps.Free;
    StartGroups.Free;
    GroupsNum.Free;
    GN_NumOnly.Free;
    GrpsNumComma.Free;
    GroupsNumSym.Free;
  end;
  //Showmessage(LnAll);
  Result := LnAll;
end;
//-------------------------------------------

function TfrmInputText.GetNumFromLineApp1(Str: String):String;
Var NumOnlyGroups,StartGroups,NumOnlyGrps,GroupsNum,GrpsNumComma,GN_NumOnly: TStringList;
    LastType,LnType,LnAll,LnStr,Ln_Str,LnStrs,LnStrTh,LnGroup,LnNumSym,LnTemp,LnNumSymSp,
    PreLnStr,LnStrGrps,SplitGrps,StrBfEQ,StrBhEQ: String;
    iSt,i,j,k,LastDigit,LastNumLen: Integer;
    FoundBlankLine: Boolean;
begin
  NumOnlyGroups := TStringList.Create;
  NumOnlyGrps   := TStringList.Create;
  StartGroups   := TStringList.Create;
  GroupsNum     := TStringList.Create;
  GrpsNumComma  := TStringList.Create;
  GN_NumOnly    := TStringList.Create;

  LastType := 'บน';
  FoundBlankLine := false;
  LastDigit := 0;
  LastNumLen := 0;
  try
    LnAll  := '';
    iSt := 1; //อักษรตัวแรกของบรรทัดใหม่
    LnGroup := '';
    LnStrGrps := '';

    for i := 1 to Length(Str) do
    begin
      LnStr := '';
      if (Str[i] = #10) Or (i = Length(Str)) then
      begin
        LnStr := Trim(Copy(Str,iSt,i-iSt+1)); //Copy ออกมาทีละบรรทัด โดยไม่ได้ copy จากบรรทัด
        iSt := i+1; //ลำดับที่ ของตัวอักขระเริ่มต้น บรรทัดถัดไป

        if (trim(LnStr) = '')  then
        begin
          if LnGroup = '' then
            FoundBlankLine := true;

          LastDigit := 0; //จำนวนตำแหน่งเลข
          Continue;
        end;

        if foundTime(LnStr) then
        begin
          LnGroup := '';
          if GetCurType(LnStr) = 'Empty' then
            LastType := 'บน';
        end;

        LnStr := RemoveDatePattern(LnStr);
       

        LnStr := RemoveTime1(LnStr);

        if (trim(LnStr) = '') Or (CountOccur('????',LnStr) > 0) then
          Continue;

        //LnStr := RemoveDateAndTime(LnStr);

        if (CountOccur('งวด',LnStr) > 0) Or (CountOccur('งวด',LnStr) > 0) Or (CountOccur('unsent',LnStr) > 0) Or (CountOccur('Stickers',LnStr) > 0) then
          Continue;

        LnStr  := Replace(LnStr, 'หมี', 'หมิ๋');
        LnStr  := Replace(LnStr, 'มีม', 'มิม');
        LnStr  := Replace(LnStr, 'มีน', 'มิน');
        LnStr  := Replace(LnStr, 'มีด', 'มิด');
        LnStr  := ReplaceIsolatedCharWithWord(LnStr, 'บล', 'บนล่าง');
        LnStr  := ReplaceIsolatedCharWithWord(LnStr, 'บล.', 'บนล่าง');
        LnStr  := ReplaceIsolatedCharWithWord(LnStr, 'บ-ล', 'บนล่าง');
        LnStr  := ReplaceIsolatedCharWithWord(LnStr, 'บ.ล', 'บนล่าง');
        LnStr  := ReplaceIsolatedCharWithWord(LnStr, 'บ*ล', 'บนล่าง');
        LnStr  := ReplaceIsolatedCharWithWord(LnStr, 'บ+ล', 'บนล่าง');

        LnStr  := ReplaceIsolatedCharWithWord(LnStr, 'บ', 'บน');  //เปลี่ยนแบบเฉพาะเจาะจง
        LnStr  := ReplaceIsolatedCharWithWord(LnStr, 'ล', 'ล่าง');
        LnStr  := ReplaceIsolatedCharWithWord(LnStr, 'บ.', 'บน');
        LnStr  := ReplaceIsolatedCharWithWord(LnStr, 'ล.', 'ล่าง');

        //Showmessage(LnStr);

        LnStr  := Replace(LnStr, '“', '*');
        LnStr  := Replace(LnStr, '”', '*');
        LnStr  := Replace(LnStr, '"', '*');
        LnStr  := Replace(LnStr, '&', '*');
        if Not(LnStr[1] = '?') then
          LnStr  := Replace(LnStr, '?', '*');
        LnStr  := Replace(LnStr, 'X', '*');
        LnStr  := Replace(LnStr, 'x', '*');
        LnStr  := Replace(LnStr, '#', '=');

        for k := 1 to 10 do  //กระชับพื้นที่
        begin
          LnStr  := Replace(LnStr, '  ', ' ');
          LnStr  := Replace(LnStr, ' = ', '=');
          LnStr  := Replace(LnStr, ' =', '=');
          LnStr  := Replace(LnStr, '= ', '=');
          LnStr  := Replace(LnStr, ' + ', '+');
          LnStr  := Replace(LnStr, ' +', '+');
          LnStr  := Replace(LnStr, '+ ', '+');
          LnStr  := Replace(LnStr, ' - ', '-');
          LnStr  := Replace(LnStr, ' -', '-');
          LnStr  := Replace(LnStr, '- ', '-');
          LnStr  := Replace(LnStr, ' * ', '*');
          LnStr  := Replace(LnStr, ' *', '*');
          LnStr  := Replace(LnStr, '* ', '*');
          LnStr  := Replace(LnStr, ' / ', '/');
          LnStr  := Replace(LnStr, ' /', '/');
          LnStr  := Replace(LnStr, '/ ', '/');
          LnStr  := Replace(LnStr, '/=', '=');
          LnStr  := Replace(LnStr, ' : ', ':');
          LnStr  := Replace(LnStr, ' :', ':');
          LnStr  := Replace(LnStr, ': ', ':');
          LnStr  := Replace(LnStr, ':=', '=');

          LnStr  := Replace(LnStr, 'บน ', 'บน');
          LnStr  := Replace(LnStr, 'ล่าง ', 'ล่าง');
        end;

        ExtractStartNumGroups(LnStr, StartGroups);
        ExtractNumberOnly(LnStr, NumOnlyGroups);

        if (NumOnlyGroups.Count = 0) Or ((CountOccur('2 ตัว',LnStr) = 1) Or (CountOccur('3 ตัว',LnStr) = 1) Or (CountOccur('4 ตัว',LnStr) = 1) Or (CountOccur('5 ตัว',LnStr) = 1) Or
           (CountOccur('2ตัว',LnStr) = 1) Or (CountOccur('3ตัว',LnStr) = 1) Or (CountOccur('4ตัว',LnStr) = 1) Or (CountOccur('5ตัว',LnStr) = 1) ) then
        begin
          //LastDigit := 0;
          LastNumLen := 0;
          if (CountOccur('บน',LnStr) > 0) Or (CountOccur('กลาง',LnStr) > 0) then
          begin
            if CountOccur('ล่าง',LnStr) > 0 then
            begin
              LastType := 'บนล่าง';
            end
            else
            if CountOccur('หน้า',LnStr) > 0 then
            begin
              LastType := 'หน้าบน';
            end
            else
            if CountOccur('หลัง',LnStr) > 0 then
            begin
              LastType := 'หลังบน';
            end
            else
            if CountOccur('กลาง',LnStr) > 0 then
            begin
              LastType := 'กลางบน';
            end
            else
            if CountOccur('ถ่าง',LnStr) > 0 then
            begin
              LastType := 'ถ่างบน';
            end
            else
            begin
              if (CountOccur('มี',LnStr) > 0) Or (CountOccur('ลอย',LnStr) > 0) Or (CountOccur('วิ่ง',LnStr) > 0) Or (CountOccur('แพ',LnStr) > 0) then
                LastType := 'ลอยบน '
              else
              if (CountOccur('โต๊ด',LnStr) > 0) Or (CountOccur('โต้ด',LnStr) > 0) Or (CountOccur('โตด',LnStr) > 0) then
                LastType := 'ลอยบน'
              else
                LastType := 'บน'
            end;
          end
          else
          begin
            if (CountOccur('ล่าง',LnStr) > 0) then
            begin
              if (CountOccur('หน้า',LnStr) = 0) and (CountOccur('หลัง',LnStr) = 0) then
                LastType := 'ล่าง'
              else
              begin
                if (CountOccur('หน้า',LnStr) > 0) then
                  LastType := 'หน้าล่าง'
                else
                if (CountOccur('หลัง',LnStr) > 0) then
                  LastType := 'หลังล่าง'
              end;
            end
            else
            begin
              if (CountOccur('มี',LnStr) > 0) Or (CountOccur('ลอย',LnStr) > 0) Or (CountOccur('วิ่ง',LnStr) > 0) Or (CountOccur('แพ',LnStr) > 0) then
                LastType := 'ลอยบน '
              else
              begin
                if (CountOccur('โต๊ด',LnStr) > 0) Or (CountOccur('โต้ด',LnStr) > 0) Or (CountOccur('โตด',LnStr) > 0) then
                  LastType := 'ลอยบน'
                else
                  LastType := 'บน'
              end;
            end;
          end;
        end
        else  // NumOnlyGroups.Count > 0
        begin
          //showmessage(LnStr);
          SplitGroups(LnStr, GroupsNum); //แยกกลุ่มตัวเลขในบรรทัดเดียวกันเป็ฯ กลุ่มๆ
          //Showmessage('Total Group = '+IntToStr(GroupsNum.Count));

          if (GroupsNum.Count = 1) then  
          begin
              //Showmessage(GroupsNum[0]);
              if pos('-',GroupsNum[0]) > 0 then  //123-100*20
              begin
                if pos('-',GroupsNum[0]) < pos('*',GroupsNum[0]) then
                  SplitGroups(Replace(GroupsNum[0],'-','='), GroupsNum);
              end;

              if (pos('ชุด',GroupsNum[0]) > 1) and (pos('ชุด',GroupsNum[0]) < Length(GroupsNum[0])) then  //123ชุด20
              begin
                  SplitGroups(Replace(GroupsNum[0],'ชุด','=')+'*ชุด', GroupsNum);
              end;
              //Showmessage(GroupsNum[0]);
          end
          else
          if (GroupsNum.Count > 1) then // 123 100*20
          begin
            //Showmessage(GroupsNum[0]+' + '+GroupsNum[1]);
            if (GroupsNum.Count = 2) then
            begin
              if ContainsDigit(GroupsNum[0]) and ContainsDigit(GroupsNum[1]) then
              begin
                //Showmessage(GroupsNum[0]+' + '+GroupsNum[1]);

                LnTemp := GetNum(GroupsNum[0])+'='+Replace(GroupsNum[1],'-','*');
                SplitGroups(LnTemp, GroupsNum);

                {
                if CountOccur('*',GroupsNum[1]) = 1 then
                begin
                  //LnTemp := Getnum(GroupsNum[0])+'='+GroupsNum[1];
                  //GroupsNum.Clear;
                  SplitGroups(LnTemp, GroupsNum);
                end
                else
                if CountOccur('-',GroupsNum[1]) = 1 then
                begin
                  //GroupsNum.Clear;
                  SplitGroups(LnTemp, GroupsNum);
                end;
                }

              end
              else
              begin
                if Not ContainsDigit(GroupsNum[0]) then
                begin
                  LnTemp := Replace(GroupsNum[1],'ชุด','=')+'*ชุด';
                  SplitGroups(LnTemp, GroupsNum);
                end;

              end;

            end
            else
            begin
              for k := 0 to GroupsNum.Count-1 do
              begin
                if (pos('=',GroupsNum[k]) = 0) and ContainsDigit(GroupsNum[k]) then
                begin
                  //ExtractNumberOnly(GroupNum[k], NumOnlyGroups);
                  GroupsNum[k] := FixSlashToEqual(GroupsNum[k]);
                end;
              end;
            end;

          end;

          //Showmessage(GroupsNum[0]);
          //Showmessage(GroupsNum[1]);

          for j := 0 to GroupsNum.Count-1 do
          begin
            Ln_Str := GroupsNum[j];  // Ln_Str คือ ตัวที่แตกออกมาจากกรณีในบรรทัดเดียว (LnStr) มีชุดเลขหลายกลุ่ม
            ExtractNumberOnly(Ln_Str, GN_NumOnly);
            //ExtractNumberOnly(GroupsNum[j], NumOnlyGrps);
            //Showmessage(Ln_Str);

            if LnStrGrps = '' then // LnStrGrps คือกรณีที่มีเลขเป็นชุดหลายบรรทัด ก็เก็บข้อความทุกบรรทัดเพื่อเอามาหาประเภทเลข
              LnStrGrps := LnStr
            else
              LnStrGrps := LnStrGrps+' '+LnStr; //เก็บทุกข้อความในกลุ่มเลข

            if Not ContainsDigit(Ln_Str) then
              Continue;

            if isNumOnly(Ln_Str) then
            begin
              if LnGroup = '' then
                LnGroup := Ln_Str
              else
                LnGroup := LnGroup + '/' + Ln_Str;

              //showmessage(LnGroup);
              Continue;
            end
            else
            begin
              if LnGroup <> '' then
              begin
                if Pos('=',Ln_Str) = 0 then
                  LnGroup := LnGroup+'='+Ln_Str
                else
                if Pos('=',Ln_Str) = 1 then
                  LnGroup := LnGroup+Ln_Str
                else
                if (Pos('=',Ln_Str) > 1) and (Pos('=',Ln_Str) < Length(Ln_Str)) then
                  LnGroup := LnGroup+'/'+Ln_Str;

                Ln_Str := LnGroup;
                LnGroup := '';
              end;
              //Showmessage(Ln_Str);

              ExtractNumberOnly(Ln_Str, NumOnlyGrps);


            if IsNumAndSlashOnly(Ln_Str) Or IsNumOnly(Ln_Str) then // Or IsNumAndEQOnly(LnStrs) then // 1/2, 12/25, 123/457, 123, 54
            begin
              if LnGroup = '' then
              begin
                if GetCurType(LnStrGrps) = 'Empty' then //ไม่พบประเภทของเลข
                  LnGroup := LnGroup + Ln_Str
                else
                begin
                  LnGroup := LnGroup + LnStrs;
                  if NumOnlyGroups.Count = 3 then
                  begin
                    LnAll := LnAll+GetCurType(LnStrGrps)+' '+NumOnlyGroups[0]+'='+NumOnlyGroups[1]+'*'+NumOnlyGroups[2]+#13#10;
                    LnGroup := '';
                  end;
                end;
              end
              else
              begin
                if isNumOnly(Trim(Ln_Str)) then
                begin
                  LnGroup := LnGroup + '/' + LnStrs;
                end
                else
                begin
                  if IsNumAndEQOnly(LnStrs) then
                    LnGroup := LnGroup + LnStrs
                  else
                    LnGroup := LnGroup + '=' + LnStrs;
  
                  if GetCurType(LnStrGrps) <> 'Empty' then
                    LastType := GetCurType(LnStrGrps);
  
                  LnTemp := '';
                  ExtractNumberOnly(LnGroup, NumOnlyGrps);
                  for k := 0 to NumOnlyGrps.Count-2 do
                  begin
                    LnTemp := LnTemp+LastType+' '+NumOnlyGrps[k]+'='+NumOnlyGrps[NumOnlyGrps.Count-1]+#13#10;
                  end;
                  LnGroup := '';
                  LnAll := LnAll+LnTemp;
                  LnStrGrps := '';
                end;
  
              end;
            end
            else
            begin
              //Showmessage(Ln_Str);


              if (LastNumLen <> 3) and (Length(NumOnlyGrps[0]) = 3) then //เลขตัวก่อนหน้า ไม่เท่ากับเลข 3 ตัว และเลขตัวปัจจุบันเท่ากับ 3
                LastType := 'บน';
  
              if GetCurType(LnStr) <> 'Empty' then
              begin
                //Showmessage('dfjdlfjdlf');
                //LastType := GetCurType(Ln_Str);
                LastType := GetCurType(LnStr);
                if NumOnlyGrps.Count = 2 then
                begin
                  LnStrs := NumOnlyGrps[0]+'='+NumOnlyGrps[1];

                  LnAll := LnAll+GetCurType(LnStr)+' '+LnStrs+#13#10;
                  LastNumLen := Length(NumOnlyGrps[0]);
                end
                else
                if NumOnlyGrps.Count = 3 then
                begin
                  LnStrs := NumOnlyGrps[0]+'='+NumOnlyGrps[1]+'*'+NumOnlyGrps[2];

                  LnAll := LnAll+GetCurType(LnStr)+' '+LnStrs+#13#10;
                  LastNumLen := Length(NumOnlyGrps[0]);
                end
                else
                begin
                  Ln_Str :=  FilterAfterEqual(Ln_Str);
                  PreLnStr := LastType+' '+Ln_Str+#13#10;

                  if IsCommaBeforeEQ(PreLnStr) then
                  begin
                    PreLnStr := ProcessComma(LastType+' '+Ln_Str)+#13#10;
                    StrBfEQ := Copy(PreLnStr,1,Pos('=',PreLnStr)-1); // copy เอาข้อความก่อนเครื่องหมาย =
                    StrBhEQ := Copy(PreLnStr,Pos('=',PreLnStr)+1,Length(PreLnStr)-Pos('=',PreLnstr)); // copy เอาข้อความหลังเครื่องหมาย =

                    ExtractNumberOnly(StrBfEQ, GrpsNumComma);
                    for k := 0 to GrpsNumComma.Count-1 do
                    begin
                      LnAll := LnAll+LastType+' '+GrpsNumComma[k]+'='+StrBhEQ;
                      LastNumLen := Length(GrpsNumComma[k]);
                    end;

                  end
                  else
                  begin
                    LnAll := LnAll+PreLnStr;
                    LastNumLen := Length(NumOnlyGrps[0]);
                  end;
                end;

              end
              else
              begin
                if (CountOccur('*5*',Ln_Str) > 0) Or (CountOccur('*2*',Ln_Str) > 0) then
                begin
                  PreLnStr := LastType+' '+NumOnlyGrps[0]+'='+NumOnlyGrps[1]+'*'+NumOnlyGrps[2]+'*'+NumOnlyGrps[3]+#13#10;
                  if IsCommaBeforeEQ(PreLnStr) then
                    PreLnStr := ProcessComma(LastType+' '+NumOnlyGrps[0]+'='+NumOnlyGrps[1]+'*'+NumOnlyGrps[2]+'*'+NumOnlyGrps[3])+#13#10;

                  LnAll := LnAll+PreLnStr;
                  //LnAll := LnAll+LastType+' '+NumOnlyGrps[0]+'='+NumOnlyGrps[1]+'*'+NumOnlyGrps[2]+'*'+NumOnlyGrps[3]+#13#10

                end
                else
                begin
                  Ln_Str :=  FilterAfterEqual(Ln_Str);
                  PreLnStr := LastType+' '+Ln_Str+#13#10;
                  //showmessage(Ln_Str);

                  if IsCommaBeforeEQ(PreLnStr) then
                  begin
                    PreLnStr := ProcessComma(LastType+' '+Ln_Str)+#13#10;
                    StrBfEQ := Copy(PreLnStr,1,Pos('=',PreLnStr)-1); // copy เอาข้อความก่อนเครื่องหมาย =
                    StrBhEQ := Copy(PreLnStr,Pos('=',PreLnStr)+1,Length(PreLnStr)-Pos('=',PreLnstr)); // copy เอาข้อความหลังเครื่องหมาย =
                    //Showmessage(StrBhEQ);

                    ExtractNumberOnly(StrBfEQ, GrpsNumComma);
                    for k := 0 to GrpsNumComma.Count-1 do
                    begin
                      LnAll := LnAll+LastType+' '+GrpsNumComma[k]+'='+StrBhEQ;
                      LastNumLen := Length(GrpsNumComma[k]);
                    end;

                  end
                  else
                  begin
                    LnAll := LnAll+PreLnStr+#13#10;
                  //LnAll := LnAll+LastType+' '+Ln_Str+#13#10;

                    LastNumLen := Length(NumOnlyGrps[0]);
                  end;
                end;
              end;

              
            end;



            end;

          end;

        
        end;




      end;


    end; //end for
  finally
    NumOnlyGroups.Free;
    NumOnlyGrps.Free;
    StartGroups.Free;
    GroupsNum.Free;
    GN_NumOnly.Free;
  end;
  //
  //Showmessage(LnAll);
  Result := LnAll;
end;

function TfrmInputText.GetNumFromCB(Str: String):String;
Var NumOnlyGroups,StartGroups,NumOnlyGrps,GroupsNum: TStringList;
    LastType,LnType,LnAll,LnStr,LnStrs,LnStrTh,LnGroup,LnNumSym,LnTemp,LnNumSymSp,LnStrGrps,SplitGrps: String;
    iSt,i,j,k,LastDigit: Integer;
    FoundBlankLine: Boolean;
begin
  NumOnlyGroups := TStringList.Create;
  NumOnlyGrps   := TStringList.Create;
  StartGroups   := TStringList.Create;
  GroupsNum     := TStringList.Create;
  LastType := 'บน';
  FoundBlankLine := false;
  LastDigit := 0;
  try
    LnAll  := '';
    iSt := 1; //อักษรตัวแรกของบรรทัดใหม่
    LnGroup := '';
    LnStrGrps := '';

    for i := 1 to Length(Str) do
    begin
      LnStr := '';
      if (Str[i] = #10) Or (i = Length(Str)) then
      begin
        LnStr := Trim(Copy(Str,iSt,i-iSt+1)); //Copy ออกมาทีละบรรทัด โดยไม่ได้ copy จากบรรทัด
        iSt := i+1; //ลำดับที่ ของตัวอักขระเริ่มต้น บรรทัดถัดไป

        //Showmessage(LnStr);

        if (trim(LnStr) = '')  then
        begin
          if LnGroup = '' then
            FoundBlankLine := true;

          LastDigit := 0; //จำนวนตำแนห่งเลข
          Continue;
        end;

        if foundTime(LnStr) then
        begin
          LnGroup := '';
          if GetCurType(LnStr) = 'Empty' then
            LastType := 'บน';
        end;

        LnStr := RemoveTime1(LnStr);
        if (trim(LnStr) = '') Or (CountOccur('????',LnStr) > 0) then
          Continue;

        LnStr := RemoveDateAndTime(LnStr);

        if (CountOccur('งวด',LnStr) > 0) Or (CountOccur('งวด',LnStr) > 0) Or (CountOccur('unsent',LnStr) > 0) Or (CountOccur('Stickers',LnStr) > 0) then
          Continue;

        LnStr  := Replace(LnStr, '“', '*');
        LnStr  := Replace(LnStr, '”', '*');
        LnStr  := Replace(LnStr, '"', '*');
        LnStr  := Replace(LnStr, '&', '*');
        if Not(LnStr[1] = '?') then
          LnStr  := Replace(LnStr, '?', '*');
        LnStr  := Replace(LnStr, 'X', '*');
        LnStr  := Replace(LnStr, '#', '=');

        if (CountOccur('ชุด',LnStr) = 0) then
        begin
          LnStr  := Replace(LnStr, '*ช', '*ชุด');
          LnStr  := Replace(LnStr, '*ชุ', '*ชุด');
        end;
        if IsLastStr(LnStr,'*3') then
          LnStr  := ReplaceLast(LnStr, '*3', '*ชุด');
        if IsLastStr(LnStr,'*6') then
          LnStr  := ReplaceLast(LnStr, '*6', '*ชุด');
        if IsLastStr(LnStr,'-') then
          LnStr  := ReplaceLast(LnStr, '-', '');

        LnStr  := Replace(LnStr, 'คูณ', '*');
        LnStr  := Replace(LnStr, 'คูน', '*');
        LnStr  := Replace(LnStr, 'บน-ล่าง', 'บนล่าง');
        LnStr  := Replace(LnStr, 'บน+ล่าง', 'บนล่าง');
        LnStr  := Replace(LnStr, 'บน*ล่าง', 'บนล่าง');
        LnStr  := Replace(LnStr, 'บน/ล่าง', 'บนล่าง');
        LnStr  := Replace(LnStr, 'ล่าง-บน', 'บนล่าง');
        LnStr  := Replace(LnStr, 'ล่าง+บน', 'บนล่าง');
        LnStr  := Replace(LnStr, 'ล่าง*บน', 'บนล่าง');
        LnStr  := Replace(LnStr, 'ล่าง/บน', 'บนล่าง');

        if (CountOccur('บน',LnStr) = 0) and (CountOccur('ล่าง',LnStr) = 0) then
          LnStr  := Replace(LnStr, 'บ.ล', 'บนล่าง');
        if (CountOccur('บน',LnStr) = 0) and (CountOccur('ล่าง',LnStr) = 0) then
          LnStr  := Replace(LnStr, 'ล.บ', 'บนล่าง');
        if (CountOccur('บน',LnStr) = 0) and (CountOccur('ล่าง',LnStr) = 0) then
          LnStr  := Replace(LnStr, 'บ,ล', 'บนล่าง');
        if (CountOccur('บน',LnStr) = 0) and (CountOccur('ล่าง',LnStr) = 0) then
          LnStr  := Replace(LnStr, 'ล,บ', 'บนล่าง');
        if (CountOccur('บน',LnStr) = 0) and (CountOccur('ล่าง',LnStr) = 0) then
          LnStr  := Replace(LnStr, 'บล.', 'บนล่าง');
        if (CountOccur('บน',LnStr) = 0) and (CountOccur('ล่าง',LnStr) = 0) then
          LnStr  := Replace(LnStr, 'บล', 'บนล่าง');
        if (CountOccur('บน',LnStr) = 0) and (CountOccur('ล่าง',LnStr) = 0) then
          LnStr  := Replace(LnStr, 'บ*ล', 'บนล่าง');
        if (CountOccur('บน',LnStr) = 0) and (CountOccur('ล่าง',LnStr) = 0) then
          LnStr  := Replace(LnStr, 'บนล่', 'บนล่าง');
        if (CountOccur('บน',LnStr) = 0) and (CountOccur('ล่าง',LnStr) = 0) then
          LnStr  := Replace(LnStr, 'บน-ล่', 'บนล่าง');
        if (CountOccur('บน',LnStr) = 0) and (CountOccur('ล่าง',LnStr) = 0) then
          LnStr  := Replace(LnStr, 'บ/ล', 'บนล่าง');
        if (CountOccur('บน',LnStr) = 0) and (CountOccur('ล่าง',LnStr) = 0) then
          LnStr  := Replace(LnStr, 'บ-ล', 'บนล่าง');
        if (CountOccur('บน',LnStr) = 0) and (CountOccur('ล่าง',LnStr) = 0) then
          LnStr  := Replace(LnStr, 'ล-บ', 'บนล่าง');
        if (CountOccur('บน',LnStr) = 0) and (CountOccur('ล่าง',LnStr) = 0) then
          LnStr  := Replace(LnStr, 'บ*ล', 'บนล่าง');
        if (CountOccur('บน',LnStr) = 0) and (CountOccur('ล่าง',LnStr) = 0) then
          LnStr  := Replace(LnStr, 'บ*ต', '');
        if (CountOccur('ตัวละ',LnStr) > 0) and (CountOccur('=',LnStr) = 0) then
          LnStr  := Replace(LnStr, 'ตัวละ', '=');
        if (CountOccur('ประตูละ',LnStr) > 0) and (CountOccur('=',LnStr) = 0) then
          LnStr  := Replace(LnStr, 'ประตูละ', '=');
        if (CountOccur('ตูละ',LnStr) > 0) and (CountOccur('=',LnStr) = 0) then
          LnStr  := Replace(LnStr, 'ตูละ', '=');

        LnStr  := ReplaceIsolatedCharWithWord(LnStr, 'บ', 'บน');  //เปลี่ยนแบบเฉพาะเจาะจง
        LnStr  := ReplaceIsolatedCharWithWord(LnStr, 'ล', 'ล่าง'); //เปลี่ยนแบบเฉพาะเจาะจง

        LnStr  := Replace(LnStr, '.', '');

        for k := 1 to 10 do  //กระชับพื้นที่
        begin
          LnStr  := Replace(LnStr, '  ', ' ');
          LnStr  := Replace(LnStr, ' = ', '=');
          LnStr  := Replace(LnStr, ' =', '=');
          LnStr  := Replace(LnStr, '= ', '=');
          LnStr  := Replace(LnStr, ' + ', '+');
          LnStr  := Replace(LnStr, ' +', '+');
          LnStr  := Replace(LnStr, '+ ', '+');
          LnStr  := Replace(LnStr, ' - ', '-');
          LnStr  := Replace(LnStr, ' -', '-');
          LnStr  := Replace(LnStr, '- ', '-');
          LnStr  := Replace(LnStr, ' * ', '*');
          LnStr  := Replace(LnStr, ' *', '*');
          LnStr  := Replace(LnStr, '* ', '*');
          LnStr  := Replace(LnStr, ' / ', '/');
          LnStr  := Replace(LnStr, ' /', '/');
          LnStr  := Replace(LnStr, '/ ', '/');
          LnStr  := Replace(LnStr, '/=', '=');
          LnStr  := Replace(LnStr, ' : ', ':');
          LnStr  := Replace(LnStr, ' :', ':');
          LnStr  := Replace(LnStr, ': ', ':');
          LnStr  := Replace(LnStr, ':=', '=');
        end;
        LnStr  := Replace(LnStr, '==', '=');
        LnStr  := Replace(LnStr, '**', '*');

        ExtractStartNumGroups(LnStr, StartGroups);
        ExtractNumberOnly(LnStr, NumOnlyGroups);

        //Showmessage(LnStr);
        if NumOnlyGroups.Count >= 2 then
        begin
          if (Pos(',',LnStr) > 0) then
            LnStr := ConvertComma(LnStr);


          if (CountOccur(NumOnlyGroups[0]+'*',LnStr) > 0) and (NumOnlyGroups.Count >= 2) and (CountOccur('=',LnStr) > 0) and (Pos('=',LnStr) > Pos('*',LnStr)) then
          begin
            if Length(NumOnlyGroups[0]) = 2 then
            begin
              LastType := 'หน้าบน';
              LnStr  :=Replace(LnStr, NumOnlyGroups[0]+'*', NumOnlyGroups[0]);
            end;
          end;

          if (CountOccur(NumOnlyGroups[0]+'*'+NumOnlyGroups[1],LnStr) > 0) and (NumOnlyGroups.Count > 2) and (CountOccur('=',LnStr) > 0) and (Pos('=',LnStr) > Pos('*',LnStr)) then
          begin
            if (Length(NumOnlyGroups[0]) = 1) and (Length(NumOnlyGroups[1]) = 1) then
            begin
              LastType := 'ถ่างบน';
              LnStr  := Replace(LnStr, NumOnlyGroups[0]+'*'+NumOnlyGroups[1], NumOnlyGroups[0]+NumOnlyGroups[1]);

              StartGroups.Clear;
              NumOnlyGroups.Clear;
              ExtractStartNumGroups(LnStr, StartGroups);
              ExtractNumberOnly(LnStr, NumOnlyGroups);
              //showmessage(IntToStr(NumOnlyGroups.Count));
            end;
          end;

          if (CountOccur('*'+NumOnlyGroups[0],LnStr) > 0) and (Pos('*',LnStr) < StrToInt(StartGroups[0])) then
          begin
            if Length(NumOnlyGroups[0]) = 2 then
            begin
              LastType := 'บน';
              LnStr  := Replace(LnStr, '*'+NumOnlyGroups[0], NumOnlyGroups[0]);
            end;
          end;

          if (CountOccur('*',LnStr) > 0) and (LnGroup = '') then
            LnStr := ConvertFirstStarCondition(LnStr);
        end;
        //Showmessage(LnStr);

        if NumOnlyGroups.Count = 3 then // เอาวันที่ใน Line ออก เช่น 2024.11.01 Friday
        begin
          if (Length(NumOnlyGroups[0]) = 3) then
          begin
            if (CountOccur('โต๊ด',LnStr) > 0) Or (CountOccur('โต้ด',LnStr) > 0) Or (CountOccur('โตด',LnStr) > 0) then
            begin
              if (Pos('โต๊ด',LnStr) > StrToInt(StartGroups[1])) and (Pos('โต๊ด',LnStr) < StrToInt(StartGroups[2])) then
                LnStr := Replace(LnStr,'โต๊ด','*');
              if (Pos('โต้ด',LnStr) > StrToInt(StartGroups[1])) and (Pos('โต้ด',LnStr) < StrToInt(StartGroups[2])) then
                LnStr := Replace(LnStr,'โต้ด','*');
              if (Pos('โตด',LnStr) > StrToInt(StartGroups[1])) and (Pos('โตด',LnStr) < StrToInt(StartGroups[2])) then
                LnStr := Replace(LnStr,'โตด','*');
            end
            else
            begin
              if (Pos('ตัว',LnStr)=0) and (Pos('เต่า',LnStr)=0) and (Pos('ตด',LnStr)=0) then
                if (Pos('ต',LnStr) > StrToInt(StartGroups[1])) and (Pos('ต',LnStr) < StrToInt(StartGroups[2])) then
                  LnStr := Replace(LnStr,'ต','*');
              if (Pos('t',LnStr) > StrToInt(StartGroups[1])) and (Pos('t',LnStr) < StrToInt(StartGroups[2])) then
                LnStr := Replace(LnStr,'t','*');
              if (Pos('T',LnStr) > StrToInt(StartGroups[1])) and (Pos('T',LnStr) < StrToInt(StartGroups[2])) then
                LnStr := Replace(LnStr,'T','*');

              if (CountOccur('กลับ',LnStr) = 0) and (CountOccur('=',LnStr) = 0) and (CountOccur('*',LnStr) = 0) and (CountOccur('/',LnStr) = 0) and (CountOccur('-',LnStr) = 0) and (CountOccur('+',LnStr) = 0) then
                LnStr := NumOnlyGroups[0]+'='+NumOnlyGroups[1]+'*'+NumOnlyGroups[2]
            end;
          end;

          if (Length(NumOnlyGroups[0]) = 4) and (Length(NumOnlyGroups[1]) = 2) and (Length(NumOnlyGroups[2]) = 2) then
          begin
            if (CountOccur(NumOnlyGroups[0]+'.'+NumOnlyGroups[1]+'.'+NumOnlyGroups[2],LnStr) > 0) then
              if FoundDayName(GetEnglishOnly(LnStr)) then
                Continue;
          end;
        end;

        if (NumOnlyGroups.Count = 2) and (CountOccur('ชุด',LnStr) > 0) and (CountOccur('*ชุด',LnStr) = 0) then // 123 100ชุด, 456=ชุด50
        begin
          if Length(NumOnlyGroups[0]) = 3 then
            LnStr := NumOnlyGroups[0]+'='+NumOnlyGroups[1]+'*ชุด';
        end;

        if (NumOnlyGroups.Count = 1) and (CountOccur('ชุด',LnStr) > 0) and (CountOccur('*ชุด',LnStr) = 0) then // 100ชุด, ชุด10
        begin
            LnStr := '='+NumOnlyGroups[0]+'*ชุด';
        end;
        //Showmessage(LnStr);
        if (NumOnlyGroups.Count = 3) then
        begin
          if (Length(NumOnlyGroups[0]) = 3) then // 123=200*ชุด20
          begin
            if (CountOccur('ชุด',LnStr) > 0) then
              if (Pos('ชุด',LnStr) > StrToInt(StartGroups[1])) and (Pos('ชุด',LnStr) < StrToInt(StartGroups[2])) then
                LnStr := Replace(LnStr,'ชุด'+NumOnlyGroups[2],'ชุด');
          end
          else
          if Length(NumOnlyGroups[0]) = 4 then
          begin
            if IsLastStr(LnStr,'*12') then
              LnStr  := ReplaceLast(LnStr, '*12', '*ชุด');

            if IsLastStr(LnStr,'*24') then
              LnStr  := ReplaceLast(LnStr, '*24', '*ชุด');
          end;
        end
        else
        if (NumOnlyGroups.Count = 4) then
        begin
            LnStr  := Replace(LnStr, '(', '*'); // 123=100(5*20)
            LnStr  := Replace(LnStr, ')', ''); // 123=100(5*20)
        end;
        

        if (CountOccur('ชุด',LnStr) > 0) then
        begin
          if (CountOccur('*',LnStr) > 0) then
            LnNumSymSp := Trim(FilterNumSymSpace(LnStr))+'ชุด'
          else
            LnNumSymSp := Trim(FilterNumSymSpace(LnStr))+'*ชุด'
        end
        else
          LnNumSymSp := Trim(FilterNumSymSpace(LnStr)); // กรองเอาเฉพาะ เลข เครื่องหมาย และ ช่องว่าง

        //Showmessage(LnNumSymSp);
        for k := 1 to 10 do  //กระชับพื้นที่
        begin
          LnNumSymSp  := Replace(LnNumSymSp, '  ', ' ');
          LnNumSymSp  := Replace(LnNumSymSp, ' = ', '=');
          LnNumSymSp  := Replace(LnNumSymSp, ' =', '=');
          LnNumSymSp  := Replace(LnNumSymSp, '= ', '=');
          LnNumSymSp  := Replace(LnNumSymSp, ' + ', '+');
          LnNumSymSp  := Replace(LnNumSymSp, ' +', '+');
          LnNumSymSp  := Replace(LnNumSymSp, '+ ', '+');
          LnNumSymSp  := Replace(LnNumSymSp, ' - ', '-');
          LnNumSymSp  := Replace(LnNumSymSp, ' -', '-');
          LnNumSymSp  := Replace(LnNumSymSp, '- ', '-');
          LnNumSymSp  := Replace(LnNumSymSp, ' * ', '*');
          LnNumSymSp  := Replace(LnNumSymSp, ' *', '*');
          LnNumSymSp  := Replace(LnNumSymSp, '* ', '*');
          LnNumSymSp  := Replace(LnNumSymSp, ' / ', '/');
          LnNumSymSp  := Replace(LnNumSymSp, ' /', '/');
          LnNumSymSp  := Replace(LnNumSymSp, '/ ', '/');
          LnNumSymSp  := Replace(LnNumSymSp, '/=', '=');
          LnNumSymSp  := Replace(LnNumSymSp, ' : ', ':');
          LnNumSymSp  := Replace(LnNumSymSp, ' :', ':');
          LnNumSymSp  := Replace(LnNumSymSp, ': ', ':');
          LnNumSymSp  := Replace(LnNumSymSp, ':=', '=');
        end;
        //Showmessage(LnNumSymSp);
        LnStrs  := ReplaceSpaces(LnNumSymSp); //เปลี่ยนช่องว่าให้เป็นเครื่องหมาย / หรือ =
        //LnStrTh := ExtractThaiText(LnStr); // กรองเอา ตัวเลข เครื่องหมาย และภาษาอังกฤษออก
        //LnStrTh := Replace(LnStrTh,'*ชุด','');
        //LnStrTh := Replace(LnStrTh,'ชุด','');
        //Showmessage(LnStrs);
        if (LnStrs <> '') and Not(LnStrs[1] in ['0'..'9','=']) then
          LnStrs := Copy(LnStrs,2,Length(LnStrs)-1);

        
        LnStrs := ReplaceLast(LnStrs,'*','');
        //Showmessage(LnStrs);


        if (CountOccur('=',LnStrs) = 2) then  // 123=10=10
        begin
          ExtractGroupsNum(LnStrs, GroupsNum);
          if GroupsNum.Count = 1 then
            if NumOnlyGroups.Count = 3 then
              LnStrs := ReplaceAtPos(LnStrs,2,'=','*');

          GroupsNum.Clear;
        end;

        if (CountOccur('*',LnStrs) = 2) and (CountOccur('=',LnStrs) = 1) then  // 123=20*10*10
        begin
          ExtractGroupsNum(LnStrs, GroupsNum);
          if GroupsNum.Count = 1 then
            if NumOnlyGroups.Count = 4 then
              if Length(NumOnlyGroups[0]) = 3 then
              begin
                if ((CountOccur('*5*',LnStrs) = 0) and (CountOccur('*2*',LnStrs) = 0)) then
                  LnStrs := NumOnlyGroups[0]+'='+NumOnlyGroups[1]+'*'+IntToStr(Permutation(NumOnlyGroups[0])-1)+'*'+NumOnlyGroups[2]
                else
                if ((CountOccur('*5*',LnStrs) > 0) Or (CountOccur('*2*',LnStrs) > 0)) then
                  LnStrs := NumOnlyGroups[0]+'='+NumOnlyGroups[1]+'*'+IntToStr(Permutation(NumOnlyGroups[0])-1)+'*'+NumOnlyGroups[3]
                else
                if IsLastStr(LnStrs,'*2') or IsLastStr(LnStrs,'*5') then
                  LnStrs := NumOnlyGroups[0]+'='+NumOnlyGroups[1]+'*'+IntToStr(Permutation(NumOnlyGroups[0])-1)+'*'+NumOnlyGroups[2]
              end;

          GroupsNum.Clear;
        end;

        //Showmessage(LnStrs);
        //Showmessage(LnStrTh);
        //Showmessage(LnStr);

        StartGroups.Clear;
        NumOnlyGroups.Clear;
        ExtractStartNumGroups(LnStr, StartGroups);
        ExtractNumberOnly(LnStr, NumOnlyGroups);

        if (NumOnlyGroups.Count = 0) Or ((CountOccur('2 ตัว',LnStr) = 1) Or (CountOccur('3 ตัว',LnStr) = 1) Or (CountOccur('4 ตัว',LnStr) = 1) Or (CountOccur('5 ตัว',LnStr) = 1) Or
           (CountOccur('2ตัว',LnStr) = 1) Or (CountOccur('3ตัว',LnStr) = 1) Or (CountOccur('4ตัว',LnStr) = 1) Or (CountOccur('5ตัว',LnStr) = 1) ) then
        begin
          LastDigit := 0;
          if (CountOccur('บน',LnStr) > 0) Or (CountOccur('กลาง',LnStr) > 0) then // Or (Trim(LnStr) = 'บ') Or (Trim(LnStr) = 'บ.') then
          begin
            if CountOccur('ล่าง',LnStr) > 0 then
            begin
              LastType := 'บนล่าง';
            end
            else
            if CountOccur('หน้า',LnStr) > 0 then
            begin
              LastType := 'หน้าบน';
            end
            else
            if CountOccur('หลัง',LnStr) > 0 then
            begin
              LastType := 'หลังบน';
            end
            else
            if CountOccur('กลาง',LnStr) > 0 then
            begin
              LastType := 'กลางบน';
            end
            else
            if CountOccur('ถ่าง',LnStr) > 0 then
            begin
              LastType := 'ถ่างบน';
            end
            else
            begin
              if (CountOccur('มี',LnStr) > 0) Or (CountOccur('ลอย',LnStr) > 0) Or (CountOccur('วิ่ง',LnStr) > 0) Or (CountOccur('แพ',LnStr) > 0) then
                LastType := 'ลอยบน '
              else
              if (CountOccur('โต๊ด',LnStr) > 0) Or (CountOccur('โต้ด',LnStr) > 0) Or (CountOccur('โตด',LnStr) > 0) then
                LastType := 'ลอยบน'
              else
                LastType := 'บน'
            end;
          end
          else
          begin
            if (CountOccur('ล่าง',LnStr) > 0) Or (Trim(LnStr) = 'ล') Or (Trim(LnStr) = 'ล.') then
            begin
              //LastType := 'ล่าง';
              if (CountOccur('หน้า',LnStr) = 0) and (CountOccur('หลัง',LnStr) = 0) then
                LastType := 'ล่าง'
              else
              begin
                if (CountOccur('หน้า',LnStr) > 0) then
                  LastType := 'หน้าล่าง'
                else
                if (CountOccur('หลัง',LnStr) > 0) then
                  LastType := 'หลังล่าง'
              end;

            end
            else
            begin
              if (CountOccur('มี',LnStr) > 0) Or (CountOccur('ลอย',LnStr) > 0) Or (CountOccur('วิ่ง',LnStr) > 0) Or (CountOccur('แพ',LnStr) > 0) then
                LastType := 'ลอยบน '
              else
              begin
                if (CountOccur('โต๊ด',LnStr) > 0) Or (CountOccur('โต้ด',LnStr) > 0) Or (CountOccur('โตด',LnStr) > 0) then
                  LastType := 'ลอยบน'
                else
                  LastType := 'บน'
              end;
            end;
          end;
        end
        else  // NumOnlyGroups.Count > 0
        begin
          if LnStrGrps = '' then
            LnStrGrps := LnStr
          else
            LnStrGrps := LnStrGrps+' '+LnStr; //เก็บทุกข้อความในกลุ่มเลข

          //if IsNumAndSlashOnly(LnStrs) Or IsNumOnly(LnStrs) then // Or IsNumAndEQOnly(LnStrs) then // 1/2, 12/25, 123/457, 123, 54
          if IsNumAndSlashOnly(LnStrs) Or IsNumOnly(LnStr) then // Or IsNumAndEQOnly(LnStrs) then // 1/2, 12/25, 123/457, 123, 54
          begin
            //Showmessage(LnStrs);
            if LnGroup = '' then
            begin
              //LastType := '';
              if GetCurType(LnStrGrps) = 'Empty' then
                LnGroup := LnGroup + LnStrs
              else
              begin
                LnGroup := LnGroup + LnStrs;
                if NumOnlyGroups.Count = 3 then
                begin
                  LnAll := LnAll+GetCurType(LnStrGrps)+' '+NumOnlyGroups[0]+'='+NumOnlyGroups[1]+'*'+NumOnlyGroups[2]+#13#10;
                  LnGroup := '';
                end;
              end;
            end
            else
            begin
              if isNumOnly(Trim(LnStr)) then
              begin
                LnGroup := LnGroup + '/' + LnStrs;
              end
              else
              begin
                if IsNumAndEQOnly(LnStrs) then
                  LnGroup := LnGroup + LnStrs
                else
                  LnGroup := LnGroup + '=' + LnStrs;

                if GetCurType(LnStrGrps) <> 'Empty' then
                  LastType := GetCurType(LnStrGrps);

                LnTemp := '';
                ExtractNumberOnly(LnGroup, NumOnlyGrps);
                for j := 0 to NumOnlyGrps.Count-2 do
                begin
                  LnTemp := LnTemp+LastType+' '+NumOnlyGrps[j]+'='+NumOnlyGrps[NumOnlyGrps.Count-1]+#13#10;
                end;
                LnGroup := '';
                LnAll := LnAll+LnTemp;
                LnStrGrps := '';
              end;

            end;
          end
          else
          begin
            //Showmessage(LnGroup);
            if LnGroup = '' then
            begin
              LnGroup := LnGroup + LnStrs;
            end
            else
            begin
              if NumOnlyGroups.Count = 2 then
              begin
                if (CountOccur('ชุด',LnStrs) > 0) then
                begin
                    LnGroup := LnGroup + '/' + NumOnlyGroups[0]+'='+NumOnlyGroups[1]+'*ชุด'
                end
                else
                if (CountOccur('*',LnStrs) > 0) and (CountOccur('ชุด',LnStrs) = 0) then
                begin
                  LnGroup := LnGroup + '=' + NumOnlyGroups[0]+'*'+NumOnlyGroups[1];
                end
                else
                  LnGroup := LnGroup + '/'+ NumOnlyGroups[0]+'='+NumOnlyGroups[1];
              end
              else
              begin
                 //Showmessage('fjlfjldfjd'+LnStrs);
                  LnGroup := LnGroup + '/' + LnStrs;
              end;
            end;

            //Showmessage(LnGroup);
            ExtractNumberOnly(LnGroup, NumOnlyGrps);
            if Length(NumOnlyGrps[0]) = 1 then
            begin
              if (GetCurType(LnStrGrps) <> 'Empty') then
              begin
                if (GetCurType(LnStrGrps) = 'ลอยบน') Or (GetCurType(LnStrGrps) = 'บน') then
                  LastType := 'บน'
                else
                if (GetCurType(LnStrGrps) = 'บนล่าง') then
                  LastType := 'บนล่าง'
                else
                if (GetCurType(LnStrGrps) = 'ล่าง') then
                  LastType := 'ล่าง'
                else
                  LastType := 'บน';
              end;
            end
            else
            if Length(NumOnlyGrps[0]) = 2 then
            begin
              if (GetCurType(LnStrGrps) <> 'Empty') then
              begin
                if (GetCurType(LnStrGrps) = 'ลอยบน') then
                  LastType := 'มี'
                else
                if (GetCurType(LnStrGrps) = 'บนล่าง') then
                  LastType := 'บนล่าง'
                else
                if (GetCurType(LnStrGrps) = 'ล่าง') then
                  LastType := 'ล่าง'
                else
                  LastType := 'บน'
              end;
            end
            else
            if Length(NumOnlyGrps[0]) =3 then
            begin
              if (GetCurType(LnStrGrps) = 'Empty') then
              begin
                if ((LastType <> 'ลอยบน') and (LastType <> 'ล่าง')) Or (FoundBlankLine) Or (LastDigit <> 3) Or (CountOccur('*',LnStrGrps) > 0)  then
                begin
                  LastType := 'บน';
                  FoundBlankLine := false;
                end;
              end
              else
              begin
                if (GetCurType(LnStrGrps) = 'ลอยบน') then //มีคำว่า โต๊ด ในชุดเลข 3 ตัวตำแหน่งไหนก็ได้
                begin
                  if (Pos('โต๊ด',LnStrGrps) > StrToInt(StartGroups[1])) and (Pos('โต๊ด',LnStrGrps) < StrToInt(StartGroups[2])) then
                    LastType := 'บน'
                  else
                    LastType := 'ลอยบน'
                end
                else
                if (GetCurType(LnStrGrps) = 'ล่าง') then
                begin
                  LastType := '[3 ตัวล่าง]';
                end

              end;
            end
            else
            if (Length(NumOnlyGrps[0]) = 4) Or (Length(NumOnlyGrps[0]) = 5) then
            begin
              if GetCurType(LnStrGrps) <> 'Empty' then
                LastType := GetCurType(LnStrGrps);

              if (GetCurType(LnStrGrps) <> 'Empty') then
              begin
                if (GetCurType(LnStrGrps) = 'ลอยบน') then
                  LastType := 'แพ'
                else
                  LastType := 'บน'
              end;
            end;
            //----------------------------------------------------------------//

            //Showmessage(LnStrs);
            //Showmessage(LnGroup);
            if (CountOccur('=',LnGroup) > 1) then
            begin
              if GetCurType(LnStr) <> 'Empty' then
                LastType := GetCurType(LnStr);

              SplitGroups(LnStr, GroupsNum);
              if (GroupsNum.Count > 1) then  // "644=1000  633=200"
              begin
                for j := 0 to GroupsNum.Count-1 do
                begin
                  ExtractNumberOnly(GroupsNum[j], NumOnlyGrps);

                  if NumOnlyGrps.Count <= 3 then
                  begin
                    if (CountOccur('ชุด',GroupsNum[j]) > 0) then
                    begin
                      LnTemp := '';
                      for k := 0 to NumOnlyGrps.Count-2 do
                      begin
                        if Permutation(NumOnlyGrps[0]) >= 3 then
                          LnTemp := LnTemp+NumOnlyGrps[k]+'='+NumOnlyGrps[NumOnlyGrps.Count-1]+'*'+IntToStr(Permutation(NumOnlyGrps[k]))+#13#10
                        else
                          LnTemp := LnTemp+NumOnlyGrps[k]+'='+NumOnlyGrps[NumOnlyGrps.Count-1]+#13#10;
                      end;
                      LnGroup := '';
                      LnAll := LnAll+LastType+#13#10+LnTemp;
                    end
                    else
                    if (CountOccur('*',GroupsNum[j]) > 0) and (CountOccur('ชุด',GroupsNum[j]) = 0) then
                    begin
                      LnTemp := '';
                      for k := 0 to NumOnlyGrps.Count-3 do
                      begin
                        LnTemp := LnTemp+NumOnlyGrps[k]+'='+NumOnlyGrps[NumOnlyGrps.Count-2]+'*'+NumOnlyGrps[NumOnlyGrps.Count-1]+#13#10;
                      end;
                      LnGroup := '';
                      LnAll := LnAll+LastType+#13#10+LnTemp;
                    end
                    else
                    begin
                      LnTemp := '';
                      for k := 0 to NumOnlyGrps.Count-2 do
                      begin
                        LnTemp := LnTemp+NumOnlyGrps[k]+'='+NumOnlyGrps[NumOnlyGrps.Count-1]+#13#10;
                      end;
                      LnGroup := '';
                      LnAll := LnAll+LastType+#13#10+LnTemp;
                    end;
                    NumOnlyGrps.Clear;
                  end
                  else
                  begin
                    SplitGrps := GroupsNum[j];
                    SplitGrps := Replace(SplitGrps,'(','*');
                    SplitGrps := Replace(SplitGrps,')','');

                    if ((CountOccur('*2*',SplitGrps) = 1) Or (CountOccur('*5*',SplitGrps) = 1)) and (NumOnlyGrps.count = 4) then // 123=100*5*20, 122=50*2*10
                    begin
                      //LnAll := LnAll+LastType+' '+LnStrs+#13#10;
                      LnAll := LnAll+LastType+' '+NumOnlyGrps[0]+'='+NumOnlyGrps[1]+'*'+IntToStr(Permutation(NumOnlyGrps[0])-1)+'*'+NumOnlyGrps[3]+#13#10;
                      LnGroup := '';
                    end
                    else
                    if (IsLastStr(SplitGrps,'*5') Or IsLastStr(SplitGrps,'*2') ) and (NumOnlyGrps.count = 4) then //  712 =120(20x5), 722 =120*20x5
                    begin
                      LnAll := LnAll+LastType+' '+NumOnlyGrps[0]+'='+NumOnlyGrps[1]+'*'+IntToStr(Permutation(NumOnlyGrps[0])-1)+'*'+NumOnlyGrps[2]+#13#10;
                      LnGroup := '';
                    end
                  end;
                end;
              end;
              GroupsNum.Clear;
            end
            else
            begin
              //Showmessage(LnGroup);
              //Showmessage(LnStrs);
              LnTemp := '';
              if (CountOccur('ชุด',LnStrs) > 0) then
              begin
                for j := 0 to NumOnlyGrps.Count-2 do
                begin
                  if Permutation(NumOnlyGrps[j]) >= 3 then
                    LnTemp := LnTemp+LastType+' '+NumOnlyGrps[j]+'='+NumOnlyGrps[NumOnlyGrps.Count-1]+'*'+IntToStr(Permutation(NumOnlyGrps[j]))+#13#10
                  else
                    LnTemp := LnTemp+LastType+' '+NumOnlyGrps[j]+'='+NumOnlyGrps[NumOnlyGrps.Count-1]+#13#10;
                end;
                LnGroup := '';
                LnAll := LnAll+LnTemp;
              end
              else
              begin
                if NumOnlyGroups.Count = 1 then //บรรทัดที่ส่งมามี เลข 1 กลุ่ม  เช่น 100, =150
                begin
                  //Showmessage('1 '+LnStrs);
                  //Showmessage(LnGroup);
                  if (GetCurType(LnStrGrps) = 'Empty') then
                  begin
                    for j := 0 to NumOnlyGrps.Count-2 do
                      LnTemp := LnTemp+LastType+' '+NumOnlyGrps[j]+'='+NumOnlyGrps[NumOnlyGrps.Count-1]+#13#10;
                  end
                  else
                  begin
                    for j := 0 to NumOnlyGrps.Count-2 do
                      LnTemp := LnTemp+GetCurType(LnStrGrps)+' '+NumOnlyGrps[j]+'='+NumOnlyGrps[NumOnlyGrps.Count-1]+#13#10;
                  end;
                  LnGroup := '';
                  LnAll := LnAll+LnTemp;
                end
                else
                if NumOnlyGroups.Count = 2 then //บรรทัดที่ส่งมามี เลข 2 กลุ่ม  เช่น 100*100, =150*20, 100+10 , 1=600, 133-500ชุด
                begin
                  //Showmessage('2 '+LnStrs);
                  if (GetCurType(LnStrGrps) = 'Empty') then
                  begin
                    if (CountOccur('*',LnStrs) = 1) then
                    begin
                      for j := 0 to NumOnlyGrps.Count-3 do
                        LnTemp := LnTemp+LastType+' '+NumOnlyGrps[j]+'='+NumOnlyGrps[NumOnlyGrps.Count-2]+'*'+NumOnlyGrps[NumOnlyGrps.Count-1]+#13#10;
                    end
                    else
                    begin
                      for j := 0 to NumOnlyGrps.Count-2 do
                        LnTemp := LnTemp+LastType+' '+NumOnlyGrps[j]+'='+NumOnlyGrps[NumOnlyGrps.Count-1]+#13#10;
                    end;
                  end
                  else
                  begin
                    //Showmessage(LnGroup);
                    if (CountOccur('*',LnStrs) = 1) then
                    begin
                      for j := 0 to NumOnlyGrps.Count-3 do
                        LnTemp := LnTemp+GetCurType(LnStrGrps)+' '+NumOnlyGrps[j]+'='+NumOnlyGrps[NumOnlyGrps.Count-2]+'*'+NumOnlyGrps[NumOnlyGrps.Count-1]+#13#10;
                    end
                    else
                    begin
                      for j := 0 to NumOnlyGrps.Count-2 do
                        LnTemp := LnTemp+GetCurType(LnStrGrps)+' '+NumOnlyGrps[j]+'='+NumOnlyGrps[NumOnlyGrps.Count-1]+#13#10;
                    end;
                  end;
                  LnGroup := '';
                  LnAll := LnAll+LnTemp;
                end
                else
                begin
                  //Showmessage('>2 '+LnStrs);
                  //Showmessage(LastType);
                  //Showmessage(NumOnlyGrps[0]);
                  //Showmessage(NumOnlyGrps[1]);
                  //Showmessage(NumOnlyGrps[2]);

                  if (NumOnlyGrps.count <= 3) Or (CountOccur('*2*',LnStrs) > 0) Or (CountOccur('*5*',LnStrs) > 0) then
                  begin
                    ExtractStartNumGroups(LnStrs, StartGroups);
                    if (Pos('*',LnStrs) > StrToInt(StartGroups[0])) and (Pos('*',LnStrs) < StrToInt(StartGroups[1])) and (Pos('=',LnStrs)  > 0) then
                      LnStrs := Replace(LnStrs,'*','');

                    ExtractStartNumGroups(LnStrs, StartGroups);
                    if (Pos(':',LnStrs) > StrToInt(StartGroups[0])) and (Pos(':',LnStrs) < StrToInt(StartGroups[1])) And (CountOccur('=',LnStrs) = 0) then
                      LnStrs := Replace(LnStrs,':','=')
                    else
                      LnStrs := Replace(LnStrs,':','');

                    ExtractStartNumGroups(LnStrs, StartGroups);
                    if (Pos(' ',LnStrs) > StrToInt(StartGroups[0])) and (Pos(' ',LnStrs) < StrToInt(StartGroups[1])) then
                      LnStrs := Replace(LnStrs,' ','=');

                    ExtractStartNumGroups(LnStrs, StartGroups);
                    if (Pos(' ',LnStrs) > StrToInt(StartGroups[1])) and (Pos(' ',LnStrs) < StrToInt(StartGroups[2])) then
                    begin
                      if Length(NumOnlyGrps[0]) <= 3 then
                        LnStrs := Replace(LnStrs,' ','*')
                      else
                      begin
                        LnStrs := NumOnlyGrps[0]+'='+NumOnlyGrps[1]+'*'+IntToStr(Permutation(NumOnlyGrps[0]));
                        ExtractNumberOnly(LnStrs, NumOnlyGrps);
                      end;
                    end;

                    //showmessage(LnStrs);

                    ExtractStartNumGroups(LnStrs, StartGroups);
                    if (Pos('+',LnStrs) > StrToInt(StartGroups[StartGroups.Count-2])) and (Pos('+',LnStrs) < StrToInt(StartGroups[StartGroups.Count-1])) then
                      LnStrs := Replace(LnStrs,'+','*');

                    ExtractStartNumGroups(LnStrs, StartGroups);
                    if (Pos('-',LnStrs) > StrToInt(StartGroups[0])) and (Pos('-',LnStrs) < StrToInt(StartGroups[1])) then
                      LnStrs := Replace(LnStrs,'-','=');

                    ExtractStartNumGroups(LnStrs, StartGroups);
                    if (Pos('-',LnStrs) > StrToInt(StartGroups[StartGroups.Count-2])) and (Pos('-',LnStrs) < StrToInt(StartGroups[StartGroups.Count-1])) then
                      LnStrs := Replace(LnStrs,'-','*');

                    ExtractStartNumGroups(LnStrs, StartGroups);
                    if (Pos('/',LnStrs) > StrToInt(StartGroups[0])) and (Pos('/',LnStrs) < StrToInt(StartGroups[1])) And (CountOccur('=',LnStrs) = 0)  then
                      LnStrs := Replace(LnStrs,'/','=');

                    ExtractStartNumGroups(LnStrs, StartGroups);
                    if (Pos('/',LnStrs) > StrToInt(StartGroups[StartGroups.Count-2])) and (Pos('/',LnStrs) < StrToInt(StartGroups[StartGroups.Count-1])) And (CountOccur('*',LnStrs) = 0) then
                      LnStrs := Replace(LnStrs,'/','*');
                  end;

                  Showmessage(LnStrs);
                  //Showmessage(LnStr);
                  //Showmessage(IntToStr(NumOnlyGrps.count));

                  if ((CountOccur('*2*',LnStrs) = 1) Or (CountOccur('*5*',LnStrs) = 1)) and (NumOnlyGrps.count = 4) then // 123=100*5*20, 122=50*2*10
                  begin
                    //LnAll := LnAll+LastType+' '+LnStrs+#13#10;
                    LnAll := LnAll+LastType+' '+NumOnlyGrps[0]+'='+NumOnlyGrps[1]+'*'+IntToStr(Permutation(NumOnlyGrps[0])-1)+'*'+NumOnlyGrps[3]+#13#10;
                    LnGroup := '';
                  end
                  else
                  if (IsLastStr(LnStrs,'*5') Or IsLastStr(LnStrs,'*2') ) and (NumOnlyGrps.count = 4) then //  712 =120(20x5), 722 =120*20x5
                  begin
                    LnAll := LnAll+LastType+' '+NumOnlyGrps[0]+'='+NumOnlyGrps[1]+'*'+IntToStr(Permutation(NumOnlyGrps[0])-1)+'*'+NumOnlyGrps[2]+#13#10;
                    LnGroup := '';
                  end
                  else
                  if (Pos('กลับ',LnStr) > StrToInt(StartGroups[1])) and (Pos('กลับ',LnStr) < StrToInt(StartGroups[2])) and (Length(NumOnlyGroups[0]) <= 3)  then
                  begin
                    if (CountOccur('*',LnStr) = 0) then
                    begin
                      if (Length(NumOnlyGroups[0]) = 3)then
                      begin
                        LnAll := LnAll+LastType+' '+NumOnlyGroups[0]+'='+NumOnlyGroups[1]+'*'+IntToStr(Permutation(NumOnlyGroups[0])-1)+'*'+NumOnlyGroups[2]+#13#10;
                        LnGroup := '';
                      end;
                      if (Length(NumOnlyGroups[0]) = 2) then
                      begin
                        LnAll := LnAll+LastType+' '+NumOnlyGroups[0]+'='+NumOnlyGroups[1]+'*'+NumOnlyGroups[2]+#13#10;
                        LnGroup := '';
                      end;
                    end;
                  end
                  else
                  if (CountOccur('*',LnStrs) = 1) and (CountOccur('=',LnStrs) = 1) and (Pos('=',LnStrs) > 0) and (Pos('*',LnStrs) > Pos('=',LnStrs)) then  //123=100*20, 123/421/780=100*20
                  begin
                    for j := 0 to NumOnlyGrps.Count-3 do
                    begin
                      if Length(NumOnlyGrps[j]) > 1 then
                        LnTemp := LnTemp+LastType+' '+NumOnlyGrps[j]+'='+NumOnlyGrps[NumOnlyGrps.Count-2]+'*'+NumOnlyGrps[NumOnlyGrps.Count-1]+#13#10;
                    end;
                    LnGroup := '';
                    LnAll := LnAll+LnTemp;
                  end
                  else
                  if (CountOccur('=',LnStrs) = 1) and (CountOccur('/',LnStrs) > 0) and (CountOccur('*',LnStrs) = 0) and (Pos('=',LnStrs) > 0) and (Pos('=',LnStrs) > Pos('/',LnStrs)) then  // 123/456=100
                  begin
                    for j := 0 to NumOnlyGrps.Count-2 do
                      LnTemp := LnTemp+LastType+' '+NumOnlyGrps[j]+'='+NumOnlyGrps[NumOnlyGrps.Count-1]+#13#10;

                    LnGroup := '';
                    LnAll := LnAll+LnTemp;
                  end;

                end;
              end;
             //------------------------------------
            end;
            LnGroup := '';
            NumOnlyGrps.Clear;
            LnStrGrps := '';
            LastDigit := Length(NumOnlyGroups[0]);
          end;
        end;
      end;
    end;
  finally
    NumOnlyGroups.Free;
    NumOnlyGrps.Free;
    StartGroups.Free;
    GroupsNum.Free;
  end;
  //Showmessage(LnAll);
  Result := LnAll;
end;


function TfrmInputText.GetNumFromClpBrd(Str: String):String;
Var i,j,k,CntSetNum,iSt,LstNumLn: integer;
    LnStr,LnNumSym,LnStrSep,LnGroup,GrpStr,LnAll,LnTemp,JoinStrGroups,NumSta,FstNum,SecNum,LstNum,LnExt,LnExt1: String;
    GetStrLn,GetStrInLnExt,GetNumType,StarGet: String;
    //InputText: string;
    NumberGroups,StrGroups,LnGroups,NumOnlyGroups,StartGroups,GroupsNum,GroupsNumSym: TStringList;
    FoundEnd: Boolean;
begin
  StrGroups := TStringList.Create;
  NumberGroups := TStringList.Create;
  GroupsNum := TStringList.Create;
  GroupsNumSym := TStringList.Create;
  LnGroups  := TStringList.Create;
  NumOnlyGroups := TStringList.Create;
  StartGroups := TStringList.Create;
  Try
  LnAll  := '';
  LnTemp := '';
  iSt := 1; //อักษรตัวแรกของบรรทัดใหม่
  LnGroup := '';
  for i := 1 to Length(Str) do
  begin
    LnStr := '';
    if (Str[i] = #10) Or (i = Length(Str)) then
    begin
      LnStr := Copy(Str,iSt,i-iSt+1); //Copy ออกมาทีละบรรทัด โดยไม่ได้ copy จากบรรทัด
      iSt := i+1; //ลำดับที่ ของตัวอักขระเริ่มต้น บรรทัดถัดไป

      if (trim(LnStr) = '')  then
      begin
        LnStr := 'บน';
        //Continue;
      end;

      //Showmessage(LnStr);
      //ClipBoard.AsText := LnStr;

      if foundTime(LnStr) then
        LnGroup := '';
      LnStr := RemoveTime1(LnStr);
      if (trim(LnStr) = '') Or (CountOccur('????',LnStr) > 0) then
        Continue;

      //Showmessage(LnStr);
      //Clipboard.AsText := LnStr;
      LnStr := RemoveDateAndTime(LnStr);

      if (CountOccur('งวด',LnStr) > 0) Or (CountOccur('งวด',LnStr) > 0) Or (CountOccur('unsent',LnStr) > 0) Or (CountOccur('Stickers',LnStr) > 0) then
        Continue;
      //showmessage(LnStr);
      //LnStr := DelCommaInNum(LnStr);

      LnStr  := Replace(LnStr, '“', '*');
      LnStr  := Replace(LnStr, '”', '*');
      LnStr  := Replace(LnStr, '"', '*');
      LnStr  := Replace(LnStr, '&', '*');
      LnStr  := Replace(LnStr, ',', '');
      LnStr  := Replace(LnStr, '?', '*');
      LnStr  := Replace(LnStr, 'X', '*');
      LnStr  := Replace(LnStr, '#', '=');
      LnStr  := Replace(LnStr, 'คูณ', '*');
      LnStr  := Replace(LnStr, 'คูน', '*');
      LnStr  := Replace(LnStr, 'กลับ', '*');
      LnStr  := Replace(LnStr, 'บล.', 'บน-ล่าง');
      LnStr  := Replace(LnStr, 'บล', 'บน-ล่าง');
      LnStr  := Replace(LnStr, 'บ*ล', 'บน-ล่าง');
      LnStr  := Replace(LnStr, 'บนล่', 'บน-ล่าง');
      LnStr  := Replace(LnStr, 'บน-ล่', 'บน-ล่าง');
      LnStr  := Replace(LnStr, 'บ/ล', 'บน-ล่าง');
      LnStr  := Replace(LnStr, 'บ-ล', 'บน-ล่าง');
      //Showmessage(LnStr);

      if trim(LnStr) = '' then
        Continue;
      
      //if (Pos('*ัวละ',LnStr) > 0) and (CountOccur('=',LnStr) = 0) then
        //LnStr  := Replace(LnStr, '*ัวละ', '=');

      //if (Pos('ตัวละ',LnStr) > 0) and (CountOccur('=',LnStr) = 0) then
        //LnStr  := Replace(LnStr, 'ตัวละ', '=');

      //if CountOccur('=',LnStr) > 0 then
        //LnStr  := Replace(LnStr, ' ', '/');


      //Showmessage(LnStr);

      for k := 1 to 10 do  //กระชับพื้นที่
      begin
        LnStr  := Replace(LnStr, '  ', ' ');
        LnStr  := Replace(LnStr, ' = ', '=');
        LnStr  := Replace(LnStr, ' =', '=');
        LnStr  := Replace(LnStr, '= ', '=');
        LnStr  := Replace(LnStr, ' + ', '+');
        LnStr  := Replace(LnStr, ' +', '+');
        LnStr  := Replace(LnStr, '+ ', '+');
        LnStr  := Replace(LnStr, ' - ', '-');
        LnStr  := Replace(LnStr, ' -', '-');
        LnStr  := Replace(LnStr, '- ', '-');
        LnStr  := Replace(LnStr, ' * ', '*');
        LnStr  := Replace(LnStr, ' *', '*');
        LnStr  := Replace(LnStr, '* ', '*');
        LnStr  := Replace(LnStr, ' / ', '/');
        LnStr  := Replace(LnStr, ' /', '/');
        LnStr  := Replace(LnStr, '/ ', '/');
        LnStr  := Replace(LnStr, '/=', '=');
      end;
      //if (CountOccur('*ชุด',LnStr) = 0) and (CountOccur('ชุด',LnStr)=1) then
        //LnStr  := Replace(LnStr, 'ชุด', '*ชุด');

      if IsLastStr(LnStr,'*ช') then
        LnStr := Replace(LnStr, '*ช', '*ชุด');

      if IsLastStr(LnStr,'-3') then  //Goo
        LnStr := ReplaceLastStr(LnStr,'-3', '*ชุด');

      if IsLastStr(LnStr,'-6') then
        LnStr := ReplaceLastStr(LnStr,'-6', '*ชุด');

      if LnStr[1] ='.' then
        LnStr[1] := ' ';

      ExtractStartNumGroups(LnStr, StartGroups);
      if StartGroups.Count > 1 then
      begin
        if (CountOccur('=',LnStr) > 0) then
          LnStr := DelComma(LnStr,Pos('=',LnStr));

      end;
      ExtractNumberGroups(LnStr, NumberGroups);
      ExtractNumberOnly(LnStr, NumOnlyGroups);

      if NumOnlyGroups.Count = 2 then // เอาเวลาออกเช่น 13.45, 1.20
      begin
        if ((Length(NumOnlyGroups[0]) = 1) Or (Length(NumOnlyGroups[0]) = 2)) and (Length(NumOnlyGroups[0]) = 2) then
        begin
          if (CountOccur(NumOnlyGroups[0]+'.'+NumOnlyGroups[1],LnStr) > 0) then
            Continue;
        end;
      end;

      if NumOnlyGroups.Count = 3 then // เอาวันที่ใน Line ออก เช่น 2024.11.01 Friday
      begin
        if (Length(NumOnlyGroups[0]) = 4) and (Length(NumOnlyGroups[1]) = 2) and (Length(NumOnlyGroups[2]) = 2) then
        begin
          if (CountOccur(NumOnlyGroups[0]+'.'+NumOnlyGroups[1]+'.'+NumOnlyGroups[2],LnStr) > 0) then
            if FoundDayName(GetEnglishOnly(LnStr)) then
              Continue;
        end;
      end;

      if (StartGroups.Count >= 1) then
      begin
        if (Pos('=',LnStr) < StrToInt(StartGroups[0])) then
          LnStr := Replace(LnStr,'=','');
      end;

      if (CountOccur('=',LnStr) = 0) then
      begin
        LnStr  := Replace(LnStr, 'ตัวละ', '=');
        LnStr  := Replace(LnStr, 'ต้วละ', '=');
        LnStr  := Replace(LnStr, 'ประตูละ', '=');
        LnStr  := Replace(LnStr, 'ประตูละ', '=');
        LnStr  := Replace(LnStr, 'ตูละ', '=');
      end
      else
      begin
        LnStr  := Replace(LnStr, 'ตัวละ', '');
        LnStr  := Replace(LnStr, 'ต้วละ', '');
        LnStr  := Replace(LnStr, 'ประตูละ', '');
        LnStr  := Replace(LnStr, 'ประตูละ', '');
        LnStr  := Replace(LnStr, 'ตูละ', '');
      end;


      //LnExt := Trim(LineToExtract(LnStr)); //ข้อความตั้งแต่เจอเลขตัวแรกไปจนถึงตัวเลขสุดท้ายในบรรทัด
      //ExtractStartNumGroups(LnExt, StartGroups);

      LstNumLn := 0;
      for j := 1 to length(LnStr) do
        if LnStr[j] in ['0'..'9'] then
          LstNumLn := i;

       //Showmessage(LnStr);
      //Showmessage(GetNumType);
      if NumBerGroups.Count >= 0 then
      begin
        GetNumType := GetStr(LnStr);

        if Trim(GetNumType) <> '' then
        begin
          GetNumType := RpStr(GetNumType);

          if NumberGroups.Count = 0 then
          begin
              if Trim(GetNumType) <> '' then
                LnAll := LnAll+Trim(GetNumType)+#13#10;
          end
          else
          begin
            if Length(NumOnlyGroups[0]) = 1 then
            begin
                GetNumType := Replace(GetNumType,'หน้าล่าง','[ปักหน้าล่าง]');
                GetNumType := Replace(GetNumType,'ล่างหน้า','[ปักหน้าล่าง]');
                GetNumType := Replace(GetNumType,'หลังล่าง','[ปักหลังล่าง]');
                GetNumType := Replace(GetNumType,'ล่างหลัง','[ปักหลังล่าง]');

                if (CountOccur('ล่าง',GetNumType) = 0) then
                begin
                  GetNumType := Replace(GetNumType,'หน้า','ปักหน้าบน');
                  GetNumType := Replace(GetNumType,'กลาง','ปักกลางบน');
                  GetNumType := Replace(GetNumType,'หลัง','ปักหลังบน');
                end;
                if Trim(GetNumType) <> '' then
                  LnAll := LnAll+Trim(GetNumType)+#13#10;
            end
            else
            if Length(NumOnlyGroups[0]) = 2 then
            begin
              if (CountOccur('โต๊ด',LnExt) > 0) then
                LnAll := LnAll+'มี'+#13#10
              else
                LnAll := LnAll+Trim(GetNumType)+#13#10;

            end
            else
            if Length(NumOnlyGroups[0]) = 3 then
            begin

              if trim(GetNumType) <> '' then
                LnAll := LnAll+Trim(GetNumType)+#13#10;

            end
            else
            begin
              if trim(GetNumType) <> '' then
                LnAll := LnAll+Trim(GetNumType)+#13#10;
            end;
          end;
        end;
      end;
      //Showmessage(LnStr+' '+IntToStr(NumberGroups.Count));

      if NumberGroups.Count = 0 then
      begin

        LnGroup := '';
      end
      else
      if NumberGroups.Count = 1 then
      begin
        //showmessage(LnStr+'-111111111');
        //LnNumSym := FilterNumSym(LnStr);

        //if (LnGroup = '') then // LnGroup is Empty
        if Trim(LnGroup) = '' then // ถ้ากรุ๊ปยังว่าง
        begin
          //if IsNumOnly(LnStr) then
          if Not((CountOccur('2 ตัว',LnStr) = 1) Or (CountOccur('3 ตัว',LnStr) = 1) Or (CountOccur('4 ตัว',LnStr) = 1) Or (CountOccur('5 ตัว',LnStr) = 1) Or
                 (CountOccur('2ตัว',LnStr) = 1) Or (CountOccur('3ตัว',LnStr) = 1) Or (CountOccur('4ตัว',LnStr) = 1) Or (CountOccur('5ตัว',LnStr) = 1) ) then
          begin
            if IsNumOnly(NumberGroups[0]) then
            begin
                LnGroup := Trim(LnStr);
            end;
          end;
        end
        else
        begin
          if IsNumOnly(LnStr) then // 1, 12, 325
          begin
            if LnGroup[Length(LnGroup)] <> '/' then
              LnGroup := Trim(LnGroup) +'/'+ LnStr
            else
              LnGroup := LnGroup + LnStr;
          end
          else // =10, =10*ชุด, 20*ชุด, =10*10
          begin
            if CountOccur('=',LnStr) > 0 then // ถ้าเจอเครื่องหมาย = ในบรรทัดนั้น
            begin
              if LnGroup[Length(LnGroup)] <> '/' then // ถ้าตัวสุดท้ายในกรุ๊ปไม่เป็น /
                LnGroup := LnGroup + '/' + LnStr
              else
              begin
                LnGroup := LnGroup + LnStr;
              end;
            end
            else // ถ้าไม่เจอเครื่องหมาย =
            begin
              if LnGroup[Length(LnGroup)] <> '/' then
                LnGroup := Trim(LnGroup) + '/' + LnStr
              else
              begin
                //LnGroup[Length(LnGroup)] := '=';
                LnGroup := LnGroup + LnStr;
              end;
            end;

            ExtractNumberGroups(LnGroup, NumberGroups);
            if CountOccur('*',LnStr) > 0 then // *ชุด, 10*10
            begin
              if CountOccur('ชุด',LnStr) > 0 then
              begin
                for j := 0 to NumberGroups.Count-2 do
                begin
                  if Permutation(NumberGroups[j]) >= 3 then
                    LnAll := LnAll+NumberGroups[j]+'='+NumberGroups[NumberGroups.Count-1]+'*'+IntToStr(Permutation(NumberGroups[j]))+#13#10
                  else
                    LnAll := LnAll+NumberGroups[j]+'='+GetNum(NumberGroups[NumberGroups.Count-1])+#13#10;
                end;
              end
              else
              begin
                for j := 0 to NumberGroups.Count-2 do
                begin
                    LnAll := LnAll+NumberGroups[j]+'='+NumberGroups[NumberGroups.Count-1]+#13#10;
                end;

              end;
            end
            else // =10, =12, =50, 10ชุด
            begin
              if CountOccur('ชุด',LnStr) > 0 then
              begin
                for j := 0 to NumberGroups.Count-2 do
                begin
                  if Permutation(NumberGroups[j]) >= 3 then
                    LnAll := LnAll+NumberGroups[j]+'='+NumberGroups[NumberGroups.Count-1]+'*'+IntToStr(Permutation(NumberGroups[j]))+#13#10
                  else
                    LnAll := LnAll+NumberGroups[j]+'='+GetNum(NumberGroups[NumberGroups.Count-1])+#13#10;
                end;
              end
              else
              begin
                if (CountOccur('=',LnStr) > 0) Or (CountOccur('ตูละ',LnStr) > 0) Or (CountOccur('ประตูละ',LnStr) > 0) then
                begin
                  for j := 0 to NumberGroups.Count-2 do
                  begin
                    LnAll := LnAll+NumberGroups[j]+'='+NumberGroups[NumberGroups.Count-1]+#13#10;
                  end;
                end
                else
                begin
                 {
                  for j := 0 to NumberGroups.Count-2 do
                  begin
                    LnAll := LnAll+NumberGroups[j]+'='+NumOnlyGroups[NumOnlyGroups.Count-1]+#13#10;
                  end;
                  }
                end;
              end;
            end;
            NumberGroups.Clear;
            LnGroup := '';
          end;
        end;
      end
      else
      if NumberGroups.Count = 2 then
      begin
        //showmessage(LnStr+' - 22222222222222');
        LnNumSym := FilterNumSym(LnStr);

        if Trim(LnGroup) = '' then // ถ้ากรุ๊ปยังว่าง
        begin
          if IsNumAndSlashOnly(LnNumSym) then // 1/2, 12/25, 123/457
          begin
            LnGroup := LnGroup + LnNumSym;
          end
          else  //12=100, 123=50*3, 25=20*20, 123 20*3
          begin
            if NumOnlyGroups.Count = 2 then  // 1 100, 25=100, 123=100*ชุด
            begin
              //if (CountOccur('*',NumberGroups[1]) = 0) and (CountOccur('ชุด',LnStr = 0) then // 1 100, 25=100
              if (CountOccur('*',LnStr) = 0) and (CountOccur('ชุด',LnStr) = 0) then // 1 100, 25=100
              begin
                if (CountOccur('โต๊ด',LnStr) > 0) Or (CountOccur('โต้ด',LnStr) > 0) then
                begin
                  if Length(NumberGroups[0]) = 2 then
                    LnAll := LnAll+'2 ตัวมี'+#13#10+NumberGroups[0]+'='+NumOnlyGroups[1]+#13#10
                  else
                  if Length(NumberGroups[0]) = 3 then
                  begin
                    if (Pos('โต๊ด',LnStr) > StrToInt(StartGroups[0])) Or (Pos('โต้ด',LnStr) > StrToInt(StartGroups[0])) Or (CountOccur('โต๊ด',GetSecondLastLine(LnAll)) > 0) then
                      LnAll := LnAll+'[3 ตัวโต๊ด]'+#13#10+NumberGroups[0]+'='+NumOnlyGroups[1]+#13#10+'บน'+#13#10
                    //else
                    //begin
                      //if (CountOccur('โต๊ด',GetLastLine(LnAll)) > 0) then
                        //LnAll := LnAll+'[3 ตัวโต๊ด]'+#13#10+NumberGroups[0]+'='+NumOnlyGroups[1]+#13#10+
                    //end;
                  end;
                end
                else
                  LnAll := LnAll+NumberGroups[0]+'='+NumOnlyGroups[1]+#13#10
              end
              else // 123=100ชุด, 123=100, 127=20*ชุด
              begin
                if CountOccur('ชุด',LnStr) > 0 then
                begin
                  if Permutation(NumberGroups[0]) >= 3 then
                    LnAll := LnAll+NumberGroups[0]+'='+NumOnlyGroups[1]+'*'+IntToStr(Permutation(NumberGroups[0]))+#13#10
                  else
                    LnAll := LnAll+NumberGroups[0]+'='+NumOnlyGroups[1]+#13#10;
                end
                else
                begin
                  if CountOccur('*',LnStr) > 0 then
                    LnAll := LnAll+NumberGroups[0]+'='+NumberGroups[1]+#13#10
                  else
                    LnAll := LnAll+NumberGroups[0]+'='+NumOnlyGroups[1]+#13#10;
                end;
              end;
            end
            else
            if NumOnlyGroups.Count = 3 then  // 25=100*100, 123=100*20
            begin
              LnAll := LnAll+NumberGroups[0]+'='+NumberGroups[1]+#13#10;

            end
            else
            if NumOnlyGroups.Count = 4 then  // 123=100*5*20, 122=200*2*100
            begin
              if (CountOccur('*',LnStr) = 2) and ((CountOccur('*5*',LnStr) = 1) Or (CountOccur('*2*',LnStr) = 1)) then //123=100*5*20
                LnAll := LnAll+LnStr+#13#10
              else
              if (CountOccur('*',LnStr) = 2) and IsLastStr(LnStr,'*2') then //123=100*40*2
                LnAll := LnAll+NumOnlyGroups[0]+'='+NumOnlyGroups[1]+'*2*'+NumOnlyGroups[2]+#13#10
              else
              if (CountOccur('*',LnStr) = 2) and IsLastStr(LnStr,'*5') then //123=100*40*5
                LnAll := LnAll+NumOnlyGroups[0]+'='+NumOnlyGroups[1]+'*5*'+NumOnlyGroups[2]+#13#10
              else
              if (CountOccur('*',LnStr) = 2) and (NumOnlyGroups[2] = NumOnlyGroups[3]) then // 123=100*30*30
                LnAll := LnAll+NumOnlyGroups[0]+'='+NumOnlyGroups[1]+'*2*'+NumOnlyGroups[2]+#13#10;
            end;
          end;
        end
        else  // ถ้ากรุ๊ปไม่ว่างแล้ว
        begin
          if IsNumAndSlashOnly(LnStr) then
          begin
            if LnGroup[Length(LnGroup)] <> '/' then
              LnGroup := Trim(LnGroup) +'/'+ LnStr
            else
              LnGroup := LnGroup + LnStr;
          end
          else
          begin
            if CountOccur('=',LnStr) > 0 then // ถ้าเจอเครื่องหมาย = ในบรรทัดนั้น  =100*6, =50*3, =20*20
            begin
              if LnGroup[Length(LnGroup)] <> '/' then // ถ้าตัวสุดท้ายในกรุ๊ปไม่เป็น /
                LnGroup := LnGroup + '/'+ LnStr
              else
              begin
                LnGroup := LnGroup + LnStr;
              end;
            end
            else // ถ้าไม่เจอเครื่องหมาย =  เช่น 100*6, 50*3, 20*20
            begin
              if LnGroup[Length(LnGroup)] <> '/' then
                LnGroup := Trim(LnGroup) + '=' + LnStr
              else
              begin
                LnGroup[Length(LnGroup)] := '=';
                LnGroup := LnGroup + LnStr;
              end;
            end;

            ExtractNumberGroups(LnGroup, NumberGroups);
            if CountOccur('*',LnStr) > 0 then // *ชุด, 10*10
            begin
              if CountOccur('ชุด',LnStr) > 0 then
              begin
                for j := 0 to NumberGroups.Count-2 do
                begin
                  if Permutation(NumberGroups[j]) >= 3 then
                    LnAll := LnAll+NumberGroups[j]+'='+NumberGroups[NumberGroups.Count-1]+'*'+IntToStr(Permutation(NumberGroups[j]))+#13#10
                  else
                    LnAll := LnAll+NumberGroups[j]+'='+NumberGroups[NumberGroups.Count-1]+#13#10;
                end;
              end
              else
              begin
                for j := 0 to NumberGroups.Count-2 do
                begin
                  LnAll := LnAll+NumberGroups[j]+'='+NumberGroups[NumberGroups.Count-1]+#13#10;
                end;
              end;
            end
            else
            begin
              for j := 0 to NumberGroups.Count-2 do
              begin
                LnAll := LnAll+NumberGroups[j]+'='+NumberGroups[NumberGroups.Count-1]+#13#10;
              end;
            end;
            NumberGroups.Clear;
            LnGroup := '';
          end;
        end;
      end
      else
      if NumberGroups.Count = 3 then //123 100-50, 123=200-10, 123=100T50, 123=100/50 ,123/425/200*ชุด, 789/524/=100, 804/643/642
      begin
        //showmessage(LnStr+' - 33333333333');
        //LnNumSym := FilterNumSym(LnStr);

        if Trim(LnGroup) = '' then
        begin
          if IsNumAndSlashOnly(LnStr) then
          begin
            LnGroup := LnGroup + LnStr;
          end
          else
          begin
            if NumOnlyGroups.Count = 3 then  // 9/7/=100, 25=100T100, 123=100ต20, 123 100/20, 254 367=100*ชุด, 239=20โต้ด20
            begin
              if (Pos(' ',LnStr) > StrToInt(StartGroups[0])) and (Pos(' ',LnStr) < Pos('=',LnStr)) and (Pos('=',LnStr) > 0) and (Pos(' ',LnStr) > 0) then
              begin
                if CountOccur('*',LnStr) > 0 then
                begin
                  for j := 0 to NumberGroups.Count-2 do
                  begin
                    if Permutation(NumberGroups[j]) >= 3 then
                      LnAll := LnAll+NumberGroups[j]+'='+NumOnlyGroups[NumberGroups.Count-1]+'*'+IntToStr(Permutation(NumberGroups[j]))+#13#10
                    else
                      LnAll := LnAll+NumberGroups[j]+'='+NumOnlyGroups[NumOnlyGroups.Count-1]+#13#10;
                  end;
                end
                else  // 254 367=100
                begin
                  for j := 0 to NumberGroups.Count-2 do
                    LnAll := LnAll+NumberGroups[j]+'='+NumberGroups[NumberGroups.Count-1]+#13#10;
                end;
              end
              else // 9/7=100, 254/367=100, 254/367/200
              begin
                if CountOccur('=',LnStr) <= 1 then
                begin
                  //if (Pos('+',LnStr) > 0) then
                  //Showmessage(LnStr);
                  if (Pos('โต๊ด',LnStr) > StrToInt(StartGroups[1])) and (Pos('โต๊ด',LnStr) < StrToInt(StartGroups[2])) then
                    LnAll := LnAll+NumberGroups[0]+'='+NumOnlyGroups[1]+'*'+NumOnlyGroups[NumOnlyGroups.Count-1]+#13#10
                  else
                  if (Pos('โต้ด',LnStr) > StrToInt(StartGroups[1])) and (Pos('โต้ด',LnStr) < StrToInt(StartGroups[2])) then
                    LnAll := LnAll+NumberGroups[0]+'='+NumOnlyGroups[1]+'*'+NumOnlyGroups[NumOnlyGroups.Count-1]+#13#10
                  else
                  if (Pos('ต',LnStr) > StrToInt(StartGroups[1])) and (Pos('ต',LnStr) < StrToInt(StartGroups[2])) then
                    LnAll := LnAll+NumberGroups[0]+'='+NumOnlyGroups[1]+'*'+NumOnlyGroups[NumOnlyGroups.Count-1]+#13#10
                  else
                  if (Pos('t',LnStr) > StrToInt(StartGroups[1])) and (Pos('t',LnStr) < StrToInt(StartGroups[2])) then
                    LnAll := LnAll+NumberGroups[0]+'='+NumOnlyGroups[1]+'*'+NumOnlyGroups[NumOnlyGroups.Count-1]+#13#10
                  else
                  if (Pos('T',LnStr) > StrToInt(StartGroups[1])) and (Pos('T',LnStr) < StrToInt(StartGroups[2])) then
                    LnAll := LnAll+NumberGroups[0]+'='+NumOnlyGroups[1]+'*'+NumOnlyGroups[NumOnlyGroups.Count-1]+#13#10
                  else
                  if (Pos('/',LnStr) > StrToInt(StartGroups[1])) and (Pos('/',LnStr) < StrToInt(StartGroups[2])) and (CountOccur('/',LnStr)=1) then
                    LnAll := LnAll+NumberGroups[0]+'='+NumOnlyGroups[1]+'*'+NumOnlyGroups[NumOnlyGroups.Count-1]+#13#10
                  else
                  if (Pos('/',LnStr) > 0) and (Pos('/',LnStr) < Pos('=',LnStr)) then // 1/5/=100, 2/6=50
                  begin
                    for j := 0 to NumberGroups.Count-2 do
                      LnAll := LnAll+NumberGroups[j]+'='+NumOnlyGroups[2]+#13#10;
                  end
                  else
                  if (Pos('+',LnStr) > StrToInt(StartGroups[1])) and (Pos('+',LnStr) < StrToInt(StartGroups[2])) then
                  begin
                    LnAll := LnAll+NumberGroups[0]+'='+NumOnlyGroups[1]+'*'+NumOnlyGroups[NumOnlyGroups.Count-1]+#13#10
                  end
                  else
                  if (Pos('-',LnStr) > StrToInt(StartGroups[1])) and (Pos('-',LnStr) < StrToInt(StartGroups[2])) then
                    LnAll := LnAll+NumberGroups[0]+'='+NumOnlyGroups[1]+'*'+NumOnlyGroups[NumOnlyGroups.Count-1]+#13#10
                  else
                  begin

                    if CountOccur('/',LnStr) = 2 then
                    begin
                      LnAll := LnAll+NumberGroups[0]+'='+NumOnlyGroups[1]+'*'+NumOnlyGroups[2]+#13#10
                    end
                    else
                    begin
                      for j := 0 to NumberGroups.Count-2 do
                        LnAll := LnAll+NumberGroups[j]+'='+NumberGroups[NumberGroups.Count-1]+#13#10;
                    end;
                  end;

                end
                else
                begin
                  LnAll := LnAll+NumberGroups[0]+'='+NumberGroups[1]+'*'+NumberGroups[NumberGroups.Count-1]+#13#10;
                end;
              end;
            end
            else
            if NumOnlyGroups.Count = 4 then  // 123=50=10*6, 122=50=10*3, 292 529=50*50, 430/947/=50*50
            begin
              if (IsLastStr(LnStr,'*6') Or IsLastStr(LnStr,'*3')) and (CountOccur('=',LnStr) = 2) then  //982=20=10*6, 988=20=10*3
              begin
                LnAll := LnAll+NumOnlyGroups[0]+'='+IntToStr(StrToInt(NumOnlyGroups[1])+StrToInt(NumOnlyGroups[2]))+'*'+IntToStr(StrToInt(NumOnlyGroups[3])-1)+'*'+NumOnlyGroups[2]+#13#10
              end
              else
              //if (Pos(' ',LnStr) > StrToInt(StartGroups[0])) and (Pos(' ',LnStr) < Pos('=',LnStr)) then
              if (CountOccur('=',LnStr) = 1) and (Pos('=',LnStr) > StrToInt(StartGroups[1]))  then
              begin
                for j := 0 to NumberGroups.Count-2 do
                  LnAll := LnAll+NumberGroups[j]+'='+NumberGroups[NumberGroups.Count-1]+#13#10;
              end;
            end;
          end;
        end
        else
        begin
          if IsNumAndSlashOnly(LnStr) then  // 12/425/39, 123/421/954
          begin
            if LnGroup[Length(LnGroup)] <> '/' then
              LnGroup := Trim(LnGroup) +'/'+ LnStr
            else
              LnGroup := LnGroup + LnStr;
          end
          else
            LnGroup := LnGroup + LnStr;
        end;
      end
      else
      begin
        //showmessage('> 3333333333');

        if Trim(LnGroup) = '' then
        begin

          if (CountOccur('=',LnStr) > 1) then
          begin
            ExtractGroupsNum(LnStr, GroupsNum);
            if (GroupsNum.Count > 1) then  // "644=1000  633=200"
            begin
              for j := 0 to GroupsNum.Count-1 do
              begin
                ExtractNumberOnly(GroupsNum[j], NumOnlyGroups);
                if (CountOccur('ชุด',GroupsNum[j]) > 0) then
                begin
                  if Permutation(NumOnlyGroups[0]) >= 3 then
                    LnAll := LnAll+NumOnlyGroups[0]+'='+NumOnlyGroups[1]+'*'+IntToStr(Permutation(NumOnlyGroups[0]))+#13#10
                  else
                    LnAll := LnAll+NumOnlyGroups[0]+'='+NumOnlyGroups[1]+#13#10;
                end
                else
                  LnAll := LnAll+GroupsNum[j]+#13#10;

                NumOnlyGroups.Clear;
              end;
            end;
            GroupsNum.Clear;
          end
          else
          begin
            if IsNumAndSlashOnly(LnStr) then // 123/425/200/284
              LnGroup := LnGroup + LnStr
            else  // 123 254 367=100*ชุด, 218,292 529=50*50
            begin
              if CountOccur('*',LnStr) > 0 then
              begin
                if CountOccur('ชุด',LnStr) > 0 then
                begin
                  for j := 0 to NumberGroups.Count-2 do
                  begin
                    if Permutation(NumberGroups[j]) >= 3 then
                      LnAll := LnAll+NumberGroups[j]+'='+NumOnlyGroups[NumberGroups.Count-1]+'*'+IntToStr(Permutation(NumberGroups[j]))+#13#10
                    else
                      LnAll := LnAll+NumberGroups[j]+'='+NumOnlyGroups[NumOnlyGroups.Count-1]+#13#10;
                    end;
                  end
                else
                begin
                  for j := 0 to NumberGroups.Count-2 do
                    LnAll := LnAll+NumberGroups[j]+'='+NumberGroups[NumberGroups.Count-1]+#13#10;
                end;
              end
              else  // 123 364 254 367=100, 125/125/968/721=100*30
              begin
                for j := 0 to NumberGroups.Count-2 do
                  LnAll := LnAll+NumberGroups[j]+'='+NumberGroups[NumberGroups.Count-1]+#13#10;
              end;
            end;
          end;// เครื่องหมาย = มากกว่า 1 ตัว
        end
        else
        begin
          if LnGroup[Length(LnGroup)] <> '/' then
            LnGroup := Trim(LnGroup) +'/'+ LnStr
          else
            LnGroup := LnGroup + LnStr;
        end;



        {
        if IsNumAndSlashOnly(LnStr) then  //123/425/200/284
        begin
          if Trim(LnGroup) = '' then
            LnGroup := LnGroup + LnStr
          else
          begin
            if LnGroup[Length(LnGroup)] <> '/' then
              LnGroup := Trim(LnGroup) +'/'+ LnStr
            else
              LnGroup := LnGroup + LnStr;
          end;
        end
        else
        begin
          if Trim(LnGroup) <> '' then
          begin
            if LnGroup[Length(LnGroup)] <> '/' then
              LnGroup := Trim(LnGroup) +'/'+ LnStr
            else
              LnGroup := LnGroup + LnStr;

          end
        end;
        //Showmessage(LnGroup);

        GetNumType := GetStr(LnStr);
        GetNumType := RpStr(GetNumType);

        if (CountOccur('=',LnStr) > 1) then
        begin
          ExtractGroupsNum(LnStr, GroupsNum);
          if (GroupsNum.Count > 1) then  // "644=1000  633=200"
          begin
            for j := 0 to GroupsNum.Count-1 do
            begin
              ExtractNumberOnly(GroupsNum[j], NumOnlyGroups);
              if (CountOccur('ชุด',GroupsNum[j]) > 0) then
              begin
                if Permutation(NumOnlyGroups[0]) >= 3 then
                  LnAll := LnAll+NumOnlyGroups[0]+'='+NumOnlyGroups[1]+'*'+IntToStr(Permutation(NumOnlyGroups[0]))+#13#10
                else
                  LnAll := LnAll+NumOnlyGroups[0]+'='+NumOnlyGroups[1]+#13#10;
              end
              else
                LnAll := LnAll+GroupsNum[j]+#13#10;

              NumOnlyGroups.Clear;
            end;
          end;
          GroupsNum.Clear;
        end
        else
        begin

          if NumOnlyGroups.Count = NumberGroups.Count then //จำนวนชุดเลขเท่ากัน
          begin
            //Showmessage('เท่ากัน');
            if (CountOccur('ชุด',LnStr) > 0) then
            begin
              if (CountOccur('=',LnStr) = 1) Or (CountOccur('*',LnStr) = 1) then
              begin  //เริ่ม มีเครื่องหมาย = ตัวเดียว
                if (LnGroup = '') then
                begin
                  ExtractNumberOnly(LnStr, NumOnlyGroups);
                  for j := 0 to NumOnlyGroups.Count-2 do
                  begin
                    if Permutation(NumOnlyGroups[j]) >= 3 then
                      LnAll := LnAll+NumOnlyGroups[j]+'='+NumOnlyGroups[NumOnlyGroups.Count-1]+'*'+IntToStr(Permutation(NumOnlyGroups[j]))+#13#10
                    else
                      LnAll := LnAll+NumOnlyGroups[j]+'='+NumOnlyGroups[NumOnlyGroups.Count-1]+#13#10;
                  end;
                  NumOnlyGroups.Clear;
                  LnGroup := '';
                end
                else
                begin
                  ExtractNumberOnly(LnGroup, NumOnlyGroups);
                  for j := 0 to NumOnlyGroups.Count-2 do
                  begin
                    if Permutation(NumOnlyGroups[j]) >= 3 then
                      LnAll := LnAll+NumOnlyGroups[j]+'='+NumOnlyGroups[NumOnlyGroups.Count-1]+'*'+IntToStr(Permutation(NumOnlyGroups[j]))+#13#10
                    else
                      LnAll := LnAll+NumOnlyGroups[j]+'='+NumOnlyGroups[NumOnlyGroups.Count-1]+#13#10;
                  end;
                  NumOnlyGroups.Clear;
                  LnGroup := '';
                end;
              end;
            end //----------------(CountOccur('ชุด',LnStr) > 0)---------//
            else
            begin
              if (CountOccur('=',LnStr) = 1) then // 644=1,000,    633=1,000
              begin

                if (LnGroup = '') then
                begin
                  ExtractNumberOnly(LnStr, NumOnlyGroups);
                  for j := 0 to NumOnlyGroups.Count-2 do
                  begin
                    LnAll := LnAll+NumOnlyGroups[j]+'='+NumOnlyGroups[NumOnlyGroups.Count-1]+#13#10
                  end;
                  NumOnlyGroups.Clear;
                end
                else
                begin
                  ExtractNumberOnly(LnGroup, NumOnlyGroups);
                  for j := 0 to NumOnlyGroups.Count-2 do
                  begin
                    LnAll := LnAll+NumOnlyGroups[j]+'='+NumOnlyGroups[NumOnlyGroups.Count-1]+#13#10;
                  end;
                  NumOnlyGroups.Clear;
                  LnGroup := '';
                end;
              end //------------end (CountOccur('=',LnStr) > 1) -----------//
              else
              if (CountOccur('=',LnStr) = 0) then
              begin
                //Showmessage(LnStr);
                if (CountOccur('=',LnStr) = 1) and (CountOccur('*',LnStr) > 1) then // 21, 59, 18 = 5
                //if (CountOccur('=',LnStr) = 1) then // 21, 59, 18 = 5
                begin
                  for j := 0 to NumOnlyGroups.Count-2 do
                    LnAll := LnAll+NumOnlyGroups[j]+'='+NumOnlyGroups[NumOnlyGroups.Count-1]+#13#10;

                  LnGroup := '';
                end;
              end;
            end;
          end //-----------------NumOnlyGroups.Count = NumberGroups.Count-------------//
          else
          begin
            if (CountOccur('=',LnStr) > 1) then
            begin
              ExtractGroupsNum(LnStr,GroupsNum);
              for j := 0 to GroupsNum.Count-1 do
                LnAll := LnAll+GroupsNum[j]+#13#10;
            end
            else
            begin
              for j := 0 to NumOnlyGroups.Count-3 do
                LnAll := LnAll+NumOnlyGroups[j]+'='+NumberGroups[NumberGroups.Count-1]+#13#10;
            end;
            LnGroup := '';
          end;
        end;
        }

      end;
      //-----------------------กรองข้อความแต่ละชุด------------------------//
    end;
  end;
  //Showmessage(LnAll);

  finally
    NumberGroups.Free; // ปล่อยหน่วยความจำ
    StrGroups.Free; // ปล่อยหน่วยความจำ
    LnGroups.Free;
    NumOnlyGroups.Free;
    StartGroups.Free;
  end;
  Result := LnAll;

end;


procedure TfrmInputText.PasteBtnClick(Sender: TObject);
var size: integer;
    St,txt,ClipbrdClear,Separator: string;
    Buffer : PChar;
    SCopy: Boolean;
    Heads: array[0..34] of String;
    i, ToTalNum: integer;
    txtLine: string;
    Rtxt: TRichEdit;
begin
  Rtxt := TRichEdit.Create(nil);
  try
    Rtxt.Visible := false;
    Rtxt.Parent := Panel3;
    Rtxt.Text := Clipboard.AsText;
    Rtxt.CutToClipboard;
  finally
    Rtxt.Free;
  end;
  NumList.Enabled := false;
  IF Not(ChkClpBrdFilter.Checked) then
  begin
    NumList.Lines.Add('################');
    NumList.PasteFromClipboard;
    NumList.Lines.Add('<----------------------------->');

    TotalNum := 0;
    With NumLIst do
    begin
        for i := 0 to Lines.Count-1 do
        begin
           txtLine := Lines[i];
           if txtLine <> '' then
           begin
              if (Pos('=',txtLine) > 0) then
              begin
                TotalNum := TotalNum+1;
              end;
           end;
        end;
        lbTotalNum.Caption := IntToStr(TotalNum)+' รายการ';
    end;
    NumList.Enabled := true;
    ChkClpBrdFilter.Checked := true;
    exit;
  end;


  Heads[0]  := 'เธงเธดเนเธเธเธ'; //คำว่า วิ่งบน
  Heads[1]  := 'เธฅเธญเธขเนเธ'; //คำว่า ลอยแพ
  Heads[2]  := 'เธงเธดเนเธเธฅเนเธฒเธ'; //คำว่า วิ่งล่าง
  Heads[3]  := 'เธงเธดเนเธ'; //คำว่าวิ่ง
  Heads[4]  := 'เธเธ'; //คำว่า บน
  Heads[5]  := 'เธฅเนเธฒเธ'; //คำว่า ล่าง
  Heads[6]  := 'เธฅเธญเธข'; //คำว่าลอย
  Heads[7]  := 'เนเธ'; //คำว่าแพ
  Heads[8]  := 'เธเธนเธ“'; //คำว่าคูณ
  Heads[9]  := 'เธเธธเธ'; //คำว่าคุน
  Heads[10] := 'เธเธนเธ'; //คำว่าคูน
  Heads[11] := 'เธเธธเธ”'; //คำว่าชุด
  Heads[12] := '/เธเธธเธ”'; //คำว่า /ชุด
  Heads[13] := 'เน€เธ—เนเธฒเธเธฑเธ'; //คำว่า เท่ากับ
  Heads[14] := 'เนเธ•เนเธ”'; //คำว่า โต๊ด
  Heads[15] := 'ร—'; //คำว่า
  Heads[16] := '/'; //คำว่า
  Heads[17] := 'เธกเธต'; //คำว่ามี
  Heads[18] := 'เธเธฃเธฐ'; //คำว่า
  Heads[19] := 'เธ•เธน'; //คำว่า
  Heads[20] := ','; //คำว่า
  Heads[21] := '"'; //คำว่า
  Heads[22] := 'เธกเธตเธเธ'; //คำว่า มีบน
  Heads[23] := 'เธกเธตเธฅเนเธฒเธ'; //คำว่า มีล่าง
  Heads[24] := 'เธเธเธฅเนเธฒเธ'; //คำว่า บนล่าง
  Heads[25] := '.'; //คำว่า
  Heads[26] := '#'; //คำว่า
  Heads[27] := 'เธ,เธฅ'; //คำว่า บ,ล
  Heads[28] := 'เนเธ•เนเธ”'; //คำว่า โต้ด
  Heads[29] := 'เธ+เธฅ'; //คำว่า บ+ล
  Heads[30] := 'เธ-เธฅ'; //คำว่า บ-ล
  Heads[31] := 'เธเธ-เธฅเนเธฒเธ'; //คำว่า บน-ล่าง
  Heads[32] := '•เธเน'; //ไม่แน่ใจว่าคำว่าอะไร
  Heads[33] := 'เธเธฅเธฑเธ'; //คำว่ากลับ
  Heads[34] := '?'; // x ในภาษาไทย


  //ClipbrdClear  := Replace(Clipboard.AsText,'       ', ' ');
  //ClipbrdClear  := Replace(CClipbrdClear,'      ', ' ');
  //ClipbrdClear  := Replace(ClipbrdClear,'     ', ' ');
  //ClipbrdClear  := Replace(ClipbrdClear,'    ', ' ');
  //ClipbrdClear  := Replace(ClipbrdClear,'   ', ' ');
  //ClipbrdClear  := Replace(ClipbrdClear,'  ', ' ');
  //ClipbrdClear  := Replace(ClipbrdClear,' ', ' ');

  if ChkSetNum.Checked then
    //ClipbrdClear := GetPrFromSetNum(ClipbrdClear)
    //ClipbrdClear := GetNumFromClpBrd(Clipboard.AsText)
    //ClipbrdClear := GetNumFromClp(ClipbrdClear)
    //ClipbrdClear := GetNumFromCB(Clipboard.AsText)
    ClipbrdClear := GetNumFromLineApp(Clipboard.AsText)
  else
    ClipbrdClear  := Replace(Clipboard.AsText, 'x', '*');

  //Showmessage(ClipbrdClear);
  ClipbrdClear  := Replace(ClipbrdClear, '5 ตัวบน', '5 Top');
  ClipbrdClear  := Replace(ClipbrdClear, '4 ตัวบน', '4 Top');
  ClipbrdClear  := Replace(ClipbrdClear, '3 ตัวล่าง', '3 Down');
  ClipbrdClear  := Replace(ClipbrdClear, 'ปักหน้าบน', 'Left-Top');
  ClipbrdClear  := Replace(ClipbrdClear, '*หน้า', '');
  ClipbrdClear  := Replace(ClipbrdClear, '* หน้า', '');
  ClipbrdClear  := Replace(ClipbrdClear, 'หน้าบน', 'Left-Top');
  ClipbrdClear  := Replace(ClipbrdClear, 'ปักกลางบน', 'Center-Top');
  ClipbrdClear  := Replace(ClipbrdClear, 'กลางบน', 'Center-Top');
  ClipbrdClear  := Replace(ClipbrdClear, 'ปักหลังบน', 'Right-Top');
  ClipbrdClear  := Replace(ClipbrdClear, 'หลังบน', 'Right-Top');
  ClipbrdClear  := Replace(ClipbrdClear, 'ปักหน้าล่าง', 'Left-Down');
  ClipbrdClear  := Replace(ClipbrdClear, 'หน้าล่าง', 'Left-Down');
  ClipbrdClear  := Replace(ClipbrdClear, 'ปักหลังล่าง', 'Right-Down');
  ClipbrdClear  := Replace(ClipbrdClear, 'หลังล่าง', 'Right-Down');
  ClipbrdClear  := Replace(ClipbrdClear, 'ถ่างบน', 'Split-Top');
  ClipbrdClear  := Replace(ClipbrdClear, 'หน้า', 'Left-Top');
  ClipbrdClear  := Replace(ClipbrdClear, 'ตู', '');
  ClipbrdClear  := Replace(ClipbrdClear, 'ตุ', '');
  ClipbrdClear  := Replace(ClipbrdClear, 'ประตู', '');

  ClipbrdClear  := Replace(ClipbrdClear, Heads[24], ' Top-Down '); //Top-Down
  ClipbrdClear  := Replace(ClipbrdClear, Heads[27], ' Top-Down '); //Top-Down
  ClipbrdClear  := Replace(ClipbrdClear, Heads[29], ' Top-Down '); //Top-Down
  ClipbrdClear  := Replace(ClipbrdClear, Heads[30], ' Top-Down '); //Top-Down
  ClipbrdClear  := Replace(ClipbrdClear, Heads[31], ' Top-Down '); //Top-Down

  ClipbrdClear  := Replace(ClipbrdClear, Heads[0], ' Float ');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[1], ' Float ');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[2], ' FD '); // Float-Down
  ClipbrdClear  := Replace(ClipbrdClear, Heads[3], ' Float ');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[22], ' Float ');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[23], ' FD ');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[4], ' Top ');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[5], ' Down ');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[6], ' Float ');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[7], ' Float ');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[8], '*');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[9], '*');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[10], '*');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[11], '');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[12], '*');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[13], '=');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[14], '*');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[28], '*');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[15], '*');
  //ClipbrdClear  := Replace(ClipbrdClear, Heads[16], '*');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[17], ' Float ');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[18], '');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[19], '');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[20], '');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[21], '');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[32], '');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[33], '*');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[34], '*');
  //ClipbrdClear  := Replace(ClipbrdClear, Heads[25], ' ');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[26], ' ');

  ClipbrdClear  := Replace(ClipbrdClear, '**', '*');
  ClipbrdClear  := Replace(ClipbrdClear, 'กลับ', '*');
  ClipbrdClear  := Replace(ClipbrdClear, 'วิ่งบน', 'Float ');
  ClipbrdClear  := Replace(ClipbrdClear, 'ลอยแพ', 'Float ');
  ClipbrdClear  := Replace(ClipbrdClear, 'มี', 'Float ');
  ClipbrdClear  := Replace(ClipbrdClear, 'วิ่งล่าง', 'FD ');
  ClipbrdClear  := Replace(ClipbrdClear, 'วิ่ง', 'Float ');
  ClipbrdClear  := Replace(ClipbrdClear, 'บน', 'Top ');
  ClipbrdClear  := Replace(ClipbrdClear, 'ล่าง', 'Down ');
  ClipbrdClear  := Replace(ClipbrdClear, 'ลอย', 'Float ');
  ClipbrdClear  := Replace(ClipbrdClear, 'แพ', 'Float ');
  ClipbrdClear  := Replace(ClipbrdClear, 'คูณ', '*');
  ClipbrdClear  := Replace(ClipbrdClear, 'คุณ', '*');
  ClipbrdClear  := Replace(ClipbrdClear, 'คูน', '*');
  ClipbrdClear  := Replace(ClipbrdClear, 'ชุด', '');
  ClipbrdClear  := Replace(ClipbrdClear, 'เท่ากับ', '=');

  if (Pos('3 ตัวโต๊ด',ClipbrdClear) = 0) then
    ClipbrdClear  := Replace(ClipbrdClear, 'โต๊ด', '*')
  else
    ClipbrdClear  := Replace(ClipbrdClear, '3 ตัวโต๊ด', '3 Float');

  ClipbrdClear  := Replace(ClipbrdClear, 'มี', 'Float ');
  ClipbrdClear  := Replace(ClipbrdClear, 'มีบน', 'Float ');
  ClipbrdClear  := Replace(ClipbrdClear, 'มีล่าง', 'FD ');
  ClipbrdClear  := Replace(ClipbrdClear, 'บนล่าง', 'Top-Down ');
  ClipbrdClear  := Replace(ClipbrdClear, 'บน-ล่าง', 'Top-Down ');
  ClipbrdClear  := Replace(ClipbrdClear, 'บ,ล', 'Top-Down ');
  ClipbrdClear  := Replace(ClipbrdClear, 'บ-ล', 'Top-Down ');
  ClipbrdClear  := Replace(ClipbrdClear, 'บ+ล', 'Top-Down ');

  eng.Text := ClipbrdClear;
  if Trim(eng.Text) <> '' then
  begin
      Size := 0;
      try
        st := '';
        With eng do
        begin
          size := SelLength;
          if size < 1 then
          begin
               selectall;
               size := Length(text);
          end;
          inc(size);//เพิ่มขนาดห้องเพื่อเก็บ Null-Terminate String (#0)
          GetMem(Buffer, Size);
          GetSelTextBuf(Buffer,Size);
          Txt := StrPas(Buffer);
          SelLength := 0;
          try
            //Showmessage(Txt);
            //ReadWord(TrimRight(txt)+'...'+#13#10+'.');
            ReadWord(TrimRight(txt)+#13#10);
          except
            Showmessage('รูปแบบข้อความที่วางจากคลิปบอร์ดบางรายการไม่ถูกต้อง');
          end;
        end;
      finally
        FreeMem(Buffer,Size);
        eng.Clear;
      end;
  end
  else
  begin
    ShowMessage('ข้อมูลในคลิปบอร์ดไม่ถูกต้อง');
    NumList.Enabled := true;
    NumList.SetFocus;
    abort;
  end;

  TotalNum := 0;
  With NumLIst do
  begin
      for i := 0 to Lines.Count-1 do
      begin
         txtLine := Lines[i];
         if txtLine <> '' then
         begin
            if (Pos('=',txtLine) > 0) then
            begin
              TotalNum := TotalNum+1;
            end;
         end;
      end;
      lbTotalNum.Caption := IntToStr(TotalNum)+' รายการ';
  end;
  NumList.Enabled := true;
  NumList.SetFocus;
end;

function CaretAtLineStart(AMemo: TRichEdit): Boolean;
var
  LineIndex: Integer;
  LineStartPos: Integer;
begin
  LineIndex := AMemo.CaretPos.Y;  // บรรทัดปัจจุบัน
  LineStartPos := AMemo.Perform(EM_LINEINDEX, LineIndex, 0); // ตำแหน่งเริ่มบรรทัด
  
  Result := (AMemo.SelStart = LineStartPos);
end;

procedure TfrmInputText.AltNum;
Var
    LineNumber: integer;
    Num,LastNum,NumLine,Pr,LastNumPr,LastPr,PerMu,LeftPr,Pr1: String;
    Last1Line, Last2Line, LastLine,BfEQLast1Line, BfEQLast2Line,BfEQLastLine, BhEQLastLine, AltStr: String;
begin
  LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
  if LineNumber = 0 then
    Exit;

  LastLine := NumList.Lines[LineNumber-1];
  BfEQLastLine := Copy(LastLine,1,Pos('=',LastLine)-1);
  BhEQLastLine := Copy(LastLine,Pos('=',LastLine),Length(LastLine)-Pos('=',LastLine)+1);
  if Length(BfEQLastLine) = 2 then
  begin
    if LineNumber >= 1 then
    begin
      Last1Line := NumList.Lines[LineNumber-2];
      BfEQLast1Line := Copy(Last1Line,1,Pos('=',Last1Line)-1);
    end;

    AltStr := LastLine[2]+LastLine[1];
    if AltStr <> BfEQLast1Line then
      NumList.SelText := AltStr+BhEQLastLine+#13#10
    else
      exit;
  end
  else
  if Length(BfEQLastLine) = 3 then
  begin
    if LineNumber >= 2 then
    begin
      Last2Line := NumList.Lines[LineNumber-2];
      BfEQLast2Line := Copy(Last2Line,1,Pos('=',Last2Line)-1);
    end;

    if (CbAlt.ItemIndex = 1) then
    begin
      AltStr := LastLine[1]+LastLine[3]+LastLine[2];
      if AltStr <> BfEQLast2Line then
        NumList.SelText := AltStr+BhEQLastLine+#13#10
      else
        Exit;
    end;

    if (CbAlt.ItemIndex = 2) then
    begin
      AltStr := LastLine[3]+LastLine[2]+LastLine[1];
      if AltStr <> BfEQLast2Line then
        NumList.SelText := AltStr+BhEQLastLine+#13#10
      else
        Exit;
    end;

    if (CbAlt.ItemIndex = 0) then
    begin
      AltStr := LastLine[2]+LastLine[1]+LastLine[3];
      if AltStr <> BfEQLast2Line then
        NumList.SelText := AltStr+BhEQLastLine+#13#10
      else
        Exit;
    end;
  end;
end;

procedure TfrmInputText.NumListKeyPress(Sender: TObject; var Key: Char);
Var
    LineNumber,i: integer;
    Num,LastNum,NumLine,Pr,LastNumPr,LastPr,PerMu,LeftPr,Pr1: String;
    Last3ChInLine: String;
    Last1Line, Last2Line, LastLine,BfEQLast1Line, BfEQLast2Line,BfEQLastLine, BhEQLastLine, AltStr: String;
begin
    LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
    LastNumPr := NumList.Lines[LineNumber-1];
    NumLine := NumList.Lines[LineNumber];

    if (Pos('=', NumLine) > 0) then
      Num := Trim(Copy(NumLine,1,Pos('=',NumLine)-1))
    else
      Num := Trim(NumLine);

    if Not(Key in ['0'..'9',#32,#13]) then //ถ้าไม่ใช่คีย์เหล่านี้
    begin
      if (Trim(NumLine) = '')  then //ถ้าบรรทัดว่างให้หยุดไม่ทำอะไร
      begin
        if (key=#10) and (GetKeyState(VK_CONTROL) < 0) then
        begin
          Key := #0;
          if LineNumber > 0 then
            AltNum;
        end
        else
        begin
          Key := #0;
          Exit;
        end;
      end;

      if (Pos('=',NumLine) = 0) Or (Trim(NumLine) = Num+'=')  then //(ถ้าไม่พบเครื่องหมาย =) หรือ (บรรทัดนั้นมีตัวเลขและเครื่องหมาย =)
      begin
        Key := #0;
        Exit;
      end;
    end;

    if ((Pos('=', NumList.Lines[LineNumber]) = 0) and (Pos('*', NumList.Lines[LineNumber]) = 0) and  (Pos(']', NumList.Lines[LineNumber]) > 0)) then
    begin
      if Not(Key in [#13]) then
        if Key in [#32] then
        begin
          Key := #0;
          if CanLockPr then
            ChkLockMoney.Checked := Not ChkLockMoney.Checked
        end
        else
          Key := #0;
    end;


    if (LineNumber > 0) then
    begin
      if (Pos('=', LastNumPr) > 0) then
      begin
        LastNum := Copy(LastNumPr,1,Pos('=', LastNumPr)-1);
        LastPr  := Copy(LastNumPr,Pos('=',LastNumPr)+1,Length(LastNumPr)-Pos('=',LastNumPr));
      end
      else
        LastPr := '0';
    end;

    if (key=#10) and (GetKeyState(VK_CONTROL) < 0) then
    begin
      try
        if ChkTod.Checked then
        begin
          if (NumList.text[NumList.SelStart] in ['='])   then   //Or  (NumLine = '')
            key:=#0
          else
          if (NumLine = '')   then
          begin
            NumList.SelText := LeftPad(StrToInt(LastNum)+1,Length(LastNum))+'=';
            key:=#0;
          end;
        end
        else
        begin
          if (NumLine = '')  then
          begin
            NumList.SelText := LeftPad(StrToInt(LastNum)+1,Length(LastNum))+'=';  // LastNum+'=';//
            key:=#0;
          end;
        end;
      except

      end;
    end;

    if (Key in ['0'..'9',#13,#10,#1,#3,#22,#24,#32,#26]) then
    begin
      if (Key=#1) then //Ctrl+A
      begin
       Key := #0; // Disable Ctrl-A
       NumList.SelectAll;
      end;
   
      if (Key=#3) then //Ctrl+C
      begin
       Key := #0; // Disable Ctrl-C
       N41Click(Sender);
      end;

      {
      if (Key=#22) then //Ctrl+V
      begin
       key := #0;
       PasteBtn.SetFocus;
       PasteBtnClick(Sender);
      end;
      }
   
      if (Key=#24) then //Ctrl+X
      begin
       key := #0;
       N3Click(Sender);
      end;

      if Key = '*' then
      begin
        if ChkTod.Checked then
          Key := #0;
      end;

      //if CanLockPr then
      //begin
        if Key = #32 then //ex 122=100*2*30, 123=100*5*30 1+5Set
        begin
          Key := #0;
          if (Length(Num) = 3)  and  ((Pos('=', NumList.Lines[LineNumber])>0) and (Pos('*', NumList.Lines[LineNumber])>0) and  (NumList.text[NumList.SelStart] in ['*'])) then
          begin
            if CountOccur( '*', NumList.Lines[LineNumber]) = 1 then
              NumList.SelText := IntToStr(Permutation(Num)-1)+'*';
          end
          else
          if (Length(Num) = 3)  and  ((Pos('=', NumList.Lines[LineNumber])>0) and (NumList.text[NumList.SelStart] in ['0'..'9'])) then
          begin
            if CountOccur( '*', NumList.Lines[LineNumber]) = 0 then
              NumList.SelText := '*'+IntToStr(Permutation(Num)-1)+'*';
          end
          else
          begin
            if CanLockPr then
              ChkLockMoney.Checked := Not ChkLockMoney.Checked;
          end;
        end;
      //end;


      if Key = #13 then
      begin
        Key := #0;
        if (LineNumber = 0) and (NumLine = '') then
          Exit;

        if (LineNumber > 0) then
        begin
          if (Pos('=', LastNumPr) > 0) then
          begin
            LastNum := Copy(LastNumPr,1,Pos('=',LastNumPr)-1);
            if Trim(LastNum) = '' then
              Key := #0
            else
            begin
              if (Trim(NumLine) = '') then
              Key := #0;
            end;
          end
          else
          begin
            if (Trim(NumLine) = '') then
              Key := #0;
          end;
        end;

        if IsLastStr(NumLine,'=') then
        begin
          Key := #0;
          if (Not ChkTod.Checked) then
          begin
            if LineNumber > 0 then
            begin
              if IsLastStr(LastPr,'*3') or IsLastStr(LastPr,'*6') or IsLastStr(LastPr,'*12') or IsLastStr(LastPr,'*24') then
              begin
                PerMu := IntToStr(Permutation(Num));
                LeftPr := Copy(LastPr,1,Pos('*',LastPr)-1);

                if (StrToInt(PerMu) > 1) Or (StrToInt(PerMu) = 0) then
                begin
                  if Length(Num) > 2 then
                    NumList.SelText := LeftPr+'*'+PerMu+#13#10
                  else
                  if Length(Num) = 2 then
                    NumList.SelText := LeftPr+'*'+LeftPr+#13#10
                  else
                  if Length(Num) = 1 then
                    NumList.SelText := LeftPr+#13#10;
                end
                else NumList.SelText := LeftPr+#13#10;
              end
              else
              begin
                if Length(Num) > 1 then
                  NumList.SelText := LastPr+#13#10
                else
                begin
                  if Pos('*',LastPr) > 0 then
                    NumList.SelText := Copy(LastPr,1,Pos('*',LastPr)-1)+#13#10
                  else
                    NumList.SelText := LastPr+#13#10;
                end;
              end;
            end
          end
          else
          begin
            if Length(Num) > 0 then
            begin
              if Pos('*',LastPr) > 0 then
                NumList.SelText := Copy(LastPr,1,Pos('*',LastPr)-1)+#13#10
              else
                NumList.SelText := LastPr+#13#10;
            end;
          end;
        end;

        //(ChkTod.Checked = false) and
        if ((Pos('=', NumList.Lines[LineNumber])=0) and  (NumList.text[NumList.SelStart] in ['0'..'9'])) then
        begin
          Key := #0;
          if ChkLockMoney.Checked then
          begin
            if IsLastStr(LastPr,'*3') or IsLastStr(LastPr,'*6') or IsLastStr(LastPr,'*12') or IsLastStr(LastPr,'*24') then
            begin
              PerMu := IntToStr(Permutation(Num));
              LeftPr := Copy(LastPr,1,Pos('*',LastPr)-1);

              if (StrToInt(PerMu) > 1) Or (StrToInt(PerMu) = 0) then
              begin
              if Length(Num) > 2 then
                NumList.SelText := '='+LeftPr+'*'+PerMu+#13#10
              else
              if Length(Num) = 2 then
                NumList.SelText := '='+LeftPr+'*'+LeftPr+#13#10
              else
              if (Length(Num) = 1) then
                NumList.SelText := '='+LeftPr+#13#10;
              end
              else NumList.SelText := '='+LeftPr+#13#10;

            end
            else
            begin
              for i := LineNumber downto 0 do
              begin
                if (CountOccur('=',NumList.Lines[i]) = 1) and Not(IsLastStr(NumList.Lines[i],'=')) then
                begin
                  LastPrice := Copy(NumList.Lines[i],Pos('=',NumList.Lines[i])+1,Length(NumList.Lines[i])-Pos('=',NumList.Lines[i]));
                  Break;
                end;
              end;

              if Length(Num) > 1 then
              begin
                NumList.SelText := '='+LastPrice+#13#10
              end
              else
              begin
                if Pos('*',LastPr) > 0 then
                begin
                  NumList.SelText := '='+LastPrice+#13#10
                end
                else
                begin
                  if LineNumber > 0 then
                  begin
                    NumList.SelText := '='+LastPrice+#13#10
                  end
                  else
                  begin
                    NumList.SelText := '='+LastPrice
                  end;
                end;
              end;
            end;
          end
          else
          begin
            NumList.SelText := '=';
            exit;
          end;
        end;

        if ((Length(Num) = 3) Or (Length(Num) = 4) or (Length(Num) = 5)) and  ((Pos('=', NumList.Lines[LineNumber])>0) and (Pos('*', NumList.Lines[LineNumber])>0) and  (NumList.text[NumList.SelStart] in ['*'])) then
        begin
          Key := #0;
          if Not ChkTod.Checked then
          begin
            if (CountOccur('*',NumList.Lines[LineNumber]) = 1) then
              NumList.SelText := IntToStr(Permutation(Num))+#13#10
            else if (CountOccur('*',NumList.Lines[LineNumber]) = 2) then
            begin
              Pr1 := Copy(NumLine,Pos('=',NumLine)+1,Length(NumLine)-7);
              NumList.SelText := Pr1+#13#10;
            end;
          end;
        end;
   
        if (Length(Num) = 2) and  ((Pos('=', NumList.Lines[LineNumber])>0) and (Pos('*', NumList.Lines[LineNumber])>0) and  (NumList.text[NumList.SelStart] in ['*'])) then
        begin
          Key := #0;
          Pr := Copy(NumLine, Pos('=',NumLine)+1,Length(NumLine)-Pos('=',NumLine)-1);
          NumList.SelText := Pr+#13#10;
        end;
   
        if ((Pos('=', NumList.Lines[LineNumber])>0) and (Pos('*', NumList.Lines[LineNumber])=0) and  (NumList.text[NumList.SelStart] in ['0'..'9'])) then
        begin
          if Length(Num) = 1 then
          begin
            Key := #0;
            NumList.SelText := #13#10
          end;
   
          if Length(Num) = 2 then
          begin
            Key := #0;
            if (Num[1] = Num[2]) then
              NumList.SelText := #13#10
            else
            begin
              if Not(ChkTod.Checked) then
              begin
                NumList.SelText := '*';
                exit;
              end
              else
                NumList.SelText := #13#10;
            end
          end;
   
          if Length(Num) = 3 then
          begin
            Key := #0;
            if (Num[1] = Num[2]) and (Num[2] = Num[3])  then
              NumList.SelText := #13#10
            else
            begin
              if Not(ChkTod.Checked) then
              begin
                NumList.SelText := '*';
                exit;
              end
              else
                NumList.SelText := #13#10;
            end
          end;
        end;

        if ((Pos('=', NumList.Lines[LineNumber])>0) and (Pos('*', NumList.Lines[LineNumber])=0) and  (NumList.text[NumList.SelStart] in ['0'..'9'])) then
        begin
          Key := #0;
          if Not(ChkTod.Checked) then
            NumList.SelText := '*'
          else
            NumList.SelText := #13#10;
        end;

        if ((Pos('=', NumList.Lines[LineNumber])>0) and (Pos('*', NumList.Lines[LineNumber])>0) and  (NumList.text[NumList.SelStart] in ['0'..'9'])) then
        begin
          Key := #0;
          NumList.SelText := #13#10;
        end;

        if ((Pos('=', NumList.Lines[LineNumber]) = 0) and (Pos('*', NumList.Lines[LineNumber]) = 0) and  (NumList.text[NumList.SelStart] in [']'])) then
        begin
          Key := #0;
          NumList.SelText := #13#10;
        end;


        if ChkAlt.Checked then
          AltNum;

      end; //#13
    end
    else Key := #0;
end;

procedure TfrmInputText.N41Click(Sender: TObject);
begin
  NumList.CopyToClipboard;
end;

procedure TfrmInputText.N19Click(Sender: TObject);
begin
  //PasteBtn.SetFocus;
  PasteBtnClick(Sender);
end;

procedure TfrmInputText.N1Click(Sender: TObject);
begin
  NumList.SelectAll;
end;

procedure TfrmInputText.N3Click(Sender: TObject);
begin
  NumList.CutToClipboard;
end;

procedure TfrmInputText.BtnSaveImportClick(Sender: TObject);
Var row,Count,NumLen: integer;
    TbImport: TABSTable;
    Num, Pr, NumLine, HeadStr, Head, StrData,PrUpDn,
    IpNum,IpPr,HTopDwn,HTop,HTod,HDwn,HTran,HMee: String;
    QrCount : TABSQuery;
    DriveNumber: Byte;
    HDDInfo: THDDInfo;
    Heads: array[0..21] of String;
begin
  HeadStr := 'Top';
  Head := '';
  NumLen := 0;

  Heads[0] := 'Float-Top'; //วิ่งบน
  Heads[1] := 'Left-Top';  //ปักหนัาบน
  Heads[2] := 'Center-Top'; //ปักกลางบน
  Heads[3] := 'Right-Top'; //ปักหลังบน
  Heads[4] := 'Float-Down'; //วิ่งล่าง
  Heads[5] := 'Left-Down'; //ปักหน้าล่าง
  Heads[6] := 'Right-Down'; //ปักหลังล่าง
  Heads[7] := '2 Top'; //2 ตัวบน
  Heads[8] := '2 Tod'; //2 ตัวโต๊ด
  Heads[9] := '2 Float'; //2 ตัวมี
  Heads[10] := 'Left-Top'; //2 ตัวหน้า
  Heads[11] := 'Split-Top'; //2 ตัวถ่าง
  Heads[12] := '2 Down'; //2 ตัวล่าง
  Heads[13] := '3 Top'; //3 ตัวเต็ง
  Heads[14] := '3 Float';  //3 ตัวโต๊ด
  Heads[15] := '3 Down'; //3 ตัวล่าง เลิกใช้ไปแล้ว
  Heads[16] := '4 Top';  //4 ตัวตรง
  Heads[17] := '4 Float'; //4 ตัวลอยแพ
  Heads[18] := '4 Translate'; //4 แปลงเป็น 3
  Heads[19] := '5 Top';   //5 ตัวตรง
  Heads[20] := '5 Float'; //5 ตัวลอยแพ
  Heads[21] := '5 Translate'; //5 แปลงเป็น 3
  HTopDwn := 'Top-Down'; //บนล่าง
  HTop := 'Top'; //บน
  HTod := 'Tod'; //โต๊ด
  HDwn := 'Down'; //ล่าง
  HMee := '2 ตัวมี'; //มี
  HTran:= 'Tran'; //แปลงเป็น 3 ตัว

  With Dm do
  begin
      try
        if Trim(NumList.Text) <> '' then
        begin
          TbImport := TABSTable.Create(nil);
          try
          except
          end;
          TbImport.DatabaseName := Database.DatabaseName;
          TbImport.TableName := 'Data';
          try
            TbImport.Close;
          except
          end;
          try
            try
              TbImport.Open;
            except
            end;
          except
          end;

          StrData := '';
          Count := 0;
          for row := 0 to NumList.Lines.Count-1 do
          begin
            NumLine := Trim(NumList.Lines[row]);

            NumLine  := Replace(NumLine, '[วิ่งบน]', 'Float-Top');
            NumLine  := Replace(NumLine, '[ปักหน้าบน]', 'Left-Top');
            NumLine  := Replace(NumLine, '[ปักกลางบน]', 'Center-Top');
            NumLine  := Replace(NumLine, '[ปักหลังบน]', 'Right-Top');
            NumLine  := Replace(NumLine, '[วิ่งล่าง]', 'Float-Down');
            NumLine  := Replace(NumLine, '[ปักหน้าล่าง]', 'Left-Down');
            NumLine  := Replace(NumLine, '[ปักหลังล่าง]', 'Right-Down');
            NumLine  := Replace(NumLine, '[2 ตัวบน]', '2 Top');
            NumLine  := Replace(NumLine, '[2 ตัวโต๊ด]', '2 Tod');
            NumLine  := Replace(NumLine, '[2 ตัวมี]', '2 Float');
            NumLine  := Replace(NumLine, '[2 ตัวหน้าบน]', 'Left-Top');
            NumLine  := Replace(NumLine, '[2 ตัวหน้า]', 'Left-Top');
            NumLine  := Replace(NumLine, '[2 ตัวถ่างบน]', 'Split-Top');
            NumLine  := Replace(NumLine, '[2 ตัวถ่าง]', 'Split-Top');
            NumLine  := Replace(NumLine, '[2 ตัวล่าง]', '2 Down');
            NumLine  := Replace(NumLine, '[3 ตัวบน]', '3 Top');
            NumLine  := Replace(NumLine, '[3 ตัวโต๊ด]', '3 Float'); //3 tod
            NumLine  := Replace(NumLine, '[3 ตัวล่าง]', '3 Down');
            NumLine  := Replace(NumLine, '[4 ตัวบน]', '4 Top');
            NumLine  := Replace(NumLine, '[4 ตัวลอยแพ]', '4 Float');
            NumLine  := Replace(NumLine, '[5 ตัวบน]', '5 Top');
            NumLine  := Replace(NumLine, '[5 ตัวลอยแพ]', '5 Float');
            NumLine  := Replace(NumLine, '[บน]', 'Top');
            NumLine  := Replace(NumLine, '[ล่าง]', 'Down');
            NumLine  := Replace(NumLine, '[ลอย]', 'Float');
            NumLine  := Replace(NumLine, '[บน-ล่าง]', 'Top-Down');

            if (Pos(Heads[0],NumLine)  > 0) then HeadStr := HTop else  //บน
            if (Pos(Heads[1],NumLine)  > 0) then HeadStr := Heads[1] else //ปักหน้าบน
            if (Pos(Heads[2],NumLine)  > 0) then HeadStr := Heads[2] else //ปักกลางบน
            if (Pos(Heads[3],NumLine)  > 0) then HeadStr := Heads[3] else //ปักหลังบน
            if (Pos(Heads[4],NumLine)  > 0) then HeadStr := HDwn else //ล่าง
            if (Pos(Heads[5],NumLine)  > 0) then HeadStr := Heads[5] else //ปักหน้าล่าง
            if (Pos(Heads[6],NumLine)  > 0) then HeadStr := Heads[6] else //ปักหลังล่าง
            if (Pos(Heads[7],NumLine)  > 0) then HeadStr := HTop else //บน
            if (Pos(Heads[8],NumLine)  > 0) then HeadStr := Heads[8] else //2 ตัวโต๊ด
            if (Pos(Heads[9],NumLine)  > 0) then HeadStr := Heads[9] else //2 ตัวมี
            if (Pos(Heads[10],NumLine) > 0) then HeadStr := Heads[10] else //2 ตัวหน้า
            if (Pos(Heads[11],NumLine) > 0) then HeadStr := Heads[11] else //2 ตัวถ่าง
            if (Pos(Heads[12],NumLine) > 0) then HeadStr := HDwn else //ล่าง
            if (Pos(Heads[13],NumLine) > 0) then HeadStr := HTop else //บน
            if (Pos(Heads[14],NumLine) > 0) then HeadStr := HTod else //โต๊ด แพ
            if (Pos(Heads[15],NumLine) > 0) then HeadStr := HDwn else //ล่าง
            if (Pos(Heads[16],NumLine) > 0) then HeadStr := HTop else //บน
            if (Pos(Heads[17],NumLine) > 0) then HeadStr := HTod else //โต๊ด 4 แพ
            if (Pos(Heads[18],NumLine) > 0) then HeadStr := HTran else //4 แปลงเป็น 3
            if (Pos(Heads[19],NumLine) > 0) then HeadStr := HTop else //บน
            if (Pos(Heads[20],NumLine) > 0) then HeadStr := HTod else //โต๊ด 5 แพ
            if (Pos(Heads[21],NumLine) > 0) then HeadStr := HTran else //5 แปลงเป็น 3
            if (Pos(HTopDwn,NumLine) > 0) then HeadStr := HTopDwn else //Top-down บน-ล่าง
            if (Pos(HTop,NumLine) > 0) then HeadStr := HTop else //Top บน เพียว
            if (Pos(HDwn,NumLine) > 0) then HeadStr := HDwn else //Down ล่าง เพียว
            if (NumLine = 'Float') then HeadStr := HTod; //'Float' ลอย

            if NumLine <> '' then
            begin

              if (Pos('=',NumLine) > 0) then
              begin
                Num := trim(Copy(NumLine,1,Pos('=',NumLine)-1)); //เก็บดิบๆมา ส่วนที่อยู่ก่อนเครื่องหมาย =
                Pr  := trim(Copy(NumLine,Pos('=',NumLine)+1,length(NumLine)-Pos('=',NumLine)));

                if (Length(Num) = 2) then
                begin
                  if IsLastStr(Pr,'*') then
                    Pr := ReplaceLast(Pr, '*', '*'+GetNum(Pr));
                end;

                if (Length(Num) = 3) then
                begin
                  //if CountCharInStr('*',Pr) = 1 then
                    if  IsNum15Set(Num,Pr) then
                      Pr := Replace(Pr, '*', '-');

                  if IsLastStr(Pr,'*6') then
                    if (Pos('*2*',Pr) = 0) and  (Pos('*5*',Pr) = 0) then
                      Pr := ReplaceLast(Pr, '*6', '*');

                  if IsLastStr(Pr,'*3') then
                    if (Pos('*2*',Pr) = 0) and  (Pos('*5*',Pr) = 0) then
                      Pr := ReplaceLast(Pr, '*3', '*');

                  Pr := Replace(Pr, '*5*', '*');
                  Pr := Replace(Pr, '*2*', '*');

                end;

                if (Length(Num) = 4) then
                begin
                  if IsLastStr(Pr,'*'+IntToStr(Permutation(Num))) then
                    Pr := ReplaceLast(Pr, IntToStr(Permutation(Num)) , '');
                end;

                if (Length(Num) = 5) then
                begin
                  if IsLastStr(Pr,'*'+IntToStr(Permutation(Num))) then
                    Pr := ReplaceLast(Pr, IntToStr(Permutation(Num)) , '');
                end;

                 //---------------------------------------------------//

                  if HeadStr = HTop then //บน
                  begin
                    IpNum := Num; IpPr := Pr; PrUpDn := 'Up';
                  end
                  else
                  if HeadStr = HDwn then //ล่าง
                  begin
                    IpNum := Num; IpPr := Pr; PrUpDn := 'Dwn';
                  end
                  else
                  if HeadStr = HTod then //โต๊ด
                  begin
                    if (Length(Num) = 1)  then //Float
                    begin
                      IpNum := Num; IpPr := Pr; PrUpDn := 'Up';
                    end;

                    if (Length(Num) = 2)  then
                    begin
                      IpNum := Num+'+'; IpPr := Pr; PrUpDn := 'Up';
                    end;

                    if (Length(Num) = 3) Or (Length(Num) = 4) Or (Length(Num) = 5) then
                    begin
                      //Showmessage(Pr);
                      if (CountOccur('-',Pr) > 0) then
                      begin
                        IpNum := Num; IpPr := Pr; PrUpDn := 'Up'
                      end
                      else
                      begin
                        IpNum := Num; IpPr := '-'+Pr; PrUpDn := 'Up';
                      end;
                    end;
                  end
                  else
                  if HeadStr = Heads[8] then // 2 ตัวโต๊ด
                  begin
                    IpNum := Num; IpPr := '-'+Pr; PrUpDn := 'Up';
                  end
                  else
                  if HeadStr = Heads[1] then // 'Left-Top';  //ปักหนัา-2 ตัวหน้า บน
                  begin
                    IpNum := Num+'-'; IpPr := Pr; PrUpDn := 'Up';
                  end
                  else
                  if HeadStr = Heads[2] then // 'Center-Top'; //ปักกลางบน
                  begin
                    IpNum := '-'+Num+'-'; IpPr := Pr; PrUpDn := 'Up';
                  end
                  else
                  if HeadStr = Heads[3] then // 'Right-Top'; //ปักขวาบน
                  begin
                    IpNum := '-'+Num; IpPr := Pr; PrUpDn := 'Up';
                  end
                  else
                  if HeadStr = Heads[5] then // 'Left-Down'; //ปักหน้าล่าง
                  begin
                    IpNum := Num+'-'; IpPr := Pr; PrUpDn := 'Dwn';
                  end
                  else
                  if HeadStr = Heads[6] then // 'Right-Down'; //ปักหลังล่าง
                  begin
                    IpNum := '-'+Num; IpPr := Pr; PrUpDn := 'Dwn';
                  end
                  else
                  if HeadStr = Heads[9] then // '2 Float'; //2 ตัวมี
                  begin
                    IpNum := Num+'+'; IpPr := Pr; PrUpDn := 'Up';
                  end
                  else
                  if HeadStr = Heads[11] then // 'Split-Top'; //2 ตัวถ่าง
                  begin
                    IpNum := Num[1]+'-'+Num[2]; IpPr := Pr; PrUpDn := 'Up';
                  end
                  else
                  if HeadStr = HTran then //'4,5 Translate'; //4,5 แปลงเป็น 3
                  begin
                    IpNum := Num; IpPr := Pr; PrUpDn := 'Up';
                  end
                  else
                  if HeadStr = HTopDwn then // Top-Down บน-ล่าง
                  begin
                    IpNum := Num; IpPr := Pr; PrUpDn := 'Up';
                  end;

                  if (Length(IpNum) = 4) Or (Length(IpNum) = 5) then
                  begin
                    if IsTod(IpPr) then
                      IpNum := IpNum;//AlterNum(IpNum);
                  end;

                  if (CountOccur('-',IpPr)=1) and (CountOccur('*',IpPr)=1) then
                    IpPr := Replace(IpPr, '-', '');

                  TbImport.Append;
                  TbImport.FieldByName('Period_Date').AsDateTime := IpDate;
                  TbImport.FieldByName('Num').AsString           := IpNum;
                  TbImport.FieldByName(PrUpDn).AsString          := IpPr;
                  TbImport.FieldByName('CustNo').AsString        := edCust.Text;
                  TbImport.FieldByName('RefNo').AsString         := edBookNo.Text;// IpRefID;
                  TbImport.FieldByName('EmpNo').AsString         := IpEmpID;
                  TbImport.FieldByName('LotType').AsInteger      := IpLotType;

                  if HeadStr = HTopDwn then // Top-Down บน-ล่าง
                  begin
                    TbImport.Append;
                    TbImport.FieldByName('Period_Date').AsDateTime := IpDate;
                    TbImport.FieldByName('Num').AsString           := IpNum;
                    TbImport.FieldByName('Dwn').AsString           := IpPr;
                    TbImport.FieldByName('CustNo').AsString        := edCust.Text;
                    TbImport.FieldByName('RefNo').AsString         := edBookNo.Text; //IpRefID;
                    TbImport.FieldByName('EmpNo').AsString         := IpEmpID;
                    TbImport.FieldByName('LotType').AsInteger      := IpLotType;
                    
                    Count := Count+1;
                  End;
                  Count := Count+1;

              End;
            End;
          end;
          TbImport.Post;
          NumList.Clear;
          ChkTod.Checked := false;
          NumList.SetFocus;
          if ChkAddBook.Checked then
            edBookNo.Value := edBookNo.Value+1;

        end
        else Showmessage('ข้อมูลที่ต้องการบันทึกไม่ถูกต้องกรุณาตรวจสอบอีกครั้ง');

      except
        Showmessage('เกิดข้อผิดพลาดในการบันทึกข้อมูล');
      end;
  end;
end;

procedure DeleteEmptyLine(RichEdit: TRichEdit; LineNum: Integer);
begin
  // ตรวจสอบว่าหมายเลขบรรทัดอยู่ในช่วงที่มีจริง
  if (LineNum < 1) or (LineNum > RichEdit.Lines.Count) then Exit;

  // ตรวจสอบว่าบรรทัดนั้นว่างหรือไม่
  if Trim(RichEdit.Lines[LineNum - 1]) = '' then
    RichEdit.Lines.Delete(LineNum - 1);
end;

// Procedure สำหรับย้าย Cursor
procedure MoveCursorToLineStart(ARichEdit: TRichEdit; ALineIndex: Integer);
var
  CharIndex: Integer;
begin
  // ตรวจสอบว่าบรรทัดที่ระบุมีอยู่จริงหรือไม่
  if (ALineIndex >= 0) and (ALineIndex < ARichEdit.Lines.Count) then
  begin
    // 1. หาตำแหน่งตัวอักษรตัวแรกของบรรทัดนั้น (EM_LINEINDEX)
    CharIndex := ARichEdit.Perform(EM_LINEINDEX, ALineIndex, 0);

    if CharIndex <> -1 then
    begin
      // 2. สั่งให้ RichEdit โฟกัส
      ARichEdit.SetFocus;

      // 3. ย้าย Cursor ไปตำแหน่งนั้น
      ARichEdit.SelStart := CharIndex;
      ARichEdit.SelLength := 0; // กำหนดความยาวการเลือกเป็น 0 (คือไม่ไฮไลท์ แค่วาง cursor)

      // 4. สั่ง Scroll หน้าจอให้เลื่อนไปหา Cursor (เผื่อบรรทัดนั้นอยู่นอกจอ)
      ARichEdit.Perform(EM_SCROLLCARET, 0, 0);
    end;
  end;
end;

procedure GoToEndOfCurrentLine(RichEdit: TRichEdit);
var
  LineIndex, LineStart, LineLength: Integer;
begin
  // หาว่าตอนนี้เคอร์เซอร์อยู่ในบรรทัดที่เท่าไร
  LineIndex := RichEdit.Perform(EM_LINEFROMCHAR, RichEdit.SelStart, 0);

  // หาตำแหน่งเริ่มต้นของบรรทัดนั้น (นับจากอักษรตัวแรกของ RichEdit)
  LineStart := RichEdit.Perform(EM_LINEINDEX, LineIndex, 0);

  // หาความยาวของบรรทัดนั้น
  LineLength := Length(RichEdit.Lines[LineIndex]);

  // ย้ายเคอร์เซอร์ไปยังตัวสุดท้ายของบรรทัดนั้น
  RichEdit.SelStart := LineStart + LineLength;
  RichEdit.SelLength := 0;
end;

procedure TfrmInputText.NumListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var Separator, NumLine, LastPr, Num, LastNum, NumPr,CurNumPr, Separator1, Principle, PerMu, LeftPr: string;
    LineNumber: Integer;
    Head: String;
    SelStart, DelCount: Integer;
    TextBefore, TextAfter: string;
    Last3ChInLine,Last1Line, Last2Line, LastLine,BfEQLast1Line, BfEQLast2Line,BfEQLastLine, BhEQLastLine, AltStr: String;
begin
  if (ssCtrl in Shift) and ((Key = Ord('V')) or (Key = Ord('v'))) then
  begin
    // 1. เรียกฟังก์ชั่นที่คุณต้องการ
    PasteBtnClick(Sender);
    // 2. กำหนด Key เป็น 0 เพื่อยกเลิกการ Paste แบบปกติของ Windows
    Key := 0;
  end;

  if Key = VK_BACK then
  begin
    LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
    NumLine := NumList.Lines[LineNumber];
    Last3ChInLine := Copy(NumLine,Length(NumLine)-2,3);
    if (Last3ChInLine = '*5*') Or (Last3ChInLine = '*2*') then
    begin
      Key := 0; // ปิดการทำงานปกติของ Backspace

      SelStart := NumList.SelStart;
      if SelStart > 0 then
      begin
        // หาจำนวนตัวอักษรที่จะลบ (สูงสุด 3 ตัว หรือเท่าที่มี)
        DelCount := 3;

        // ตัดข้อความออก
        TextBefore   := Copy(NumList.Text, 1, SelStart - DelCount);
        TextAfter    := Copy(NumList.Text, SelStart + 1, Length(NumList.Text));
        NumList.Text := TextBefore + TextAfter;

        // ตั้งตำแหน่งเคอร์เซอร์ใหม่
        NumList.SelStart := SelStart - DelCount;
      end;
    end;
  end;

  if ((Shift = [ssCtrl]) and (Key = $0D)) then // Ctrl+Enter
  begin
    Key := 0;
    LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
    CurNumPr := NumList.Lines[LineNumber];
    if (LineNumber = 0) and (CurNumPr = '') then
      exit;    

    if (Pos('=', CurNumPr) > 0) then
      Num := Trim(Copy(CurNumPr,1,Pos('=',CurNumPr)-1))
    else
      Num := Trim(CurNumPr);

    if LineNumber > 0 then
    begin
      NumPr := NumList.Lines[LineNumber-1];
      LastNum := Copy(NumPr,1,Pos('=', NumPr)-1);
    end
    else NumPr := '';

    
    if (Pos('=', NumPr) > 0) then
      LastPr := Copy(NumPr,Pos('=',NumPr)+1,Length(NumPr)-Pos('=',NumPr))
    else
      LastPr := '0';

    if (Pos('=', CurNumPr) = 0) and  (NumList.text[NumList.SelStart] in ['0'..'9']) then
    begin
      if (Not ChkTod.Checked) then
      begin
        if IsLastStr(LastPr,'*3') or IsLastStr(LastPr,'*6') or IsLastStr(LastPr,'*12') or IsLastStr(LastPr,'*24') then
        begin
          PerMu := IntToStr(Permutation(Num));
          LeftPr := Copy(LastPr,1,Pos('*',LastPr)-1);

          if (StrToInt(PerMu) > 1) Or (StrToInt(PerMu) = 0)  then
          begin
            if Length(Num) > 2 then
              NumList.SelText := '='+LeftPr+'*'+PerMu
            else
            if Length(Num) = 2 then
              NumList.SelText := '='+LeftPr+'*'+LeftPr
            else
            if Length(Num) = 1 then
              NumList.SelText := '='+LeftPr;
          end
          else NumList.SelText := '='+LeftPr;

        end
        else
        begin
          if Length(Num) > 1 then
            NumList.SelText := '='+LastPr
          else
          begin
            if Pos('*',LastPr) > 0 then
              NumList.SelText := '='+Copy(LastPr,1,Pos('*',LastPr)-1)
            else
              NumList.SelText := '='+LastPr;
          end;

            //NumList.SelText := '='+Copy(LastPr,1,Pos('*',LastPr)-1)
        end
      end
      else
      begin
        //NumList.SelText := '=';
        NumList.SelText := '='+LastPr;
      end;

    end;

    if IsLastStr(CurNumPr,'=') then
    begin
      if IsLastStr(LastPr,'*3') or IsLastStr(LastPr,'*6') or IsLastStr(LastPr,'*12') or IsLastStr(LastPr,'*24') then
      begin
        PerMu := IntToStr(Permutation(Num));
        LeftPr := Copy(LastPr,1,Pos('*',LastPr)-1);

        if (StrToInt(PerMu) > 1) Or (StrToInt(PerMu) = 0) then
        begin
          if Length(Num) > 2 then
            NumList.SelText := LeftPr+'*'+PerMu
          else
          if Length(Num) = 2 then
            NumList.SelText := LeftPr+'*'+LeftPr
          else
          if Length(Num) = 1 then
            NumList.SelText := LeftPr;
        end
        else NumList.SelText := LeftPr;
      end
      else
      begin
        if Length(Num) > 1 then
          NumList.SelText := LastPr
        else
        begin
          if Pos('*',LastPr) > 0 then
            NumList.SelText := Copy(LastPr,1,Pos('*',LastPr)-1)
          else
            NumList.SelText := LastPr;
        end;
      end
    end;

    if ((Length(Num) = 3) and (CountOccur( '*', NumList.Lines[LineNumber]) = 1) and (Pos('=', NumList.Lines[LineNumber])>0)  and  (NumList.text[NumList.SelStart] in ['*'])) then
    begin
      Principle := Copy(NumList.Lines[LineNumber],Pos('=', NumList.Lines[LineNumber])+1,Length(NumList.Lines[LineNumber])-Pos('=', NumList.Lines[LineNumber])-1);
      NumList.SelText := FormatFloat('##0.#',Round(StrToFloat(Principle)*(100)/(100+edPercent.Value)));
    end;
    
  end;

  {
  if (Shift = [ssCtrl]) and (Key = VK_DECIMAL) then  // Ctrl+.
  begin
      //ChkTod.Checked := Not ChkTod.Checked;
      //if ChkTod.Checked = true then
        //ChkLockMoney.Checked := false;
  end;
  }

  Separator1 := '################';
  Separator := '<----------------------------->';

  if (Shift = [ssCtrl]) and (Key = VK_NUMPAD0) then  // Ctrl+0
  begin
      Key := 0;
      LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
      if LineNumber = 0 then
      begin
        if NumList.Lines[LineNumber] = '' then
        begin
          NumList.SelText := Separator1+#13#10;
          NumList.SelText := '[บน-ล่าง]';
          NumList.SelText := #13#10;
          ChkTod.Checked := false;
        end;
      end
      else
      begin
        if (NumList.Lines[LineNumber-1] = Separator1) Or (NumList.Lines[LineNumber-1] = Separator) then
        begin
          DeleteEmptyLine(NumList,LineNumber+2);
          NumList.Lines[LineNumber] := '[บน-ล่าง]'+#13#10;
        end
        else
        begin
          if NumList.Lines[LineNumber] = '' then
          begin
            if LineNumber < NumList.Lines.Count-1 then
            begin
              NumList.SelText := Separator+#13#10;
              NumList.SelText := '[บน-ล่าง]';
              NumList.SelText := #13#10;
              ChkTod.Checked := false;
            end
            else
            begin
              NumList.SelText := Separator1+#13#10;
              NumList.SelText := '[บน-ล่าง]';
              NumList.SelText := #13#10;
              ChkTod.Checked := false;
            end;
          end
          else
          begin
            if NumList.Lines[LineNumber] <> '' then
            begin
              if (NumList.Lines[LineNumber] = Separator1) Or (NumList.Lines[LineNumber] = Separator) then
              begin
                GoToEndOfCurrentLine(NumList);
                NumList.SelText := #13#10;
              end
              else
              begin
                GoToEndOfCurrentLine(NumList);
                NumList.SelText := #13#10+Separator+#13#10;
              end;
            end
            else
              NumList.SelText := Separator+#13#10;
              
            NumList.SelText := '[บน-ล่าง]';
            NumList.SelText := #13#10;
            ChkTod.Checked := false;
          end;
        end;
      end;
  end;

  if (Shift = [ssCtrl]) and (Key = VK_NUMPAD1) then  // Ctrl+1
  begin
      Key := 0;
      LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
      if LineNumber = 0 then
      begin
        if NumList.Lines[LineNumber] = '' then
        begin
          NumList.SelText := Separator1+#13#10;
          NumList.SelText := '[บน]';
          NumList.SelText := #13#10;
        end;
      end
      else
      begin
        if (NumList.Lines[LineNumber-1] = Separator1) Or (NumList.Lines[LineNumber-1] = Separator) then
        begin
          DeleteEmptyLine(NumList,LineNumber+2);
          NumList.Lines[LineNumber] := '[บน]'+#13#10;
        end
        else
        begin
          if NumList.Lines[LineNumber] = '' then
          begin
            if LineNumber < NumList.Lines.Count-1 then
            begin
              NumList.SelText := Separator+#13#10;
              NumList.SelText := '[บน]';
              NumList.SelText := #13#10;
              ChkTod.Checked := false;
            end
            else
            begin
              NumList.SelText := Separator1+#13#10;
              NumList.SelText := '[บน]';
              NumList.SelText := #13#10;
            end;
          end
          else
          begin
            if NumList.Lines[LineNumber] <> '' then
            begin
              if (NumList.Lines[LineNumber] = Separator1) Or (NumList.Lines[LineNumber] = Separator) then
              begin
                GoToEndOfCurrentLine(NumList);
                NumList.SelText := #13#10;
              end
              else
              begin
                GoToEndOfCurrentLine(NumList);
                NumList.SelText := #13#10+Separator+#13#10;
              end;
            end
            else
              NumList.SelText := Separator+#13#10;
              
            NumList.SelText := '[บน]';
            NumList.SelText := #13#10;
          end;
        end;
      end;
      ChkTod.Checked := false;
  end;

  if (Shift = [ssCtrl]) and (Key = VK_NUMPAD2) then  // Ctrl+2
  begin
      Key := 0;
      LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
      if LineNumber = 0 then
      begin
        if NumList.Lines[LineNumber] = '' then
        begin
          NumList.SelText := Separator1+#13#10;
          NumList.SelText := '[ล่าง]';
          NumList.SelText := #13#10;
        end;
      end
      else
      begin
        if (NumList.Lines[LineNumber-1] = Separator1) Or (NumList.Lines[LineNumber-1] = Separator) then
        begin
          DeleteEmptyLine(NumList,LineNumber+2);
          NumList.Lines[LineNumber] := '[ล่าง]'+#13#10;
        end
        else
        begin
          if NumList.Lines[LineNumber] = '' then
          begin
            if LineNumber < NumList.Lines.Count-1 then
            begin
              NumList.SelText := Separator+#13#10;
              NumList.SelText := '[ล่าง]';
              NumList.SelText := #13#10;
            end
            else
            begin
              NumList.SelText := Separator1+#13#10;
              NumList.SelText := '[ล่าง]';
              NumList.SelText := #13#10;
            end;
          end
          else
          begin
            if NumList.Lines[LineNumber] <> '' then
            begin
              if (NumList.Lines[LineNumber] = Separator1) Or (NumList.Lines[LineNumber] = Separator) then
              begin
                GoToEndOfCurrentLine(NumList);
                NumList.SelText := #13#10;
              end
              else
              begin
                GoToEndOfCurrentLine(NumList);
                NumList.SelText := #13#10+Separator+#13#10;
              end;
            end
            else
              NumList.SelText := Separator+#13#10;
              
            NumList.SelText := '[ล่าง]';
            NumList.SelText := #13#10;
          end;
        end;
      end;
      ChkTod.Checked := false;
  end;

  if (Shift = [ssCtrl]) and (Key = VK_NUMPAD3) then  // Ctrl+3
  begin
      Key := 0;
      LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
      if LineNumber = 0 then
      begin
        if NumList.Lines[LineNumber] = '' then
        begin
          NumList.SelText := Separator1+#13#10;
          NumList.SelText := '[ลอย]';
          NumList.SelText := #13#10;
        end;
      end
      else
      begin
        if (NumList.Lines[LineNumber-1] = Separator1) Or (NumList.Lines[LineNumber-1] = Separator) then
        begin
          DeleteEmptyLine(NumList,LineNumber+2);
          NumList.Lines[LineNumber] := '[ลอย]'+#13#10;
        end
        else
        begin
          if NumList.Lines[LineNumber] = '' then
          begin
            if LineNumber < NumList.Lines.Count-1 then
            begin
              NumList.SelText := Separator+#13#10;
              NumList.SelText := '[ลอย]';
              NumList.SelText := #13#10;
              ChkTod.Checked := true;
            end
            else
            begin
              NumList.SelText := Separator1+#13#10;
              NumList.SelText := '[ลอย]';
              NumList.SelText := #13#10;
            end;
          end
          else
          begin
            if NumList.Lines[LineNumber] <> '' then
            begin
              if (NumList.Lines[LineNumber] = Separator1) Or (NumList.Lines[LineNumber] = Separator) then
              begin
                GoToEndOfCurrentLine(NumList);
                NumList.SelText := #13#10;
              end
              else
              begin
                GoToEndOfCurrentLine(NumList);
                NumList.SelText := #13#10+Separator+#13#10;
              end;
            end
            else
              NumList.SelText := Separator+#13#10;
              
            NumList.SelText := '[ลอย]';
            NumList.SelText := #13#10;
          end;
        end;
      end;
      ChkTod.Checked := true;
  end;

  if (Shift = [ssCtrl]) and (Key = VK_NUMPAD4) then  // Ctrl+4
  begin
      Key := 0;
      LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
      if LineNumber = 0 then
      begin
        if NumList.Lines[LineNumber] = '' then
        begin
          NumList.SelText := Separator1+#13#10;
          NumList.SelText := '[3 ตัวโต๊ด]';
          NumList.SelText := #13#10;
        end;
      end
      else
      begin
        if (NumList.Lines[LineNumber-1] = Separator1) Or (NumList.Lines[LineNumber-1] = Separator) then
        begin
          DeleteEmptyLine(NumList,LineNumber+2);
          NumList.Lines[LineNumber] := '[3 ตัวโต๊ด]'+#13#10;
        end
        else
        begin
          if NumList.Lines[LineNumber] = '' then
          begin
            if LineNumber < NumList.Lines.Count-1 then
            begin
              NumList.SelText := Separator+#13#10;
              NumList.SelText := '[3 ตัวโต๊ด]';
              NumList.SelText := #13#10;
              ChkTod.Checked := true;
            end
            else
            begin
              NumList.SelText := Separator1+#13#10;
              NumList.SelText := '[3 ตัวโต๊ด]';
              NumList.SelText := #13#10;
            end;
          end
          else
          begin
            if NumList.Lines[LineNumber] <> '' then
            begin
              if (NumList.Lines[LineNumber] = Separator1) Or (NumList.Lines[LineNumber] = Separator) then
              begin
                GoToEndOfCurrentLine(NumList);
                NumList.SelText := #13#10;
              end
              else
              begin
                GoToEndOfCurrentLine(NumList);
                NumList.SelText := #13#10+Separator+#13#10;
              end;
            end
            else
              NumList.SelText := Separator+#13#10;
              
            NumList.SelText := '[3 ตัวโต๊ด]';
            NumList.SelText := #13#10;
          end;
        end;
      end;
      ChkTod.Checked := true;
  end;
end;

procedure TfrmInputText.BtnCopyClick(Sender: TObject);
begin
  Numlist.SelectAll;
  Numlist.CutToClipboard;
  NumList.SetFocus;
  //Showmessage('ตัดข้อมูลทั้งหมดลงคลิปบอร์ดเรียบร้อยแล้ว');
end;

procedure TfrmInputText.NumListEnter(Sender: TObject);
begin
  LoadKeyBoardLayOutA('00000409',1);
end;

procedure TfrmInputText.edBookNoKeyPress(Sender: TObject; var Key: Char);
begin
  if Not(Key in ['0'..'9',#8]) then
    Key := #0;
end;

procedure TfrmInputText.RunUpBtnClick(Sender: TObject);
Var LineNumber: Integer;
    Separator,Separator1,NumType: String;
begin
  Separator1 := '################';
  Separator := '<----------------------------->';
  LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
  NumType := '[วิ่งบน]';
  if NumList.Lines[LineNumber] <> '' then //บรรทัดปัจจุบันไม่ว่าง
  begin
    if (NumList.Lines[LineNumber] = Separator1) Or (NumList.Lines[LineNumber] = Separator) then //บรรทัดปัจจุบันเป็นเส้น
    begin
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10;
      NumList.SelText := NumType+#13#10;
      NumList.SelText := #13#10+Separator;
      NumList.SelStart:= NumList.SelStart-Length(Separator)-1;
    end
    else
    if (NumList.Lines[LineNumber-1] = Separator1) Or (NumList.Lines[LineNumber-1] = Separator) then //บรรทัดก่อนหน้าเป็นเส้น
    begin
      if (Pos(']',NumList.Lines[LineNumber]) > 0) then //พบเครื่องหมาย ] ในบรรทัด
      begin
        NumList.Lines[LineNumber] := NumType;
        if (trim(NumList.Lines[LineNumber+1]) = '') then
          MoveCursorToLineStart(NumList,LineNumber+1);
      end
      else
      begin
        GoToEndOfCurrentLine(NumList);
        NumList.SelText := #13#10;
        NumList.SelText := NumType;
      end;
    end
    else
    begin //บรรทัดปัจจุบันไม่ว่าง และไม่เป็นเส้น และบรรทัดก่อนหน้าก็ไม่เป็นเส้น และไม่พบเครื่องหมาย ]
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10+Separator+#13#10;
      NumList.SelText := NumType;
      NumList.SelText := #13#10;
    end;
  end
  else
  begin //กรณีบรรทัดปัจจุบันว่าง
    NumList.SelText := Separator+#13#10;
    NumList.SelText := NumType;
    NumList.SelText := #13#10;
  end;
  ChkTod.Checked := false;
  NumList.SetFocus;
end;

procedure TfrmInputText.LeftUpBtnClick(Sender: TObject);
Var LineNumber: Integer;
   Separator,Separator1,NumType: String;
begin
  Separator1 := '################';
  Separator := '<----------------------------->';
  LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
  if NumList.Lines[LineNumber] <> '' then //บรรทัดปัจจุบันไม่ว่าง
  begin
    if (NumList.Lines[LineNumber] = Separator1) Or (NumList.Lines[LineNumber] = Separator) then //บรรทัดปัจจุบันเป็นเส้น
    begin
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10;
      NumList.SelText := '[ปักหน้าบน]'+#13#10;
      NumList.SelText := #13#10+Separator;
      NumList.SelStart:= NumList.SelStart-Length(Separator)-1;
    end
    else
    if (NumList.Lines[LineNumber-1] = Separator1) Or (NumList.Lines[LineNumber-1] = Separator) then //บรรทัดก่อนหน้าเป็นเส้น
    begin
      if (Pos(']',NumList.Lines[LineNumber]) > 0) then //พบเครื่องหมาย ] ในบรรทัด
      begin
        NumList.Lines[LineNumber] := '[ปักหน้าบน]';
        if (trim(NumList.Lines[LineNumber+1]) = '') then
          MoveCursorToLineStart(NumList,LineNumber+1);
      end
      else
      begin
        GoToEndOfCurrentLine(NumList);
        NumList.SelText := #13#10;
        NumList.SelText := '[ปักหน้าบน]';
      end;
    end
    else
    begin //บรรทัดปัจจุบันไม่ว่าง และไม่เป็นเส้น และบรรทัดก่อนหน้าก็ไม่เป็นเส้น และไม่พบเครื่องหมาย ]
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10+Separator+#13#10;
      NumList.SelText := '[ปักหน้าบน]';
      NumList.SelText := #13#10;
    end;
  end
  else
  begin //กรณีบรรทัดปัจจุบันว่าง
    NumList.SelText := Separator+#13#10;
    NumList.SelText := '[ปักหน้าบน]';
    NumList.SelText := #13#10;
  end;
  ChkTod.Checked := false;
  NumList.SetFocus;
end;

procedure TfrmInputText.CenterUpBtnClick(Sender: TObject);
Var LineNumber: Integer;
    Separator,Separator1,NumType: String;
begin
  Separator1 := '################';
  Separator := '<----------------------------->';
  LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
  if NumList.Lines[LineNumber] <> '' then //บรรทัดปัจจุบันไม่ว่าง
  begin
    if (NumList.Lines[LineNumber] = Separator1) Or (NumList.Lines[LineNumber] = Separator) then //บรรทัดปัจจุบันเป็นเส้น
    begin
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10;
      NumList.SelText := '[ปักกลางบน]'+#13#10;
      NumList.SelText := #13#10+Separator;
      NumList.SelStart:= NumList.SelStart-Length(Separator)-1;
    end
    else
    if (NumList.Lines[LineNumber-1] = Separator1) Or (NumList.Lines[LineNumber-1] = Separator) then //บรรทัดก่อนหน้าเป็นเส้น
    begin
      if (Pos(']',NumList.Lines[LineNumber]) > 0) then //พบเครื่องหมาย ] ในบรรทัด
      begin
        NumList.Lines[LineNumber] := '[ปักกลางบน]';
        if (trim(NumList.Lines[LineNumber+1]) = '') then
          MoveCursorToLineStart(NumList,LineNumber+1);
      end
      else
      begin
        GoToEndOfCurrentLine(NumList);
        NumList.SelText := #13#10;
        NumList.SelText := '[ปักกลางบน]';
      end;
    end
    else
    begin //บรรทัดปัจจุบันไม่ว่าง และไม่เป็นเส้น และบรรทัดก่อนหน้าก็ไม่เป็นเส้น และไม่พบเครื่องหมาย ]
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10+Separator+#13#10;
      NumList.SelText := '[ปักกลางบน]';
      NumList.SelText := #13#10;
    end;
  end
  else
  begin //กรณีบรรทัดปัจจุบันว่าง
    NumList.SelText := Separator+#13#10;
    NumList.SelText := '[ปักกลางบน]';
    NumList.SelText := #13#10;
  end;
  ChkTod.Checked := false;
  NumList.SetFocus;
end;

procedure TfrmInputText.RightUpBtnClick(Sender: TObject);
Var LineNumber: Integer;
    Separator,Separator1,NumType: String;
begin
  Separator1 := '################';
  Separator := '<----------------------------->';
  LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
  if NumList.Lines[LineNumber] <> '' then //บรรทัดปัจจุบันไม่ว่าง
  begin
    if (NumList.Lines[LineNumber] = Separator1) Or (NumList.Lines[LineNumber] = Separator) then //บรรทัดปัจจุบันเป็นเส้น
    begin
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10;
      NumList.SelText := '[ปักหลังบน]'+#13#10;
      NumList.SelText := #13#10+Separator;
      NumList.SelStart:= NumList.SelStart-Length(Separator)-1;
    end
    else
    if (NumList.Lines[LineNumber-1] = Separator1) Or (NumList.Lines[LineNumber-1] = Separator) then //บรรทัดก่อนหน้าเป็นเส้น
    begin
      if (Pos(']',NumList.Lines[LineNumber]) > 0) then //พบเครื่องหมาย ] ในบรรทัด
      begin
        NumList.Lines[LineNumber] := '[ปักหลังบน]';
        if (trim(NumList.Lines[LineNumber+1]) = '') then
          MoveCursorToLineStart(NumList,LineNumber+1);
      end
      else
      begin
        GoToEndOfCurrentLine(NumList);
        NumList.SelText := #13#10;
        NumList.SelText := '[ปักหลังบน]';
      end;
    end
    else
    begin //บรรทัดปัจจุบันไม่ว่าง และไม่เป็นเส้น และบรรทัดก่อนหน้าก็ไม่เป็นเส้น และไม่พบเครื่องหมาย ]
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10+Separator+#13#10;
      NumList.SelText := '[ปักหลังบน]';
      NumList.SelText := #13#10;
    end;
  end
  else
  begin //กรณีบรรทัดปัจจุบันว่าง
    NumList.SelText := Separator+#13#10;
    NumList.SelText := '[ปักหลังบน]';
    NumList.SelText := #13#10;
  end;
  ChkTod.Checked := false;
  NumList.SetFocus;
end;

procedure TfrmInputText.RunDwnBtnClick(Sender: TObject);
Var LineNumber: Integer;
    Separator,Separator1,NumType: String;
begin
  Separator1 := '################';
  Separator := '<----------------------------->';
  LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
  if NumList.Lines[LineNumber] <> '' then //บรรทัดปัจจุบันไม่ว่าง
  begin
    if (NumList.Lines[LineNumber] = Separator1) Or (NumList.Lines[LineNumber] = Separator) then //บรรทัดปัจจุบันเป็นเส้น
    begin
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10;
      NumList.SelText := '[วิ่งบน]'+#13#10;
      NumList.SelText := #13#10+Separator;
      NumList.SelStart:= NumList.SelStart-Length(Separator)-1;
    end
    else
    if (NumList.Lines[LineNumber-1] = Separator1) Or (NumList.Lines[LineNumber-1] = Separator) then //บรรทัดก่อนหน้าเป็นเส้น
    begin
      if (Pos(']',NumList.Lines[LineNumber]) > 0) then //พบเครื่องหมาย ] ในบรรทัด
      begin
        NumList.Lines[LineNumber] := '[วิ่งล่าง]';
        if (trim(NumList.Lines[LineNumber+1]) = '') then
          MoveCursorToLineStart(NumList,LineNumber+1);
      end
      else
      begin
        GoToEndOfCurrentLine(NumList);
        NumList.SelText := #13#10;
        NumList.SelText := '[วิ่งล่าง]';
      end;
    end
    else
    begin //บรรทัดปัจจุบันไม่ว่าง และไม่เป็นเส้น และบรรทัดก่อนหน้าก็ไม่เป็นเส้น และไม่พบเครื่องหมาย ]
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10+Separator+#13#10;
      NumList.SelText := '[วิ่งล่าง]';
      NumList.SelText := #13#10;
    end;
  end
  else
  begin //กรณีบรรทัดปัจจุบันว่าง
    NumList.SelText := Separator+#13#10;
    NumList.SelText := '[วิ่งล่าง]';
    NumList.SelText := #13#10;
  end;
  ChkTod.Checked := false;
  NumList.SetFocus;
end;

procedure TfrmInputText.LeftDwnBtnClick(Sender: TObject);
Var LineNumber: Integer;
    Separator,Separator1,NumType: String;
begin
  Separator1 := '################';
  Separator := '<----------------------------->';
  LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
  if NumList.Lines[LineNumber] <> '' then //บรรทัดปัจจุบันไม่ว่าง
  begin
    if (NumList.Lines[LineNumber] = Separator1) Or (NumList.Lines[LineNumber] = Separator) then //บรรทัดปัจจุบันเป็นเส้น
    begin
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10;
      NumList.SelText := '[ปักหน้าล่าง]'+#13#10;
      NumList.SelText := #13#10+Separator;
      NumList.SelStart:= NumList.SelStart-Length(Separator)-1;
    end
    else
    if (NumList.Lines[LineNumber-1] = Separator1) Or (NumList.Lines[LineNumber-1] = Separator) then //บรรทัดก่อนหน้าเป็นเส้น
    begin
      if (Pos(']',NumList.Lines[LineNumber]) > 0) then //พบเครื่องหมาย ] ในบรรทัด
      begin
        NumList.Lines[LineNumber] := '[ปักหน้าล่าง]';
        if (trim(NumList.Lines[LineNumber+1]) = '') then
          MoveCursorToLineStart(NumList,LineNumber+1);
      end
      else
      begin
        GoToEndOfCurrentLine(NumList);
        NumList.SelText := #13#10;
        NumList.SelText := '[ปักหน้าล่าง]';
      end;
    end
    else
    begin //บรรทัดปัจจุบันไม่ว่าง และไม่เป็นเส้น และบรรทัดก่อนหน้าก็ไม่เป็นเส้น และไม่พบเครื่องหมาย ]
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10+Separator+#13#10;
      NumList.SelText := '[ปักหน้าล่าง]';
      NumList.SelText := #13#10;
    end;
  end
  else
  begin //กรณีบรรทัดปัจจุบันว่าง
    NumList.SelText := Separator+#13#10;
    NumList.SelText := '[ปักหน้าล่าง]';
    NumList.SelText := #13#10;
  end;
  ChkTod.Checked := false;
  NumList.SetFocus;
end;

procedure TfrmInputText.RightDwnBtnClick(Sender: TObject);
Var LineNumber: Integer;
    Separator,Separator1,NumType: String;
begin
  Separator1 := '################';
  Separator := '<----------------------------->';
  LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
  if NumList.Lines[LineNumber] <> '' then //บรรทัดปัจจุบันไม่ว่าง
  begin
    if (NumList.Lines[LineNumber] = Separator1) Or (NumList.Lines[LineNumber] = Separator) then //บรรทัดปัจจุบันเป็นเส้น
    begin
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10;
      NumList.SelText := '[ปักหลังล่าง]'+#13#10;
      NumList.SelText := #13#10+Separator;
      NumList.SelStart:= NumList.SelStart-Length(Separator)-1;
    end
    else
    if (NumList.Lines[LineNumber-1] = Separator1) Or (NumList.Lines[LineNumber-1] = Separator) then //บรรทัดก่อนหน้าเป็นเส้น
    begin
      if (Pos(']',NumList.Lines[LineNumber]) > 0) then //พบเครื่องหมาย ] ในบรรทัด
      begin
        NumList.Lines[LineNumber] := '[ปักหลังล่าง]';
        if (trim(NumList.Lines[LineNumber+1]) = '') then
          MoveCursorToLineStart(NumList,LineNumber+1);
      end
      else
      begin
        GoToEndOfCurrentLine(NumList);
        NumList.SelText := #13#10;
        NumList.SelText := '[ปักหลังล่าง]';
      end;
    end
    else
    begin //บรรทัดปัจจุบันไม่ว่าง และไม่เป็นเส้น และบรรทัดก่อนหน้าก็ไม่เป็นเส้น และไม่พบเครื่องหมาย ]
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10+Separator+#13#10;
      NumList.SelText := '[ปักหลังล่าง]';
      NumList.SelText := #13#10;
    end;
  end
  else
  begin //กรณีบรรทัดปัจจุบันว่าง
    NumList.SelText := Separator+#13#10;
    NumList.SelText := '[ปักหลังล่าง]';
    NumList.SelText := #13#10;
  end;
  ChkTod.Checked := false;
  NumList.SetFocus;
end;

procedure TfrmInputText.Up2BtnClick(Sender: TObject);
Var LineNumber: Integer;
    Separator,Separator1,NumType: String;
begin
  Separator1 := '################';
  Separator := '<----------------------------->';
  LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
  NumType := '[2 ตัวบน]';
  if NumList.Lines[LineNumber] <> '' then //บรรทัดปัจจุบันไม่ว่าง
  begin
    if (NumList.Lines[LineNumber] = Separator1) Or (NumList.Lines[LineNumber] = Separator) then //บรรทัดปัจจุบันเป็นเส้น
    begin
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10;
      NumList.SelText := NumType+#13#10;
      NumList.SelText := #13#10+Separator;
      NumList.SelStart:= NumList.SelStart-Length(Separator)-1;
    end
    else
    if (NumList.Lines[LineNumber-1] = Separator1) Or (NumList.Lines[LineNumber-1] = Separator) then //บรรทัดก่อนหน้าเป็นเส้น
    begin
      if (Pos(']',NumList.Lines[LineNumber]) > 0) then //พบเครื่องหมาย ] ในบรรทัด
      begin
        NumList.Lines[LineNumber] := NumType;
        if (trim(NumList.Lines[LineNumber+1]) = '') then
          MoveCursorToLineStart(NumList,LineNumber+1);
      end
      else
      begin
        GoToEndOfCurrentLine(NumList);
        NumList.SelText := #13#10;
        NumList.SelText := NumType;
      end;
    end
    else
    begin //บรรทัดปัจจุบันไม่ว่าง และไม่เป็นเส้น และบรรทัดก่อนหน้าก็ไม่เป็นเส้น และไม่พบเครื่องหมาย ]
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10+Separator+#13#10;
      NumList.SelText := NumType;
      NumList.SelText := #13#10;
    end;
  end
  else
  begin //กรณีบรรทัดปัจจุบันว่าง
    NumList.SelText := Separator+#13#10;
    NumList.SelText := NumType;
    NumList.SelText := #13#10;
  end;
  NumList.SetFocus;
end;

procedure TfrmInputText.Mee2BtnClick(Sender: TObject);
Var LineNumber: Integer;
    Separator,Separator1,NumType: String;
begin
  Separator1 := '################';
  Separator := '<----------------------------->';
  LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
  NumType := '[2 ตัวมี]';
  if NumList.Lines[LineNumber] <> '' then //บรรทัดปัจจุบันไม่ว่าง
  begin
    if (NumList.Lines[LineNumber] = Separator1) Or (NumList.Lines[LineNumber] = Separator) then //บรรทัดปัจจุบันเป็นเส้น
    begin
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10;
      NumList.SelText := NumType+#13#10;
      NumList.SelText := #13#10+Separator;
      NumList.SelStart:= NumList.SelStart-Length(Separator)-1;
    end
    else
    if (NumList.Lines[LineNumber-1] = Separator1) Or (NumList.Lines[LineNumber-1] = Separator) then //บรรทัดก่อนหน้าเป็นเส้น
    begin
      if (Pos(']',NumList.Lines[LineNumber]) > 0) then //พบเครื่องหมาย ] ในบรรทัด
      begin
        NumList.Lines[LineNumber] := NumType;
        if (trim(NumList.Lines[LineNumber+1]) = '') then
          MoveCursorToLineStart(NumList,LineNumber+1);
      end
      else
      begin
        GoToEndOfCurrentLine(NumList);
        NumList.SelText := #13#10;
        NumList.SelText := NumType;
      end;
    end
    else
    begin //บรรทัดปัจจุบันไม่ว่าง และไม่เป็นเส้น และบรรทัดก่อนหน้าก็ไม่เป็นเส้น และไม่พบเครื่องหมาย ]
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10+Separator+#13#10;
      NumList.SelText := NumType;
      NumList.SelText := #13#10;
    end;
  end
  else
  begin //กรณีบรรทัดปัจจุบันว่าง
    NumList.SelText := Separator+#13#10;
    NumList.SelText := NumType;
    NumList.SelText := #13#10;
  end;
  ChkTod.Checked := true;
  NumList.SetFocus;
end;

procedure TfrmInputText.Left2BtnClick(Sender: TObject);
Var LineNumber: Integer;
    Separator,Separator1,NumType: String;
begin
  Separator1 := '################';
  Separator := '<----------------------------->';
  LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
  NumType := '[2 ตัวหน้าบน]';
  if NumList.Lines[LineNumber] <> '' then //บรรทัดปัจจุบันไม่ว่าง
  begin
    if (NumList.Lines[LineNumber] = Separator1) Or (NumList.Lines[LineNumber] = Separator) then //บรรทัดปัจจุบันเป็นเส้น
    begin
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10;
      NumList.SelText := NumType+#13#10;
      NumList.SelText := #13#10+Separator;
      NumList.SelStart:= NumList.SelStart-Length(Separator)-1;
    end
    else
    if (NumList.Lines[LineNumber-1] = Separator1) Or (NumList.Lines[LineNumber-1] = Separator) then //บรรทัดก่อนหน้าเป็นเส้น
    begin
      if (Pos(']',NumList.Lines[LineNumber]) > 0) then //พบเครื่องหมาย ] ในบรรทัด
      begin
        NumList.Lines[LineNumber] := NumType;
        if (trim(NumList.Lines[LineNumber+1]) = '') then
          MoveCursorToLineStart(NumList,LineNumber+1);
      end
      else
      begin
        GoToEndOfCurrentLine(NumList);
        NumList.SelText := #13#10;
        NumList.SelText := NumType;
      end;
    end
    else
    begin //บรรทัดปัจจุบันไม่ว่าง และไม่เป็นเส้น และบรรทัดก่อนหน้าก็ไม่เป็นเส้น และไม่พบเครื่องหมาย ]
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10+Separator+#13#10;
      NumList.SelText := NumType;
      NumList.SelText := #13#10;
    end;
  end
  else
  begin //กรณีบรรทัดปัจจุบันว่าง
    NumList.SelText := Separator+#13#10;
    NumList.SelText := NumType;
    NumList.SelText := #13#10;
  end;
  NumList.SetFocus;
end;

procedure TfrmInputText.Tang2BtnClick(Sender: TObject);
Var LineNumber: Integer;
    Separator,Separator1,NumType: String;
begin
  Separator1 := '################';
  Separator := '<----------------------------->';
  LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
  NumType := '[2 ตัวถ่างบน]';
  if NumList.Lines[LineNumber] <> '' then //บรรทัดปัจจุบันไม่ว่าง
  begin
    if (NumList.Lines[LineNumber] = Separator1) Or (NumList.Lines[LineNumber] = Separator) then //บรรทัดปัจจุบันเป็นเส้น
    begin
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10;
      NumList.SelText := NumType+#13#10;
      NumList.SelText := #13#10+Separator;
      NumList.SelStart:= NumList.SelStart-Length(Separator)-1;
    end
    else
    if (NumList.Lines[LineNumber-1] = Separator1) Or (NumList.Lines[LineNumber-1] = Separator) then //บรรทัดก่อนหน้าเป็นเส้น
    begin
      if (Pos(']',NumList.Lines[LineNumber]) > 0) then //พบเครื่องหมาย ] ในบรรทัด
      begin
        NumList.Lines[LineNumber] := NumType;
        if (trim(NumList.Lines[LineNumber+1]) = '') then
          MoveCursorToLineStart(NumList,LineNumber+1);
      end
      else
      begin
        GoToEndOfCurrentLine(NumList);
        NumList.SelText := #13#10;
        NumList.SelText := NumType;
      end;
    end
    else
    begin //บรรทัดปัจจุบันไม่ว่าง และไม่เป็นเส้น และบรรทัดก่อนหน้าก็ไม่เป็นเส้น และไม่พบเครื่องหมาย ]
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10+Separator+#13#10;
      NumList.SelText := NumType;
      NumList.SelText := #13#10;
    end;
  end
  else
  begin //กรณีบรรทัดปัจจุบันว่าง
    NumList.SelText := Separator+#13#10;
    NumList.SelText := NumType;
    NumList.SelText := #13#10;
  end;
  NumList.SetFocus;
end;

procedure TfrmInputText.Dwn2BtnClick(Sender: TObject);
Var LineNumber: Integer;
    Separator,Separator1,NumType: String;
begin
  Separator1 := '################';
  Separator := '<----------------------------->';
  LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
  NumType := '[2 ตัวล่าง]';
  if NumList.Lines[LineNumber] <> '' then //บรรทัดปัจจุบันไม่ว่าง
  begin
    if (NumList.Lines[LineNumber] = Separator1) Or (NumList.Lines[LineNumber] = Separator) then //บรรทัดปัจจุบันเป็นเส้น
    begin
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10;
      NumList.SelText := NumType+#13#10;
      NumList.SelText := #13#10+Separator;
      NumList.SelStart:= NumList.SelStart-Length(Separator)-1;
    end
    else
    if (NumList.Lines[LineNumber-1] = Separator1) Or (NumList.Lines[LineNumber-1] = Separator) then //บรรทัดก่อนหน้าเป็นเส้น
    begin
      if (Pos(']',NumList.Lines[LineNumber]) > 0) then //พบเครื่องหมาย ] ในบรรทัด
      begin
        NumList.Lines[LineNumber] := NumType;
        if (trim(NumList.Lines[LineNumber+1]) = '') then
          MoveCursorToLineStart(NumList,LineNumber+1);
      end
      else
      begin
        GoToEndOfCurrentLine(NumList);
        NumList.SelText := #13#10;
        NumList.SelText := NumType;
      end;
    end
    else
    begin //บรรทัดปัจจุบันไม่ว่าง และไม่เป็นเส้น และบรรทัดก่อนหน้าก็ไม่เป็นเส้น และไม่พบเครื่องหมาย ]
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10+Separator+#13#10;
      NumList.SelText := NumType;
      NumList.SelText := #13#10;
    end;
  end
  else
  begin //กรณีบรรทัดปัจจุบันว่าง
    NumList.SelText := Separator+#13#10;
    NumList.SelText := NumType;
    NumList.SelText := #13#10;
  end;
  NumList.SetFocus;
end;

procedure TfrmInputText.Up3TodBtnClick(Sender: TObject);
Var LineNumber: Integer;
    Separator,Separator1,NumType: String;
begin
  Separator1 := '################';
  Separator := '<----------------------------->';
  LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
  NumType := '[3 ตัวโต๊ด]';
  if NumList.Lines[LineNumber] <> '' then //บรรทัดปัจจุบันไม่ว่าง
  begin
    if (NumList.Lines[LineNumber] = Separator1) Or (NumList.Lines[LineNumber] = Separator) then //บรรทัดปัจจุบันเป็นเส้น
    begin
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10;
      NumList.SelText := NumType+#13#10;
      NumList.SelText := #13#10+Separator;
      NumList.SelStart:= NumList.SelStart-Length(Separator)-1;
    end
    else
    if (NumList.Lines[LineNumber-1] = Separator1) Or (NumList.Lines[LineNumber-1] = Separator) then //บรรทัดก่อนหน้าเป็นเส้น
    begin
      if (Pos(']',NumList.Lines[LineNumber]) > 0) then //พบเครื่องหมาย ] ในบรรทัด
      begin
        NumList.Lines[LineNumber] := NumType;
        if (trim(NumList.Lines[LineNumber+1]) = '') then
          MoveCursorToLineStart(NumList,LineNumber+1);
      end
      else
      begin
        GoToEndOfCurrentLine(NumList);
        NumList.SelText := #13#10;
        NumList.SelText := NumType;
      end;
    end
    else
    begin //บรรทัดปัจจุบันไม่ว่าง และไม่เป็นเส้น และบรรทัดก่อนหน้าก็ไม่เป็นเส้น และไม่พบเครื่องหมาย ]
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10+Separator+#13#10;
      NumList.SelText := NumType;
      NumList.SelText := #13#10;
    end;
  end
  else
  begin //กรณีบรรทัดปัจจุบันว่าง
    NumList.SelText := Separator+#13#10;
    NumList.SelText := NumType;
    NumList.SelText := #13#10;
  end;
  ChkTod.Checked := true;
  NumList.SetFocus;
end;

procedure TfrmInputText.Up3DwnBtnClick(Sender: TObject);
Var LineNumber: Integer;
    Separator,Separator1,NumType: String;
begin
  Separator1 := '################';
  Separator := '<----------------------------->';
  LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
  NumType := '[3 ตัวล่าง]';
  if NumList.Lines[LineNumber] <> '' then //บรรทัดปัจจุบันไม่ว่าง
  begin
    if (NumList.Lines[LineNumber] = Separator1) Or (NumList.Lines[LineNumber] = Separator) then //บรรทัดปัจจุบันเป็นเส้น
    begin
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10;
      NumList.SelText := NumType+#13#10;
      NumList.SelText := #13#10+Separator;
      NumList.SelStart:= NumList.SelStart-Length(Separator)-1;
    end
    else
    if (NumList.Lines[LineNumber-1] = Separator1) Or (NumList.Lines[LineNumber-1] = Separator) then //บรรทัดก่อนหน้าเป็นเส้น
    begin
      if (Pos(']',NumList.Lines[LineNumber]) > 0) then //พบเครื่องหมาย ] ในบรรทัด
      begin
        NumList.Lines[LineNumber] := NumType;
        if (trim(NumList.Lines[LineNumber+1]) = '') then
          MoveCursorToLineStart(NumList,LineNumber+1);
      end
      else
      begin
        GoToEndOfCurrentLine(NumList);
        NumList.SelText := #13#10;
        NumList.SelText := NumType;
      end;
    end
    else
    begin //บรรทัดปัจจุบันไม่ว่าง และไม่เป็นเส้น และบรรทัดก่อนหน้าก็ไม่เป็นเส้น และไม่พบเครื่องหมาย ]
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10+Separator+#13#10;
      NumList.SelText := NumType;
      NumList.SelText := #13#10;
    end;
  end
  else
  begin //กรณีบรรทัดปัจจุบันว่าง
    NumList.SelText := Separator+#13#10;
    NumList.SelText := NumType;
    NumList.SelText := #13#10;
  end;
  ChkTod.Checked := true;
  NumList.SetFocus;
end;

procedure TfrmInputText.Up4BtnClick(Sender: TObject);
Var LineNumber: Integer;
    Separator,Separator1,NumType: String;
begin
  Separator1 := '################';
  Separator := '<----------------------------->';
  LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
  NumType := '[4 ตัวบน]';
  if NumList.Lines[LineNumber] <> '' then //บรรทัดปัจจุบันไม่ว่าง
  begin
    if (NumList.Lines[LineNumber] = Separator1) Or (NumList.Lines[LineNumber] = Separator) then //บรรทัดปัจจุบันเป็นเส้น
    begin
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10;
      NumList.SelText := NumType+#13#10;
      NumList.SelText := #13#10+Separator;
      NumList.SelStart:= NumList.SelStart-Length(Separator)-1;
    end
    else
    if (NumList.Lines[LineNumber-1] = Separator1) Or (NumList.Lines[LineNumber-1] = Separator) then //บรรทัดก่อนหน้าเป็นเส้น
    begin
      if (Pos(']',NumList.Lines[LineNumber]) > 0) then //พบเครื่องหมาย ] ในบรรทัด
      begin
        NumList.Lines[LineNumber] := NumType;
        if (trim(NumList.Lines[LineNumber+1]) = '') then
          MoveCursorToLineStart(NumList,LineNumber+1);
      end
      else
      begin
        GoToEndOfCurrentLine(NumList);
        NumList.SelText := #13#10;
        NumList.SelText := NumType;
      end;
    end
    else
    begin //บรรทัดปัจจุบันไม่ว่าง และไม่เป็นเส้น และบรรทัดก่อนหน้าก็ไม่เป็นเส้น และไม่พบเครื่องหมาย ]
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10+Separator+#13#10;
      NumList.SelText := NumType;
      NumList.SelText := #13#10;
    end;
  end
  else
  begin //กรณีบรรทัดปัจจุบันว่าง
    NumList.SelText := Separator+#13#10;
    NumList.SelText := NumType;
    NumList.SelText := #13#10;
  end;
  ChkTod.Checked := true;
  NumList.SetFocus;
end;

procedure TfrmInputText.Float4BtnClick(Sender: TObject);
Var LineNumber: Integer;
    Separator,Separator1,NumType: String;
begin
  Separator1 := '################';
  Separator := '<----------------------------->';
  LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
  NumType := '[4 ตัวลอยแพ]';
  if NumList.Lines[LineNumber] <> '' then //บรรทัดปัจจุบันไม่ว่าง
  begin
    if (NumList.Lines[LineNumber] = Separator1) Or (NumList.Lines[LineNumber] = Separator) then //บรรทัดปัจจุบันเป็นเส้น
    begin
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10;
      NumList.SelText := NumType+#13#10;
      NumList.SelText := #13#10+Separator;
      NumList.SelStart:= NumList.SelStart-Length(Separator)-1;
    end
    else
    if (NumList.Lines[LineNumber-1] = Separator1) Or (NumList.Lines[LineNumber-1] = Separator) then //บรรทัดก่อนหน้าเป็นเส้น
    begin
      if (Pos(']',NumList.Lines[LineNumber]) > 0) then //พบเครื่องหมาย ] ในบรรทัด
      begin
        NumList.Lines[LineNumber] := NumType;
        if (trim(NumList.Lines[LineNumber+1]) = '') then
          MoveCursorToLineStart(NumList,LineNumber+1);
      end
      else
      begin
        GoToEndOfCurrentLine(NumList);
        NumList.SelText := #13#10;
        NumList.SelText := NumType;
      end;
    end
    else
    begin //บรรทัดปัจจุบันไม่ว่าง และไม่เป็นเส้น และบรรทัดก่อนหน้าก็ไม่เป็นเส้น และไม่พบเครื่องหมาย ]
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10+Separator+#13#10;
      NumList.SelText := NumType;
      NumList.SelText := #13#10;
    end;
  end
  else
  begin //กรณีบรรทัดปัจจุบันว่าง
    NumList.SelText := Separator+#13#10;
    NumList.SelText := NumType;
    NumList.SelText := #13#10;
  end;
  ChkTod.Checked := true;
  NumList.SetFocus;
end;

procedure TfrmInputText.Up5BtnClick(Sender: TObject);
Var LineNumber: Integer;
    Separator,Separator1,NumType: String;
begin
  Separator1 := '################';
  Separator := '<----------------------------->';
  LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
  NumType := '[5 ตัวบน]';
  if NumList.Lines[LineNumber] <> '' then //บรรทัดปัจจุบันไม่ว่าง
  begin
    if (NumList.Lines[LineNumber] = Separator1) Or (NumList.Lines[LineNumber] = Separator) then //บรรทัดปัจจุบันเป็นเส้น
    begin
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10;
      NumList.SelText := NumType+#13#10;
      NumList.SelText := #13#10+Separator;
      NumList.SelStart:= NumList.SelStart-Length(Separator)-1;
    end
    else
    if (NumList.Lines[LineNumber-1] = Separator1) Or (NumList.Lines[LineNumber-1] = Separator) then //บรรทัดก่อนหน้าเป็นเส้น
    begin
      if (Pos(']',NumList.Lines[LineNumber]) > 0) then //พบเครื่องหมาย ] ในบรรทัด
      begin
        NumList.Lines[LineNumber] := NumType;
        if (trim(NumList.Lines[LineNumber+1]) = '') then
          MoveCursorToLineStart(NumList,LineNumber+1);
      end
      else
      begin
        GoToEndOfCurrentLine(NumList);
        NumList.SelText := #13#10;
        NumList.SelText := NumType;
      end;
    end
    else
    begin //บรรทัดปัจจุบันไม่ว่าง และไม่เป็นเส้น และบรรทัดก่อนหน้าก็ไม่เป็นเส้น และไม่พบเครื่องหมาย ]
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10+Separator+#13#10;
      NumList.SelText := NumType;
      NumList.SelText := #13#10;
    end;
  end
  else
  begin //กรณีบรรทัดปัจจุบันว่าง
    NumList.SelText := Separator+#13#10;
    NumList.SelText := NumType;
    NumList.SelText := #13#10;
  end;
  ChkTod.Checked := true;
  NumList.SetFocus;
end;

procedure TfrmInputText.Float5BtnClick(Sender: TObject);
Var LineNumber: Integer;
    Separator,Separator1,NumType: String;
begin
  Separator1 := '################';
  Separator := '<----------------------------->';
  LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
  NumType := '[5 ตัวลอยแพ]';
  if NumList.Lines[LineNumber] <> '' then //บรรทัดปัจจุบันไม่ว่าง
  begin
    if (NumList.Lines[LineNumber] = Separator1) Or (NumList.Lines[LineNumber] = Separator) then //บรรทัดปัจจุบันเป็นเส้น
    begin
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10;
      NumList.SelText := NumType+#13#10;
      NumList.SelText := #13#10+Separator;
      NumList.SelStart:= NumList.SelStart-Length(Separator)-1;
    end
    else
    if (NumList.Lines[LineNumber-1] = Separator1) Or (NumList.Lines[LineNumber-1] = Separator) then //บรรทัดก่อนหน้าเป็นเส้น
    begin
      if (Pos(']',NumList.Lines[LineNumber]) > 0) then //พบเครื่องหมาย ] ในบรรทัด
      begin
        NumList.Lines[LineNumber] := NumType;
        if (trim(NumList.Lines[LineNumber+1]) = '') then
          MoveCursorToLineStart(NumList,LineNumber+1);
      end
      else
      begin
        GoToEndOfCurrentLine(NumList);
        NumList.SelText := #13#10;
        NumList.SelText := NumType;
      end;
    end
    else
    begin //บรรทัดปัจจุบันไม่ว่าง และไม่เป็นเส้น และบรรทัดก่อนหน้าก็ไม่เป็นเส้น และไม่พบเครื่องหมาย ]
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10+Separator+#13#10;
      NumList.SelText := NumType;
      NumList.SelText := #13#10;
    end;
  end
  else
  begin //กรณีบรรทัดปัจจุบันว่าง
    NumList.SelText := Separator+#13#10;
    NumList.SelText := NumType;
    NumList.SelText := #13#10;
  end;
  ChkTod.Checked := true;
  NumList.SetFocus;
end;

procedure TfrmInputText.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Shift = [ssCtrl]) and (Key = $53)) then // Ctrl+S บันทึกข้อมูล
  begin
    if BtnSaveImport.Enabled then
      BtnSaveImportClick(Sender);
    Key := 0;
  end;

  if ((Shift = [ssCtrl]) and (Key = $58)) then // Ctrl+X ตัดข้อมูลลงคลิปบอร์ด
  begin
    BtnCopyClick(Sender);
    Key := 0;
  end;

  if Key = VK_F4 then  // เปิดหน้าต่างเลือกลูกค้า
  begin
    edCustButtonClick(Sender); 
    Key := 0;
  end;

  //if Key = VK_ADD then //ปุ่ม+ เปิดหน้าต่างเลือกลูกค้า
  if Key = $6F then   //ปุ่ม / เปิดหน้าต่างเลือกลูกค้า
  begin
    Key := 0;
    edCustButtonClick(Sender);
  end;

  if Key = VK_SUBTRACT then //ปุ่ม- เปิดปิด ป้อนไม่เอาตัวกลับ
  begin
    Key := 0;
    ChkTod.Checked := Not ChkTod.Checked;
  end;

  if Key = VK_MULTIPLY then //ปุ่ม* เปิดปิด ป้อนสลับ
  begin
    Key := 0;
    ChkAlt.Checked := Not ChkAlt.Checked;
  end;

  if Key = VK_HOME then //ปุ่ม Home กลับมายังเล่มที่ 1
  begin
    Key := 0;
    EdBookNo.Value := 1;
  end;

  if Key = VK_PRIOR then //ปุ่ม PageUp เพิ่มเล่มที่ อีก 1
  begin
    Key := 0;
    EdBookNo.Value := EdBookNo.Value+1;
  end;

  if Key = VK_NEXT then //ปุ่ม PageUp ลดเล่มที่ ลง 1
  begin
    Key := 0;
    if edBookNo.Value > 1 then
    EdBookNo.Value := EdBookNo.Value-1;
  end;

  if Key = VK_ADD then //เปิดปิด ChkAddPercent
  begin
    // 2. ตรวจสอบว่ามีการกดปุ่ม Ctrl ค้างไว้หรือไม่
    if ssCtrl in Shift then
    begin
      ChkAddPercent.Checked := Not ChkAddPercent.Checked;
      //ChkLockMoney.Checked := Not ChkLockMoney.Checked;
      Key := 0;
    end
  end;

  if Key = VK_SPACE then //เปิดปิด Lock Money
  begin
    // 2. ตรวจสอบว่ามีการกดปุ่ม Ctrl ค้างไว้หรือไม่
    if ssCtrl in Shift then
    begin
      //ChkAddPercent.Checked := Not ChkAddPercent.Checked;
      ChkLockMoney.Checked := Not ChkLockMoney.Checked;
      Key := 0;
    end
  end;

  With PcNumType do
  begin
    //if (Shift = [ssAlt]) and (Key = VK_NUMPAD1) then
    if (ssAlt in Shift) and (Key = VK_NUMPAD1) then
    begin
      Key := 0;
      TabIndex := 0;
      LeftUpBtn.SetFocus;
    end;

    //if (Shift = [ssAlt]) and (Key = VK_NUMPAD2) then
    if (ssAlt in Shift) and (Key = VK_NUMPAD2) then
    begin
      Key := 0;
      TabIndex := 1;
      Left2Btn.SetFocus;
    end;

    //if (Shift = [ssAlt]) and (Key = VK_NUMPAD3) then
    if (ssAlt in Shift) and (Key = VK_NUMPAD3) then
    begin
      Key := 0;
      TabIndex := 2;
      Up3TodBtn.SetFocus;
    end;

    //if (Shift = [ssAlt]) and (Key = VK_NUMPAD4) then
    if (ssAlt in Shift) and (Key = VK_NUMPAD4) then
    begin
      Key := 0;
      TabIndex := 3;
      Up4Btn.SetFocus;
    end;

    //if (Shift = [ssAlt]) and (Key = VK_NUMPAD5) then
    if (ssAlt in Shift) and (Key = VK_NUMPAD5) then
    begin
      Key := 0;
      TabIndex := 4;
      Up5Btn.SetFocus;
    end;

  end;
end;

procedure TfrmInputText.ChkLockMoneyClick(Sender: TObject);
begin
  if ChkLockMoney.Checked then
    ChkTod.Checked := false;
end;

procedure TfrmInputText.ChkTodClick(Sender: TObject);
begin
  if ChkTod.Checked then
    ChkLockMoney.Checked := false;
end;

procedure TfrmInputText.ChkMovePanelClick(Sender: TObject);
begin
  if ChkMovePanel.Checked then
    Panel3.Align := alRight
  else
    Panel3.Align := alLeft;
end;

procedure TfrmInputText.BtnEditGridClick(Sender: TObject);
Var i: Integer;
    Txts: String;
    size: integer;
    St,txt,ClipbrdClear,Separator: string;
    Buffer : PChar;
    SCopy: Boolean;
    Heads: array[0..34] of String;
    ToTalNum: integer;
    txtLine: string;
    Rtxt: TRichEdit;
begin
  With frmPasteNumPrice,EditGrid do
  begin
    if Showmodal = mrOk then
    begin
      Case CbNumType.ItemIndex of
        0 : Txts := 'Top'+#13#10;
        1 : Txts := 'Down'+#13#10;
        2 : Txts := 'Float'+#13#10;
        3 : Txts := 'Top-Down'+#13#10;
      end;
      for i := 0 to EditGrid.RowCount-1 do
      begin
        if EditGrid[1,i] <> '' then
          Txts := Txts+EditGrid[0,i]+'='+EditGrid[1,i]+#13#10
        else
          Txts := Txts+EditGrid[0,i]+#13#10;
      end;

  //Rtxt := TRichEdit.Create(nil);
  //Rtxt.Visible := false;
  //Rtxt.Parent := Panel3;
  //Rtxt.Text := Txts;//Clipboard.AsText;
  //Rtxt.CutToClipboard;
  NumList.Enabled := false;
  IF Not(ChkClpBrdFilter.Checked) then
  begin
    NumList.Lines.Add('################');
    NumList.PasteFromClipboard;
    NumList.Lines.Add('<----------------------------->');

    TotalNum := 0;
    With NumLIst do
    begin
        for i := 0 to Lines.Count-1 do
        begin
           txtLine := Lines[i];
           if txtLine <> '' then
           begin
              if (Pos('=',txtLine) > 0) then
              begin
                TotalNum := TotalNum+1;
              end;
           end;
        end;
        lbTotalNum.Caption := IntToStr(TotalNum)+' รายการ';
    end;
    NumList.Enabled := true;
    ChkClpBrdFilter.Checked := true;
    exit;
  end;


  Heads[0]  := 'เธงเธดเนเธเธเธ'; //คำว่า วิ่งบน
  Heads[1]  := 'เธฅเธญเธขเนเธ'; //คำว่า ลอยแพ
  Heads[2]  := 'เธงเธดเนเธเธฅเนเธฒเธ'; //คำว่า วิ่งล่าง
  Heads[3]  := 'เธงเธดเนเธ'; //คำว่าวิ่ง
  Heads[4]  := 'เธเธ'; //คำว่า บน
  Heads[5]  := 'เธฅเนเธฒเธ'; //คำว่า ล่าง
  Heads[6]  := 'เธฅเธญเธข'; //คำว่าลอย
  Heads[7]  := 'เนเธ'; //คำว่าแพ
  Heads[8]  := 'เธเธนเธ“'; //คำว่าคูณ
  Heads[9]  := 'เธเธธเธ'; //คำว่าคุน
  Heads[10] := 'เธเธนเธ'; //คำว่าคูน
  Heads[11] := 'เธเธธเธ”'; //คำว่าชุด
  Heads[12] := '/เธเธธเธ”'; //คำว่า /ชุด
  Heads[13] := 'เน€เธ—เนเธฒเธเธฑเธ'; //คำว่า เท่ากับ
  Heads[14] := 'เนเธ•เนเธ”'; //คำว่า โต๊ด
  Heads[15] := 'ร—'; //คำว่า
  Heads[16] := '/'; //คำว่า
  Heads[17] := 'เธกเธต'; //คำว่ามี
  Heads[18] := 'เธเธฃเธฐ'; //คำว่า
  Heads[19] := 'เธ•เธน'; //คำว่า
  Heads[20] := ','; //คำว่า
  Heads[21] := '"'; //คำว่า
  Heads[22] := 'เธกเธตเธเธ'; //คำว่า มีบน
  Heads[23] := 'เธกเธตเธฅเนเธฒเธ'; //คำว่า มีล่าง
  Heads[24] := 'เธเธเธฅเนเธฒเธ'; //คำว่า บนล่าง
  Heads[25] := '.'; //คำว่า
  Heads[26] := '#'; //คำว่า
  Heads[27] := 'เธ,เธฅ'; //คำว่า บ,ล
  Heads[28] := 'เนเธ•เนเธ”'; //คำว่า โต้ด
  Heads[29] := 'เธ+เธฅ'; //คำว่า บ+ล
  Heads[30] := 'เธ-เธฅ'; //คำว่า บ-ล
  Heads[31] := 'เธเธ-เธฅเนเธฒเธ'; //คำว่า บน-ล่าง
  Heads[32] := '•เธเน'; //ไม่แน่ใจว่าคำว่าอะไร
  Heads[33] := 'เธเธฅเธฑเธ'; //คำว่ากลับ
  Heads[34] := '?'; // x ในภาษาไทย


  //ClipbrdClear  := Replace(Clipboard.AsText,'       ', ' ');
  //ClipbrdClear  := Replace(CClipbrdClear,'      ', ' ');
  //ClipbrdClear  := Replace(ClipbrdClear,'     ', ' ');
  //ClipbrdClear  := Replace(ClipbrdClear,'    ', ' ');
  //ClipbrdClear  := Replace(ClipbrdClear,'   ', ' ');
  //ClipbrdClear  := Replace(ClipbrdClear,'  ', ' ');
  //ClipbrdClear  := Replace(ClipbrdClear,' ', ' ');

  if ChkSetNum.Checked then
    //ClipbrdClear := GetPrFromSetNum(ClipbrdClear)
    //ClipbrdClear := GetNumFromClpBrd(Clipboard.AsText)
    //ClipbrdClear := GetNumFromClp(ClipbrdClear)
    //ClipbrdClear := GetNumFromCB(Clipboard.AsText)
    ClipbrdClear := GetNumFromLineApp(Txts)
  else
    ClipbrdClear  := Replace(Txts, 'x', '*');

  //Showmessage(ClipbrdClear);
  ClipbrdClear  := Replace(ClipbrdClear, '5 ตัวบน', '5 Top');
  ClipbrdClear  := Replace(ClipbrdClear, '4 ตัวบน', '4 Top');
  ClipbrdClear  := Replace(ClipbrdClear, '3 ตัวล่าง', '3 Down');
  ClipbrdClear  := Replace(ClipbrdClear, 'ปักหน้าบน', 'Left-Top');
  ClipbrdClear  := Replace(ClipbrdClear, '*หน้า', '');
  ClipbrdClear  := Replace(ClipbrdClear, '* หน้า', '');
  ClipbrdClear  := Replace(ClipbrdClear, 'หน้าบน', 'Left-Top');
  ClipbrdClear  := Replace(ClipbrdClear, 'ปักกลางบน', 'Center-Top');
  ClipbrdClear  := Replace(ClipbrdClear, 'กลางบน', 'Center-Top');
  ClipbrdClear  := Replace(ClipbrdClear, 'ปักหลังบน', 'Right-Top');
  ClipbrdClear  := Replace(ClipbrdClear, 'หลังบน', 'Right-Top');
  ClipbrdClear  := Replace(ClipbrdClear, 'ปักหน้าล่าง', 'Left-Down');
  ClipbrdClear  := Replace(ClipbrdClear, 'หน้าล่าง', 'Left-Down');
  ClipbrdClear  := Replace(ClipbrdClear, 'ปักหลังล่าง', 'Right-Down');
  ClipbrdClear  := Replace(ClipbrdClear, 'หลังล่าง', 'Right-Down');
  ClipbrdClear  := Replace(ClipbrdClear, 'ถ่างบน', 'Split-Top');
  ClipbrdClear  := Replace(ClipbrdClear, 'หน้า', 'Left-Top');
  ClipbrdClear  := Replace(ClipbrdClear, 'ตู', '');
  ClipbrdClear  := Replace(ClipbrdClear, 'ตุ', '');
  ClipbrdClear  := Replace(ClipbrdClear, 'ประตู', '');

  ClipbrdClear  := Replace(ClipbrdClear, Heads[24], ' Top-Down '); //Top-Down
  ClipbrdClear  := Replace(ClipbrdClear, Heads[27], ' Top-Down '); //Top-Down
  ClipbrdClear  := Replace(ClipbrdClear, Heads[29], ' Top-Down '); //Top-Down
  ClipbrdClear  := Replace(ClipbrdClear, Heads[30], ' Top-Down '); //Top-Down
  ClipbrdClear  := Replace(ClipbrdClear, Heads[31], ' Top-Down '); //Top-Down

  ClipbrdClear  := Replace(ClipbrdClear, Heads[0], ' Float ');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[1], ' Float ');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[2], ' FD '); // Float-Down
  ClipbrdClear  := Replace(ClipbrdClear, Heads[3], ' Float ');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[22], ' Float ');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[23], ' FD ');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[4], ' Top ');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[5], ' Down ');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[6], ' Float ');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[7], ' Float ');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[8], '*');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[9], '*');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[10], '*');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[11], '');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[12], '*');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[13], '=');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[14], '*');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[28], '*');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[15], '*');
  //ClipbrdClear  := Replace(ClipbrdClear, Heads[16], '*');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[17], ' Float ');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[18], '');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[19], '');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[20], '');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[21], '');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[32], '');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[33], '*');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[34], '*');
  //ClipbrdClear  := Replace(ClipbrdClear, Heads[25], ' ');
  ClipbrdClear  := Replace(ClipbrdClear, Heads[26], ' ');

  ClipbrdClear  := Replace(ClipbrdClear, '**', '*');
  ClipbrdClear  := Replace(ClipbrdClear, 'กลับ', '*');
  ClipbrdClear  := Replace(ClipbrdClear, 'วิ่งบน', 'Float ');
  ClipbrdClear  := Replace(ClipbrdClear, 'ลอยแพ', 'Float ');
  ClipbrdClear  := Replace(ClipbrdClear, 'มี', 'Float ');
  ClipbrdClear  := Replace(ClipbrdClear, 'วิ่งล่าง', 'FD ');
  ClipbrdClear  := Replace(ClipbrdClear, 'วิ่ง', 'Float ');
  ClipbrdClear  := Replace(ClipbrdClear, 'บน', 'Top ');
  ClipbrdClear  := Replace(ClipbrdClear, 'ล่าง', 'Down ');
  ClipbrdClear  := Replace(ClipbrdClear, 'ลอย', 'Float ');
  ClipbrdClear  := Replace(ClipbrdClear, 'แพ', 'Float ');
  ClipbrdClear  := Replace(ClipbrdClear, 'คูณ', '*');
  ClipbrdClear  := Replace(ClipbrdClear, 'คุณ', '*');
  ClipbrdClear  := Replace(ClipbrdClear, 'คูน', '*');
  ClipbrdClear  := Replace(ClipbrdClear, 'ชุด', '');
  ClipbrdClear  := Replace(ClipbrdClear, 'เท่ากับ', '=');

  if (Pos('3 ตัวโต๊ด',ClipbrdClear) = 0) then
    ClipbrdClear  := Replace(ClipbrdClear, 'โต๊ด', '*')
  else
    ClipbrdClear  := Replace(ClipbrdClear, '3 ตัวโต๊ด', '3 Float');

  ClipbrdClear  := Replace(ClipbrdClear, 'มี', 'Float ');
  ClipbrdClear  := Replace(ClipbrdClear, 'มีบน', 'Float ');
  ClipbrdClear  := Replace(ClipbrdClear, 'มีล่าง', 'FD ');
  ClipbrdClear  := Replace(ClipbrdClear, 'บนล่าง', 'Top-Down ');
  ClipbrdClear  := Replace(ClipbrdClear, 'บน-ล่าง', 'Top-Down ');
  ClipbrdClear  := Replace(ClipbrdClear, 'บ,ล', 'Top-Down ');
  ClipbrdClear  := Replace(ClipbrdClear, 'บ-ล', 'Top-Down ');
  ClipbrdClear  := Replace(ClipbrdClear, 'บ+ล', 'Top-Down ');

  eng.Text := ClipbrdClear;
  if Trim(eng.Text) <> '' then
  begin
      Size := 0;
      try
        st := '';
        With eng do
        begin
          size := SelLength;
          if size < 1 then
          begin
               selectall;
               size := Length(text);
          end;
          inc(size);//เพิ่มขนาดห้องเพื่อเก็บ Null-Terminate String (#0)
          GetMem(Buffer, Size);
          GetSelTextBuf(Buffer,Size);
          Txt := StrPas(Buffer);
          SelLength := 0;
          try
            //Showmessage(Txt);
            //ReadWord(TrimRight(txt)+'...'+#13#10+'.');
            ReadWord(TrimRight(txt)+#13#10);
          except
            Showmessage('รูปแบบข้อความที่วางจากคลิปบอร์ดบางรายการไม่ถูกต้อง');
          end;
        end;
      finally
        FreeMem(Buffer,Size);
        eng.Clear;
      end;
      Clear;
      RowCount := 1;
      Col := 0;
      Row := 0;
  end
  else
  begin
    ShowMessage('ข้อมูลในคลิปบอร์ดไม่ถูกต้อง');
    NumList.Enabled := true;
    NumList.SetFocus;
    abort;
  end;

  TotalNum := 0;
  With NumLIst do
  begin
      for i := 0 to Lines.Count-1 do
      begin
         txtLine := Lines[i];
         if txtLine <> '' then
         begin
            if (Pos('=',txtLine) > 0) then
            begin
              TotalNum := TotalNum+1;
            end;
         end;
      end;
      lbTotalNum.Caption := IntToStr(TotalNum)+' รายการ';
  end;
  NumList.Enabled := true;
  NumList.SetFocus;


    end;
  end;
end;

procedure TfrmInputText.Btn3UpClick(Sender: TObject);
Var LineNumber: Integer;
    Separator,Separator1,NumType: String;
begin
  Separator1 := '################';
  Separator := '<----------------------------->';
  LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
  NumType := '[3 ตัวบน]';
  if NumList.Lines[LineNumber] <> '' then //บรรทัดปัจจุบันไม่ว่าง
  begin
    if (NumList.Lines[LineNumber] = Separator1) Or (NumList.Lines[LineNumber] = Separator) then //บรรทัดปัจจุบันเป็นเส้น
    begin
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10;
      NumList.SelText := NumType+#13#10;
      NumList.SelText := #13#10+Separator;
      NumList.SelStart:= NumList.SelStart-Length(Separator)-1;
    end
    else
    if (NumList.Lines[LineNumber-1] = Separator1) Or (NumList.Lines[LineNumber-1] = Separator) then //บรรทัดก่อนหน้าเป็นเส้น
    begin
      if (Pos(']',NumList.Lines[LineNumber]) > 0) then //พบเครื่องหมาย ] ในบรรทัด
      begin
        NumList.Lines[LineNumber] := NumType;
        if (trim(NumList.Lines[LineNumber+1]) = '') then
          MoveCursorToLineStart(NumList,LineNumber+1);
      end
      else
      begin
        GoToEndOfCurrentLine(NumList);
        NumList.SelText := #13#10;
        NumList.SelText := NumType;
      end;
    end
    else
    begin //บรรทัดปัจจุบันไม่ว่าง และไม่เป็นเส้น และบรรทัดก่อนหน้าก็ไม่เป็นเส้น และไม่พบเครื่องหมาย ]
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10+Separator+#13#10;
      NumList.SelText := NumType;
      NumList.SelText := #13#10;
    end;
  end
  else
  begin //กรณีบรรทัดปัจจุบันว่าง
    NumList.SelText := Separator+#13#10;
    NumList.SelText := NumType;
    NumList.SelText := #13#10;
  end;
  NumList.SetFocus;
end;

procedure TfrmInputText.Btn423Click(Sender: TObject);
Var LineNumber: Integer;
    Separator,Separator1,NumType: String;
begin
  Separator1 := '################';
  Separator := '<----------------------------->';
  LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
  NumType := '[3 ตัวบน]';
  if NumList.Lines[LineNumber] <> '' then //บรรทัดปัจจุบันไม่ว่าง
  begin
    if (NumList.Lines[LineNumber] = Separator1) Or (NumList.Lines[LineNumber] = Separator) then //บรรทัดปัจจุบันเป็นเส้น
    begin
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10;
      NumList.SelText := NumType+#13#10;
      NumList.SelText := #13#10+Separator;
      NumList.SelStart:= NumList.SelStart-Length(Separator)-1;
    end
    else
    if (NumList.Lines[LineNumber-1] = Separator1) Or (NumList.Lines[LineNumber-1] = Separator) then //บรรทัดก่อนหน้าเป็นเส้น
    begin
      if (Pos(']',NumList.Lines[LineNumber]) > 0) then //พบเครื่องหมาย ] ในบรรทัด
      begin
        NumList.Lines[LineNumber] := NumType;
        if (trim(NumList.Lines[LineNumber+1]) = '') then
          MoveCursorToLineStart(NumList,LineNumber+1);
      end
      else
      begin
        GoToEndOfCurrentLine(NumList);
        NumList.SelText := #13#10;
        NumList.SelText := NumType;
      end;
    end
    else
    begin //บรรทัดปัจจุบันไม่ว่าง และไม่เป็นเส้น และบรรทัดก่อนหน้าก็ไม่เป็นเส้น และไม่พบเครื่องหมาย ]
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10+Separator+#13#10;
      NumList.SelText := NumType;
      NumList.SelText := #13#10;
    end;
  end
  else
  begin //กรณีบรรทัดปัจจุบันว่าง
    NumList.SelText := Separator+#13#10;
    NumList.SelText := NumType;
    NumList.SelText := #13#10;
  end;
  NumList.SetFocus;
end;

procedure TfrmInputText.Btn523Click(Sender: TObject);
Var LineNumber: Integer;
    Separator,Separator1,NumType: String;
begin
  Separator1 := '################';
  Separator := '<----------------------------->';
  LineNumber := SendMessage(NumList.Handle, EM_LINEFROMCHAR, NumList.Selstart, 0);
  NumType := '[3 ตัวบน]';
  if NumList.Lines[LineNumber] <> '' then //บรรทัดปัจจุบันไม่ว่าง
  begin
    if (NumList.Lines[LineNumber] = Separator1) Or (NumList.Lines[LineNumber] = Separator) then //บรรทัดปัจจุบันเป็นเส้น
    begin
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10;
      NumList.SelText := NumType+#13#10;
      NumList.SelText := #13#10+Separator;
      NumList.SelStart:= NumList.SelStart-Length(Separator)-1;
    end
    else
    if (NumList.Lines[LineNumber-1] = Separator1) Or (NumList.Lines[LineNumber-1] = Separator) then //บรรทัดก่อนหน้าเป็นเส้น
    begin
      if (Pos(']',NumList.Lines[LineNumber]) > 0) then //พบเครื่องหมาย ] ในบรรทัด
      begin
        NumList.Lines[LineNumber] := NumType;
        if (trim(NumList.Lines[LineNumber+1]) = '') then
          MoveCursorToLineStart(NumList,LineNumber+1);
      end
      else
      begin
        GoToEndOfCurrentLine(NumList);
        NumList.SelText := #13#10;
        NumList.SelText := NumType;
      end;
    end
    else
    begin //บรรทัดปัจจุบันไม่ว่าง และไม่เป็นเส้น และบรรทัดก่อนหน้าก็ไม่เป็นเส้น และไม่พบเครื่องหมาย ]
      GoToEndOfCurrentLine(NumList);
      NumList.SelText := #13#10+Separator+#13#10;
      NumList.SelText := NumType;
      NumList.SelText := #13#10;
    end;
  end
  else
  begin //กรณีบรรทัดปัจจุบันว่าง
    NumList.SelText := Separator+#13#10;
    NumList.SelText := NumType;
    NumList.SelText := #13#10;
  end;
  NumList.SetFocus;
end;

procedure TfrmInputText.FormClose(Sender: TObject;
  var Action: TCloseAction);
Var IniFile : TInifile;
begin
  Try
    IniFile := TIniFile.Create(
             ChangeFileExt(Application.ExeName,'.ini'));

    IniFile.WriteFloat('INPUT','AddPercent',edPercent.Value);
    IniFile.WriteFloat('INPUT','PrWarn',edtOverPr.Value);
  finally
    IniFile.Free;
  end;
end;

end.
