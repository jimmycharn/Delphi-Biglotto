unit uConfirmPass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, se_controls, KsSkinButtons, sEdit;

type
  TfrmConfirmPass = class(TForm)
    edcfPass: TsEdit;
    edConfirmPass: TsEdit;
    OkBtn: TSeSkinButton;
    SeSkinButton2: TSeSkinButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure edcfPassChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfirmPass: TfrmConfirmPass;

implementation

{$R *.dfm}

procedure TfrmConfirmPass.FormShow(Sender: TObject);
begin
   edCfPass.Clear;
   edConfirmPass.Clear;
   edCfPass.SetFocus;
end;

procedure TfrmConfirmPass.edcfPassChange(Sender: TObject);
begin
   Okbtn.Enabled :=  (edCfpass.Text = edConfirmPass.Text);
end;

end.
