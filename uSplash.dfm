object frmSplash: TfrmSplash
  Left = 292
  Top = 134
  BorderStyle = bsNone
  Caption = 'frmSplash'
  ClientHeight = 249
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 0
    Top = 0
    Width = 504
    Height = 249
    Align = alClient
  end
  object Label1: TLabel
    Left = 32
    Top = 48
    Width = 223
    Height = 29
    Caption = 'ThaiLottoSoft.com'
    Font.Charset = THAI_CHARSET
    Font.Color = clRed
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 32
    Top = 64
    Width = 446
    Height = 76
    Caption = 'BigLotto 2026'
    Font.Charset = THAI_CHARSET
    Font.Color = clNavy
    Font.Height = -63
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 24
    Top = 216
    Width = 116
    Height = 29
    Caption = 'Loading...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 77
    Top = 61
    Width = 19
    Height = 76
    Caption = 'i'
    Font.Charset = THAI_CHARSET
    Font.Color = clRed
    Font.Height = -63
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 366
    Top = 135
    Width = 39
    Height = 16
    Alignment = taRightJustify
    Caption = 'Build :'
    Font.Charset = THAI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Visible = False
  end
  object lbBuild: TLabel
    Left = 418
    Top = 135
    Width = 52
    Height = 16
    Alignment = taRightJustify
    Caption = '2.0.26.1'
    Font.Charset = THAI_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
end
