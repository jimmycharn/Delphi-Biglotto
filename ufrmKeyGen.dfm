object frmKeyGen: TfrmKeyGen
  Left = 400
  Top = 200
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'BigLotto License Key Generator (เครื่องมือผู้ขาย)'
  ClientHeight = 440
  ClientWidth = 520
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
    Width = 520
    Height = 45
    Align = alTop
    Color = clNavy
    TabOrder = 0
    object lblTitle: TLabel
      Left = 16
      Top = 10
      Width = 360
      Height = 23
      Caption = 'ระบบสร้างรหัสลงทะเบียน (License Generator)'
      Font.Charset = THAI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object grpInput: TGroupBox
    Left = 12
    Top = 55
    Width = 496
    Height = 175
    Caption = ' ข้อมูลสำหรับการออกสิทธิ์ '
    Font.Charset = THAI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object lblHWID: TLabel
      Left = 16
      Top = 32
      Width = 111
      Height = 16
      Caption = 'Hardware ID ลูกค้า:'
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblYears: TLabel
      Left = 16
      Top = 68
      Width = 105
      Height = 16
      Caption = 'จำนวนปี (Years):'
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblMonths: TLabel
      Left = 248
      Top = 68
      Width = 128
      Height = 16
      Caption = 'จำนวนเดือน (Months):'
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblMaxClients: TLabel
      Left = 16
      Top = 104
      Width = 186
      Height = 16
      Caption = 'จำนวนเครื่องลูกสูงสุด (Clients):'
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edHWID: TEdit
      Left = 135
      Top = 28
      Width = 220
      Height = 24
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object btnCurrentHWID: TButton
      Left = 362
      Top = 27
      Width = 120
      Height = 26
      Caption = 'เครื่องปัจจุบัน'
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnCurrentHWIDClick
    end
    object edYears: TEdit
      Left = 135
      Top = 64
      Width = 90
      Height = 24
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = '1'
    end
    object edMonths: TEdit
      Left = 385
      Top = 64
      Width = 97
      Height = 24
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = '1'
    end
    object edMaxClients: TEdit
      Left = 210
      Top = 100
      Width = 90
      Height = 24
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = '1'
    end
    object btnGenerate: TButton
      Left = 135
      Top = 135
      Width = 220
      Height = 32
      Caption = '🔑 สร้างรหัสลงทะเบียน'
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = btnGenerateClick
    end
  end
  object grpResult: TGroupBox
    Left = 12
    Top = 238
    Width = 496
    Height = 150
    Caption = ' รหัสเปิดใช้งานที่ได้ (License Key) '
    Font.Charset = THAI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object memKey: TMemo
      Left = 16
      Top = 28
      Width = 466
      Height = 70
      Font.Charset = THAI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object btnCopyKey: TButton
      Left = 16
      Top = 106
      Width = 180
      Height = 32
      Caption = '📋 คัดลอกรหัส (Copy)'
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnCopyKeyClick
    end
    object btnClose: TButton
      Left = 362
      Top = 106
      Width = 120
      Height = 32
      Caption = 'ปิดหน้าต่าง'
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnCloseClick
    end
  end
end
