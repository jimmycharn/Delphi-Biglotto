object frmIncExp: TfrmIncExp
  Left = 790
  Top = 314
  BorderStyle = bsDialog
  Caption = #3610#3633#3609#3607#3638#3585#3610#3633#3597#3594#3637
  ClientHeight = 483
  ClientWidth = 367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 367
    Height = 105
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 56
      Top = 32
      Width = 39
      Height = 13
      Caption = #3591#3623#3604#3623#3633#3609#3607#3637#3656
    end
    object Label2: TLabel
      Left = 32
      Top = 64
      Width = 76
      Height = 13
      Caption = #3621#3641#3585#3588#3657#3634'/'#3588#3609#3626#3656#3591#3650#3614#3618
    end
    object DatePick: TDateTimePicker
      Left = 105
      Top = 24
      Width = 199
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
      TabOrder = 0
    end
    object EdMobile1: TsEdit
      Left = 120
      Top = 60
      Width = 169
      Height = 21
      TabOrder = 1
      Text = #3648#3591#3636#3609#3626#3604
      sStyle.GroupIndex = 0
      sStyle.Painting.ColorBorderTop = clBtnHighlight
      sStyle.Painting.ColorBorderBottom = clSkyBlue
      sStyle.Caption.Layout = sclLeft
      sStyle.Caption.MaxWidth = 0
      sStyle.Caption.Font.Charset = DEFAULT_CHARSET
      sStyle.Caption.Font.Color = clWindowText
      sStyle.Caption.Font.Height = -11
      sStyle.Caption.Font.Name = 'MS Sans Serif'
      sStyle.Caption.Font.Style = []
      sStyle.Caption.Active = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 427
    Width = 367
    Height = 56
    Align = alBottom
    TabOrder = 1
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
      TabOrder = 0
      WordWrap = False
      ShowCaption = True
      ShowGlyph = True
      SkinObject = 'Button'
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 105
    Width = 367
    Height = 322
    Align = alClient
    TabOrder = 2
    object Label3: TLabel
      Left = 40
      Top = 16
      Width = 44
      Height = 13
      Caption = #3618#3629#3604#3586#3634#3618' :'
    end
    object Label4: TLabel
      Left = 40
      Top = 40
      Width = 54
      Height = 13
      Caption = #3588#3629#3617#3617#3636#3626#3594#3633#3656#3609' :'
    end
    object Label5: TLabel
      Left = 40
      Top = 64
      Width = 58
      Height = 13
      Caption = #3618#3629#3604#3619#3633#3610#3626#3640#3607#3608#3636' :'
    end
    object Label6: TLabel
      Left = 40
      Top = 88
      Width = 34
      Height = 13
      Caption = #3618#3629#3604#3606#3641#3585
    end
    object Label7: TLabel
      Left = 40
      Top = 112
      Width = 78
      Height = 13
      Caption = #3618#3629#3604#3592#3656#3634#3618#3606#3641#3585#3627#3623#3618' :'
    end
    object Label8: TLabel
      Left = 40
      Top = 136
      Width = 68
      Height = 13
      Caption = #3585#3635#3652#3619'/'#3586#3634#3604#3607#3640#3609' :'
    end
    object Label9: TLabel
      Left = 40
      Top = 160
      Width = 25
      Height = 13
      Caption = #3619#3633#3610#3617#3634
    end
    object Label10: TLabel
      Left = 40
      Top = 184
      Width = 31
      Height = 13
      Caption = #3592#3656#3634#3618#3652#3611
    end
    object Label11: TLabel
      Left = 40
      Top = 208
      Width = 30
      Height = 13
      Caption = #3588#3657#3634#3591#3619#3633#3610
    end
    object Label12: TLabel
      Left = 40
      Top = 264
      Width = 35
      Height = 13
      Caption = #3588#3657#3634#3591#3592#3656#3634#3618
    end
    object Label13: TLabel
      Left = 40
      Top = 232
      Width = 80
      Height = 13
      Caption = #3594#3635#3619#3632#3588#3657#3634#3591#3619#3633#3610#3623#3633#3609#3607#3637#3656' :'
    end
    object Label14: TLabel
      Left = 40
      Top = 288
      Width = 85
      Height = 13
      Caption = #3594#3635#3619#3632#3588#3657#3634#3591#3592#3656#3634#3618#3623#3633#3609#3607#3637#3656' :'
    end
    object ed1: TsCurrencyEdit
      Left = 135
      Top = 12
      Width = 119
      Height = 21
      GlyphMode.Grayed = False
      ReadOnly = True
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
      TabOrder = 0
      AutoSize = False
      DisplayFormat = '###,##0.##;-###,##0.##;0'
    end
    object ed2: TsCurrencyEdit
      Left = 135
      Top = 36
      Width = 119
      Height = 21
      GlyphMode.Grayed = False
      ReadOnly = True
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
      TabOrder = 1
      AutoSize = False
      DisplayFormat = '###,##0.##;-###,##0.##;0'
    end
    object ed3: TsCurrencyEdit
      Left = 135
      Top = 60
      Width = 119
      Height = 21
      GlyphMode.Grayed = False
      ReadOnly = True
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
      TabOrder = 2
      AutoSize = False
      DisplayFormat = '###,##0.##;-###,##0.##;0'
    end
    object ed4: TsCurrencyEdit
      Left = 135
      Top = 84
      Width = 119
      Height = 21
      GlyphMode.Grayed = False
      ReadOnly = True
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
      DisplayFormat = '###,##0.##;-###,##0.##;0'
    end
    object ed5: TsCurrencyEdit
      Left = 135
      Top = 108
      Width = 119
      Height = 21
      GlyphMode.Grayed = False
      ReadOnly = True
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
      TabOrder = 4
      AutoSize = False
      DisplayFormat = '###,##0.##;-###,##0.##;0'
    end
    object ed6: TsCurrencyEdit
      Left = 135
      Top = 132
      Width = 119
      Height = 21
      GlyphMode.Grayed = False
      ReadOnly = True
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
      DisplayFormat = '###,##0.##;-###,##0.##;0'
    end
    object edReceive: TsCurrencyEdit
      Left = 135
      Top = 156
      Width = 119
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
      OnChange = edReceiveChange
      AutoSize = False
    end
    object sCurrencyEdit8: TsCurrencyEdit
      Left = 135
      Top = 180
      Width = 119
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
      TabOrder = 7
      AutoSize = False
    end
    object edOutStd: TsCurrencyEdit
      Left = 135
      Top = 204
      Width = 119
      Height = 21
      GlyphMode.Grayed = False
      ReadOnly = True
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
      TabOrder = 8
      AutoSize = False
    end
    object sCurrencyEdit10: TsCurrencyEdit
      Left = 135
      Top = 260
      Width = 119
      Height = 21
      GlyphMode.Grayed = False
      ReadOnly = True
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
      TabOrder = 9
      AutoSize = False
    end
    object DateTimePicker1: TDateTimePicker
      Left = 135
      Top = 227
      Width = 120
      Height = 24
      Hint = #3585#3635#3627#3609#3604#3591#3623#3604#3623#3633#3609#3607#3637#3656
      Date = 45505.003361180560000000
      Time = 45505.003361180560000000
      Font.Charset = THAI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
    end
    object DateTimePicker2: TDateTimePicker
      Left = 135
      Top = 283
      Width = 120
      Height = 24
      Hint = #3585#3635#3627#3609#3604#3591#3623#3604#3623#3633#3609#3607#3637#3656
      Date = 45505.003361180560000000
      Time = 45505.003361180560000000
      Font.Charset = THAI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
    end
    object SeSkinButton1: TSeSkinButton
      Left = 280
      Top = 18
      Width = 67
      Height = 27
      Hint = #3621#3610#3586#3657#3629#3617#3641#3621#3605#3634#3619#3634#3591#3619#3634#3618#3585#3634#3619#3611#3657#3629#3609#3586#3657#3629#3617#3641#3621
      Performance = kspDoubleBuffer
      ShowHint = True
      Transparent = False
      BlackAndWhiteGlyph = False
      Caption = #3610#3633#3609#3607#3638#3585
      Font.Charset = THAI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      State = kbsNormal
      ParentShowHint = False
      TabOrder = 12
      WordWrap = False
      ShowCaption = True
      ShowGlyph = True
      SkinObject = 'Button'
    end
  end
end
