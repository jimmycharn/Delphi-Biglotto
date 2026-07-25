unit uUserProp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sEdit, se_controls, KsSkinButtons, KsSkinGroupBoxs,
  ExtCtrls, DB, ADODB, Buttons,ABSMain;

type
  TfrmUserProp = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    RdgSit: TSeSkinRadioGroup;
    BtnSetPass: TSeSkinButton;
    edUsName: TsEdit;
    edName: TsEdit;
    edUserTel: TsEdit;
    edUserAdr: TsEdit;
    edUserEmail: TsEdit;
    SeSkinButton4: TSeSkinButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EdPass: TEdit;
    SeSkinButton1: TSeSkinButton;
    DetailBtn: TSeSkinButton;
    procedure BtnSetPassClick(Sender: TObject);
    procedure DetailBtnClick(Sender: TObject);
    procedure SeSkinButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure SetState(State: Boolean);
    function GetState: Boolean;
  public
    { Public declarations }
    property State: Boolean read GetState write SetState;
  end;

var
  frmUserProp: TfrmUserProp;
  AddNew : Boolean;

implementation

uses uConfirmPass, uDm, USit;

{$R *.dfm}

procedure TfrmUserProp.SetState(State: Boolean);
begin
 AddNew := State;
end;

function TfrmUserProp.GetState: Boolean;
begin
  Result := AddNew;
end;

procedure TfrmUserProp.BtnSetPassClick(Sender: TObject);
begin
   with frmConfirmPass,Dm do
   begin
      if Showmodal = mrOk then
         Edpass.Text := EdCfPass.text;

   end;
end;

procedure TfrmUserProp.DetailBtnClick(Sender: TObject);
Var
   QrSit : TABSQuery;
begin
  try
   With Dm, frmSit do
   begin
      QrSit := TABSQuery.Create(nil);
      try
      except
      end;
      QrSit.DatabaseName := Database.DatabaseName;
      try
        Qrsit.Close;
      except
      end;
      Qrsit.SQL.Clear;
      Qrsit.SQL.Add('Select * from UserConfig');
      QrSit.SQL.Add('Where id =:aId');
      Qrsit.ParamByName('aId').Value := rdgSit.ItemIndex;
      try
        try
          QrSit.Open;
        except
        end;
      except
      end;

      ChkCanAddCust.Checked := Qrsit.FieldByName('CanAddCust').AsBoolean;
      ChkConfig.Checked := Qrsit.FieldByName('CanConfig').AsBoolean;
      ChkInput.Checked := Qrsit.FieldByName('CanInput').AsBoolean;
      ChkCut.Checked := Qrsit.FieldByName('CanCut').AsBoolean;
      ChkUndo.Checked := Qrsit.FieldByName('CanUndoCut').AsBoolean;
      ChkPrintCut.Checked := Qrsit.FieldByName('CanPrintCut').AsBoolean;
      ChkEditCorrectNum.Checked := Qrsit.FieldByName('CanEditCorrectNum').AsBoolean;
      //ChkExportExcel.Checked := Qrsit.FieldByName('CanExportCorrectNum').AsBoolean;
      ChkExportExcel.Checked := Qrsit.FieldByName('CanExport').AsBoolean;
      ChkImportExcel.Checked := Qrsit.FieldByName('CanImport').AsBoolean;
      ChkPrintCorrect.Checked := Qrsit.FieldByName('CanPrintCorrectNum').AsBoolean;
      if Showmodal = mrOk then
      begin
         QrSit.Edit;
         Qrsit.FieldByName('CanAddCust').AsBoolean :=  ChkCanAddCust.Checked;
         Qrsit.FieldByName('CanConfig').AsBoolean := ChkConfig.Checked;
         Qrsit.FieldByName('CanInput').AsBoolean := ChkInput.Checked;
         Qrsit.FieldByName('CanCut').AsBoolean := ChkCut.Checked;
         Qrsit.FieldByName('CanUndoCut').AsBoolean := ChkUndo.Checked;
         Qrsit.FieldByName('CanPrintCut').AsBoolean := ChkPrintCut.Checked;
         Qrsit.FieldByName('CanEditCorrectNum').AsBoolean := ChkEditCorrectNum.Checked;
         //Qrsit.FieldByName('CanExportCorrectNum').AsBoolean := ChkExportExcel.Checked;
         Qrsit.FieldByName('CanExport').AsBoolean := ChkExportExcel.Checked;
         Qrsit.FieldByName('CanImport').AsBoolean := ChkImportExcel.Checked;
         Qrsit.FieldByName('CanPrintCorrectNum').AsBoolean := ChkPrintCorrect.Checked;
         Qrsit.Post;
      end
   end;
  finally
     Qrsit.Free;
  end;


end;

procedure TfrmUserProp.SeSkinButton1Click(Sender: TObject);
Var
   QrFindCode : TABSQuery;
begin

   if (trim(edUsName.Text) <> '') then
   begin
      if AddNew then
      with Dm do
      begin
         QrfindCode := TABSQuery.Create(nil);
         try
         except
         end;
         QrfindCode.DatabaseName := Database.DatabaseName;
         try
           QrfindCode.Close;
         except
         end;
         QrFindCode.SQL.Clear;
         QrfindCode.SQL.Add('Select * from Users');
         QrfindCode.SQL.Add('Where UsName =:aUName');

         QrfindCode.ParamByName('aUName').Value := edUsName.Text;
         try
           try
             QrfindCode.Open;
           except
           end;
         except
         end;

         if QrfindCode.RecordCount > 0 then
         begin
            MessageDlg('ชื่อบัญชีนี้มีอยู่แล้วกรุณาเปลี่ยนชื่อบัญชีใหม่',mtInformation, [mbOk], 0);
            modalresult := mrNone;
         end;
      end;
   end
   else
   begin
      MessageDlg('ชื่อบัญชีไม่ถูกต้องกรุณากรอกใหม่',mtInformation, [mbOk], 0);
      edUsName.SetFocus;
      modalresult := mrNone;
   end;

end;

procedure TfrmUserProp.FormShow(Sender: TObject);
begin
  if AddNew then
    edUsName.SetFocus
  else
    edName.SetFocus;
end;

end.
