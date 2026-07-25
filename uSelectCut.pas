unit uSelectCut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, sCustomComboEdit, sCurrEdit, sCurrencyEdit,
  ExtCtrls, se_controls, KsSkinButtons;

type
  TfrmSelectCut = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    RdSelectCut: TRadioGroup;
    edOver: TsCurrencyEdit;
    edLow: TsCurrencyEdit;
    edStart: TsCurrencyEdit;
    Panel3: TPanel;
    edEnd: TsCurrencyEdit;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    SeSkinButton5: TSeSkinButton;
    SeSkinButton1: TSeSkinButton;
    Panel7: TPanel;
    Panel8: TPanel;
    procedure RdSelectCutClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edOverEnter(Sender: TObject);
    procedure edLowEnter(Sender: TObject);
    procedure edStartEnter(Sender: TObject);
    procedure edEndEnter(Sender: TObject);
    procedure edOverKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edLowKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edStartKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelectCut: TfrmSelectCut;
  LastFocus: Byte;

implementation

{$R *.dfm}

procedure TfrmSelectCut.RdSelectCutClick(Sender: TObject);
begin
  Case RdSelectCut.ItemIndex of
    0: edOver.SetFocus;
    1: edLow.SetFocus;
    2:begin
        if LastFocus = 0 then
          edStart.SetFocus
        else
          edEnd.SetFocus;
      end;
  end;
end;

procedure TfrmSelectCut.FormShow(Sender: TObject);
begin

  Case RdSelectCut.ItemIndex of
    0:begin edOver.SetFocus;  edOver.SelectAll;  end;
    1:begin edLow.SetFocus;   edLow.SelectAll;   end;
    2:begin
        if LastFocus = 0 then
        begin
          edStart.SetFocus;
          edStart.SelectAll;
        end
        else
        begin
          edEnd.SetFocus;
          edEnd.SelectAll;
        end;
      end;
  end;
end;

procedure TfrmSelectCut.edOverEnter(Sender: TObject);
begin
  RdSelectCut.ItemIndex := 0;
  edOver.SelectAll;
end;

procedure TfrmSelectCut.edLowEnter(Sender: TObject);
begin
  RdSelectCut.ItemIndex := 1;
  edLow.SelectAll;
end;

procedure TfrmSelectCut.edStartEnter(Sender: TObject);
begin
  LastFocus := 0;
  RdSelectCut.ItemIndex := 2;
  edStart.SelectAll;
end;

procedure TfrmSelectCut.edEndEnter(Sender: TObject);
begin
  LastFocus := 1;
  RdSelectCut.ItemIndex := 2;
  edEnd.SelectAll;
end;

procedure TfrmSelectCut.edOverKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Down then
  begin
    edLow.SetFocus;
    edLow.SelectAll;
  end;
end;

procedure TfrmSelectCut.edLowKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Up then
  begin
    edOver.SetFocus;
    edOver.SelectAll;
  end
  else
  if Key = VK_Down then
  begin
    if LastFocus = 0 then
    begin
      edStart.SetFocus;
      edStart.SelectAll;
    end
    else
    begin
      edEnd.SetFocus;
      edEnd.SelectAll;
    end;
  end;
end;


procedure TfrmSelectCut.edStartKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Up then
  begin
    edLow.SetFocus;
    edLow.SelectAll;
  end
end;

procedure TfrmSelectCut.FormCreate(Sender: TObject);
begin
  LastFocus := 0;
end;

end.
