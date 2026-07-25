unit uLottoCalc;

interface

uses SysUtils, Math;

// คำนวณยอดเงินสุทธิหลังหักส่วนลด (Net Amount = Total * (1 - DiscountPercent/100))
function CalculateNetAmount(const TotalAmount, DiscountPcnt: Double): Double;

// คำนวณเงินรางวัล (Payout = BetAmount * PayRate)
function CalculatePayout(const BetAmount, PayRate: Double): Double;

// คำนวณยอดกำไร/ขาดทุนสุทธิของเจ้ามือ (Net Profit/Loss = TotalReceived - TotalDiscount - TotalPayout)
function CalculateNetProfitLoss(const TotalReceived, TotalDiscount, TotalPayout: Double): Double;

// ตรวจสอบว่าเลขที่ซื้อ ตรงกับเลขรางวัลหรือไม่
function IsWinningNumber(const BetNum, WinNum: string; const MatchExact: Boolean = True): Boolean;

implementation

function CalculateNetAmount(const TotalAmount, DiscountPcnt: Double): Double;
begin
  if DiscountPcnt <= 0 then
    Result := TotalAmount
  else
    Result := SimpleRoundTo(TotalAmount * (1.0 - (DiscountPcnt / 100.0)), -2);
end;

function CalculatePayout(const BetAmount, PayRate: Double): Double;
begin
  Result := SimpleRoundTo(BetAmount * PayRate, -2);
end;

function CalculateNetProfitLoss(const TotalReceived, TotalDiscount, TotalPayout: Double): Double;
begin
  Result := SimpleRoundTo(TotalReceived - TotalDiscount - TotalPayout, -2);
end;

function IsWinningNumber(const BetNum, WinNum: string; const MatchExact: Boolean = True): Boolean;
begin
  if MatchExact then
    Result := (Trim(BetNum) = Trim(WinNum))
  else
    Result := (Pos(Trim(BetNum), Trim(WinNum)) > 0);
end;

end.
