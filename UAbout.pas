unit UAbout;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, Graphics,
  Dialogs, StdCtrls, KsSkinButtons, se_controls, jpeg, ExtCtrls, siComp,ShellAPI;

const
  //SeedKey = 53269;
  SeedKey = 10162;


type
  TfAbout = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SeSkinButton1: TSeSkinButton;
    lbHelp: TsiLabel;
    Label7: TLabel;
    Label8: TLabel;
    LbDateExpr: TLabel;
    lbFacebook: TsiLabel;
    Label9: TLabel;
    Label10: TLabel;
    lbWebsite: TsiLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    lbBuild: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Image2: TImage;
    procedure lbHelpMouseEnter(Sender: TObject);
    procedure lbHelpMouseLeave(Sender: TObject);
    procedure lbHelpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lbFacebookClick(Sender: TObject);
    procedure lbFacebookMouseEnter(Sender: TObject);
    procedure lbFacebookMouseLeave(Sender: TObject);
    procedure lbWebsiteClick(Sender: TObject);
    procedure lbWebsiteMouseEnter(Sender: TObject);
    procedure lbWebsiteMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAbout: TfAbout;

implementation

uses MyUnit, uMain, Utils, UEncrypt, SerialGenerator;

{$R *.dfm}

procedure TfAbout.lbHelpMouseEnter(Sender: TObject);
begin
   lbHelp.Font.Style := [fsUnderline,fsBold];
end;

procedure TfAbout.lbHelpMouseLeave(Sender: TObject);
begin
   lbHelp.Font.Style := [fsBold];
end;

procedure TfAbout.lbHelpClick(Sender: TObject);
begin
  WinExec(Pchar('rundll32 url.dll,FileProtocolHandler mailto:thailuckysoft@gmail.com'),WS_MAXIMIZE);
  //ShellExecute(Handle, 'open', PChar('http://www.thai.net/Prayadsoft/index.htm'), nil, nil, SW_SHOW);
  //http://www.facebook.com/home.php?sk=group_128748540512069&ap=1#!/home.php?sk=group_128748540512069&ap=1

 end;

procedure TfAbout.FormShow(Sender: TObject);
Var ExprDate: TDateTime;
    Years, Months, Dates: Word;
    LenDate: integer;
    StrDate,StrKey,RegKey: String;
    HardwareID: string;
    SerialNo: string;
    SerialInfo: TSerialInfo;
begin
    lbBuild.Caption := GetAppVersion;
    HardwareID := GetHardwareID;
    SerialNo := Trim(AppKey);
    if (SerialNo = '') then
    begin
      LbDateExpr.Caption := 'ทดลองใช้งาน';
      Exit;
    end
    else
    begin
      SerialInfo := ValidateSerialWithExpiry(HardwareID, SerialNo);
      if not(SerialInfo.IsValid) Or SerialInfo.IsExpired then
      begin
        LbDateExpr.Caption := 'ทดลองใช้งาน';
        Exit;
      end
      else
        LbDateExpr.Caption := DateToStr(SerialInfo.ExpiryDate)+' เหลืออีก: ' + IntToStr(SerialInfo.DaysRemaining) + ' วัน';
    end;
end;

procedure TfAbout.lbFacebookClick(Sender: TObject);
begin
  //ShellExecute(Handle, 'open', PChar('http://www.facebook.com/home.php?sk=group_128748540512069&ap=1#!/home.php?sk=group_128748540512069&ap=1'), nil, nil, SW_SHOW);
  //////ShellExecute(Handle, 'open', PChar('http://www.facebook.com/pages/%E0%B9%82%E0%B8%9B%E0%B8%A3%E0%B9%81%E0%B8%81%E0%B8%A3%E0%B8%A1-Big-Lotto/192616437428221?sk=wall'), nil, nil, SW_SHOW);

  //http://www.facebook.com/home.php?sk=group_128748540512069&ap=1#!/home.php?sk=group_128748540512069&ap=1

  //ShellExecute(Handle, 'open', PChar('http://www.facebook.com/pages/Thailuckysoft-โปรแกรมบริหารจัดการหวย/410605485637319'), nil, nil, SW_SHOW);
  //ShellExecute(Handle, 'open', PChar('https://www.facebook.com/%E0%B9%82%E0%B8%9B%E0%B8%A3%E0%B9%81%E0%B8%81%E0%B8%A3%E0%B8%A1-Big-Lotto-192616437428221'), nil, nil, SW_SHOW);

  ShellExecute(Handle, 'open', PChar('https://fb.me/ThaiBiglotto'), nil, nil, SW_SHOW);
end;

procedure TfAbout.lbFacebookMouseEnter(Sender: TObject);
begin
  lbFacebook.Font.Style := [fsUnderline, fsBold];
end;

procedure TfAbout.lbFacebookMouseLeave(Sender: TObject);
begin
  lbFacebook.Font.Style := [fsBold];
end;

procedure TfAbout.lbWebsiteClick(Sender: TObject);
begin
  //ShellExecute(Handle, 'open', PChar('https://sites.google.com/site/luckysoftteam/'), nil, nil, SW_SHOW);
  //ShellExecute(Handle, 'open', PChar('http://www.thailottosoft.com'), nil, nil, SW_SHOW);
  ShellExecute(Handle, 'open', PChar('https://sites.google.com/view/thailottosoft'), nil, nil, SW_SHOW);
end;

procedure TfAbout.lbWebsiteMouseEnter(Sender: TObject);
begin
  lbWebsite.Font.Style := [fsUnderline, fsBold];
end;

procedure TfAbout.lbWebsiteMouseLeave(Sender: TObject);
begin
  lbWebsite.Font.Style := [fsBold];
end;

end.
