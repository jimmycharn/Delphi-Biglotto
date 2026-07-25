unit ufrmCust;

interface

uses
  ZDataset,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, MoneyEdit, Buttons,  Grids, sMemo, sEdit,
  sCustomComboBox, se_controls, Mask, sCustomComboEdit, sCurrEdit, ABSMain,
  sCurrencyEdit, DB, ADODB, PngBitBtn, NiceGrid, EditAlign, KsSkinCheckBoxs;

type
  TfrmCust = class(TForm)
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
    EdCID: TsEdit;
    Label8: TLabel;
    EdlName: TsEdit;
    RdgState: TRadioGroup;
    PngBitBtn2: TPngBitBtn;
    SaveBtn: TPngBitBtn;
    Panel7: TPanel;
    PayGrid: TNiceGrid;
    Panel9: TPanel;
    ComChk: TSeSkinCheckBox;
    ChkTemp: TSeSkinCheckBox;
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
  frmCust: TfrmCust;

implementation

uses uDm, Utils;

{$R *.dfm}



procedure TfrmCust.FormShow(Sender: TObject);
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

  Case rdgState.ItemIndex of
    0: ChkTemp.Checked := true;   // Add mode
    1: ChkTemp.Checked := false;  // Edit mode
  end;

  with Dm do
  begin
    if not ZConnection1.Connected then Exit;

    if (not ChkTemp.Checked) and (RdgState.ItemIndex = 1) then
    begin
      // Edit mode: Load customer from Firebird Cust table
      ZQFindCust := TZQuery.Create(nil);
      try
        ZQFindCust.Connection := ZConnection1;
        ZQFindCust.SQL.Text := 'SELECT * FROM CUST WHERE CUSTID=:aCustID';
        ZQFindCust.ParamByName('aCustID').Value := EdCID.Text;
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

procedure TfrmCust.SaveBtnClick(Sender: TObject);
var QrUpDateCust : TABSQuery;
    QrFindCurCustID : TABSQuery;
    ZQSave : TZQuery;
    ZQCheck : TZQuery;
    CID: String;
begin
  CID := Trim(EdCID.Text);
  if Length(CID) = 4 then
  begin
    if Not((CID[1] in ['0'..'9']) and (CID[2] in ['0'..'9']) and (CID[3] in ['0'..'9']) and (CID[4] in ['0'..'9'])) then
    begin
      Showmessage('กรุณากรอกรหัสลูกค้าเป็นตัวเลข 4 หลัก');
      EdCID.SetFocus;
      exit;
    end;
  end
  else
  begin
    Showmessage('กรุณากรอกรหัสลูกค้าเป็นตัวเลข 4 หลัก');
    EdCID.SetFocus;
    exit;
  end;

  if Trim(EdfName.Text) = '' then
  begin
    Showmessage('กรุณากรอกชื่อลูกค้า');
    EdfName.SetFocus;
    exit;
  end;
  try
    with Dm do
    begin
      if ZConnection1.Connected then
      begin
        if RdgState.ItemIndex = 0 then // Insert mode: check if exists
        begin
          ZQCheck := TZQuery.Create(nil);
          try
            ZQCheck.Connection := ZConnection1;
            ZQCheck.SQL.Text := 'Select CustID From Cust WHERE CUSTID=:aCustID';
            ZQCheck.ParamByName('aCustID').Value := EdCID.Text;
            try
              ZQCheck.Open;
              if ZQCheck.Active and (not ZQCheck.IsEmpty) then
              begin
                MessageDlg('รหัสลูกค้านี้มีอยู่แล้ว ไม่สามารถใช้ซ้ำได้', mtWarning, [mbOK], 0);
                EdCID.SetFocus;
                Exit;
              end;
            except
            end;
          finally
            ZQCheck.Free;
          end;

          // Perform INSERT on Firebird
          ZQSave := TZQuery.Create(nil);
          try
            ZQSave.Connection := ZConnection1;
            ZQSave.SQL.Text := 'INSERT INTO CUST (CUSTID, BFNAME, FNAME, LNAME, ADDRESS1, PHONE1, MOBILE1, HASCOM, COMMENT, ' +
                               'COMRNUP, COMRNDWN, COMPOSUP, COMPOSDWN, COM2UP, COM2TOD, COM2DWN, COM2MEE, ' +
                               'COM2POS, COM3UP, COM3TOD, COM3DWN, COM4, COM5, COM4TOD, COM5TOD, ' +
                               'PAYRNUP, PAYRNDWN, PAYPOSUP, PAYPOSDWN, PAY2UP, PAY2TOD, PAY2DWN, PAY2MEE, ' +
                               'PAY2POS, PAY3UP, PAY3TOD, PAY3DWN, PAY4, PAY5, PAY4TOD, PAY5TOD) ' +
                               'VALUES (:aCustID, :aBfn, :afName, :alName, :aAdr1, :aPhone1, :aMoBile1, :aHasCom, :aComment, ' +
                               ':aCRnU, :aCRnD, :aCPU, :aCPD, :aC2U, :aC2T, :aC2D, :aC2M, ' +
                               ':aC2P, :aC3U, :aC3T, :aC3D, :aC4, :aC5, :aC4Tod, :aC5Tod, ' +
                               ':aPRnU, :aPRnD, :aPPU, :aPPD, :aP2U, :aP2T, :aP2D, :aP2M, ' +
                               ':aP2P, :aP3U, :aP3T, :aP3D, :aP4, :aP5, :aP4Tod, :aP5Tod)';
            ZQSave.ParamByName('aCustID').Value  := EdCID.Text;
            ZQSave.ParamByName('aBfn').Value     := CbBfn.Text;
            ZQSave.ParamByName('afName').Value   := EdfName.Text;
            ZQSave.ParamByName('alName').Value   := EdlName.Text;
            ZQSave.ParamByName('aAdr1').Value    := MmoAdr1.Text;
            ZQSave.ParamByName('aPhone1').Value  := EdPhone1.Text;
            ZQSave.ParamByName('aMobile1').Value := EdMobile1.Text;
            if ComChk.Checked then ZQSave.ParamByName('aHasCom').Value := 1 else ZQSave.ParamByName('aHasCom').Value := 0;

            ZQSave.ParamByName('aCRnU').Value:= StrToFloat(PayGrid[0,0]);
            ZQSave.ParamByName('aCRnD').Value:= StrToFloat(PayGrid[0,1]);
            ZQSave.ParamByName('aCPU').Value := StrToFloat(PayGrid[0,2]);
            ZQSave.ParamByName('aCPD').Value := StrToFloat(PayGrid[0,3]);
            ZQSave.ParamByName('aC2U').Value := StrToFloat(PayGrid[0,4]);
            ZQSave.ParamByName('aC2T').Value := StrToFloat(PayGrid[0,5]);
            ZQSave.ParamByName('aC2D').Value := StrToFloat(PayGrid[0,6]);
            ZQSave.ParamByName('aC2M').Value := StrToFloat(PayGrid[0,7]);
            ZQSave.ParamByName('aC2P').Value := StrToFloat(PayGrid[0,8]);
            ZQSave.ParamByName('aC3U').Value := StrToFloat(PayGrid[0,9]);
            ZQSave.ParamByName('aC3T').Value := StrToFloat(PayGrid[0,10]);
            ZQSave.ParamByName('aC3D').Value := StrToFloat(PayGrid[0,11]);
            ZQSave.ParamByName('aC4').Value  := StrToFloat(PayGrid[0,12]);
            ZQSave.ParamByName('aC4Tod').Value  := StrToFloat(PayGrid[0,13]);
            ZQSave.ParamByName('aC5').Value  := StrToFloat(PayGrid[0,14]);
            ZQSave.ParamByName('aC5Tod').Value  := StrToFloat(PayGrid[0,15]);

            ZQSave.ParamByName('aPRnU').Value:= StrToFloat(PayGrid[1,0]);
            ZQSave.ParamByName('aPRnD').Value:= StrToFloat(PayGrid[1,1]);
            ZQSave.ParamByName('aPPU').Value := StrToFloat(PayGrid[1,2]);
            ZQSave.ParamByName('aPPD').Value := StrToFloat(PayGrid[1,3]);
            ZQSave.ParamByName('aP2U').Value := StrToFloat(PayGrid[1,4]);
            ZQSave.ParamByName('aP2T').Value := StrToFloat(PayGrid[1,5]);
            ZQSave.ParamByName('aP2D').Value := StrToFloat(PayGrid[1,6]);
            ZQSave.ParamByName('aP2M').Value := StrToFloat(PayGrid[1,7]);
            ZQSave.ParamByName('aP2P').Value := StrToFloat(PayGrid[1,8]);
            ZQSave.ParamByName('aP3U').Value := StrToFloat(PayGrid[1,9]);
            ZQSave.ParamByName('aP3T').Value := StrToFloat(PayGrid[1,10]);
            ZQSave.ParamByName('aP3D').Value := StrToFloat(PayGrid[1,11]);
            ZQSave.ParamByName('aP4').Value  := StrToFloat(PayGrid[1,12]);
            ZQSave.ParamByName('aP4Tod').Value  := StrToFloat(PayGrid[1,13]);
            ZQSave.ParamByName('aP5').Value  := StrToFloat(PayGrid[1,14]);
            ZQSave.ParamByName('aP5Tod').Value  := StrToFloat(PayGrid[1,15]);
            ZQSave.ParamByName('aComment').Value := Comment.Text;

            try
              ZQSave.ExecSQL;
            except
            end;
          finally
            ZQSave.Free;
          end;
        end;
      end;

      // Local ABS Query (safely in try..except)
      QrUpDateCust := TABSQuery.Create(nil);
      try
        QrUpDateCust.DatabaseName := Database.DatabaseName;
        if RdgState.ItemIndex = 1 then
        begin
          QrUpDateCust.SQL.Clear;
          QrUpDateCust.SQL.Add('UPDATE CUST SET BFNAME=:aBfn, FNAME=:afName, LNAME=:alName, ADDRESS1=:aAdr1, PHONE1=:aPhone1, MOBILE1=:aMoBile1, HASCOM=:aHasCom, COMMENT=:aComment, ' +
                               'COMRNUP=:aCRnU, COMRNDWN=:aCRnD, COMPOSUP=:aCPU, COMPOSDWN=:aCPD, COM2UP=:aC2U, COM2TOD=:aC2T, COM2DWN=:aC2D, COM2MEE=:aC2M, ' +
                               'COM2POS=:aC2P, COM3UP=:aC3U, COM3TOD=:aC3T, COM3DWN=:aC3D, COM4=:aC4, COM4TOD=:aC4Tod, COM5=:aC5, COM5TOD=:aC5Tod, ' +
                               'PAYRNUP=:aPRnU, PAYRNDWN=:aPRnD, PAYPOSUP=:aPPU, PAYPOSDWN=:aPPD, PAY2UP=:aP2U, PAY2TOD=:aP2T, PAY2DWN=:aP2D, PAY2MEE=:aP2M, ' +
                               'Pay2Pos=:aP2P, Pay3Up=:aP3U, Pay3Tod=:aP3T, Pay3Dwn=:aP3D, Pay4=:aP4, Pay5=:aP5, Pay4Tod=:aP4Tod, Pay5Tod=:aP5Tod WHERE CUSTID=:aCustID');
          QrUpDateCust.ParamByName('aCustID').Value  := EdCID.Text;
          QrUpDateCust.ParamByName('aBfn').Value     := CbBfn.Text;
          QrUpDateCust.ParamByName('afName').Value   := EdfName.Text;
          QrUpDateCust.ParamByName('alName').Value   := EdlName.Text;
          QrUpDateCust.ParamByName('aAdr1').Value    := MmoAdr1.Text;
          QrUpDateCust.ParamByName('aPhone1').Value  := EdPhone1.Text;
          QrUpDateCust.ParamByName('aMobile1').Value := EdMobile1.Text;
          QrUpDateCust.ParamByName('aHasCom').Value  := ComChk.Checked;

          QrUpDateCust.ParamByName('aCRnU').Value:= StrToFloat(PayGrid[0,0]);
          QrUpDateCust.ParamByName('aCRnD').Value:= StrToFloat(PayGrid[0,1]);
          QrUpDateCust.ParamByName('aCPU').Value := StrToFloat(PayGrid[0,2]);
          QrUpDateCust.ParamByName('aCPD').Value := StrToFloat(PayGrid[0,3]);
          QrUpDateCust.ParamByName('aC2U').Value := StrToFloat(PayGrid[0,4]);
          QrUpDateCust.ParamByName('aC2T').Value := StrToFloat(PayGrid[0,5]);
          QrUpDateCust.ParamByName('aC2D').Value := StrToFloat(PayGrid[0,6]);
          QrUpDateCust.ParamByName('aC2M').Value := StrToFloat(PayGrid[0,7]);
          QrUpDateCust.ParamByName('aC2P').Value := StrToFloat(PayGrid[0,8]);
          QrUpDateCust.ParamByName('aC3U').Value := StrToFloat(PayGrid[0,9]);
          QrUpDateCust.ParamByName('aC3T').Value := StrToFloat(PayGrid[0,10]);
          QrUpDateCust.ParamByName('aC3D').Value := StrToFloat(PayGrid[0,11]);
          QrUpDateCust.ParamByName('aC4').Value  := StrToFloat(PayGrid[0,12]);
          QrUpDateCust.ParamByName('aC4Tod').Value  := StrToFloat(PayGrid[0,13]);
          QrUpDateCust.ParamByName('aC5').Value  := StrToFloat(PayGrid[0,14]);
          QrUpDateCust.ParamByName('aC5Tod').Value  := StrToFloat(PayGrid[0,15]);

          QrUpDateCust.ParamByName('aPRnU').Value:= StrToFloat(PayGrid[1,0]);
          QrUpDateCust.ParamByName('aPRnD').Value:= StrToFloat(PayGrid[1,1]);
          QrUpDateCust.ParamByName('aPPU').Value := StrToFloat(PayGrid[1,2]);
          QrUpDateCust.ParamByName('aPPD').Value := StrToFloat(PayGrid[1,3]);
          QrUpDateCust.ParamByName('aP2U').Value := StrToFloat(PayGrid[1,4]);
          QrUpDateCust.ParamByName('aP2T').Value := StrToFloat(PayGrid[1,5]);
          QrUpDateCust.ParamByName('aP2D').Value := StrToFloat(PayGrid[1,6]);
          QrUpDateCust.ParamByName('aP2M').Value := StrToFloat(PayGrid[1,7]);
          QrUpDateCust.ParamByName('aP2P').Value := StrToFloat(PayGrid[1,8]);
          QrUpDateCust.ParamByName('aP3U').Value := StrToFloat(PayGrid[1,9]);
          QrUpDateCust.ParamByName('aP3T').Value := StrToFloat(PayGrid[1,10]);
          QrUpDateCust.ParamByName('aP3D').Value := StrToFloat(PayGrid[1,11]);
          QrUpDateCust.ParamByName('aP4').Value  := StrToFloat(PayGrid[1,12]);
          QrUpDateCust.ParamByName('aP4Tod').Value  := StrToFloat(PayGrid[1,13]);
          QrUpDateCust.ParamByName('aP5').Value  := StrToFloat(PayGrid[1,14]);
          QrUpDateCust.ParamByName('aP5Tod').Value  := StrToFloat(PayGrid[1,15]);
          QrUpDateCust.ParamByName('aComment').Value := Comment.Text;
          try
            QrUpDateCust.ExecSQL;
          except
          end;
        end
        else
        begin
          // Check ABS
          try
            QrFindCurCustID := TABSQuery.Create(nil);
            QrFindCurCustID.DatabaseName := Database.DatabaseName;
            QrFindCurCustID.SQL.Add('Select CustID From Cust WHERE CUSTID=:aCustID');
            QrFindCurCustID.ParamByName('aCustID').Value := EdCID.Text;
            try
              QrFindCurCustID.Open;
              if QrFindCurCustID.Active and (QrFindCurCustID.RecordCount > 0) then
              begin
                if not ZConnection1.Connected then
                begin
                  MessageDlg('รหัสลูกค้านี้มีอยู่แล้ว', mtWarning, [mbOK], 0);
                  EdCID.SetFocus;
                  exit;
                end;
              end;
            except
            end;
          finally
            QrFindCurCustID.Free;
          end;

          QrUpDateCust.SQL.Clear;
          QrUpDateCust.SQL.Add('INSERT INTO CUST (CUSTID, BFNAME, FNAME, LNAME, ADDRESS1, PHONE1, MOBILE1, HASCOM, COMMENT, ' +
                               'COMRNUP, COMRNDWN, COMPOSUP, COMPOSDWN, COM2UP, COM2TOD, COM2DWN, COM2MEE, ' +
                               'COM2POS, COM3UP, COM3TOD, COM3DWN, COM4, COM5, COM4TOD, COM5TOD, ' +
                               'PAYRNUP, PAYRNDWN, PAYPOSUP, PAYPOSDWN, PAY2UP, PAY2TOD, PAY2DWN, PAY2MEE, ' +
                               'PAY2POS, PAY3UP, PAY3TOD, PAY3DWN, PAY4, PAY5, PAY4TOD, PAY5TOD) ' +
                               'VALUES (:aCustID, :aBfn, :afName, :alName, :aAdr1, :aPhone1, :aMoBile1, :aHasCom, :aComment, ' +
                               ':aCRnU, :aCRnD, :aCPU, :aCPD, :aC2U, :aC2T, :aC2D, :aC2M, ' +
                               ':aC2P, :aC3U, :aC3T, :aC3D, :aC4, :aC5, :aC4Tod, :aC5Tod, ' +
                               ':aPRnU, :aPRnD, :aPPU, :aPPD, :aP2U, :aP2T, :aP2D, :aP2M, ' +
                               ':aP2P, :aP3U, :aP3T, :aP3D, :aP4, :aP5, :aP4Tod, :aP5Tod)');

          QrUpDateCust.ParamByName('aCustID').Value  := EdCID.Text;
          QrUpDateCust.ParamByName('aBfn').Value     := CbBfn.Text;
          QrUpDateCust.ParamByName('afName').Value   := EdfName.Text;
          QrUpDateCust.ParamByName('alName').Value   := EdlName.Text;
          QrUpDateCust.ParamByName('aAdr1').Value    := MmoAdr1.Text;
          QrUpDateCust.ParamByName('aPhone1').Value  := EdPhone1.Text;
          QrUpDateCust.ParamByName('aMobile1').Value := EdMobile1.Text;
          QrUpDateCust.ParamByName('aHasCom').Value  := ComChk.Checked;

          QrUpDateCust.ParamByName('aCRnU').Value:= StrToFloat(PayGrid[0,0]);
          QrUpDateCust.ParamByName('aCRnD').Value:= StrToFloat(PayGrid[0,1]);
          QrUpDateCust.ParamByName('aCPU').Value := StrToFloat(PayGrid[0,2]);
          QrUpDateCust.ParamByName('aCPD').Value := StrToFloat(PayGrid[0,3]);
          QrUpDateCust.ParamByName('aC2U').Value := StrToFloat(PayGrid[0,4]);
          QrUpDateCust.ParamByName('aC2T').Value := StrToFloat(PayGrid[0,5]);
          QrUpDateCust.ParamByName('aC2D').Value := StrToFloat(PayGrid[0,6]);
          QrUpDateCust.ParamByName('aC2M').Value := StrToFloat(PayGrid[0,7]);
          QrUpDateCust.ParamByName('aC2P').Value := StrToFloat(PayGrid[0,8]);
          QrUpDateCust.ParamByName('aC3U').Value := StrToFloat(PayGrid[0,9]);
          QrUpDateCust.ParamByName('aC3T').Value := StrToFloat(PayGrid[0,10]);
          QrUpDateCust.ParamByName('aC3D').Value := StrToFloat(PayGrid[0,11]);
          QrUpDateCust.ParamByName('aC4').Value  := StrToFloat(PayGrid[0,12]);
          QrUpDateCust.ParamByName('aC4Tod').Value  := StrToFloat(PayGrid[0,13]);
          QrUpDateCust.ParamByName('aC5').Value  := StrToFloat(PayGrid[0,14]);
          QrUpDateCust.ParamByName('aC5Tod').Value  := StrToFloat(PayGrid[0,15]);

          QrUpDateCust.ParamByName('aPRnU').Value:= StrToFloat(PayGrid[1,0]);
          QrUpDateCust.ParamByName('aPRnD').Value:= StrToFloat(PayGrid[1,1]);
          QrUpDateCust.ParamByName('aPPU').Value := StrToFloat(PayGrid[1,2]);
          QrUpDateCust.ParamByName('aPPD').Value := StrToFloat(PayGrid[1,3]);
          QrUpDateCust.ParamByName('aP2U').Value := StrToFloat(PayGrid[1,4]);
          QrUpDateCust.ParamByName('aP2T').Value := StrToFloat(PayGrid[1,5]);
          QrUpDateCust.ParamByName('aP2D').Value := StrToFloat(PayGrid[1,6]);
          QrUpDateCust.ParamByName('aP2M').Value := StrToFloat(PayGrid[1,7]);
          QrUpDateCust.ParamByName('aP2P').Value := StrToFloat(PayGrid[1,8]);
          QrUpDateCust.ParamByName('aP3U').Value := StrToFloat(PayGrid[1,9]);
          QrUpDateCust.ParamByName('aP3T').Value := StrToFloat(PayGrid[1,10]);
          QrUpDateCust.ParamByName('aP3D').Value := StrToFloat(PayGrid[1,11]);
          QrUpDateCust.ParamByName('aP4').Value  := StrToFloat(PayGrid[1,12]);
          QrUpDateCust.ParamByName('aP4Tod').Value  := StrToFloat(PayGrid[1,13]);
          QrUpDateCust.ParamByName('aP5').Value  := StrToFloat(PayGrid[1,14]);
          QrUpDateCust.ParamByName('aP5Tod').Value  := StrToFloat(PayGrid[1,15]);
          QrUpDateCust.ParamByName('aComment').Value := Comment.Text;
          try
            QrUpDateCust.ExecSQL;
          except
          end;
        end;
      finally
        QrUpDateCust.Free;
      end;

      Showmessage('บันทึกข้อมูลเรียบร้อยแล้ว');
      Close;
    end;
  except
    Showmessage('เกิดข้อผิดพลาดในการบันทึกข้อมูล');
  end;
end;

procedure TfrmCust.PayGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCust.PayGridFilterChar(Sender: TObject; Col, Row: Integer;
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
        if foundChar(TNiceGrid(Sender).Cells[Col,Row],'.') then
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
