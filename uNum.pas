unit uNum;

interface
Type
      TNum = Class
             Private
                  Num: String[5];
                  NumType: String;
                  Price: Extended;
                  Limited: Boolean;
                  LimitPrice: Extended;
                  Cuted: Boolean;
                  CutPrice: Extended;

             public
                  procedure setNum(n,nt: String;p: Extended);
                  procedure setLimited(l: Boolean);
                  procedure setLmtPrice(lp: extended);
                  procedure setcuted(c: Boolean);
                  procedure setCutPrice(cp: extended);

                  function getNum(): String;
                  function getTNum(): String;
                  function getPrice(): extended;
                  function getlimited(): Boolean;
                  function getLPrice(): Extended;
                  function getCuted(): Boolean;
                  function getCPrice(): Extended;

      end;

implementation
uses sysutils;

procedure TNum.setNum(n,nt: String;p: extended);
begin
  Num := n;
  NumType := nt;
  Price := p;
end;

procedure TNum.setLimited(l: Boolean);
begin
  Limited := l;
end;

procedure TNum.setLmtPrice(lp: Extended);
begin
  LimitPrice := lp;
end;

procedure TNum.setcuted(c: Boolean);
begin
  Cuted := c;
end;

procedure TNum.setCutPrice(cp: Extended);
begin
  CutPrice := cp;
end;

function TNum.getNum(): String;
begin
  result := Num;
end;

function TNum.getTNum(): String;
begin
  result := NumType;
end;

function TNum.getPrice(): Extended;
begin
  result := Price;
end;

function TNum.getlimited(): Boolean;
begin
  result := Limited;
end;

function TNum.getLPrice(): Extended;
begin
  result := LimitPrice;
end;

function TNum.getCuted(): Boolean;
begin
  result := Cuted;
end;

function TNum.getCPrice(): Extended;
begin
  result := CutPrice;
end;

end.
 