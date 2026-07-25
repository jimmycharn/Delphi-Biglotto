object frmMove: TfrmMove
  Left = 152
  Top = 153
  BorderStyle = bsDialog
  Caption = #3618#3657#3634#3618#3586#3657#3629#3617#3641#3621#3652#3611#3618#3633#3591
  ClientHeight = 235
  ClientWidth = 243
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 243
    Height = 186
    Align = alClient
    TabOrder = 0
    object LbCust: TLabel
      Left = 8
      Top = 109
      Width = 35
      Height = 14
      Alignment = taRightJustify
      Caption = #3621#3641#3585#3588#3657#3634' :'
      Font.Charset = THAI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 136
      Width = 49
      Height = 14
      Caption = #3592#3634#3585#3649#3606#3623#3607#3637#3656
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 140
      Top = 136
      Width = 42
      Height = 14
      Caption = #3606#3638#3591#3649#3606#3623#3607#3637#3656
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 61
      Width = 35
      Height = 14
      Caption = #3648#3621#3656#3617#3607#3637#3656' :'
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 12
      Width = 32
      Height = 16
      Caption = #3623#3633#3609#3607#3637#3656' :'
      Font.Charset = THAI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object edCust: TsComboEdit
      Left = 56
      Top = 108
      Width = 60
      Height = 21
      Hint = #3611#3657#3629#3609#3619#3627#3633#3626#3621#3641#3585#3588#3657#3634#3627#3619#3639#3629#3648#3621#3639#3629#3585#3592#3634#3585#3611#3640#3656#3617
      GlyphMode.Grayed = False
      sStyle.GroupIndex = 0
      sStyle.Painting.ColorBorderTop = clBtnHighlight
      sStyle.Caption.Layout = sclLeft
      sStyle.Caption.MaxWidth = 0
      sStyle.Caption.Font.Charset = DEFAULT_CHARSET
      sStyle.Caption.Font.Color = clWindowText
      sStyle.Caption.Font.Height = -11
      sStyle.Caption.Font.Name = 'MS Sans Serif'
      sStyle.Caption.Font.Style = []
      sStyle.Caption.Active = False
      Font.Charset = THAI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = '0001'
      OnKeyPress = edCustKeyPress
      OnButtonClick = edCustButtonClick
    end
    object ChkFoundCust: TCheckBox
      Left = 168
      Top = 91
      Width = 62
      Height = 17
      Caption = #3614#3610#3621#3641#3585#3588#3657#3634
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
    object PanelCustName: TPanel
      Left = 120
      Top = 109
      Width = 112
      Height = 20
      Hint = #3594#3639#3656#3629'-'#3626#3585#3640#3621#3621#3641#3585#3588#3657#3634'/'#3588#3609#3626#3656#3591#3650#3614#3618
      Alignment = taLeftJustify
      BevelOuter = bvSpace
      Caption = #3648#3591#3636#3609#3626#3604
      Color = clBtnHighlight
      Font.Charset = THAI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object edStart: TsCurrencyEdit
      Left = 8
      Top = 152
      Width = 92
      Height = 21
      GlyphMode.Grayed = False
      sStyle.GroupIndex = 0
      sStyle.Painting.ColorBorderTop = clBtnHighlight
      sStyle.Caption.Layout = sclLeft
      sStyle.Caption.MaxWidth = 0
      sStyle.Caption.Font.Charset = DEFAULT_CHARSET
      sStyle.Caption.Font.Color = clWindowText
      sStyle.Caption.Font.Height = -11
      sStyle.Caption.Font.Name = 'MS Sans Serif'
      sStyle.Caption.Font.Style = []
      sStyle.Caption.Active = False
      TabOrder = 3
      AutoSize = False
      DisplayFormat = '###,##0;-###,##0;0'
      MinValue = 1.000000000000000000
      Value = 1.000000000000000000
    end
    object Panel3: TPanel
      Left = 112
      Top = 148
      Width = 22
      Height = 25
      BevelOuter = bvNone
      Caption = #3606#3638#3591
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object edEnd: TsCurrencyEdit
      Left = 139
      Top = 152
      Width = 92
      Height = 21
      GlyphMode.Grayed = False
      sStyle.GroupIndex = 0
      sStyle.Painting.ColorBorderTop = clBtnHighlight
      sStyle.Caption.Layout = sclLeft
      sStyle.Caption.MaxWidth = 0
      sStyle.Caption.Font.Charset = DEFAULT_CHARSET
      sStyle.Caption.Font.Color = clWindowText
      sStyle.Caption.Font.Height = -11
      sStyle.Caption.Font.Name = 'MS Sans Serif'
      sStyle.Caption.Font.Style = []
      sStyle.Caption.Active = False
      TabOrder = 5
      AutoSize = False
      DisplayFormat = '###,##0;-###,##0;0'
      MinValue = 1.000000000000000000
      Value = 1.000000000000000000
    end
    object edBookNo: TsCurrencyEdit
      Left = 56
      Top = 58
      Width = 60
      Height = 21
      GlyphMode.Grayed = False
      sStyle.GroupIndex = 0
      sStyle.Painting.ColorBorderTop = clBtnHighlight
      sStyle.Caption.Layout = sclLeft
      sStyle.Caption.MaxWidth = 0
      sStyle.Caption.Font.Charset = DEFAULT_CHARSET
      sStyle.Caption.Font.Color = clWindowText
      sStyle.Caption.Font.Height = -11
      sStyle.Caption.Font.Name = 'MS Sans Serif'
      sStyle.Caption.Font.Style = []
      sStyle.Caption.Active = False
      TabOrder = 6
      AutoSize = False
      DisplayFormat = '###,##0;-###,##0;0'
      MinValue = 1.000000000000000000
      Value = 1.000000000000000000
    end
    object DateMove: TDateTimePicker
      Left = 56
      Top = 8
      Width = 179
      Height = 24
      Hint = #3585#3635#3627#3609#3604#3591#3623#3604#3623#3633#3609#3607#3637#3656
      Date = 40082.003361180560000000
      Time = 40082.003361180560000000
      DateFormat = dfLong
      Font.Charset = THAI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
    end
    object ChkMoveB: TCheckBox
      Left = 8
      Top = 37
      Width = 137
      Height = 17
      Caption = #3618#3657#3634#3618#3650#3604#3618#3651#3627#3657#3648#3621#3656#3617#3588#3591#3648#3604#3636#3617
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = ChkMoveBClick
    end
    object ChkMoveCust: TCheckBox
      Left = 8
      Top = 87
      Width = 121
      Height = 17
      Caption = #3618#3657#3634#3618#3652#3611#3618#3633#3591#3621#3641#3585#3588#3657#3634#3648#3604#3636#3617
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = ChkMoveCustClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 186
    Width = 243
    Height = 49
    Align = alBottom
    TabOrder = 1
    object BtnMoveOK: TSeSkinButton
      Left = 21
      Top = 10
      Width = 68
      Height = 27
      Performance = kspDoubleBuffer
      Transparent = False
      OnClick = BtnMoveOKClick
      BlackAndWhiteGlyph = False
      Caption = 'OK'
      Default = True
      Font.Charset = THAI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Kind = bkOK
      ModalResult = 1
      NumGlyphs = 2
      State = kbsNormal
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        0000808000008080000000FF0000FF0000008080000080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        00008080000080800000FFFFFF00808080008080000080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        00008080000000FF00000080000000800000FF00000080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        000080800000FFFFFF0080808000808080008080800080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        000000FF000000800000008000000080000000800000FF000000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        0000FFFFFF008080800080808000808080008080800080808000808000008080
        00008080000080800000808000008080000080800000808000008080000000FF
        0000008000000080000000800000008000000080000000800000FF0000008080
        000080800000808000008080000080800000808000008080000080800000FFFF
        FF00808080008080800080808000808080008080800080808000808080008080
        00008080000080800000808000008080000080800000808000008080000000FF
        00000080000000800000FF00000000FF0000008000000080000000800000FF00
        000080800000808000008080000080800000808000008080000080800000FFFF
        FF00808080008080800080808000FFFFFF008080800080808000808080008080
        80008080000080800000808000008080000080800000808000008080000000FF
        000000800000FF000000808000008080000000FF000000800000008000000080
        0000FF000000808000008080000080800000808000008080000080800000FFFF
        FF0080808000808080008080000080800000FFFFFF0080808000808080008080
        80008080800080800000808000008080000080800000808000008080000000FF
        0000FF0000008080000080800000808000008080000000FF0000008000000080
        000000800000FF0000008080000080800000808000008080000080800000FFFF
        FF008080800080800000808000008080000080800000FFFFFF00808080008080
        8000808080008080800080800000808000008080000080800000808000008080
        000080800000808000008080000080800000808000008080000000FF00000080
        00000080000000800000FF000000808000008080000080800000808000008080
        0000808000008080000080800000808000008080000080800000FFFFFF008080
        8000808080008080800080808000808000008080000080800000808000008080
        00008080000080800000808000008080000080800000808000008080000000FF
        0000008000000080000000800000FF0000008080000080800000808000008080
        000080800000808000008080000080800000808000008080000080800000FFFF
        FF00808080008080800080808000808080008080000080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        000000FF0000008000000080000000800000FF00000080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        0000FFFFFF008080800080808000808080008080800080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        00008080000000FF00000080000000800000FF00000080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        000080800000FFFFFF0080808000808080008080800080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        0000808000008080000000FF000000800000FF00000080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        00008080000080800000FFFFFF00808080008080800080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        000080800000808000008080000000FF0000FF00000080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        0000808000008080000080800000FFFFFF008080800080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        0000808000008080000080800000808000008080000080800000}
      TabOrder = 0
      WordWrap = False
      ShowCaption = True
      ShowGlyph = True
      SkinObject = 'Button'
    end
    object BtnMoveCancel: TSeSkinButton
      Left = 152
      Top = 10
      Width = 67
      Height = 27
      Hint = #3621#3610#3586#3657#3629#3617#3641#3621#3605#3634#3619#3634#3591#3619#3634#3618#3585#3634#3619#3611#3657#3629#3609#3586#3657#3629#3617#3641#3621
      Performance = kspDoubleBuffer
      ShowHint = True
      Transparent = False
      BlackAndWhiteGlyph = False
      Caption = #3618#3585#3648#3621#3636#3585
      Font.Charset = THAI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 2
      State = kbsNormal
      ParentShowHint = False
      TabOrder = 1
      WordWrap = False
      ShowCaption = True
      ShowGlyph = True
      SkinObject = 'Button'
    end
  end
end
