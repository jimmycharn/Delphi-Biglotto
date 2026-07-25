unit uEditInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NiceGrid, se_controls, KsSkinButtons, ExtCtrls;

type
  TfrmEditInput = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BtnCancelEdit: TSeSkinButton;
    BtnSaveEdit: TSeSkinButton;
    Panel4: TPanel;
    EditInputGrid: TNiceGrid;
    procedure BtnSaveEditClick(Sender: TObject);
    procedure BtnCancelEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditInput: TfrmEditInput;

implementation

{$R *.dfm}

procedure TfrmEditInput.BtnSaveEditClick(Sender: TObject);
begin
  if editInputGrid.Focused then
    Modalresult := mrNone
  else
    Modalresult := mrOk;
end;

procedure TfrmEditInput.BtnCancelEditClick(Sender: TObject);
begin
  Close;
end;

end.
