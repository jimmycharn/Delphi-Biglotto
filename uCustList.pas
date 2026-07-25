unit uCustList;

interface

uses
  ZDataset,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AppEvnts, ComCtrls, SortListViews, StdCtrls, DB, ADODB,
  ExtCtrls, ImgList, Buttons, PngBitBtn, ABSMain, Gauges, sCheckedControl,
  sCheckbox, sCustomComboBox;

type
  TfrmCustList = class(TForm)
    CustList: TSortListView;
    ApplicationEvents1: TApplicationEvents;
    EditFindCust: TEdit;
    ImageList1: TImageList;
    PngBitBtn2: TPngBitBtn;
    FindBtn: TPngBitBtn;
    AddBtn: TPngBitBtn;
    DelBtn: TPngBitBtn;
    EditBtn: TPngBitBtn;
    Label1: TLabel;
    updateBtn: TPngBitBtn;
    Progress1: TGauge;
    Label2: TLabel;
    lbCustItems: TLabel;
    CbCustVisible: TsComboBox;
    procedure FindBtnClick(Sender: TObject);
    procedure EditBtnClick(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure CustListDblClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CustListCustomSort(Sender: TObject; ColIndex: Integer; Str1,
      Str2: String; var Res: Integer; var Handled: Boolean);
    procedure EditFindCustKeyPress(Sender: TObject; var Key: Char);
    procedure updateBtnClick(Sender: TObject);
    procedure CbCustVisibleChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCustList: TfrmCustList;

implementation

uses uDm, ufrmCust, Utils, uMain;

{$R *.dfm}

procedure TfrmCustList.FindBtnClick(Sender: TObject);
var ZQFindCust : TZQuery;
    i, j: integer;
    BfStr, CommentStr, SearchText: string;
begin
  with Dm do
  begin
    Custlist.Clear;
    Custlist.Items.BeginUpdate;
    try
      if not ZConnection1.Connected then
      begin
        try
          ZConnection1.Connect;
        except
          on E: Exception do
          begin
            ShowMessage('ZConnection error: ' + E.Message);
            Exit;
          end;
        end;
      end;

      ZQFindCust := TZQuery.Create(nil);
      try
        ZQFindCust.Connection := ZConnection1;
        SearchText := Trim(EditFindCust.Text);
        if SearchText = '' then
          ZQFindCust.SQL.Text := 'SELECT * FROM CUST ORDER BY CUSTID ASC'
        else
        begin
          ZQFindCust.SQL.Text := 'SELECT * FROM CUST WHERE (COALESCE(FNAME,'''') || '' '' || COALESCE(LNAME,'''') || '' '' || COALESCE(CUSTID,'''')) LIKE :pSearch ORDER BY CUSTID ASC';
          ZQFindCust.ParamByName('pSearch').AsString := '%' + SearchText + '%';
        end;

        try
          ZQFindCust.Open;
          if ZQFindCust.Active and (not ZQFindCust.IsEmpty) then
          begin
            ZQFindCust.First;
            i := 0;
            j := 0;
            while not ZQFindCust.Eof do
            begin
              CommentStr := ZQFindCust.FieldByName('COMMENT').AsString;
              BfStr := ZQFindCust.FieldByName('BFNAME').AsString;

              if CbCustVisible.ItemIndex = 0 then
              begin
                if (Pos('INVISIBLE', UpperCase(CommentStr)) = 0) and (Pos('ซ่อน', CommentStr) = 0) then
                begin
                  with Custlist.Items.Add do
                  begin
                    if BfStr = 'นาย' then ImageIndex := 0
                    else if BfStr = 'นาง' then ImageIndex := 1
                    else if (BfStr = 'ด.ช.') or (BfStr = 'ด.ญ.') then ImageIndex := 2
                    else if BfStr = 'นางสาว' then ImageIndex := 3
                    else ImageIndex := 4;

                    Caption := ZQFindCust.FieldByName('CUSTID').AsString;
                    SubItems.Add(Trim(ZQFindCust.FieldByName('FNAME').AsString + ' ' + ZQFindCust.FieldByName('LNAME').AsString));
                    if ZQFindCust.FieldByName('HASCOM').AsInteger > 0 then SubItems.Add('มี') else SubItems.Add('ไม่มี');
                    Inc(j);
                  end;
                end;
              end
              else if CbCustVisible.ItemIndex = 1 then
              begin
                if (Pos('INVISIBLE', UpperCase(CommentStr)) > 0) or (Pos('ซ่อน', CommentStr) > 0) then
                begin
                  with Custlist.Items.Add do
                  begin
                    if BfStr = 'นาย' then ImageIndex := 0
                    else if BfStr = 'นาง' then ImageIndex := 1
                    else if (BfStr = 'ด.ช.') or (BfStr = 'ด.ญ.') then ImageIndex := 2
                    else if BfStr = 'นางสาว' then ImageIndex := 3
                    else ImageIndex := 4;

                    Caption := ZQFindCust.FieldByName('CUSTID').AsString;
                    SubItems.Add(Trim(ZQFindCust.FieldByName('FNAME').AsString + ' ' + ZQFindCust.FieldByName('LNAME').AsString));
                    if ZQFindCust.FieldByName('HASCOM').AsInteger > 0 then SubItems.Add('มี') else SubItems.Add('ไม่มี');
                    Inc(j);
                  end;
                end;
              end
              else
              begin
                with Custlist.Items.Add do
                begin
                  if BfStr = 'นาย' then ImageIndex := 0
                  else if BfStr = 'นาง' then ImageIndex := 1
                  else if (BfStr = 'ด.ช.') or (BfStr = 'ด.ญ.') then ImageIndex := 2
                  else if BfStr = 'นางสาว' then ImageIndex := 3
                  else ImageIndex := 4;

                  Caption := ZQFindCust.FieldByName('CUSTID').AsString;
                  SubItems.Add(Trim(ZQFindCust.FieldByName('FNAME').AsString + ' ' + ZQFindCust.FieldByName('LNAME').AsString));
                  if ZQFindCust.FieldByName('HASCOM').AsInteger > 0 then SubItems.Add('มี') else SubItems.Add('ไม่มี');
                  Inc(i);
                end;
              end;
              ZQFindCust.Next;
            end;
          end;
        except
          on E: Exception do
            ShowMessage('Query error: ' + E.Message);
        end;
      finally
        ZQFindCust.Free;
      end;
    finally
      Custlist.Items.EndUpdate;
      lbCustItems.Caption := IntToStr(Custlist.Items.Count) + ' รายชื่อ';
    end;
  end;
end;

procedure TfrmCustList.EditBtnClick(Sender: TObject);
Var CustID : String;
begin

  With frmCust,CustList do
  begin
    if (UpperCase(Items[Selected.Index].Caption) <> '0001') then
    begin
      CbBfn.ItemIndex := 4;
      CbBfn.Enabled := true;
      EdCID.Enabled := false;
      EdfName.Enabled := true;
      EdlName.Enabled := true;
      MmoAdr1.Enabled := true;
      EdPhone1.Enabled := true;
      EdMobile1.Enabled := true;
      RdgState.ItemIndex := 1;
      //ComChk.Enabled := true;
      EdCID.Text := Items[Selected.Index].Caption;//CustID;
      Showmodal;
    end
    else
    begin
      CbBfn.ItemIndex := -1;
      CbBfn.Enabled := false;
      EdCID.Enabled := false;
      EdfName.Enabled := false;
      EdlName.Enabled := false;
      MmoAdr1.Enabled := false;
      EdPhone1.Enabled := false;
      EdMobile1.Enabled := false;
      RdgState.ItemIndex := 1;
      //ComChk.Enabled := false;
      EdCID.Text := Items[Selected.Index].Caption;//CustID;
      Showmodal;
     //Showmessage('ขออภัยครับ รายการนี้ไม่สามารถแก้ไขได้');
    end;
  end;
end;

procedure TfrmCustList.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  With fMain do
  begin
    if IsHost then
    begin
      EditBtn.Enabled := CustList.SelCount > 0;
      DelBtn.Enabled  := CustList.SelCount > 0;
    end;
  end;
end;

procedure TfrmCustList.CustListDblClick(Sender: TObject);
begin
  with fMain do
  begin
    if (CustList.SelCount > 0) and IsHost then
      EditBtnClick(Sender);
  end;
end;

procedure TfrmCustList.AddBtnClick(Sender: TObject);
var ZQLastCustID : TZQuery;
    LastCodeStr : string;
begin
  with Dm do
  begin
    LastCodeStr := '';
    if ZConnection1.Connected then
    begin
      ZQLastCustID := TZQuery.Create(nil);
      try
        ZQLastCustID.Connection := ZConnection1;
        ZQLastCustID.SQL.Text := 'SELECT MAX(CUSTID) AS LASTCODE FROM CUST';
        try
          ZQLastCustID.Open;
          if ZQLastCustID.Active and (not ZQLastCustID.IsEmpty) then
          begin
            LastCodeStr := ZQLastCustID.FieldByName('LASTCODE').AsString;
          end;
        except
        end;
      finally
        ZQLastCustID.Free;
      end;
    end;

    With frmCust do
    begin
      EdCID.Enabled := true;
      ComChk.Checked := true;
      ComChk.Enabled := true;
      CbBfn.Enabled := true;
      EdfName.Enabled := true;
      EdlName.Enabled := true;
      MmoAdr1.Enabled := true;
      EdPhone1.Enabled := true;
      EdMobile1.Enabled := true;
      RdgState.ItemIndex := 0;
      EdCID.Text := AutoNum(LastCodeStr);
      Showmodal;
    end;
  end;
end;

procedure TfrmCustList.DelBtnClick(Sender: TObject);
var ZQDelCust : TZQuery;
    CustIDToDelete : string;
begin
  with CustList, Dm do
  begin
    if Selected = nil then Exit;

    if MessageDlg('ต้องการลบลูกค้า  "' + Items[Selected.Index].Caption + '  ' + Items[Selected.Index].SubItems[0] + '"  หรือไม่?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      if UpperCase(Items[Selected.Index].Caption) = '0001' then
        Showmessage('ขออภัย รายการนี้ไม่สามารถลบได้')
      else
      begin
        CustIDToDelete := Items[Selected.Index].Caption;

        if ZConnection1.Connected then
        begin
          ZQDelCust := TZQuery.Create(nil);
          try
            ZQDelCust.Connection := ZConnection1;
            ZQDelCust.SQL.Text := 'DELETE FROM CUST WHERE CUSTID = :aCustID';
            ZQDelCust.ParamByName('aCustID').Value := CustIDToDelete;
            try
              ZQDelCust.ExecSQL;
            except
            end;
          finally
            ZQDelCust.Free;
          end;
        end;

        Items.Delete(Selected.Index);
      end;
    end;
  end;
end;

procedure TfrmCustList.FormShow(Sender: TObject);
begin
  with fMain do
  begin
    //findBtn.Enabled    := Not IsHost;
    addBtn.Enabled    := IsHost;
    editBtn.Enabled   := IsHost;
    delBtn.Enabled    := IsHost;
    updateBtn.Visible := Not IsHost;
  end;
  CustList.Clear;
  FindBtnClick(Sender);
  EditfindCust.SetFocus;
end;

procedure TfrmCustList.CustListCustomSort(Sender: TObject;
  ColIndex: Integer; Str1, Str2: String; var Res: Integer;
  var Handled: Boolean);
var
  //n1, n2: Extended; //Integer;
  n1, n2: Extended;
begin
  if (ColIndex in [0]) then
  begin
    //n1 := TxtToFloat(Str1);// StrToFloatDef(Str1, 0);
    //n2 := txtToFloat(Str2);//StrToFloatDef(Str2, 0);
    n1 := StrToFloatDef(Str1, 0);
    n2 := StrToFloatDef(Str2, 0);
    if (n1 = n2)
      then Res := 0 else
    if (n1 > n2)
      then Res := 1
      else Res := -1;
    Handled := True;
  end;
end;

procedure TfrmCustList.EditFindCustKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    FindBtnClick(Sender);
    EditFindCust.SelectAll;
    Key := #0;  
  end
end;

procedure TfrmCustList.updateBtnClick(Sender: TObject);
Var QrLastCustID,QrMasterCust,QrUpDateCust,QrUpDateNum : TABSQuery;
    i,j,Total: integer;
    Num,PriUp,PriDwn,LastCustID: String;
begin
  With Dm,fMain do
  begin
      try
        ServerDB.Connected := false;
      except
      end;
      ServerDB.DatabaseFileName := ServerDBFile;
      try
        try
          ServerDB.Connected := true;
        except
        end;
      except
      end;

      
      QrLastCustID := TABSQuery.Create(nil);
      try
      except
      end;
      QrLastCustID.DatabaseName := ServerDB.DatabaseName;
      try
        QrLastCustID.Close;
      except
      end;
      QrLastCustID.SQL.Clear;
      QrLastCustID.SQL.Add('Select Max(CustID) as MaxCustID from Cust');
      try
        try
          QrLastCustID.Open;
        except
        end;
      except
      end;
      LastCustID := QrLastCustID.fieldByName('MaxCustID').AsString;
      QrLastCustID := nil;

      QrMasterCust := TABSQuery.Create(nil);
      try
      except
      end;
      QrMasterCust.DatabaseName := ServerDB.DatabaseName;
      try
        QrMasterCust.Close;
      except
      end;
      QrMasterCust.SQL.Clear;
      QrMasterCust.SQL.Add('Select * from Cust');
      try
        try
          QrMasterCust.Open;
        except
        end;
      except
      end;

      Progress1.MinValue := 0;
      Progress1.MaxValue := QrMasterCust.RecordCount;
      Progress1.Visible  := true;

     try
      QrUpDateCust := TABSQuery.Create(nil);
      try
      except
      end;
      QrUpDateCust.DatabaseName := Database.DatabaseName;
      try
        QrUpDateCust.Close;
      except
      end;
      QrUpDateCust.SQL.Clear;
      QrUpDateCust.SQL.Add('Delete from Cust');
      try
        try
          QrUpDateCust.ExecSQL;
        except
        end;
      except
      end;

      QrMasterCust.First;
      for i := 0 to QrMasterCust.RecordCount-1 do
      begin
        Application.ProcessMessages;
        Progress1.Progress := i+1;
        try
          QrUpDateCust.Close;
        except
        end;
        QrUpDateCust.SQL.Clear;
        QrUpDateCust.SQL.Add('INSERT INTO Cust (CustID, IDCard, bfName, fName, lName, Address1, Address2, Phone1, Phone2, Mobile1, Mobile2, HasCom, Comment, '+
                           'ComRnUp, ComRnDwn, ComPosUp, ComPosDwn, Com2Up, Com2Tod, Com2Dwn, Com2Mee, Com2Pos, Com3Up, Com3Tod, Com3Dwn, Com4, Com4Tod, Com5, Com5Tod, '+
                           'PayRnUp, PayRnDwn, PayPosUp, PayPosDwn, Pay2Up, Pay2Tod, Pay2Dwn, Pay2Mee, Pay2Pos, Pay3Up, Pay3Tod, Pay3Dwn, Pay4, Pay4Tod, Pay5, Pay5Tod)');

        QrUpDateCust.SQL.Add('VALUES (:aCustID, :aIDCard, :aBfn, :afName, :alName, :aAdr1, :aAdr2, :aPhone1, :aPhone2, :aMoBile1, :aMoBile2, :aHasCom, :aComment, '+
                           ':aComRnUp, :aComRnDwn, :aComPosUp, :aComPosDwn, :aCom2Up, :aCom2Tod, :aCom2Dwn, :aCom2Mee, :aCom2Pos, :aCom3Up, :aCom3Tod, :aCom3Dwn, :aCom4, :aCom4Tod, :aCom5, :aCom5Tod, '+
                           ':aPayRnUp, :aPayRnDwn, :aPayPosUp, :aPayPosDwn, :aPay2Up, :aPay2Tod, :aPay2Dwn, :aPay2Mee, :aPay2Pos, :aPay3Up, :aPay3Tod, :aPay3Dwn, :aPay4, :aPay4Tod, :aPay5, :aPay5Tod)');

        QrUpDateCust.ParamByName('aCustID').Value  := QrMasterCust.fieldByName('CUSTID').AsString;
        QrUpDateCust.ParamByName('aIDCard').Value  := QrMasterCust.fieldByName('CUSTID').AsString;
        QrUpDateCust.ParamByName('aBfn').Value     := QrMasterCust.fieldByName('BFNAME').AsString;
        QrUpDateCust.ParamByName('afName').Value   := QrMasterCust.fieldByName('FNAME').AsString;
        QrUpDateCust.ParamByName('alName').Value   := QrMasterCust.fieldByName('LNAME').AsString;
        QrUpDateCust.ParamByName('aAdr1').Value    := QrMasterCust.fieldByName('Address1').AsString;
        QrUpDateCust.ParamByName('aAdr2').Value    := QrMasterCust.fieldByName('Address2').AsString;
        QrUpDateCust.ParamByName('aPhone1').Value  := QrMasterCust.fieldByName('PHONE1').AsString;
        QrUpDateCust.ParamByName('aPhone2').Value  := QrMasterCust.fieldByName('Phone2').AsString;
        QrUpDateCust.ParamByName('aMobile1').Value := QrMasterCust.fieldByName('MOBILE1').AsString;
        QrUpDateCust.ParamByName('aMobile2').Value := QrMasterCust.fieldByName('Mobile2').AsString;
        QrUpDateCust.ParamByName('aHasCom').Value  := QrMasterCust.fieldByName('HasCom').AsString;
        QrUpDateCust.ParamByName('aComment').Value := QrMasterCust.fieldByName('COMMENT').AsString;

        QrUpDateCust.ParamByName('aComRnUp').Value   := QrMasterCust.fieldByName('ComRnUp').Value;
        QrUpDateCust.ParamByName('aComRnDwn').Value  := QrMasterCust.fieldByName('ComRnDwn').Value;
        QrUpDateCust.ParamByName('aComPosUp').Value  := QrMasterCust.fieldByName('ComPosUp').Value;
        QrUpDateCust.ParamByName('aComPosDwn').Value := QrMasterCust.fieldByName('ComPosDwn').Value;
        QrUpDateCust.ParamByName('aCom2Up').Value    := QrMasterCust.fieldByName('Com2Up').Value;
        QrUpDateCust.ParamByName('aCom2Tod').Value   := QrMasterCust.fieldByName('Com2Tod').Value;
        QrUpDateCust.ParamByName('aCom2Dwn').Value   := QrMasterCust.fieldByName('Com2Dwn').Value;
        QrUpDateCust.ParamByName('aCom2Mee').Value   := QrMasterCust.fieldByName('Com2Mee').Value;
        QrUpDateCust.ParamByName('aCom2Pos').Value   := QrMasterCust.fieldByName('Com2Pos').Value;
        QrUpDateCust.ParamByName('aCom3Up').Value    := QrMasterCust.fieldByName('Com3Up').Value;
        QrUpDateCust.ParamByName('aCom3Tod').Value   := QrMasterCust.fieldByName('Com3Tod').Value;
        QrUpDateCust.ParamByName('aCom3Dwn').Value   := QrMasterCust.fieldByName('Com3Dwn').Value;
        QrUpDateCust.ParamByName('aCom4').Value      := QrMasterCust.fieldByName('Com4').Value;
        QrUpDateCust.ParamByName('aCom4Tod').Value   := QrMasterCust.fieldByName('Com4Tod').Value;
        QrUpDateCust.ParamByName('aCom5').Value      := QrMasterCust.fieldByName('Com5').Value;
        QrUpDateCust.ParamByName('aCom5Tod').Value   := QrMasterCust.fieldByName('Com5Tod').Value;

        QrUpDateCust.ParamByName('aPayRnUp').Value   := QrMasterCust.fieldByName('PayRnUp').Value;
        QrUpDateCust.ParamByName('aPayRnDwn').Value  := QrMasterCust.fieldByName('PayRnDwn').Value;
        QrUpDateCust.ParamByName('aPayPosUp').Value  := QrMasterCust.fieldByName('PayPosUp').Value;
        QrUpDateCust.ParamByName('aPayPosDwn').Value := QrMasterCust.fieldByName('PayPosDwn').Value;
        QrUpDateCust.ParamByName('aPay2Up').Value    := QrMasterCust.fieldByName('Pay2Up').Value;
        QrUpDateCust.ParamByName('aPay2Tod').Value   := QrMasterCust.fieldByName('Pay2Tod').Value;
        QrUpDateCust.ParamByName('aPay2Dwn').Value   := QrMasterCust.fieldByName('Pay2Dwn').Value;
        QrUpDateCust.ParamByName('aPay2Mee').Value   := QrMasterCust.fieldByName('Pay2Mee').Value;
        QrUpDateCust.ParamByName('aPay2Pos').Value   := QrMasterCust.fieldByName('Pay2Pos').Value;
        QrUpDateCust.ParamByName('aPay3Up').Value    := QrMasterCust.fieldByName('Pay3Up').Value;
        QrUpDateCust.ParamByName('aPay3Tod').Value   := QrMasterCust.fieldByName('Pay3Tod').Value;
        QrUpDateCust.ParamByName('aPay3Dwn').Value   := QrMasterCust.fieldByName('Pay3Dwn').Value;
        QrUpDateCust.ParamByName('aPay4').Value      := QrMasterCust.fieldByName('Pay4').Value;
        QrUpDateCust.ParamByName('aPay4Tod').Value   := QrMasterCust.fieldByName('Pay4Tod').Value;
        QrUpDateCust.ParamByName('aPay5').Value      := QrMasterCust.fieldByName('Pay5').Value;
        QrUpDateCust.ParamByName('aPay5Tod').Value   := QrMasterCust.fieldByName('Pay5Tod').Value;
        try
          try
            QrUpDateCust.ExecSQL;
          except
          end;
        except
        end;

        QrMasterCust.Next;
      end;

     except
      Showmessage('ไม่สามารถอัพเดทรายชื่อลูกค้า กรุณาตรวจสอบการเชื่อมต่อ');
     end;

    try
      ServerDB.Close;
    except
    end;
    QrUpDateCust := nil;
    QrMasterCust := nil;
    Progress1.Visible := false;
    FindBtnClick(Sender);
  end;
end;

procedure TfrmCustList.CbCustVisibleChange(Sender: TObject);
begin
  FindBtnClick(Sender);
end;

end.
