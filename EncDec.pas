{-------------------------------------------------------------------------------

The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
the specific language governing rights and limitations under the License.

     The Original Code is EncDec.pas released at May 21st, 2007.
     The Initial Developer of the Original Code is Priyatna.
     (Website: http://www.priyatna.org Email: me@priyatna.org)
     All Rights Reserved.

Alternatively, the contents of this file may be used under the terms of the
GNU General Public License Version 2 or later (the "GPL"), in which case
the provisions of the GPL are applicable instead of those above.
If you wish to allow use of your version of this file only under the terms
of the GPL and not to allow others to use your version of this file
under the MPL, indicate your decision by deleting the provisions above and
replace them with the notice and other provisions required by the GPL.
If you do not delete the provisions above, a recipient may use your version
of this file under either the MPL or the GPL.

-------------------------------------------------------------------------------}

unit EncDec;

interface

var
  EncDecKey: string =
    // must be 65 chars, no duplicate chars, uppercases and lowercases allowed
    //'qazwsxedcrfvtgbyhnujmikolpPLOKMIJNUHBYGVTFCRDXESZWAQ0987654321#@$';
    'PLOKMIJNUHBYGVTFCRDXESZWAQ0987654321#%$qazwsxedcrfvtgbyhnujmikolp';

  function EncodeString(const Str: string): string;
  function DecodeString(const Str: string): string;

implementation

{$WARN UNSAFE_CODE OFF}

function EncodeString(const Str: string): string;
var
  c: Byte;
  n, l: Integer;
  Count: Integer;
  d: array[0..3] of Byte;
begin
  SetLength(Result, ((Length(Str) + 2) div 3) * 4);
  l := 1;
  Count := 1;
  while (Count <= Length(Str)) do
  begin
    c := Ord(Str[Count]);
    Inc(Count);
    d[0] := (c and $FC) shr 2;
    d[1] := (c and $03) shl 4;
    if (Count <= Length(Str)) then
    begin
      c := Ord(Str[Count]);
      Inc(Count);
      d[1] := d[1] + (c and $F0) shr 4;
      d[2] := (c and $0F) shl 2;
      if (Count <= Length(Str)) then
      begin
        c := Ord(Str[Count]);
        Inc(Count);
        d[2] := d[2] + (c and $C0) shr 6;
        d[3] := (c and $3F);
      end else
        d[3] := $40;
    end else
    begin
      d[2] := $40;
      d[3] := $40;
    end;
    for n := 0 to 3 do
    begin
      Result[l] := EncDecKey[d[n] + 1];
      Inc(l);
    end;
  end;
end;

function DecodeString(const Str: string): string;
var
  x, y, n, l: Integer;
  d: array[0..3] of Byte;
begin
  SetLength(Result, Length(Str));
  x := 1;
  l := 1;
  while (x < Length(Str)) do
  begin
    for n := 0 to 3 do
    begin
      if (x > Length(Str))
        then d[n] := 64
        else
        begin
          y := Pos(Str[x], EncDecKey);
          if (y < 1)
            then y := 1;
          d[n] := y - 1;
        end;
      Inc(x);
    end;
    Result[l] := Char((D[0] and $3F) shl 2 + (D[1] and $30) shr 4);
    Inc(l);
    if (d[2] <> 64) then
    begin
      Result[l] := Char((D[1] and $0F) shl 4 + (D[2] and $3C) shr 2);
      Inc(l);
      if (d[3] <> 64) then
      begin
        Result[l] := Char((D[2] and $03) shl 6 + (D[3] and $3F));
        Inc(l);
      end;
    end;
  end;
  Dec(l);
  SetLength(Result, l);
end;

end.
