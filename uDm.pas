unit uDm;

interface

uses
  SysUtils, Classes, Controls, DB, ABSMain, Dialogs, IniFiles, Forms, Variants, ZConnection, ZDataset, ZDbcIntfs,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractConnection;

type
  TDm = class(TDataModule)
    Database: TABSDatabase;
    QrData: TABSQuery;
    dsData: TDataSource;
    QrData1: TABSQuery;
    Lotto: TABSTable;
    Limit3: TABSQuery;
    DsLimit3: TDataSource;
    Limit3LimitDate: TDateField;
    Limit3LotType: TSmallintField;
    Limit3Num: TStringField;
    Limit3Limit1: TBooleanField;
    Limit3Price1: TFloatField;
    Limit3Limit2: TBooleanField;
    Limit3Price2: TFloatField;
    Limit3Limit3: TBooleanField;
    Limit3Price3: TFloatField;
    Limit3Limit4: TBooleanField;
    Limit3Price4: TFloatField;
    Limit3Limit5: TBooleanField;
    Limit3Price5: TFloatField;
    Limit3Limit6: TBooleanField;
    Limit3Price6: TFloatField;
    Limit3Limit7: TBooleanField;
    Limit3Price7: TFloatField;
    QrLocateNum: TABSQuery;
    TbLocateNum: TABSTable;
    TbLocateNumID: TAutoIncField;
    TbLocateNumLimitDate: TDateField;
    TbLocateNumLotType: TSmallintField;
    TbLocateNumNum: TStringField;
    TbLocateNumLimit1: TBooleanField;
    TbLocateNumPrice1: TFloatField;
    TbLocateNumLimit2: TBooleanField;
    TbLocateNumPrice2: TFloatField;
    TbLocateNumLimit3: TBooleanField;
    TbLocateNumPrice3: TFloatField;
    TbLocateNumLimit4: TBooleanField;
    TbLocateNumPrice4: TFloatField;
    TbLocateNumLimit5: TBooleanField;
    TbLocateNumPrice5: TFloatField;
    TbLocateNumLimit6: TBooleanField;
    TbLocateNumPrice6: TFloatField;
    TbLocateNumLimit7: TBooleanField;
    TbLocateNumPrice7: TFloatField;
    TAllData: TABSTable;
    ExportDB: TABSDatabase;
    ServLotto: TABSTable;
    ServCust: TABSTable;
    TbCust: TABSTable;
    ServLastCust: TABSTable;
    ABSUsers: TABSTable;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    ZExecQuery: TZQuery;
    OpenDmDialog: TOpenDialog;
    ServerDB: TABSDatabase;
    QrAddCol: TABSQuery;
    DateField1: TDateField;
    SmallintField1: TSmallintField;
    StringField1: TStringField;
    BooleanField1: TBooleanField;
    FloatField1: TFloatField;
    BooleanField2: TBooleanField;
    FloatField2: TFloatField;
    BooleanField3: TBooleanField;
    FloatField3: TFloatField;
    BooleanField4: TBooleanField;
    FloatField4: TFloatField;
    BooleanField5: TBooleanField;
    FloatField5: TFloatField;
    BooleanField6: TBooleanField;
    FloatField6: TFloatField;
    BooleanField7: TBooleanField;
    FloatField7: TFloatField;
    procedure QrDataBeforeDelete(DataSet: TDataSet);
    procedure QrDataAfterDelete(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure Limit3NumValidate(Sender: TField);
    procedure Limit3BeforePost(DataSet: TDataSet);
    procedure Limit3AfterPost(DataSet: TDataSet);
    procedure DsLimit3DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    ConnectionErrorMsg: string;
    ServerIPConfig: string;
    DBPathConfig: string;
  end;

var
  Dm: TDm;
  TotalRecFree: integer;

implementation

uses uMain;

{$R *.dfm}

procedure TDm.QrDataBeforeDelete(DataSet: TDataSet);
Var i: integer;
begin
  with fMain do
  begin
    with NiceGrid3 do
    for i := RowCount-1 Downto 0 do
    begin
      if NiceGrid3[0,i] = QrData.fieldByname('Id').AsString then
      begin
        DeleteRow(i);
      end;
    end;
  end;
end;

procedure TDm.QrDataAfterDelete(DataSet: TDataSet);
begin
    QrData.Close;
    try
      QrData.Open;
    except
    end;
end;

procedure ReadDatabaseConfig(const IniFile: string; var ServerIP, DBPath: string);
var
  SL: TStringList;
  i: Integer;
  line, key, val, currentSection: string;
  FoundDatabaseSection: Boolean;
begin
  ServerIP := '127.0.0.1';
  DBPath   := ExtractFilePath(ParamStr(0)) + 'DB\BIGLOTTO.FDB';
  FoundDatabaseSection := False;

  if not FileExists(IniFile) then Exit;

  SL := TStringList.Create;
  try
    try
      SL.LoadFromFile(IniFile);
      currentSection := '';
      for i := 0 to SL.Count - 1 do
      begin
        line := Trim(SL[i]);
        if (i = 0) and (Length(line) >= 3) and (Ord(line[1]) = $EF) and (Ord(line[2]) = $BB) and (Ord(line[3]) = $BF) then
          Delete(line, 1, 3);
        line := Trim(line);

        if (line = '') or (line[1] = ';') or (line[1] = '#') then Continue;

        if (line[1] = '[') and (line[Length(line)] = ']') then
        begin
          currentSection := UpperCase(Copy(line, 2, Length(line) - 2));
          if currentSection = 'DATABASE' then
            FoundDatabaseSection := True;
          Continue;
        end;

        if Pos('=', line) > 0 then
        begin
          key := UpperCase(Trim(Copy(line, 1, Pos('=', line) - 1)));
          val := Trim(Copy(line, Pos('=', line) + 1, Length(line)));

          if currentSection = 'DATABASE' then
          begin
            if (key = 'SERVERIP') or (key = 'IP') or (key = 'HOST') or (key = 'SERVER') then
              if val <> '' then ServerIP := val;

            if (key = 'DBPATH') or (key = 'DATABASE') or (key = 'PATH') then
              if val <> '' then DBPath := val;
          end
          else if (currentSection = 'DB') and (not FoundDatabaseSection) then
          begin
            if (key = 'SERVERIP') or (key = 'IP') or (key = 'HOST') or (key = 'SERVER') then
              if val <> '' then ServerIP := val;

            if (key = 'DBPATH') or (key = 'DATABASE') or (key = 'PATH') then
              if val <> '' then DBPath := val;
          end;
        end;
      end;
    except
    end;
  finally
    SL.Free;
  end;

  // Sanity check: If DBPath points to a .LUX file (Absolute Database), redirect to Firebird .FDB
  if UpperCase(ExtractFileExt(DBPath)) = '.LUX' then
    DBPath := ExtractFilePath(ParamStr(0)) + 'DB\BIGLOTTO.FDB';
end;

procedure TDm.DataModuleCreate(Sender: TObject);
var
  IniPath, ServerIP, DBPath: string;
begin
  Database.SilentMode := True;
  if Database.DatabaseFileName = '' then
  begin
    if FileExists(ExtractFilePath(ParamStr(0)) + 'LNUM.LUX') then
      Database.DatabaseFileName := ExtractFilePath(ParamStr(0)) + 'LNUM.LUX'
    else if FileExists(ExtractFilePath(ParamStr(0)) + 'Data\LNUM.LUX') then
      Database.DatabaseFileName := ExtractFilePath(ParamStr(0)) + 'Data\LNUM.LUX';
  end;
  ConnectionErrorMsg := '';
  Database.SilentMode := True;
  ExportDB.SilentMode := True;
  ServerDB.SilentMode := True;

  IniPath := ExtractFilePath(ParamStr(0)) + 'BigLotto.ini';
  ReadDatabaseConfig(IniPath, ServerIP, DBPath);

  ServerIPConfig := ServerIP;
  DBPathConfig   := DBPath;

  // Smart path normalization for ZeosDBO
  if (Pos(':', DBPath) > 2) and (Copy(DBPath, 2, 1) <> ':') then
  begin
    ServerIP := Copy(DBPath, 1, Pos(':', DBPath) - 1);
    DBPath   := Copy(DBPath, Pos(':', DBPath) + 1, Length(DBPath));
  end;

  ZConnection1.Connected := False;
  ZConnection1.Protocol  := 'firebird';
  ZConnection1.HostName  := ServerIP;
  ZConnection1.Database  := DBPath;
  ZConnection1.User      := 'SYSDBA';
  ZConnection1.Password  := 'aB360110162';
  ZConnection1.Port      := 3050;
  
  ZConnection1.Properties.Clear;
  ZConnection1.Properties.Add('codepage=WIN874');
  ZConnection1.Properties.Add('timeout=3');
  ZConnection1.Properties.Add('connect_timeout=3');
  ZConnection1.TransactIsolationLevel := tiReadCommitted;
  ZConnection1.AutoCommit := True;
  
  ZConnection1.LibraryLocation := ExtractFilePath(ParamStr(0)) + 'fbclient.dll';
  
  try
    ZConnection1.Connect;
  except
    on E: Exception do
    begin
      ConnectionErrorMsg := E.Message;
    end;
  end;
end;

procedure TDm.Limit3NumValidate(Sender: TField);
Var found: Boolean;
begin
  with fMain,Dm do
  found := (length(Limit3Num.Value) = Maxlen)and(TbLocateNum.Locate('LimitDate; LotType; Num',VarArrayOf([DateToStr(DatePick.Date),StrToInt(edLotID.Text), Limit3Num.Value]),[]));

  if (Limit3Num.Value = null)or(length(Limit3Num.Value) > Maxlen)or(length(Limit3Num.Value) < Maxlen)or(found) then
  begin
    if found then
      raise Exception.Create('เลขที่ต้องการเพิ่มเข้าในรายการอั้นมีอยู่แล้ว')
    else
      raise Exception.Create('กรุณาป้อนตัวเลขให้ถูกต้อง');
  end;
end;

procedure TDm.Limit3BeforePost(DataSet: TDataSet);
begin
  Limit3LimitDate.Value := DateSpecNum;//MainDate;
  Limit3LotType.Value   := LottoID;
end;

procedure TDm.Limit3AfterPost(DataSet: TDataSet);
begin
  TbLocateNum.Close;
  try
    tbLocateNum.Open;
  except
  end;

  QrLocateNum.Close;
  QrLocateNum.ParamByName('mDate').Value  := DateSpecNum;
  QrLocateNum.ParamByName('mLotID').Value := LottoID;
  try
    QrLocateNum.Open;
  except
  end;
end;

procedure TDm.DsLimit3DataChange(Sender: TObject; Field: TField);
begin
  //with fMain do
    //label26.Caption := IntToStr(DsLimit3.DataSet.RecordCount)+' รายการ';
    //AltGridL3.DataSource.DataSet.RecordCount)+' รายการ';
end;

end.
