unit uCorectNum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, se_controls, KsSkinButtons, NiceGrid, ExtCtrls;

type
  TfrmCorectNum = class(TForm)
    PanelNameCor: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    NGridCorrect: TNiceGrid;
    ProcessBtn: TSeSkinButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCorectNum: TfrmCorectNum;

implementation

{$R *.dfm}

end.
