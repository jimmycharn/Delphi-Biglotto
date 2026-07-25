unit USit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, se_controls, KsSkinCheckBoxs, KsSkinButtons, ExtCtrls;

type
  TfrmSit = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SeSkinButton1: TSeSkinButton;
    SeSkinButton2: TSeSkinButton;
    ChkCanAddCust: TSeSkinCheckBox;
    ChkConfig: TSeSkinCheckBox;
    ChkInput: TSeSkinCheckBox;
    ChkCut: TSeSkinCheckBox;
    ChkUndo: TSeSkinCheckBox;
    ChkPrintCut: TSeSkinCheckBox;
    ChkEditCorrectNum: TSeSkinCheckBox;
    ChkExportExcel: TSeSkinCheckBox;
    ChkPrintCorrect: TSeSkinCheckBox;
    ChkImportExcel: TSeSkinCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSit: TfrmSit;

implementation

{$R *.dfm}

end.
