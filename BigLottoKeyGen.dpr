program BigLottoKeyGen;

uses
  Forms,
  ufrmKeyGen in 'ufrmKeyGen.pas' {frmKeyGen},
  uLicense in 'uLicense.pas',
  hddinfo in 'hddinfo.pas';

begin
  Application.Initialize;
  Application.Title := 'BigLotto Key Generator';
  Application.CreateForm(TfrmKeyGen, frmKeyGen);
  Application.Run;
end.
