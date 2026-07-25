unit uFindCust;

interface

uses
  ZDataset,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, PngSpeedButton, IAsemiPanel, Grids,
  se_controls, KsSkinGroupBoxs, NiceGrid,DB, ADODB, AppEvnts, PngBitBtn,
  ImgList, ComCtrls, SortListViews,ABSMain, Gauges;

type
  TfrmFindCust = class(TForm)
    Panel1: TPanel;
    EditFindCust: TEdit;
    RdgSort: TRadioGroup;
    Panel2: TPanel;
    ApplicationEvents1: TApplicationEvents;
    OkBtn: TPngBitBtn;
    Label1: TLabel;
    FindBtn: TPngSpeedButton;
    ImageList1: TImageList;
    PngBitBtn1: TPngBitBtn;
    updateBtn: TPngBitBtn;
    Progress1: TGauge;
    Panel3: TPanel;
    CustList: TSortListView;
    procedure FindBtnClick(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure CustListDblClick(Sender: TObject);
    procedure EditFindCustKeyPress(Sender: TObject; var Key: Char);
    procedure updateBtnClick(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
    procedure CustListKeyPress(Sender: TObject; var Key: Char);
    //procedure OkBtnClick(Sender: TObject);
    //procedure PngBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFindCust: TfrmFindCust;

implementation

uses uDm, uMain;

{$R *.dfm}

procedure TfrmFindCust.FindBtnClick(Sender: TObject);
var ZQFindCust: TZQuery;
    SortBySQL: String;
    i: integer;
    SearchText, CommentStr: string;
begin
  with Dm, fMain do
  begin
    Case RdgSort.ItemIndex of
      0 : SortBySQL := ' ORDER BY CUSTID ASC';
      1 : SortBySQL := ' ORDER BY FNAME ASC';
    end;

    With CustList do
    begin
      Items.BeginUpdate;
      try
        Clear;
        if not ZConnection1.Connected then Exit;

        ZQFindCust := TZQuery.Create(nil);
        try
          ZQFindCust.Connection := ZConnection1;
          SearchText := Trim(EditFindCust.Text);
          if SearchText = '' then
            ZQFindCust.SQL.Text := 'SELECT * FROM CUST ' + SortBySQL
          else
            ZQFindCust.SQL.Text := 'SELECT * FROM CUST WHERE (COALESCE(FNAME,'''') || '' '' || COALESCE(LNAME,'''') || '' '' || COALESCE(CUSTID,'''')) LIKE ' + QuotedStr('%' + SearchText + '%') + SortBySQL;

          try
            ZQFindCust.Open;
            if ZQFindCust.Active and (not ZQFindCust.IsEmpty) then
            begin
              i := 0;
              ZQFindCust.First;
              while not ZQFindCust.Eof do
              begin
                CommentStr := ZQFindCust.FieldByName('COMMENT').AsString;
                if (LowerCase(Trim(CommentStr)) <> 'invisible') and (Pos('ซ่อน', CommentStr) = 0) then
                begin
                  with Items.Add do
                  begin
                    Caption := ZQFindCust.FieldByName('CUSTID').AsString;
                    SubItems.Add(Trim(ZQFindCust.FieldByName('FNAME').AsString + ' ' + ZQFindCust.FieldByName('LNAME').AsString));
                    SubItems.Add(ZQFindCust.FieldByName('ADDRESS1').AsString);
                    SubItems.Add(ZQFindCust.FieldByName('PHONE1').AsString);
                    Inc(i);
                  end;
                end;
                ZQFindCust.Next;
              end;
            end;
          except
          end;
        finally
          ZQFindCust.Free;
        end;

        if Items.Count > 0 then
        begin
          Selected := Items[0];
          ItemFocused := Items[0];
        end;
      finally
        Items.EndUpdate;
      end;
    end;
  end;
end;

procedure TfrmFindCust.ApplicationEvents1Message(var Msg: tagMSG;
var Handled: Boolean);
begin
  OkBtn.Enabled := CustList.SelCount > 0;
end;

procedure TfrmFindCust.FormShow(Sender: TObject);
begin
  CustList.Clear;
  EditFindcust.Clear;
  FindBtnClick(Sender);
  EditFindcust.SetFocus;
  With fMain do
    updateBtn.Visible := Not IsHost;
end;

procedure TfrmFindCust.CustListDblClick(Sender: TObject);
begin
  if CustList.SelCount > 0 then
    Modalresult := mrOk;
end;

procedure TfrmFindCust.EditFindCustKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    ModalResult := MrNone;
    FindBtnClick(Sender);
    if CustList.Items.Count = 1 then
      ModalResult := mrOK;
  end;
end;

procedure TfrmFindCust.updateBtnClick(Sender: TObject);
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
    
  end;
  FindBtnClick(Sender);
end;

procedure TfrmFindCust.OkBtnClick(Sender: TObject);
begin
  if CustList.SelCount > 0 then
    ModalResult := MrOK
  else
    ModalResult := mrNone;
end;

procedure TfrmFindCust.CustListKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then //Enter
  begin
    Key := #0;
    if CustList.SelCount > 0 then
      ModalResult := mrOk;
  end;

  if Key = #43 then //+
  begin
    Key := #0;
    editFindCust.Clear;
    editFindCust.SetFocus;
  end;
end;

end.

