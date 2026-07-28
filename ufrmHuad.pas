unit ufrmHuad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ABSMain, Buttons, ExtCtrls, sSkinProvider,
  sButton, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfrmHuad = class(TForm)
    HuadList: TListView;
    Panel1: TPanel;
    btnSelHuad: TsButton;
    btnExit: TsButton;
    DeleteBtn: TsButton;
    procedure btnSelHuadClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure ShowHuad;
  end;

var
  frmHuad: TfrmHuad;

implementation

uses uMain, uDm;

{$R *.dfm}

procedure TfrmHuad.btnSelHuadClick(Sender: TObject);
begin
  if HuadList.Selected <> nil then
  begin
    modalresult := mrOk;
  end
  else
  begin
    MessageDlg('≥卍腦테棨㎸뉵촛ⓖ한뭍戾들系⌒�!', mtInformation, [mbOk], 0);
  end;
end;

procedure TfrmHuad.btnExitClick(Sender: TObject);
begin
  modalresult := mrCancel;
end;

procedure TfrmHuad.ShowHuad;
var QrFindHuad : TABSQuery;
    ZQFindHuad : TZQuery;
    ZQLot : TZQuery;
    ABSLot : TABSQuery;
    i, LotNo: integer;
    LotNameStr, RawLotType : string;
    
    function LookupLotName(n: Integer; const RawStr: string): string;
    var
      c: Char;
      isNonNumeric: Boolean;
      idx: Integer;
    begin
      Result := '';
      if Trim(RawStr) = '' then Exit;

      isNonNumeric := False;
      for idx := 1 to Length(RawStr) do
      begin
        c := RawStr[idx];
        if not (c in ['0'..'9', '-']) then
        begin
          isNonNumeric := True;
          Break;
        end;
      end;

      if isNonNumeric then
      begin
        Result := RawStr;
        Exit;
      end;

      // 1. Check Firebird ZQLot if available
      if (ZQLot <> nil) and ZQLot.Active and not ZQLot.IsEmpty then
      begin
        if ZQLot.Locate('ID', RawStr, [loCaseInsensitive]) then
          Result := ZQLot.FieldByName('LOTNAME').AsString
        else if ZQLot.Locate('ID', n, []) then
          Result := ZQLot.FieldByName('LOTNAME').AsString
        else if (ZQLot.FindField('LOTID') <> nil) and ZQLot.Locate('LOTID', RawStr, [loCaseInsensitive]) then
          Result := ZQLot.FieldByName('LOTNAME').AsString
        else if (ZQLot.FindField('LOTID') <> nil) and ZQLot.Locate('LOTID', n, []) then
          Result := ZQLot.FieldByName('LOTNAME').AsString
        else if ZQLot.Locate('ID', n + 1, []) then
          Result := ZQLot.FieldByName('LOTNAME').AsString
        else if (ZQLot.FindField('LOTID') <> nil) and ZQLot.Locate('LOTID', n + 1, []) then
          Result := ZQLot.FieldByName('LOTNAME').AsString;
      end;

      // 2. Check ABSLot if available
      if (Result = '') and (ABSLot <> nil) and ABSLot.Active and not ABSLot.IsEmpty then
      begin
        if ABSLot.Locate('ID', RawStr, [loCaseInsensitive]) then
          Result := ABSLot.fieldByName('LotName').AsString
        else if ABSLot.Locate('ID', n, []) then
          Result := ABSLot.fieldByName('LotName').AsString
        else if (ABSLot.FindField('LotID') <> nil) and ABSLot.Locate('LotID', RawStr, [loCaseInsensitive]) then
          Result := ABSLot.fieldByName('LotName').AsString
        else if (ABSLot.FindField('LotID') <> nil) and ABSLot.Locate('LotID', n, []) then
          Result := ABSLot.fieldByName('LotName').AsString
        else if ABSLot.Locate('ID', n + 1, []) then
          Result := ABSLot.fieldByName('LotName').AsString
        else if (ABSLot.FindField('LotID') <> nil) and ABSLot.Locate('LotID', n + 1, []) then
          Result := ABSLot.fieldByName('LotName').AsString;
      end;

      // 3. Fallback to fMain.ComboLotType items if still empty
      if (Result = '') and (fMain <> nil) and (fMain.ComboLotType <> nil) and (fMain.ComboLotType.Items.Count > 0) then
      begin
        if (n >= 0) and (n < fMain.ComboLotType.Items.Count) then
          Result := fMain.ComboLotType.Items[n]
        else if (n - 1 >= 0) and (n - 1 < fMain.ComboLotType.Items.Count) then
          Result := fMain.ComboLotType.Items[n - 1]
        else
          Result := fMain.ComboLotType.Items[0];
      end;
    end;

begin
  With Dm, fMain, ComboLotType do
  begin
    Huadlist.Clear;
    Huadlist.Items.BeginUpdate;
    try
      ZQLot := nil;
      ABSLot := nil;

      if ZConnection1.Connected then
      begin
        ZQLot := TZQuery.Create(nil);
        try
          ZQLot.Connection := ZConnection1;
          ZQLot.SQL.Text := 'SELECT * FROM LOTTO ORDER BY ID';
          try ZQLot.Open; except end;

          ZQFindHuad := TZQuery.Create(nil);
          try
            ZQFindHuad.Connection := ZConnection1;
            ZQFindHuad.SQL.Text := 'Select Period_Date, LotType from Data Group By Period_Date, LotType ORDER BY Period_Date DESC';
            try
              ZQFindHuad.Open;
              if ZQFindHuad.Active and (not ZQFindHuad.IsEmpty) then
              begin
                ZQFindHuad.First;
                while not ZQFindHuad.Eof do
                begin
                  RawLotType := ZQFindHuad.fieldByName('LotType').AsString;
                  LotNo := StrToIntDef(RawLotType, 0);
                  with Huadlist.Items.Add do
                  begin
                    Caption := ZQFindHuad.FieldByName('Period_Date').AsString;
                    LotNameStr := LookupLotName(LotNo, RawLotType);
                    SubItems.Add(LotNameStr);
                    SubItems.Add(RawLotType);
                  end;
                  ZQFindHuad.Next;
                end;
              end;
            except
            end;
          finally
            ZQFindHuad.Free;
          end;
        finally
          ZQLot.Free;
          ZQLot := nil;
        end;
      end
      else
      begin
        ABSLot := TABSQuery.Create(nil);
        try
          ABSLot.DatabaseName := Database.DatabaseName;
          ABSLot.SQL.Text := 'Select ID, LotID, LotName from Lotto';
          try ABSLot.Open; except end;

          QrFindHuad := TABSQuery.Create(nil);
          try
            QrFindHuad.DatabaseName := Database.DatabaseName;
            QrFindHuad.SQL.Text := 'Select Period_Date, LotType from Data Group By Period_Date, LotType ORDER BY Period_Date DESC';
            try
              QrFindHuad.Open;
              if QrFindHuad.Active and (not QrFindHuad.IsEmpty) then
              begin
                QrFindHuad.First;
                While Not QrFindHuad.Eof do
                begin
                  RawLotType := QrFindHuad.fieldByName('LotType').AsString;
                  LotNo := StrToIntDef(RawLotType, 0);
                  with Huadlist.Items.Add do
                  begin
                    Caption := QrFindHuad.FieldByName('Period_Date').AsString;
                    LotNameStr := LookupLotName(LotNo, RawLotType);
                    SubItems.Add(LotNameStr);
                    SubItems.Add(RawLotType);
                  end;
                  QrFindHuad.Next;
                end;
              end;
            except
            end;
          finally
            QrFindHuad.Free;
          end;
        finally
          ABSLot.Free;
          ABSLot := nil;
        end;
      end;
    finally
      Huadlist.Items.EndUpdate;
    end;
  end;
end;

procedure TfrmHuad.FormShow(Sender: TObject);
begin
  ShowHuad;
end;

procedure TfrmHuad.DeleteBtnClick(Sender: TObject);
var QrDelHuad : TABSQuery;
    ZQDelHuad : TZQuery;
    i, j: integer;
    dt, ltStr: string;
begin
  With Dm, HuadList do
  begin
    j := 0;
    for i := 0 to Items.Count - 1 do
    begin
      if Items[i].Checked then
        inc(j);
    end;

    if j = 0 then Exit;

    if MessageDlg('들系탄촤징櫓롱歪테棨 "' + IntToStr(j) + '" 촤징櫓 丞浣쵠琨쥡?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      if ZConnection1.Connected then
      begin
        ZQDelHuad := TZQuery.Create(nil);
        try
          ZQDelHuad.Connection := ZConnection1;
          for i := Items.Count - 1 DownTo 0 do
          begin
            if Items[i].Checked then
            begin
              dt := Items[i].Caption;
              ltStr := Items[i].SubItems[1];

              // Delete from Data
              ZQDelHuad.SQL.Text := 'DELETE FROM DATA WHERE PERIOD_DATE = ' + QuotedStr(dt) + 
                                    ' AND LOTTYPE = ' + QuotedStr(ltStr);
              try ZQDelHuad.ExecSQL; except end;

              // Delete from Cut
              ZQDelHuad.SQL.Text := 'DELETE FROM CUT WHERE DATECUT = ' + QuotedStr(dt) + 
                                    ' AND LOTTYPE = ' + QuotedStr(ltStr);
              try ZQDelHuad.ExecSQL; except end;

              // Delete from CorrectNum
              ZQDelHuad.SQL.Text := 'DELETE FROM CORRECTNUM WHERE CRDATE = ' + QuotedStr(dt) + 
                                    ' AND LOTTYPE = ' + QuotedStr(ltStr);
              try ZQDelHuad.ExecSQL; except end;

              // Delete from LimitNum
              ZQDelHuad.SQL.Text := 'DELETE FROM LIMITNUM WHERE LIMITDATE = ' + QuotedStr(dt) + 
                                    ' AND LOTTYPE = ' + QuotedStr(ltStr);
              try ZQDelHuad.ExecSQL; except end;

              Items[i].Delete;
            end;
          end;
        finally
          ZQDelHuad.Free;
        end;
      end
      else
      begin
        QrDelHuad := TABSQuery.Create(nil);
        try
          QrDelHuad.DatabaseName := Database.DatabaseName;
          for i := Items.Count - 1 DownTo 0 do
          begin
            if Items[i].Checked then
            begin
              dt := Items[i].Caption;
              ltStr := Items[i].SubItems[1];

              QrDelHuad.SQL.Clear;
              QrDelHuad.SQL.Add('Delete from Data');        
              QrDelHuad.SQL.Add('Where Period_Date = "' + dt + '"');
              QrDelHuad.SQL.Add('and LotType = "' + ltStr + '"');
              try QrDelHuad.ExecSQL; except end;

              QrDelHuad.SQL.Clear;
              QrDelHuad.SQL.Add('Delete from Cut');
              QrDelHuad.SQL.Add('Where DateCut = "' + dt + '"');
              try QrDelHuad.ExecSQL; except end;

              QrDelHuad.SQL.Clear;
              QrDelHuad.SQL.Add('Delete from CorrectNum');  
              QrDelHuad.SQL.Add('Where CrDate = "' + dt + '"');
              try QrDelHuad.ExecSQL; except end;

              QrDelHuad.SQL.Clear;
              QrDelHuad.SQL.Add('Delete from LimitNum');    
              QrDelHuad.SQL.Add('Where LimitDate = "' + dt + '"');
              try QrDelHuad.ExecSQL; except end;

              Items[i].Delete;
            end;
          end;
        finally
          QrDelHuad.Free;
        end;
      end;

      MessageDlg('�皐芼롱歪테棨뛰∴뷕촹쨘췌睾笑茸', mtInformation, [mbOk], 0);
    end;
  end;
end;

end.
