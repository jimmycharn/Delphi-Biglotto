program BigLotto;

uses
  Forms,
  uMain in 'uMain.pas' {fMain},
  Utils in 'Utils.pas',
  uDm in 'uDm.pas' {Dm: TDataModule},
  ufrmCust in 'ufrmCust.pas' {frmCust},
  uCustList in 'uCustList.pas' {frmCustList},
  uFindServCust in 'uFindServCust.pas' {frmFindServCust},
  ufrmFindRef in 'ufrmFindRef.pas' {frmFindRef},
  uPrintCutPrev in 'uPrintCutPrev.pas' {frmPrintCutPrev},
  uNum in 'uNum.pas',
  uFindDealer in 'uFindDealer.pas' {frmFindDealer},
  ufrmLogin in 'ufrmLogin.pas' {frmLogin},
  MyUnit in 'MyUnit.pas',
  CheckPrevious in 'CheckPrevious.pas',
  uSplash in 'uSplash.pas' {frmSplash},
  uAbout in 'UAbout.pas' {fAbout},
  uRegis in 'uRegis.pas' {fRegis},
  ufrmToDBServ in 'ufrmToDBServ.pas' {fSendToServ},
  uFindCust in 'uFindCust.pas' {frmFindCust},
  uConfirmPass in 'uConfirmPass.pas' {frmConfirmPass},
  uUserProp in 'uUserProp.pas' {frmUserProp},
  USit in 'USit.pas' {frmSit},
  uAddHuad in 'uAddHuad.pas' {frmAddLotto},
  uPrintAllPrev in 'uPrintAllPrev.pas' {frmPrintAllPrev},
  uDealerList in 'uDealerList.pas' {frmDealerList},
  ufrmDealer in 'ufrmDealer.pas' {frmDealer},
  uPrintPrev in 'uPrintPrev.pas' {frmPrintPrev},
  uShowCut in 'uShowCut.pas' {fShowCut},
  uImportfilelist in 'uImportfilelist.pas' {fIptFilelist},
  ufrmHuad in 'ufrmHuad.pas' {frmHuad},
  uCutByChart in 'uCutByChart.pas' {frmCutByChart},
  uSelectCut in 'uSelectCut.pas' {frmSelectCut},
  uFInputText in 'uFInputText.pas' {frmInputText},
  hddinfo in 'hddinfo.pas',
  UEncrypt in 'UEncrypt.pas',
  uMove in 'uMove.pas' {frmMove},
  uCorectNum in 'uCorectNum.pas' {frmCorectNum},
  uEditInput in 'uEditInput.pas' {frmEditInput},
  uIncExp in 'uIncExp.pas' {frmIncExp},
  uLottoParser in 'uLottoParser.pas',
  uLicense in 'uLicense.pas',
  ufrmRegister in 'ufrmRegister.pas' {frmRegister},
  ufrmKeyGen in 'ufrmKeyGen.pas' {frmKeyGen},
  uLottoCalc in 'uLottoCalc.pas',
  uChart in 'uChart.pas' {frmChart},
  uEditNumPrice in 'uEditNumPrice.pas' {frmPasteNumPrice},
  SerialGenerator in 'SerialGenerator.pas';

{$R *.res}

begin
 if not CheckPrevious.RestoreIfRunning(Application.Handle, 1) then
 begin
  Application.Initialize;
  FrmSplash := TFrmSplash.Create(Application);
  FrmSplash.Show;
  FrmSplash.Update;  
  try
    Application.Title := 'Biglotto';
    Application.HelpFile := 'BIGLOTTO.HLP';
    Application.CreateForm(TDm, Dm);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TfrmCust, frmCust);
  Application.CreateForm(TfrmCustList, frmCustList);
  Application.CreateForm(TfrmFindServCust, frmFindServCust);
  Application.CreateForm(TfrmFindRef, frmFindRef);
  Application.CreateForm(TfrmPrintCutPrev, frmPrintCutPrev);
  Application.CreateForm(TfrmFindDealer, frmFindDealer);
  Application.CreateForm(TfAbout, fAbout);
  Application.CreateForm(TfRegis, fRegis);
  Application.CreateForm(TfSendToServ, fSendToServ);
  Application.CreateForm(TfrmFindCust, frmFindCust);
  Application.CreateForm(TfrmConfirmPass, frmConfirmPass);
  Application.CreateForm(TfrmUserProp, frmUserProp);
  Application.CreateForm(TfrmSit, frmSit);
  Application.CreateForm(TfrmAddLotto, frmAddLotto);
  Application.CreateForm(TfrmPrintAllPrev, frmPrintAllPrev);
  Application.CreateForm(TfrmDealerList, frmDealerList);
  Application.CreateForm(TfrmDealer, frmDealer);
  Application.CreateForm(TfrmPrintPrev, frmPrintPrev);
  Application.CreateForm(TfShowCut, fShowCut);
  Application.CreateForm(TfIptFilelist, fIptFilelist);
  Application.CreateForm(TfrmHuad, frmHuad);
  Application.CreateForm(TfrmCutByChart, frmCutByChart);
  Application.CreateForm(TfrmSelectCut, frmSelectCut);
  Application.CreateForm(TfrmInputText, frmInputText);
  Application.CreateForm(TfrmMove, frmMove);
  Application.CreateForm(TfrmCorectNum, frmCorectNum);
  Application.CreateForm(TfrmEditInput, frmEditInput);
  Application.CreateForm(TfrmIncExp, frmIncExp);
  Application.CreateForm(TfrmChart, frmChart);
  Application.CreateForm(TfrmPasteNumPrice, frmPasteNumPrice);
  finally
    FrmSplash.Hide;
    FrmSplash.Free;
  end;
  Application.Run;
 end;
end.
