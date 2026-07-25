unit uSplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WallPaper, ExtCtrls, jpeg, AdvShaper, AdvPicture, StdCtrls;

type
  TfrmSplash = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lbBuild: TLabel;
    Shape1: TShape;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure WMSysCommand(var Msg: TMessage); message WM_SYSCOMMAND;
  public
    { Public declarations }
    procedure CreateParams(var Params: TCreateParams);
  end;

var
  frmSplash: TfrmSplash;
  timecnt: integer;

implementation

uses MyUnit, Utils;

{$R *.dfm}

procedure TfrmSplash.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do begin
    ExStyle := ExStyle or WS_EX_APPWINDOW;
    WndParent := GetDesktopwindow;
  end;
end;

procedure TfrmSplash.WMSysCommand(var Msg: TMessage);
begin
  DefaultHandler(Msg);
end;

procedure TfrmSplash.FormCreate(Sender: TObject);
begin
    //Create_Registry;
    SetWindowLong(Application.Handle, GWL_EXSTYLE,
    GetWindowLong(Application.Handle, GWL_EXSTYLE)or
    WS_EX_TOOLWINDOW and not WS_EX_APPWINDOW);
end;

procedure TfrmSplash.FormShow(Sender: TObject);
begin
  lbBuild.Caption := 'Build '+GetAppVersion;
end;

end.
