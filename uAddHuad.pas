unit uAddHuad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, Spin, se_controls,
  KsSkinButtons, sEdit;

type
  TfrmAddLotto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    edLottoName: TsEdit;
    SeSkinButton1: TSeSkinButton;
    SeSkinButton2: TSeSkinButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddLotto: TfrmAddLotto;

implementation

{$R *.dfm}

procedure TfrmAddLotto.FormShow(Sender: TObject);
begin
   edLottoName.SetFocus;
end;

end.
