unit uDealerList;

interface

uses
  ZDataset,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AppEvnts, ComCtrls, SortListViews, StdCtrls, DB, ADODB,
  ExtCtrls, ImgList, Buttons, PngBitBtn, ABSMain;

type
  TfrmDealerList = class(TForm)
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDealerList: TfrmDealerList;

implementation

uses uDm, ufrmCust, Utils, ufrmDealer;

{$R *.dfm}

procedure TfrmDealerList.FindBtnClick(Sender: TObject);
var ZQFindDealer : TZQuery;
    i: integer;
    BfStr, SearchText: string;
begin
  with Dm do
  begin
    CustList.Clear;
    CustList.Items.BeginUpdate;
    try
      if not ZConnection1.Connected then Exit;

      ZQFindDealer := TZQuery.Create(nil);
      try
        ZQFindDealer.Connection := ZConnection1;
        SearchText := Trim(EditFindCust.Text);
        if SearchText = '' then
          ZQFindDealer.SQL.Text := 'SELECT * FROM DEALER ORDER BY CODE ASC'
        else
          ZQFindDealer.SQL.Text := 'SELECT * FROM DEALER WHERE (COALESCE(FNAME,'''') || '' '' || COALESCE(LNAME,'''') || '' '' || COALESCE(CODE,'''')) LIKE ' + QuotedStr('%' + SearchText + '%') + ' ORDER BY CODE ASC';

        try
          ZQFindDealer.Open;
          if ZQFindDealer.Active and (not ZQFindDealer.IsEmpty) then
          begin
            ZQFindDealer.First;
            i := 0;
            while not ZQFindDealer.Eof do
            begin
              BfStr := ZQFindDealer.FieldByName('BFNAME').AsString;

              with CustList.Items.Add do
              begin
                if BfStr = 'นาย' then ImageIndex := 0
                else if BfStr = 'นาง' then ImageIndex := 1
                else if (BfStr = 'ด.ช.') or (BfStr = 'ด.ญ.') then ImageIndex := 2
                else if BfStr = 'นางสาว' then ImageIndex := 3
                else ImageIndex := 4;

                Caption := ZQFindDealer.FieldByName('CODE').AsString;
                SubItems.Add(Trim(ZQFindDealer.FieldByName('FNAME').AsString + ' ' + ZQFindDealer.FieldByName('LNAME').AsString));
                if ZQFindDealer.FieldByName('HASCOM').AsInteger > 0 then SubItems.Add('มี') else SubItems.Add('ไม่มี');
                Inc(i);
              end;
              ZQFindDealer.Next;
            end;
          end;
        except
        end;
      finally
        ZQFindDealer.Free;
      end;
    finally
      CustList.Items.EndUpdate;
    end;
  end;
end;

procedure TfrmDealerList.EditBtnClick(Sender: TObject);
Var CustID : String;
begin

  With frmDealer,CustList do
  begin
    if (UpperCase(Items[Selected.Index].Caption) <> 'C00000') then
    begin
      CbBfn.ItemIndex := 4;
      CbBfn.Enabled := true;
      EdfName.Enabled := true;
      EdlName.Enabled := true;
      MmoAdr1.Enabled := true;
      EdPhone1.Enabled := true;
      EdMobile1.Enabled := true;
      RdgState.ItemIndex := 1;
      EdCode.Text := Items[Selected.Index].Caption;//CustID;
      Showmodal;
      FindBtnClick(Sender);
    end
    else
    begin
      CbBfn.ItemIndex := -1;
      CbBfn.Enabled := false;
      EdfName.Enabled := false;
      EdlName.Enabled := false;
      MmoAdr1.Enabled := false;
      EdPhone1.Enabled := false;
      EdMobile1.Enabled := false;
      RdgState.ItemIndex := 1;
      EdCode.Text := Items[Selected.Index].Caption;//CustID;
      Showmodal;
     //Showmessage('ขออภัยครับ รายการนี้ไม่สามารถแก้ไขได้');
    end;
  end;
end;

procedure TfrmDealerList.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  EditBtn.Enabled := CustList.SelCount > 0;
  DelBtn.Enabled := CustList.SelCount > 0;
end;

procedure TfrmDealerList.CustListDblClick(Sender: TObject);
begin
  if CustList.SelCount > 0 then
    EditBtnClick(Sender);
end;

procedure TfrmDealerList.AddBtnClick(Sender: TObject);
var ZQLastCode : TZQuery;
    LastCodeStr : string;
begin
  with Dm do
  begin
    LastCodeStr := '';
    if ZConnection1.Connected then
    begin
      ZQLastCode := TZQuery.Create(nil);
      try
        ZQLastCode.Connection := ZConnection1;
        ZQLastCode.SQL.Text := 'SELECT MAX(CODE) AS LASTCODE FROM DEALER';
        try
          ZQLastCode.Open;
          if ZQLastCode.Active and (not ZQLastCode.IsEmpty) then
          begin
            LastCodeStr := ZQLastCode.FieldByName('LASTCODE').AsString;
          end;
        except
        end;
      finally
        ZQLastCode.Free;
      end;
    end;

    With frmDealer do
    begin
      EdCode.Enabled := true;
      ComChk.Checked := true;
      ComChk.Enabled := true;
      CbBfn.Enabled := true;
      EdfName.Enabled := true;
      EdlName.Enabled := true;
      MmoAdr1.Enabled := true;
      EdPhone1.Enabled := true;
      EdMobile1.Enabled := true;
      RdgState.ItemIndex := 0;
      EdCode.Text := AutoNum(LastCodeStr);
      Showmodal;
    end;
  end;
end;

procedure TfrmDealerList.DelBtnClick(Sender: TObject);
var ZQDelDealer : TZQuery;
    CodeToDelete : string;
begin
  with CustList, Dm do
  begin
    if Selected = nil then Exit;

    if MessageDlg('ต้องการลบเจ้ามือ  "' + Items[Selected.Index].Caption + '  ' + Items[Selected.Index].SubItems[0] + '"  หรือไม่?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      if UpperCase(Items[Selected.Index].Caption) = '0001' then
        Showmessage('ขออภัย รายการนี้ไม่สามารถลบได้')
      else
      begin
        CodeToDelete := Items[Selected.Index].Caption;

        if ZConnection1.Connected then
        begin
          ZQDelDealer := TZQuery.Create(nil);
          try
            ZQDelDealer.Connection := ZConnection1;
            ZQDelDealer.SQL.Text := 'DELETE FROM DEALER WHERE CODE = :aCode';
            ZQDelDealer.ParamByName('aCode').Value := CodeToDelete;
            try
              ZQDelDealer.ExecSQL;
            except
            end;
          finally
            ZQDelDealer.Free;
          end;
        end;

        Items.Delete(Selected.Index);
      end;
    end;
  end;
end;

procedure TfrmDealerList.FormShow(Sender: TObject);
begin
  CustList.Clear;
  FindBtnClick(Sender);
  EditfindCust.SetFocus;
end;

procedure TfrmDealerList.CustListCustomSort(Sender: TObject;
  ColIndex: Integer; Str1, Str2: String; var Res: Integer;
  var Handled: Boolean);
var
  n1, n2: Extended; //Integer;
begin
  if (ColIndex in [2]) then
  begin
    n1 := TxtToFloat(Str1);// StrToFloatDef(Str1, 0);
    n2 := txtToFloat(Str2);//StrToFloatDef(Str2, 0);
    if (n1 = n2)
      then Res := 0 else
    if (n1 > n2)
      then Res := 1
      else Res := -1;
    Handled := True;
  end;
end;

procedure TfrmDealerList.EditFindCustKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    FindBtnClick(Sender);
    EditFindCust.SelectAll;
    Key := #0;  
  end
end;

end.
