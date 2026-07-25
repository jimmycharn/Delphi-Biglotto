program LuckyNumber;

uses
  Forms,
  uMain in 'uMain.pas' {fMain},
  Utils in 'Utils.pas',
  uDm in 'uDm.pas' {Dm: TDataModule},
  ufrmCust in 'ufrmCust.pas' {frmCust},
  uCustList in 'uCustList.pas' {frmCustList},
  uFindCust in 'uFindCust.pas' {frmFindCust},
  ufrmFindRef in 'ufrmFindRef.pas' {frmFindRef},
  uPrintCutPrev in 'uPrintCutPrev.pas' {frmPrintCutPrev},
  uNum in 'uNum.pas',
  uFindDealer in 'uFindDealer.pas' {frmFindDealer},
  ufrmLogin in 'ufrmLogin.pas' {frmLogin},
  MyUnit in 'MyUnit.pas',
  CheckPrevious in 'CheckPrevious.pas',
  uSplash in 'uSplash.pas' {frmSplash};

{$R *.res}

begin
 if not CheckPrevious.RestoreIfRunning(Application.Handle, 1) then
 begin
  Application.Initialize;
  FrmSplash := TFrmSplash.Create(Application);
  FrmSplash.Show;
  FrmSplash.Update;  
  Application.HelpFile := 'K:\Delphi\Project\LuckyNumber2011\LUCKYNUM.HLP';
  Application.CreateForm(TDm, Dm);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TfrmCust, frmCust);
  Application.CreateForm(TfrmCustList, frmCustList);
  Application.CreateForm(TfrmFindCust, frmFindCust);
  Application.CreateForm(TfrmFindRef, frmFindRef);
  Application.CreateForm(TfrmPrintCutPrev, frmPrintCutPrev);
  Application.CreateForm(TfrmFindDealer, frmFindDealer);
  FrmSplash.Hide;
  FrmSplash.Free;
  Application.Run;
 end;
end.
