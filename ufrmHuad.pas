unit ufrmHuad;

interface

uses
  ZDataset,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, SortListViews, ExtCtrls, StdCtrls, Buttons, PngBitBtn, ABSMain,
  AppEvnts, se_controls, KsSkinButtons, KsSkinCheckBoxs;

type
  TfrmHuad = class(TForm)
    Panel3: TPanel;
    HuadList: TSortListView;
    ApplicationEvents1: TApplicationEvents;
    Panel1: TPanel;
    Panel4: TPanel;
    DeleteBtn: TSeSkinButton;
    ChkSelAll: TSeSkinCheckBox;
    OkBtn: TSeSkinButton;
    SeSkinButton2: TSeSkinButton;
    procedure FormShow(Sender: TObject);
    procedure HuadListDblClick(Sender: TObject);
    procedure HuadListCustomSort(Sender: TObject; ColIndex: Integer; Str1,
      Str2: String; var Res: Integer; var Handled: Boolean);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure ChkSelAllClick(Sender: TObject);
    procedure HuadListClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
  private
    { Private declarations }
    procedure ShowHuad;
  public
    { Public declarations }
  end;

var
  frmHuad: TfrmHuad;

implementation

uses uDm, uMain;

{$R *.dfm}

procedure TfrmHuad.ShowHuad;
var QrFindHuad : TABSQuery;
    ZQFindHuad : TZQuery;
    i, LotNo: integer;
    found : Boolean;
    FoundFB : Boolean;
    LotNameStr : string;
begin
  With Dm, fMain, ComboLotType do
  begin
    Huadlist.Clear;
    Huadlist.Items.BeginUpdate;

    FoundFB := False;
    if ZConnection1.Connected then
    begin
      ZQFindHuad := TZQuery.Create(nil);
      try
        ZQFindHuad.Connection := ZConnection1;
        ZQFindHuad.SQL.Text := 'Select Period_Date, LotType from Data Group By Period_Date, LotType ORDER BY Period_Date DESC';
        try
          ZQFindHuad.Open;
          if ZQFindHuad.Active and (not ZQFindHuad.IsEmpty) then
          begin
            FoundFB := True;
            ZQFindHuad.First;
            while not ZQFindHuad.Eof do
            begin
              LotNo := ZQFindHuad.fieldByName('LotType').AsInteger;
              with Huadlist.Items.Add do
              begin
                Caption := ZQFindHuad.FieldByName('Period_Date').AsString;

                LotNameStr := '';
                if Lotto.Active then
                begin
                  try
                    if Lotto.Locate('ID', LotNo, []) then
                      LotNameStr := Lotto.fieldByName('LotName').AsString;
                  except
                  end;
                end;
                SubItems.Add(LotNameStr);
                SubItems.Add(IntToStr(LotNo));
              end;
              ZQFindHuad.Next;
            end;
          end;
        except
        end;
      finally
        ZQFindHuad.Free;
      end;
    end;

    if not FoundFB then
    begin
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
              LotNo := QrFindHuad.fieldByName('LotType').AsInteger;
              with Huadlist.Items.Add do
              begin
                Caption := QrFindHuad.FieldByName('Period_Date').AsString;

                LotNameStr := '';
                if Lotto.Active then
                begin
                  try
                    if Lotto.Locate('ID', LotNo, []) then
                      LotNameStr := Lotto.fieldByName('LotName').AsString;
                  except
                  end;
                end;
                SubItems.Add(LotNameStr);
                SubItems.Add(IntToStr(LotNo));
              end;
              QrFindHuad.Next;
            end;
          end;
        except
        end;
      finally
        QrFindHuad.Free;
      end;
    end;

    Huadlist.Items.EndUpdate;
  end;
end;

procedure TfrmHuad.FormShow(Sender: TObject);
begin
  ChkSelAll.Checked := false;
  ShowHuad;
end;

procedure TfrmHuad.HuadListDblClick(Sender: TObject);
begin
  if HuadList.SelCount > 0 then
    Modalresult := mrOk;
end;

procedure TfrmHuad.HuadListCustomSort(Sender: TObject; ColIndex: Integer;
  Str1, Str2: String; var Res: Integer; var Handled: Boolean);
Var  n1, n2: TDateTime;
     n3, n4: String;
begin
  if (ColIndex in [0]) then
  begin
    n1 := StrToDate(Str1); //TxtToFloat(Str1);
    n2 := StrToDate(Str2); //txtToFloat(Str2);
    if (n1 = n2)
      then Res := 0 else
    if (n1 > n2)
      then Res := 1
      else Res := -1;
    Handled := True;
  end
  else
  begin
    n3 := Str1; //TxtToFloat(Str1);
    n4 := Str2; //txtToFloat(Str2);
    if (n3 = n4)
      then Res := 0 else
    if (n3 > n4)
      then Res := 1
      else Res := -1;
    Handled := True;
  end;
end;

procedure TfrmHuad.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  OkBtn.Enabled := HuadList.SelCount > 0;
end;

procedure TfrmHuad.ChkSelAllClick(Sender: TObject);
Var i,j: integer;
begin
 if Not HuadList.Focused then
 begin
  with HuadList do
  begin
    for i := 0 to Items.Count-1 do
        Items[i].checked := ChkSelAll.Checked;

    j:=0;
    if Items.Count > 0 then
    begin 
      for i:= 0 to Items.Count-1 do
      begin
          if items[i].Checked = true then
          begin
            inc(j);
          end;
      end;
    end;
    DeleteBtn.Enabled := (j > 0);
  end;
 end;
end;

procedure TfrmHuad.HuadListClick(Sender: TObject);
Var i,j: integer;
begin
  with HuadList do
  begin
    j:=0;
    if Items.Count > 0 then
    begin 
      for i:= 0 to Items.Count-1 do
      begin
          if items[i].Checked = true then
          begin
            inc(j);
          end;
      end;
    end;
    DeleteBtn.Enabled := (j > 0);
    ChkSelAll.Checked := (j = Items.Count);
  end;
end;

procedure TfrmHuad.DeleteBtnClick(Sender: TObject);
var QrDelHuad : TABSQuery;
    i,j: integer;
    found : Boolean;
begin
 With Dm, HuadList do
 begin
  j:=0;
  for i:= 0 to Items.Count-1 do
  begin
    if items[i].Checked = true then
    begin
      inc(j);
    end;
  end;

  if MessageDlg('ต้องลบรายการที่เลือก  "'+IntToStr(j)+'"  รายการ ใช่หรือไม่?',
   mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    QrDelHuad := TABSQuery.Create(nil);
    QrDelHuad.DatabaseName := Database.DatabaseName;
    QrDelHuad.Close;
    for i := Items.Count-1 DownTo 0 do
    begin
      if (Items[i].Checked) then
      begin
        found := Lotto.Locate('LotName',Items[i].SubItems[0],[]);
        if found then
        begin
          QrDelHuad.SQL.Clear;
          QrDelHuad.SQL.Add('Delete from Data');
          QrDelHuad.SQL.Add('Where Period_Date = "'+Items[i].Caption+'"');
          QrDelHuad.SQL.Add('and LotType = "'+Items[i].SubItems[1]+'"');
          try
            QrDelHuad.ExecSQL;
          except
          end;

          QrDelHuad.SQL.Clear;
          QrDelHuad.SQL.Add('Delete from Cut');
          QrDelHuad.SQL.Add('Where DateCut = "'+Items[i].Caption+'"');
          try
            QrDelHuad.ExecSQL;
          except
          end;

          QrDelHuad.SQL.Clear;
          QrDelHuad.SQL.Add('Delete from CorrectNum');
          QrDelHuad.SQL.Add('Where CrDate = "'+Items[i].Caption+'"');
          try
            QrDelHuad.ExecSQL;
          except
          end;

          QrDelHuad.SQL.Clear;
          QrDelHuad.SQL.Add('Delete from LimitNum');
          QrDelHuad.SQL.Add('Where LimitDate = "'+Items[i].Caption+'"');
          try
            QrDelHuad.ExecSQL;
          except
          end;

          Items[i].Delete;
        end;
      end;
    end;
    MessageDlg('ข้อมูลที่เลือกถูกลบเรียบร้อยแล้ว',mtInformation, [mbOk], 0);
  end;
 end;

end;

end.
