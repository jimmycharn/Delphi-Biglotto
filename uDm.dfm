object Dm: TDm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 221
  Top = 130
  Height = 522
  Width = 414
  object Database: TABSDatabase
    CurrentVersion = '5.16 '
    DatabaseName = 'LNUM'
    SilentMode = True
    Exclusive = False
    Password = '360110A162'
    HandleShared = True
    MaxConnections = 500
    MultiUser = True
    SessionName = 'Default'
    Left = 40
    Top = 16
  end
  object QrData: TABSQuery
    CurrentVersion = '5.16 '
    DatabaseName = 'LNUM'
    InMemory = False
    ReadOnly = False
    BeforeDelete = QrDataBeforeDelete
    AfterDelete = QrDataAfterDelete
    RequestLive = True
    SQL.Strings = (
      'Select * '
      'from Data')
    Left = 40
    Top = 72
  end
  object dsData: TDataSource
    DataSet = QrData
    Left = 104
    Top = 72
  end
  object QrData1: TABSQuery
    CurrentVersion = '5.16 '
    DatabaseName = 'LNUM'
    InMemory = False
    ReadOnly = True
    SQL.Strings = (
      'Select * '
      'from Data'
      'Order By Num')
    Left = 40
    Top = 136
  end
  object Lotto: TABSTable
    CurrentVersion = '5.16 '
    DatabaseName = 'LNUM'
    InMemory = False
    ReadOnly = False
    TableName = 'Lotto'
    Exclusive = False
    Left = 104
    Top = 136
  end
  object Limit3: TABSQuery
    CurrentVersion = '5.16 '
    DatabaseName = 'LNUM'
    InMemory = False
    ReadOnly = False
    BeforePost = Limit3BeforePost
    AfterPost = Limit3AfterPost
    RequestLive = True
    SQL.Strings = (
      
        'Select L1."LimitDate", L1."LotType", L1."Num", L1."Limit1", L1."' +
        'Price1", L1."PayPcnt1", L1."Limit2", L1."Price2", L1."PayPcnt2",' +
        ' L1."Limit3", L1."Price3", L1."PayPcnt3", L1."Limit4", L1."Price' +
        '4", L1."PayPcnt4", L1."Limit5", L1."Price5", L1."PayPcnt5", L1."' +
        'Limit6", L1."Price6", L1."PayPcnt6", L1."Limit7", L1."Price7", L' +
        '1."PayPcnt7"  from LimitNum L1'
      
        'Where ((length(L1."Num") = :LNum) and (L1."LimitDate" = :aDate) ' +
        'and (L1."LotType" = :aLotID))'
      'Order By ID')
    Left = 40
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'LNum'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'aDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'aLotID'
        ParamType = ptUnknown
      end>
    object Limit3LimitDate: TDateField
      FieldName = 'LimitDate'
    end
    object Limit3LotType: TSmallintField
      FieldName = 'LotType'
    end
    object Limit3Num: TStringField
      FieldName = 'Num'
      OnValidate = Limit3NumValidate
      Size = 5
    end
    object Limit3Limit1: TBooleanField
      FieldName = 'Limit1'
      Required = True
    end
    object Limit3Price1: TFloatField
      FieldName = 'Price1'
    end
      object Limit3Limit2: TBooleanField
      FieldName = 'Limit2'
      Required = True
    end
    object Limit3Price2: TFloatField
      FieldName = 'Price2'
    end
      object Limit3Limit3: TBooleanField
      FieldName = 'Limit3'
      Required = True
    end
    object Limit3Price3: TFloatField
      FieldName = 'Price3'
    end
      object Limit3Limit4: TBooleanField
      FieldName = 'Limit4'
      Required = True
    end
    object Limit3Price4: TFloatField
      FieldName = 'Price4'
    end
      object Limit3Limit5: TBooleanField
      FieldName = 'Limit5'
      Required = True
    end
    object Limit3Price5: TFloatField
      FieldName = 'Price5'
    end
      object Limit3Limit6: TBooleanField
      FieldName = 'Limit6'
      Required = True
    end
    object Limit3Price6: TFloatField
      FieldName = 'Price6'
    end
      object Limit3Limit7: TBooleanField
      FieldName = 'Limit7'
      Required = True
    end
    object Limit3Price7: TFloatField
      FieldName = 'Price7'
    end
    end
  object DsLimit3: TDataSource
    DataSet = Limit3
    OnDataChange = DsLimit3DataChange
    Left = 104
    Top = 192
  end
  object QrLocateNum: TABSQuery
    CurrentVersion = '5.16 '
    DatabaseName = 'LNUM'
    InMemory = False
    ReadOnly = False
    SQL.Strings = (
      'Select * from LimitNum'
      'Where ((LimitDate = :mDate) and (LotType = :mLotID));')
    Left = 40
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'mDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mLotID'
        ParamType = ptUnknown
      end>
  end
  object TbLocateNum: TABSTable
    CurrentVersion = '5.16 '
    DatabaseName = 'LNUM'
    InMemory = False
    ReadOnly = False
    StoreDefs = True
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftAutoInc
      end
      item
        Name = 'LimitDate'
        DataType = ftDate
      end
      item
        Name = 'LotType'
        DataType = ftSmallint
      end
      item
        Name = 'Num'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Limit1'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Price1'
        DataType = ftFloat
      end
      item
        Name = 'Limit2'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Price2'
        DataType = ftFloat
      end
      item
        Name = 'Limit3'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Price3'
        DataType = ftFloat
      end
      item
        Name = 'Limit4'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Price4'
        DataType = ftFloat
      end
      item
        Name = 'Limit5'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Price5'
        DataType = ftFloat
      end
      item
        Name = 'Limit6'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Price6'
        DataType = ftFloat
      end
      item
        Name = 'Limit7'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Price7'
        DataType = ftFloat
      end>
    TableName = 'LimitNum'
    Exclusive = False
    Left = 40
    Top = 304
    object TbLocateNumID: TAutoIncField
      FieldName = 'ID'
    end
    object TbLocateNumLimitDate: TDateField
      FieldName = 'LimitDate'
    end
    object TbLocateNumLotType: TSmallintField
      FieldName = 'LotType'
    end
    object TbLocateNumNum: TStringField
      FieldName = 'Num'
      Size = 5
    end
    object TbLocateNumLimit1: TBooleanField
      FieldName = 'Limit1'
      Required = True
    end
    object TbLocateNumPrice1: TFloatField
      FieldName = 'Price1'
    end
    object TbLocateNumLimit2: TBooleanField
      FieldName = 'Limit2'
      Required = True
    end
    object TbLocateNumPrice2: TFloatField
      FieldName = 'Price2'
    end
    object TbLocateNumLimit3: TBooleanField
      FieldName = 'Limit3'
      Required = True
    end
    object TbLocateNumPrice3: TFloatField
      FieldName = 'Price3'
    end
    object TbLocateNumLimit4: TBooleanField
      FieldName = 'Limit4'
      Required = True
    end
    object TbLocateNumPrice4: TFloatField
      FieldName = 'Price4'
    end
    object TbLocateNumLimit5: TBooleanField
      FieldName = 'Limit5'
      Required = True
    end
    object TbLocateNumPrice5: TFloatField
      FieldName = 'Price5'
    end
    object TbLocateNumLimit6: TBooleanField
      FieldName = 'Limit6'
      Required = True
    end
    object TbLocateNumPrice6: TFloatField
      FieldName = 'Price6'
    end
    object TbLocateNumLimit7: TBooleanField
      FieldName = 'Limit7'
      Required = True
    end
    object TbLocateNumPrice7: TFloatField
      FieldName = 'Price7'
    end
  end
  object TAllData: TABSTable
    CurrentVersion = '5.16 '
    DatabaseName = 'LNUM'
    InMemory = False
    ReadOnly = False
    TableName = 'Data'
    Exclusive = False
    Left = 104
    Top = 248
  end
  object ExportDB: TABSDatabase
    CurrentVersion = '5.16 '
    DatabaseName = 'ExpDB'
    Exclusive = False
    Password = '360110A162'
    HandleShared = True
    MaxConnections = 500
    MultiUser = True
    SessionName = 'Default'
    SilentMode = True
    Left = 200
    Top = 16
  end
  object ServLotto: TABSTable
    CurrentVersion = '5.16 '
    DatabaseName = 'ExpDB'
    InMemory = False
    ReadOnly = False
    TableName = 'Lotto'
    Exclusive = False
    Left = 200
    Top = 72
  end
  object ServCust: TABSTable
    CurrentVersion = '5.16 '
    DatabaseName = 'ExpDB'
    InMemory = False
    ReadOnly = False
    TableName = 'Cust'
    Exclusive = False
    Left = 200
    Top = 136
  end
  object TbCust: TABSTable
    CurrentVersion = '5.16 '
    DatabaseName = 'LNUM'
    InMemory = False
    ReadOnly = False
    StoreDefs = True
    IndexFieldNames = 'CustID'
    TableName = 'Cust'
    Exclusive = False
    Left = 104
    Top = 304
  end
  object ServLastCust: TABSTable
    CurrentVersion = '5.16 '
    DatabaseName = 'ExpDB'
    InMemory = False
    ReadOnly = False
    TableName = 'LastCust'
    Exclusive = False
    Left = 200
    Top = 192
  end
  object ABSUsers: TABSTable
    CurrentVersion = '5.16 '
    DatabaseName = 'LNUM'
    InMemory = False
    ReadOnly = False
    TableName = 'Users'
    Exclusive = False
    Left = 40
    Top = 360
  end
  object OpenDmDialog: TOpenDialog
    Filter = 'BigLotto Database Files (*.LUX)|*.LUX'
    Left = 200
    Top = 248
  end
  object ServerDB: TABSDatabase
    CurrentVersion = '5.16 '
    DatabaseName = 'ServDB'
    Exclusive = False
    Password = '360110A162'
    HandleShared = True
    MaxConnections = 500
    MultiUser = True
    SessionName = 'Default'
    SilentMode = True
    Left = 272
    Top = 16
  end
  object QrAddCol: TABSQuery
    CurrentVersion = '5.16 '
    DatabaseName = 'LNUM'
    InMemory = False
    ReadOnly = False
    BeforePost = Limit3BeforePost
    AfterPost = Limit3AfterPost
    RequestLive = True
    SQL.Strings = (
      
        'Select L1."LimitDate", L1."LotType", L1."Num", L1."Limit1", L1."' +
        'Price1", L1."Limit2", L1."Price2", L1."Limit3", L1."Price3", L1.' +
        '"Limit4", L1."Price4", L1."Limit5", L1."Price5", L1."Limit6", L1' +
        '."Price6", L1."Limit7", L1."Price7"  from LimitNum L1'
      
        'Where ((length(L1."Num") = :LNum) and (L1."LimitDate" = :aDate) ' +
        'and (L1."LotType" = :aLotID))'
      'Order By ID')
    Left = 104
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'LNum'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'aDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'aLotID'
        ParamType = ptUnknown
      end>
    object DateField1: TDateField
      FieldName = 'LimitDate'
    end
    object SmallintField1: TSmallintField
      FieldName = 'LotType'
    end
    object StringField1: TStringField
      FieldName = 'Num'
      OnValidate = Limit3NumValidate
      Size = 5
    end
    object BooleanField1: TBooleanField
      FieldName = 'Limit1'
      Required = True
    end
    object FloatField1: TFloatField
      FieldName = 'Price1'
    end
    object BooleanField2: TBooleanField
      FieldName = 'Limit2'
      Required = True
    end
    object FloatField2: TFloatField
      FieldName = 'Price2'
    end
    object BooleanField3: TBooleanField
      FieldName = 'Limit3'
      Required = True
    end
    object FloatField3: TFloatField
      FieldName = 'Price3'
    end
    object BooleanField4: TBooleanField
      FieldName = 'Limit4'
      Required = True
    end
    object FloatField4: TFloatField
      FieldName = 'Price4'
    end
    object BooleanField5: TBooleanField
      FieldName = 'Limit5'
      Required = True
    end
    object FloatField5: TFloatField
      FieldName = 'Price5'
    end
    object BooleanField6: TBooleanField
      FieldName = 'Limit6'
      Required = True
    end
    object FloatField6: TFloatField
      FieldName = 'Price6'
    end
    object BooleanField7: TBooleanField
      FieldName = 'Limit7'
      Required = True
    end
    object FloatField7: TFloatField
      FieldName = 'Price7'
    end
  end
  object ZConnection1: TZConnection
    ControlsCodePage = cGET_ACP
    Properties.Strings = (
      'RawStringEncoding=DB_CP')
    DisableSavepoints = False
    HostName = '127.0.0.1'
    Port = 3050
    Database = 'D:\Delphi7\BigLotto2.65D2\DB\BIGLOTTO.FDB'
    User = 'SYSDBA'
    Password = 'aB360110162'
    Protocol = 'firebird'
    LibraryLocation = 'fbclient.dll'
    Left = 200
    Top = 312
  end
  object ZQuery1: TZQuery
    Connection = ZConnection1
    Params = <>
    Left = 256
    Top = 312
  end
  object ZExecQuery: TZQuery
    Connection = ZConnection1
    Params = <>
    Left = 312
    Top = 312
  end
end
