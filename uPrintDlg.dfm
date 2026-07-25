object frmPrintDlg: TfrmPrintDlg
  Left = 305
  Top = 187
  BorderStyle = bsDialog
  Caption = 'Print'
  ClientHeight = 300
  ClientWidth = 431
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 12
    Top = 6
    Width = 407
    Height = 139
    Caption = 'Printer'
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 32
      Width = 34
      Height = 13
      Caption = 'Name :'
    end
    object Label4: TLabel
      Left = 13
      Top = 60
      Width = 33
      Height = 13
      Caption = 'Status:'
    end
    object Label5: TLabel
      Left = 13
      Top = 78
      Width = 27
      Height = 13
      Caption = 'Type:'
    end
    object Label6: TLabel
      Left = 13
      Top = 96
      Width = 35
      Height = 13
      Caption = 'Where:'
    end
    object Label7: TLabel
      Left = 13
      Top = 114
      Width = 47
      Height = 13
      Caption = 'Comment:'
    end
    object LbState: TLabel
      Left = 72
      Top = 61
      Width = 31
      Height = 13
      Caption = 'Ready'
    end
    object LbType: TLabel
      Left = 72
      Top = 78
      Width = 143
      Height = 13
      Caption = 'Samsung ML-1510_700 Series'
    end
    object LbPort: TLabel
      Left = 72
      Top = 98
      Width = 39
      Height = 13
      Caption = 'USB001'
    end
    object LbComment: TLabel
      Left = 72
      Top = 115
      Width = 143
      Height = 13
      Caption = 'Samsung ML-1510_700 Series'
    end
    object ComboBox1: TComboBox
      Left = 74
      Top = 32
      Width = 223
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBox1Change
    end
    object Button1: TButton
      Left = 306
      Top = 30
      Width = 89
      Height = 25
      Caption = 'Properties...'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 238
    Top = 152
    Width = 181
    Height = 97
    Caption = 'Copies'
    TabOrder = 1
    object Label3: TLabel
      Left = 12
      Top = 24
      Width = 86
      Height = 13
      Caption = 'Number of copies:'
    end
    object SeCopies: TSpinEdit
      Left = 112
      Top = 24
      Width = 57
      Height = 22
      MaxValue = 1000000
      MinValue = 1
      TabOrder = 0
      Value = 1
    end
  end
  object Button3: TButton
    Left = 347
    Top = 264
    Width = 71
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object GroupBox2: TGroupBox
    Left = 13
    Top = 152
    Width = 213
    Height = 97
    Caption = 'Print range'
    TabOrder = 3
    object Label2: TLabel
      Left = 148
      Top = 53
      Width = 12
      Height = 13
      Caption = 'to:'
    end
    object RdbAll: TRadioButton
      Left = 16
      Top = 24
      Width = 49
      Height = 17
      Caption = 'All'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RdbPages: TRadioButton
      Left = 16
      Top = 48
      Width = 89
      Height = 17
      Caption = 'Pages    from:'
      TabOrder = 1
    end
    object RdbSel: TRadioButton
      Left = 16
      Top = 72
      Width = 73
      Height = 17
      Caption = 'Selecttion'
      Enabled = False
      TabOrder = 2
    end
    object Edit1: TEdit
      Left = 104
      Top = 49
      Width = 33
      Height = 21
      TabOrder = 3
    end
    object Edit2: TEdit
      Left = 166
      Top = 49
      Width = 37
      Height = 21
      TabOrder = 4
    end
  end
  object OK: TBitBtn
    Left = 270
    Top = 264
    Width = 69
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 4
  end
end
