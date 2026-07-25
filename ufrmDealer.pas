unit ufrmDealer;

interface

uses
  ZDataset,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, MoneyEdit, Buttons,  Grids, sMemo, sEdit,
  sCustomComboBox, se_controls, Mask, sCustomComboEdit, sCurrEdit, ABSMain,
  KsSkinCheckBoxs, NiceGrid, PngBitBtn, sCurrencyEdit, DB, ADODB, EditAlign;

type
  TfrmDealer = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    CbBfn: TsComboBox;
    EdfName: TsEdit;
    MmoAdr1: TsMemo;
    EdPhone1: TsEdit;
    EdMobile1: TsEdit;
    Comment: TsMemo;
    Label1: TLabel;
    Label4: TLabel;
    EdCode: TsEdit;
    Label8: TLabel;
    EdlName: TsEdit;
    RdgState: TRadioGroup;
    PngBitBtn2: TPngBitBtn;
    SaveBtn: TPngBitBtn;
    Panel7: TPanel;
    PayGrid: TNiceGrid;
    Panel9: TPanel;
    ComChk: TSeSkinCheckBox;
    procedure FormShow(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure PayGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PayGridFilterChar(Sender: TObject; Col, Row: Integer;
      Chr: Char; var Allowed: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDealer: TfrmDealer;

implementation

uses uDm, uMain;

{$R *.dfm}

function findChar(Str: String;Chr: Char): Boolean;
Var
   i: integer;
begin
  result := false;
  for i := 1 to length(str) do
    if Str[i] = Chr then
      result := true;
end;

procedure TfrmDealer.FormShow(Sender: TObject);
var ZQFindCust : TZQuery;
    ZQTemp     : TZQuery;
    i          : Integer;
begin
  // Reset all PayGrid to '0' first
  for i := 0 to PayGrid.RowCount - 1 do
  begin
    PayGrid[0, i] := '0';
    PayGrid[1, i] := '0';
  end;

  with Dm do
  begin
    if not ZConnection1.Connected then Exit;

    if RdgState.ItemIndex = 1 then
    begin
      // Edit mode: Load dealer from Firebird Dealer table
      ZQFindCust := TZQuery.Create(nil);
      try
        ZQFindCust.Connection := ZConnection1;
        ZQFindCust.SQL.Text := 'Select * from Dealer Where Code = :aCode';
        ZQFindCust.ParamByName('aCode').Value := EdCode.Text;
        try
          ZQFindCust.Open;
          if ZQFindCust.Active and (not ZQFindCust.IsEmpty) then
          begin
            CbBfN.ItemIndex := CbBfn.Items.IndexOf(ZQFindCust.FieldByName('BFNAME').AsString);
            EdFname.Text    := ZQFindCust.FieldByName('FNAME').AsString;
            EdLname.Text    := ZQFindCust.FieldByName('LNAME').AsString;
            MmoAdr1.Text    := ZQFindCust.FieldByName('ADDRESS1').AsString;
            EdPhone1.Text   := ZQFindCust.FieldByName('PHONE1').AsString;
            EdMobile1.Text  := ZQFindCust.FieldByName('MOBILE1').AsString;
            ComChk.Checked  := ZQFindCust.FieldByName('HASCOM').AsBoolean;

            try PayGrid[0,0]  := ZQFindCust.FieldByName('COMRNUP').AsString;   except end;
            try PayGrid[0,1]  := ZQFindCust.FieldByName('COMRNDWN').AsString;  except end;
            try PayGrid[0,2]  := ZQFindCust.FieldByName('COMPOSUP').AsString;  except end;
            try PayGrid[0,3]  := ZQFindCust.FieldByName('COMPOSDWN').AsString; except end;
            try PayGrid[0,4]  := ZQFindCust.FieldByName('COM2UP').AsString;    except end;
            try PayGrid[0,5]  := ZQFindCust.FieldByName('COM2TOD').AsString;   except end;
            try PayGrid[0,6]  := ZQFindCust.FieldByName('COM2DWN').AsString;   except end;
            try PayGrid[0,7]  := ZQFindCust.FieldByName('COM2MEE').AsString;   except end;
            try PayGrid[0,8]  := ZQFindCust.FieldByName('COM2POS').AsString;   except end;
            try PayGrid[0,9]  := ZQFindCust.FieldByName('COM3UP').AsString;    except end;
            try PayGrid[0,10] := ZQFindCust.FieldByName('COM3TOD').AsString;   except end;
            try PayGrid[0,11] := ZQFindCust.FieldByName('COM3DWN').AsString;   except end;
            try PayGrid[0,12] := ZQFindCust.FieldByName('COM4').AsString;      except end;
            try PayGrid[0,13] := ZQFindCust.FieldByName('COM4TOD').AsString;   except end;
            try PayGrid[0,14] := ZQFindCust.FieldByName('COM5').AsString;      except end;
            try PayGrid[0,15] := ZQFindCust.FieldByName('COM5TOD').AsString;   except end;

            try PayGrid[1,0]  := ZQFindCust.FieldByName('PAYRNUP').AsString;   except end;
            try PayGrid[1,1]  := ZQFindCust.FieldByName('PAYRNDWN').AsString;  except end;
            try PayGrid[1,2]  := ZQFindCust.FieldByName('PAYPOSUP').AsString;  except end;
            try PayGrid[1,3]  := ZQFindCust.FieldByName('PAYPOSDWN').AsString; except end;
            try PayGrid[1,4]  := ZQFindCust.FieldByName('PAY2UP').AsString;    except end;
            try PayGrid[1,5]  := ZQFindCust.FieldByName('PAY2TOD').AsString;   except end;
            try PayGrid[1,6]  := ZQFindCust.FieldByName('PAY2DWN').AsString;   except end;
            try PayGrid[1,7]  := ZQFindCust.FieldByName('PAY2MEE').AsString;   except end;
            try PayGrid[1,8]  := ZQFindCust.FieldByName('PAY2POS').AsString;   except end;
            try PayGrid[1,9]  := ZQFindCust.FieldByName('PAY3UP').AsString;    except end;
            try PayGrid[1,10] := ZQFindCust.FieldByName('PAY3TOD').AsString;   except end;
            try PayGrid[1,11] := ZQFindCust.FieldByName('PAY3DWN').AsString;   except end;
            try PayGrid[1,12] := ZQFindCust.FieldByName('PAY4').AsString;      except end;
            try PayGrid[1,13] := ZQFindCust.FieldByName('PAY4TOD').AsString;   except end;
            try PayGrid[1,14] := ZQFindCust.FieldByName('PAY5').AsString;      except end;
            try PayGrid[1,15] := ZQFindCust.FieldByName('PAY5TOD').AsString;   except end;
            try Comment.Text  := ZQFindCust.FieldByName('COMMENT').AsString;   except end;

            for i := 0 to PayGrid.RowCount - 1 do
            begin
              if PayGrid[0,i] = '' then PayGrid[0,i] := '0';
              if PayGrid[1,i] = '' then PayGrid[1,i] := '0';
            end;
          end;
        except
        end;
      finally
        ZQFindCust.Free;
      end;
    end
    else
    begin
      // Add mode: Load defaults from Firebird TempLotto table
      ZQTemp := TZQuery.Create(nil);
      try
        ZQTemp.Connection := ZConnection1;
        ZQTemp.SQL.Text := 'Select * from TempLotto';
        try
          ZQTemp.Open;
          if ZQTemp.Active and (not ZQTemp.IsEmpty) then
          begin
            try PayGrid[0,0]  := ZQTemp.FieldByName('COMRNUP').AsString;   except end;
            try PayGrid[0,1]  := ZQTemp.FieldByName('COMRNDWN').AsString;  except end;
            try PayGrid[0,2]  := ZQTemp.FieldByName('COMPOSUP').AsString;  except end;
            try PayGrid[0,3]  := ZQTemp.FieldByName('COMPOSDWN').AsString; except end;
            try PayGrid[0,4]  := ZQTemp.FieldByName('COM2UP').AsString;    except end;
            try PayGrid[0,5]  := ZQTemp.FieldByName('COM2TOD').AsString;   except end;
            try PayGrid[0,6]  := ZQTemp.FieldByName('COM2DWN').AsString;   except end;
            try PayGrid[0,7]  := ZQTemp.FieldByName('COM2MEE').AsString;   except end;
            try PayGrid[0,8]  := ZQTemp.FieldByName('COM2POS').AsString;   except end;
            try PayGrid[0,9]  := ZQTemp.FieldByName('COM3UP').AsString;    except end;
            try PayGrid[0,10] := ZQTemp.FieldByName('COM3TOD').AsString;   except end;
            try PayGrid[0,11] := ZQTemp.FieldByName('COM3DWN').AsString;   except end;
            try PayGrid[0,12] := ZQTemp.FieldByName('COM4').AsString;      except end;
            try PayGrid[0,13] := ZQTemp.FieldByName('COM4TOD').AsString;   except end;
            try PayGrid[0,14] := ZQTemp.FieldByName('COM5').AsString;      except end;
            try PayGrid[0,15] := ZQTemp.FieldByName('COM5TOD').AsString;   except end;

            try PayGrid[1,0]  := ZQTemp.FieldByName('PAYRNUP').AsString;   except end;
            try PayGrid[1,1]  := ZQTemp.FieldByName('PAYRNDWN').AsString;  except end;
            try PayGrid[1,2]  := ZQTemp.FieldByName('PAYPOSUP').AsString;  except end;
            try PayGrid[1,3]  := ZQTemp.FieldByName('PAYPOSDWN').AsString; except end;
            try PayGrid[1,4]  := ZQTemp.FieldByName('PAY2UP').AsString;    except end;
            try PayGrid[1,5]  := ZQTemp.FieldByName('PAY2TOD').AsString;   except end;
            try PayGrid[1,6]  := ZQTemp.FieldByName('PAY2DWN').AsString;   except end;
            try PayGrid[1,7]  := ZQTemp.FieldByName('PAY2MEE').AsString;   except end;
            try PayGrid[1,8]  := ZQTemp.FieldByName('PAY2POS').AsString;   except end;
            try PayGrid[1,9]  := ZQTemp.FieldByName('PAY3UP').AsString;    except end;
            try PayGrid[1,10] := ZQTemp.FieldByName('PAY3TOD').AsString;   except end;
            try PayGrid[1,11] := ZQTemp.FieldByName('PAY3DWN').AsString;   except end;
            try PayGrid[1,12] := ZQTemp.FieldByName('PAY4').AsString;      except end;
            try PayGrid[1,13] := ZQTemp.FieldByName('PAY4TOD').AsString;   except end;
            try PayGrid[1,14] := ZQTemp.FieldByName('PAY5').AsString;      except end;
            try PayGrid[1,15] := ZQTemp.FieldByName('PAY5TOD').AsString;   except end;
          end;
        except
        end;
      finally
        ZQTemp.Free;
      end;

      // Clear personal fields for new entry
      CbBfn.ItemIndex := 4;
      EdfName.Text    := '';
      EdlName.Text    := '';
      MmoAdr1.Text    := '';
      EdPhone1.Text   := '';
      EdMobile1.Text  := '';
      Comment.Text    := '';
      EdfName.SetFocus;
    end;
  end;
end;

procedure TfrmDealer.SaveBtnClick(Sender: TObject);
var ZQSave : TZQuery;
    HasComVal: Integer;
begin
  with Dm do
  begin
    if Trim(EdfName.Text) = '' then
    begin
      Showmessage('กรุณาป้อน ชื่อ-นามสกุล ด้วยครับ');
      EdfName.SetFocus;
      Exit;
    end;

    if ComChk.Checked then HasComVal := 1 else HasComVal := 0;

    if ZConnection1.Connected then
    begin
      ZQSave := TZQuery.Create(nil);
      try
        ZQSave.Connection := ZConnection1;
        if RdgState.ItemIndex = 1 then
        begin
          // Edit mode
          ZQSave.SQL.Text := 'UPDATE DEALER SET ' +
            'BFNAME = :aBfn, FNAME = :afName, LNAME = :alName, ADDRESS1 = :aAdr1, ' +
            'PHONE1 = :aPhone1, MOBILE1 = :aMoBile1, HASCOM = :aHasCom, COMMENT = :aComment, ' +
            'COMRNUP = :aCRnU, COMRNDWN = :aCRnD, COMPOSUP = :aCPU, COMPOSDWN = :aCPD, ' +
            'COM2UP = :aC2U, COM2TOD = :aC2T, COM2DWN = :aC2D, COM2MEE = :aC2M, COM2POS = :aC2P, ' +
            'COM3UP = :aC3U, COM3TOD = :aC3T, COM3DWN = :aC3D, COM4 = :aC4, COM4TOD = :aC4Tod, ' +
            'COM5 = :aC5, COM5TOD = :aC5Tod, ' +
            'PAYRNUP = :aPRnU, PAYRNDWN = :aPRnD, PAYPOSUP = :aPPU, PAYPOSDWN = :aPPD, ' +
            'PAY2UP = :aP2U, PAY2TOD = :aP2T, PAY2DWN = :aP2D, PAY2MEE = :aP2M, PAY2POS = :aP2P, ' +
            'PAY3UP = :aP3U, PAY3TOD = :aP3T, PAY3DWN = :aP3D, PAY4 = :aP4, PAY4TOD = :aP4Tod, ' +
            'PAY5 = :aP5, PAY5TOD = :aP5Tod ' +
            'WHERE CODE = :aCode';
        end
        else
        begin
          // Add mode
          ZQSave.SQL.Text := 'INSERT INTO DEALER (ID, CODE, BFNAME, FNAME, LNAME, ADDRESS1, PHONE1, MOBILE1, HASCOM, COMMENT, ' +
            'COMRNUP, COMRNDWN, COMPOSUP, COMPOSDWN, COM2UP, COM2TOD, COM2DWN, COM2MEE, COM2POS, ' +
            'COM3UP, COM3TOD, COM3DWN, COM4, COM4TOD, COM5, COM5TOD, ' +
            'PAYRNUP, PAYRNDWN, PAYPOSUP, PAYPOSDWN, PAY2UP, PAY2TOD, PAY2DWN, PAY2MEE, PAY2POS, ' +
            'PAY3UP, PAY3TOD, PAY3DWN, PAY4, PAY4TOD, PAY5, PAY5Tod) ' +
            'VALUES ((SELECT COALESCE(MAX(ID), 0) + 1 FROM DEALER), :aCode, :aBfn, :afName, :alName, :aAdr1, :aPhone1, :aMoBile1, :aHasCom, :aComment, ' +
            ':aCRnU, :aCRnD, :aCPU, :aCPD, :aC2U, :aC2T, :aC2D, :aC2M, :aC2P, ' +
            ':aC3U, :aC3T, :aC3D, :aC4, :aC4Tod, :aC5, :aC5Tod, ' +
            ':aPRnU, :aPRnD, :aPPU, :aPPD, :aP2U, :aP2T, :aP2D, :aP2M, :aP2P, ' +
            ':aP3U, :aP3T, :aP3D, :aP4, :aP4Tod, :aP5, :aP5Tod)';
        end;

        ZQSave.ParamByName('aCode').Value    := EdCode.Text;
        ZQSave.ParamByName('aBfn').Value     := CbBfn.Text;
        ZQSave.ParamByName('afName').Value   := EdfName.Text;
        ZQSave.ParamByName('alName').Value   := EdlName.Text;
        ZQSave.ParamByName('aAdr1').Value    := MmoAdr1.Text;
        ZQSave.ParamByName('aPhone1').Value  := EdPhone1.Text;
        ZQSave.ParamByName('aMobile1').Value := EdMobile1.Text;
        ZQSave.ParamByName('aHasCom').Value  := HasComVal;

        ZQSave.ParamByName('aCRnU').Value:= StrToFloatDef(PayGrid[0,0], 0);
        ZQSave.ParamByName('aCRnD').Value:= StrToFloatDef(PayGrid[0,1], 0);
        ZQSave.ParamByName('aCPU').Value := StrToFloatDef(PayGrid[0,2], 0);
        ZQSave.ParamByName('aCPD').Value := StrToFloatDef(PayGrid[0,3], 0);
        ZQSave.ParamByName('aC2U').Value := StrToFloatDef(PayGrid[0,4], 0);
        ZQSave.ParamByName('aC2T').Value := StrToFloatDef(PayGrid[0,5], 0);
        ZQSave.ParamByName('aC2D').Value := StrToFloatDef(PayGrid[0,6], 0);
        ZQSave.ParamByName('aC2M').Value := StrToFloatDef(PayGrid[0,7], 0);
        ZQSave.ParamByName('aC2P').Value := StrToFloatDef(PayGrid[0,8], 0);
        ZQSave.ParamByName('aC3U').Value := StrToFloatDef(PayGrid[0,9], 0);
        ZQSave.ParamByName('aC3T').Value := StrToFloatDef(PayGrid[0,10], 0);
        ZQSave.ParamByName('aC3D').Value := StrToFloatDef(PayGrid[0,11], 0);
        ZQSave.ParamByName('aC4').Value  := StrToFloatDef(PayGrid[0,12], 0);
        ZQSave.ParamByName('aC4Tod').Value  := StrToFloatDef(PayGrid[0,13], 0);
        ZQSave.ParamByName('aC5').Value  := StrToFloatDef(PayGrid[0,14], 0);
        ZQSave.ParamByName('aC5Tod').Value  := StrToFloatDef(PayGrid[0,15], 0);

        ZQSave.ParamByName('aPRnU').Value:= StrToFloatDef(PayGrid[1,0], 0);
        ZQSave.ParamByName('aPRnD').Value:= StrToFloatDef(PayGrid[1,1], 0);
        ZQSave.ParamByName('aPPU').Value := StrToFloatDef(PayGrid[1,2], 0);
        ZQSave.ParamByName('aPPD').Value := StrToFloatDef(PayGrid[1,3], 0);
        ZQSave.ParamByName('aP2U').Value := StrToFloatDef(PayGrid[1,4], 0);
        ZQSave.ParamByName('aP2T').Value := StrToFloatDef(PayGrid[1,5], 0);
        ZQSave.ParamByName('aP2D').Value := StrToFloatDef(PayGrid[1,6], 0);
        ZQSave.ParamByName('aP2M').Value := StrToFloatDef(PayGrid[1,7], 0);
        ZQSave.ParamByName('aP2P').Value := StrToFloatDef(PayGrid[1,8], 0);
        ZQSave.ParamByName('aP3U').Value := StrToFloatDef(PayGrid[1,9], 0);
        ZQSave.ParamByName('aP3T').Value := StrToFloatDef(PayGrid[1,10], 0);
        ZQSave.ParamByName('aP3D').Value := StrToFloatDef(PayGrid[1,11], 0);
        ZQSave.ParamByName('aP4').Value  := StrToFloatDef(PayGrid[1,12], 0);
        ZQSave.ParamByName('aP4Tod').Value  := StrToFloatDef(PayGrid[1,13], 0);
        ZQSave.ParamByName('aP5').Value  := StrToFloatDef(PayGrid[1,14], 0);
        ZQSave.ParamByName('aP5Tod').Value  := StrToFloatDef(PayGrid[1,15], 0);
        ZQSave.ParamByName('aComment').Value := Comment.Text;

        ZQSave.ExecSQL;

        // Update LASTDEALER
        try
          ZQSave.Close;
          ZQSave.SQL.Text := 'UPDATE LASTDEALER SET LASTCODE = :aLastCode';
          ZQSave.ParamByName('aLastCode').Value := EdCode.Text;
          ZQSave.ExecSQL;
        except
        end;

        if ZConnection1.InTransaction then
          ZConnection1.Commit;
      finally
        ZQSave.Free;
      end;

      Showmessage('ปรับปรุงบันทึกเรียบร้อย');
      Close;
    end;
  end;
end;

procedure TfrmDealer.PayGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var i,j: integer;
begin
 If (Sender is TNiceGrid) then
 begin
  if Key = VK_Delete then
    for i:= 0 to TNiceGrid(Sender).Rowcount-1 do
    begin
      for j := 0 to TNiceGrid(Sender).ColCount-1 do
      begin
        if TNiceGrid(Sender).Cells[j,i] = '' then
          TNiceGrid(Sender).Cells[j,i] := '0';
      end;
    end;
  end;
end;

procedure TfrmDealer.PayGridFilterChar(Sender: TObject; Col, Row: Integer;
  Chr: Char; var Allowed: Boolean);
begin
  if Col in [0,1] then
  begin
    if Chr in ['0'..'9','.'] then
    begin
      if Chr in ['0'..'9'] then
        Allowed := true
      else
      begin
        if findChar(TNiceGrid(Sender).Cells[Col,Row],'.') then
          Allowed := false
        else
          Allowed := true;
      end;
    end
    else
      Allowed := false;
  end;
end;

end.
