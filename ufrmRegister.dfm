object frmRegister: TfrmRegister
  Left = 380
  Top = 180
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'การลงทะเบียนโปรแกรม BigLotto (Registration)'
  ClientHeight = 480
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = THAI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object PanelHeader: TPanel
    Left = 0
    Top = 0
    Width = 540
    Height = 50
    Align = alTop
    Color = clNavy
    TabOrder = 0
    object lblTitle: TLabel
      Left = 16
      Top = 12
      Width = 370
      Height = 23
      Caption = 'ลงทะเบียนสิทธิ์ใช้งานโปรแกรม BigLotto'
      Font.Charset = THAI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object grpHWID: TGroupBox
    Left = 12
    Top = 60
    Width = 516
    Height = 90
    Caption = ' 1. รหัสประจำเครื่องนี้ (Hardware ID) '
    Font.Charset = THAI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object lblHWIDHint: TLabel
      Left = 16
      Top = 25
      Width = 345
      Height = 16
      Caption = 'ส่งรหัสเครื่องนี้ให้ผู้ขายเพื่อขอรับรหัสลงทะเบียน (License Key):'
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edHWID: TEdit
      Left = 16
      Top = 48
      Width = 340
      Height = 24
      Color = clInfoBk
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object btnCopyHWID: TButton
      Left = 365
      Top = 46
      Width = 135
      Height = 28
      Caption = 'คัดลอก HWID'
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnCopyHWIDClick
    end
  end
  object grpKey: TGroupBox
    Left = 12
    Top = 160
    Width = 516
    Height = 150
    Caption = ' 2. กรอกรหัสลงทะเบียน (License Key) '
    Font.Charset = THAI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object lblKeyHint: TLabel
      Left = 16
      Top = 24
      Width = 277
      Height = 16
      Caption = 'วางรหัสลงทะเบียนที่ได้รับจากผู้ขายลงในช่องด้านล่าง:'
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object memKey: TMemo
      Left = 16
      Top = 46
      Width = 484
      Height = 55
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object btnActivate: TButton
      Left = 16
      Top = 108
      Width = 200
      Height = 32
      Caption = 'ยืนยันเปิดใช้งาน'
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnActivateClick
    end
    object btnOpenKeyGen: TButton
      Left = 300
      Top = 108
      Width = 200
      Height = 32
      Caption = 'เครื่องมือผู้ขาย (KeyGen)'
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnOpenKeyGenClick
    end
  end
  object grpStatus: TGroupBox
    Left = 12
    Top = 320
    Width = 516
    Height = 110
    Caption = ' สถานะสิทธิ์ใช้งานปัจจุบัน '
    Font.Charset = THAI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object lblStatus: TLabel
      Left = 16
      Top = 25
      Width = 250
      Height = 18
      Caption = 'สถานะ: ตรวจสอบข้อมูลสิทธิ์...'
      Font.Charset = THAI_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblExpDate: TLabel
      Left = 16
      Top = 52
      Width = 105
      Height = 16
      Caption = 'วันที่หมดอายุ: -'
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblDaysLeft: TLabel
      Left = 260
      Top = 52
      Width = 132
      Height = 16
      Caption = 'ระยะเวลาคงเหลือ: -'
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblMaxClients: TLabel
      Left = 16
      Top = 78
      Width = 188
      Height = 16
      Caption = 'จำนวนเครื่องลูกที่อนุญาต: -'
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object btnClose: TButton
    Left = 408
    Top = 438
    Width = 120
    Height = 32
    Caption = 'ปิดหน้าต่าง'
    Font.Charset = THAI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnCloseClick
  end
end