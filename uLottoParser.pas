unit uLottoParser;

interface

uses SysUtils, Classes;

type
  TLottoType = (lt2Top, lt2Bottom, lt3Top, lt3Tod, ltRunTop, ltRunBottom);

  TLottoItem = record
    Num: string;
    Price: Double;
    LottoType: TLottoType;
  end;

// ฟังก์ชันแปรรูปเลข 19 ประตู (คืนค่า StringList ของเลข 2 ตัว 19 ชุด)
function Expand19Door(const DigitChar: Char): TStringList;

// ฟังก์ชันแปรรูปเลขรูดหน้า (เช่น 5 -> 50..59)
function ExpandSlideFront(const DigitChar: Char): TStringList;

// ฟังก์ชันแปรรูปเลขรูดหลัง (เช่น 5 -> 05..95)
function ExpandSlideBack(const DigitChar: Char): TStringList;

// ฟังก์ชันถอดเลขกลับ 3 ตัว (Permutations 6 กลับ หรือ 3 กลับ)
function Expand3DigitPermutations(const Num3: string): TStringList;

// ฟังก์ชันถอดเลขกลับ 2 ตัว (เช่น 12 -> 12, 21)
function Expand2DigitPermutation(const Num2: string): TStringList;

implementation

function Expand19Door(const DigitChar: Char): TStringList;
var
  I: Integer;
  Digit: string;
begin
  Result := TStringList.Create;
  Result.Duplicates := dupIgnore;
  Result.Sorted := True;
  Digit := String(DigitChar);

  if not (DigitChar in ['0'..'9']) then Exit;

  // รูดหน้า (50-59)
  for I := 0 to 9 do
    Result.Add(Digit + IntToStr(I));

  // รูดหลัง (05-95)
  for I := 0 to 9 do
    Result.Add(IntToStr(I) + Digit);
end;

function ExpandSlideFront(const DigitChar: Char): TStringList;
var
  I: Integer;
  Digit: string;
begin
  Result := TStringList.Create;
  Digit := String(DigitChar);

  if not (DigitChar in ['0'..'9']) then Exit;

  for I := 0 to 9 do
    Result.Add(Digit + IntToStr(I));
end;

function ExpandSlideBack(const DigitChar: Char): TStringList;
var
  I: Integer;
  Digit: string;
begin
  Result := TStringList.Create;
  Digit := String(DigitChar);

  if not (DigitChar in ['0'..'9']) then Exit;

  for I := 0 to 9 do
    Result.Add(IntToStr(I) + Digit);
end;

function Expand3DigitPermutations(const Num3: string): TStringList;
var
  d1, d2, d3: Char;
begin
  Result := TStringList.Create;
  Result.Duplicates := dupIgnore;
  Result.Sorted := True;

  if Length(Num3) <> 3 then Exit;

  d1 := Num3[1];
  d2 := Num3[2];
  d3 := Num3[3];

  Result.Add(d1 + d2 + d3);
  Result.Add(d1 + d3 + d2);
  Result.Add(d2 + d1 + d3);
  Result.Add(d2 + d3 + d1);
  Result.Add(d3 + d1 + d2);
  Result.Add(d3 + d2 + d1);
end;

function Expand2DigitPermutation(const Num2: string): TStringList;
var
  d1, d2: Char;
begin
  Result := TStringList.Create;
  Result.Duplicates := dupIgnore;
  Result.Sorted := True;

  if Length(Num2) <> 2 then Exit;

  d1 := Num2[1];
  d2 := Num2[2];

  Result.Add(d1 + d2);
  Result.Add(d2 + d1);
end;

end.
