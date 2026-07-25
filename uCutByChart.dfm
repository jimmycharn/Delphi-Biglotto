object frmCutByChart: TfrmCutByChart
  Left = 246
  Top = 98
  Width = 1198
  Height = 676
  BorderIcons = [biSystemMenu, biMaximize, biHelp]
  Caption = #3605#3633#3604#3604#3657#3623#3618#3585#3619#3634#3615
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1182
    Height = 41
    Align = alTop
    TabOrder = 0
    object Panel11: TPanel
      Left = 1
      Top = 1
      Width = 736
      Height = 39
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      Visible = False
      object CbLotType: TComboBox
        Left = 71
        Top = 9
        Width = 137
        Height = 24
        Style = csDropDownList
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 16
        ItemIndex = 0
        ParentFont = False
        TabOrder = 0
        Text = #3627#3623#3618#3626#3621#3634#3585#3585#3636#3609#3649#3610#3656#3591#3619#3633#3600#3610#3634#3621
        Items.Strings = (
          #3627#3623#3618#3626#3621#3634#3585#3585#3636#3609#3649#3610#3656#3591#3619#3633#3600#3610#3634#3621
          #3627#3623#3618' '#3608#3585#3626'.'
          #3627#3623#3618' '#3608'.'#3629#3629#3617#3626#3636#3609)
      end
      object HDatePick: TDateTimePicker
        Left = 207
        Top = 9
        Width = 137
        Height = 24
        Date = 40082.003361180560000000
        Time = 40082.003361180560000000
        DateFormat = dfLong
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object edLID: TsEdit
        Left = 3
        Top = 10
        Width = 22
        Height = 21
        TabOrder = 2
        Text = '1'
        Visible = False
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
      end
      object EdSendName: TSeSkinEdit
        Left = 27
        Top = 9
        Width = 41
        Height = 23
        Cursor = crIBeam
        Performance = kspDoubleBuffer
        Transparent = False
        Visible = False
        AutoSize = True
        BevelSides = [kbsLeft, kbsTop, kbsRight, kbsBottom]
        BevelInner = kbvLowered
        BevelOuter = kbvLowered
        BevelKind = kbkSingle
        BevelWidth = 1
        BorderWidth = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        PasswordKind = pkNone
        ContextMenuOptions.Animation.EffectKind = '[ RANDOM ] - Random selection'
        TabOrder = 3
        SkinObject = 'Edit'
      end
    end
    object Panel17: TPanel
      Left = 737
      Top = 1
      Width = 444
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object Label2: TLabel
        Left = 2
        Top = 4
        Width = 43
        Height = 29
        Alignment = taRightJustify
        Caption = #3648#3592#3657#3634#3617#3639#3629' :'
        Font.Charset = THAI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'AngsanaUPC'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object CbCutType: TsComboBox
        Left = 290
        Top = 6
        Width = 146
        Height = 24
        ItemIndex = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 16
        Items.Strings = (
          #3623#3636#3656#3591#3610#3609
          #3627#3609#3657#3634#3610#3609
          #3585#3621#3634#3591#3610#3609
          #3627#3621#3633#3591#3610#3609' '
          #3623#3636#3656#3591#3621#3656#3634#3591
          #3627#3609#3657#3634#3621#3656#3634#3591
          #3627#3621#3633#3591#3621#3656#3634#3591
          '2 '#3605#3633#3623#3610#3609
          '2 '#3605#3633#3623#3650#3605#3658#3604
          '2 '#3605#3633#3623#3617#3637
          '2 '#3605#3633#3623#3627#3609#3657#3634
          '2 '#3605#3633#3623#3627#3621#3633#3591
          '2 '#3605#3633#3623#3621#3656#3634#3591
          '3 '#3605#3633#3623#3610#3609
          '3 '#3605#3633#3623#3650#3605#3658#3604
          '3 '#3605#3633#3623#3621#3656#3634#3591
          '4 '#3605#3633#3623#3610#3609
          '4/3 '#3650#3605#3658#3604
          '5 '#3605#3633#3623#3610#3609
          '5/3 '#3650#3605#3658#3604)
        DropDownCount = 20
        ParentFont = False
        Style = csDropDownList
        TabOrder = 0
        Text = '3 '#3605#3633#3623#3610#3609
        Visible = False
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
        GlyphMode.Grayed = False
        OnChange = CbCutTypeChange
      end
      object edDealerID: TsComboEdit
        Left = 49
        Top = 8
        Width = 65
        Height = 24
        Hint = 'F3 '#3648#3614#3639#3656#3629#3648#3621#3639#3629#3585#3648#3592#3657#3634#3617#3639#3629
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
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Text = '0001'
        OnButtonClick = edDealerIDButtonClick
      end
      object edDealerName: TsEdit
        Left = 120
        Top = 8
        Width = 141
        Height = 23
        TabOrder = 2
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
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 4
    Height = 552
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 0
    Top = 593
    Width = 1182
    Height = 44
    Align = alBottom
    TabOrder = 2
    object Panel12: TPanel
      Left = 1086
      Top = 1
      Width = 95
      Height = 42
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object SeSkinButton5: TSeSkinButton
        Left = 6
        Top = 6
        Width = 77
        Height = 27
        Performance = kspDoubleBuffer
        ShowHint = True
        Transparent = False
        BlackAndWhiteGlyph = False
        Caption = '&'#3611#3636#3604
        Kind = bkClose
        ModalResult = 2
        NumGlyphs = 2
        State = kbsNormal
        Glyph.Data = {
          42040000424D4204000000000000420000002800000020000000100000000100
          1000030000000004000000000000000000000000000000000000007C0000E003
          00001F00000010020000FF7FFF7F00000000FF7FFF7F00000000104210420000
          00001042104210021042FF7FFF7F10421042FF7FFF7F10421042186318631042
          104218631863FF7FFF7F00000000FF7FFF7F00000000FF7FFF7F000000001042
          104200000000FF7FFF7F10421042FF7FFF7F10421042FF7FFF7F104210421863
          18631042104200000000FF7FFF7F00000000FF7FFF7F00000000000018630000
          00001042104210421042FF7FFF7F10421042FF7FFF7F10421042104218631042
          1042186318630000000000000000000000000000000018631863000018631042
          0000000000001042104210421042104210421042104218631863104218631042
          1042104210421002100210021002100210020000186300000000000018631042
          1042000010021002100210021002100210021042186310421042104218631042
          1042104210021002100210021002100210020000000000000000000018631042
          1042000010021002100210021002100210021042104210421042104218631042
          1042104210021002100210021002100210020000104210421042000018631042
          1042000010021002100210021002100210021042104210421042104218631042
          1042104210021002100210021002100210020000104210421042000018631042
          1042000010021002100210021002100210021042104210421042104218631042
          1042104210021002100200000000000000000000000000001042000018630000
          104200001002100210021042104210421042104210421042104210421863FF7F
          104210421002100210020000007C007C007C007C007C00001042000018631042
          104200001002100210021042FF7FFF7FFF7FFF7FFF7F10421042104218631042
          10421042100210020000007C007C007C007C007C000010421042000018631042
          10420000100210021042FF7FFF7FFF7FFF7FFF7F104210421042104218631042
          10421042100210020000007C0000007C007C0000104210421042000018631042
          10420000100210021042FF7F1042FF7FFF7F1042104210421042104218631042
          1042104210021002000000000000007C00000000104210421042000018631042
          1042000010021002104210421042FF7F10421042104210421042104218631042
          1042104210021002100210020000000010020000104210421042104200001863
          1042000010021002100210021042104210021042104210421042104210421863
          1042104210021002100210021002100210020000104210421042104210420000
          1863000010021002100210021002100210021042104210421042104210421042
          1863104210021002100210021002100210020000000000000000000000000000
          0000000010021002100210021002100210021042104210421042104210421042
          104210421002}
        ParentShowHint = False
        TabOrder = 0
        WordWrap = False
        ShowCaption = True
        ShowGlyph = True
        SkinObject = 'Button'
      end
    end
  end
  object Panel4: TPanel
    Left = 645
    Top = 41
    Width = 51
    Height = 552
    Align = alRight
    TabOrder = 3
    OnResize = Panel4Resize
    object DeleteBtn: TSeSkinButton
      Left = 2
      Top = 217
      Width = 46
      Height = 27
      Hint = #3588#3639#3609#3618#3629#3604#3585#3621#3633#3610#3651#3609#3617#3639#3629
      Performance = kspDoubleBuffer
      ShowHint = True
      Transparent = False
      OnClick = DeleteBtnClick
      BlackAndWhiteGlyph = False
      Caption = '<--'
      State = kbsNormal
      ParentShowHint = False
      TabOrder = 0
      WordWrap = False
      ShowCaption = True
      ShowGlyph = True
      SkinObject = 'Button'
    end
    object BtnCutChart: TSeSkinButton
      Left = 2
      Top = 177
      Width = 46
      Height = 27
      Hint = #3605#3633#3604#3629#3629#3585#3650#3604#3618#3585#3634#3619#3585#3635#3627#3609#3604#3592#3635#3609#3623#3609
      Performance = kspDoubleBuffer
      ShowHint = True
      Transparent = False
      OnClick = BtnCutChartClick
      BlackAndWhiteGlyph = False
      Caption = '-->'
      State = kbsNormal
      ParentShowHint = False
      TabOrder = 1
      WordWrap = False
      ShowCaption = True
      ShowGlyph = True
      SkinObject = 'Button'
    end
  end
  object Panel5: TPanel
    Left = 484
    Top = 41
    Width = 161
    Height = 552
    Align = alRight
    BorderWidth = 2
    TabOrder = 4
    OnResize = Panel5Resize
    object ChartListData: TSortListView
      Left = 3
      Top = 57
      Width = 155
      Height = 438
      Align = alClient
      Checkboxes = True
      Columns = <
        item
          Caption = #3648#3621#3586
          Width = 60
        end
        item
          Alignment = taRightJustify
          Caption = #3592#3635#3609#3623#3609#3648#3591#3636#3609
          Width = 70
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      GridLines = True
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      SortType = stText
      TabOrder = 0
      ViewStyle = vsReport
      OnClick = ChartListDataClick
      OnCustomSort = ChartListDataCustomSort
    end
    object Panel9: TPanel
      Left = 3
      Top = 3
      Width = 155
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      Caption = #3618#3629#3604#3648#3627#3621#3639#3629#3651#3609#3617#3639#3629
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object Panel10: TPanel
      Left = 3
      Top = 495
      Width = 155
      Height = 54
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object lbOnHandItem: TLabel
        Left = 8
        Top = 3
        Width = 34
        Height = 13
        Caption = '0 '#3611#3619#3632#3605#3641
      end
      object lbOnHand: TLabel
        Left = 105
        Top = 3
        Width = 25
        Height = 13
        Alignment = taRightJustify
        Caption = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SeSkinButton2: TSeSkinButton
        Left = 26
        Top = 23
        Width = 102
        Height = 27
        Performance = kspDoubleBuffer
        ShowHint = True
        Transparent = False
        Visible = False
        BlackAndWhiteGlyph = False
        Caption = #3614#3636#3617#3614#3660
        State = kbsNormal
        ParentShowHint = False
        TabOrder = 0
        WordWrap = False
        ShowCaption = True
        ShowGlyph = True
        SkinObject = 'Button'
      end
    end
    object Panel13: TPanel
      Left = 3
      Top = 33
      Width = 155
      Height = 24
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object ChkDataAll: TSeSkinCheckBox
        Left = 15
        Top = 3
        Width = 98
        Height = 20
        Performance = kspDoubleBuffer
        Transparent = True
        OnClick = ChkDataAllClick
        Caption = #3648#3621#3639#3629#3585#3607#3633#3657#3591#3627#3617#3604
        AllowGrayed = False
        Alignment = ktaLeftJustify
        Checked = True
        Spacing = 5
        State = cbChecked
        WordWrap = False
        TabOrder = 0
        SkinObject = 'CheckBox'
      end
    end
  end
  object Panel6: TPanel
    Left = 696
    Top = 41
    Width = 186
    Height = 552
    Align = alRight
    BorderWidth = 2
    TabOrder = 5
    object ChartListCut: TSortListView
      Left = 3
      Top = 57
      Width = 180
      Height = 438
      Align = alClient
      Checkboxes = True
      Columns = <
        item
          Caption = #3648#3621#3586
          Width = 75
        end
        item
          Alignment = taRightJustify
          Caption = #3592#3635#3609#3623#3609#3648#3591#3636#3609
          Width = 80
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      GridLines = True
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      SortType = stText
      TabOrder = 0
      ViewStyle = vsReport
      OnClick = ChartListDataClick
      OnCustomSort = ChartListDataCustomSort
    end
    object Panel7: TPanel
      Left = 3
      Top = 3
      Width = 180
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      Caption = #3618#3629#3604#3607#3637#3656#3605#3657#3629#3591#3585#3634#3619#3605#3633#3604#3629#3629#3585
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object Panel8: TPanel
      Left = 3
      Top = 495
      Width = 180
      Height = 54
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object lbCutItem: TLabel
        Left = 8
        Top = 2
        Width = 34
        Height = 13
        Caption = '0 '#3611#3619#3632#3605#3641
      end
      object lbCut: TLabel
        Left = 107
        Top = 2
        Width = 25
        Height = 13
        Alignment = taRightJustify
        Caption = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BtnCutOut: TSeSkinButton
        Left = 2
        Top = 22
        Width = 45
        Height = 27
        Performance = kspDoubleBuffer
        ShowHint = True
        Transparent = False
        OnClick = BtnCutOutClick
        BlackAndWhiteGlyph = False
        Caption = #3605#3637#3629#3629#3585
        State = kbsNormal
        ParentShowHint = False
        TabOrder = 0
        WordWrap = False
        ShowCaption = True
        ShowGlyph = True
        SkinObject = 'Button'
      end
      object BtnCutPrint: TSeSkinButton
        Left = 134
        Top = 22
        Width = 45
        Height = 27
        Performance = kspDoubleBuffer
        ShowHint = True
        Transparent = False
        OnClick = BtnCutPrintClick
        BlackAndWhiteGlyph = False
        Caption = #3614#3636#3617#3614#3660
        State = kbsNormal
        ParentShowHint = False
        TabOrder = 1
        WordWrap = False
        ShowCaption = True
        ShowGlyph = True
        SkinObject = 'Button'
      end
      object BtnExcelExport: TSeSkinButton
        Left = 90
        Top = 22
        Width = 45
        Height = 27
        Performance = kspDoubleBuffer
        ShowHint = True
        Transparent = False
        OnClick = BtnExcelExportClick
        BlackAndWhiteGlyph = False
        Caption = 'Excel'
        State = kbsNormal
        ParentShowHint = False
        TabOrder = 2
        WordWrap = False
        ShowCaption = True
        ShowGlyph = True
        SkinObject = 'Button'
      end
      object BtnCutToCb: TSeSkinButton
        Left = 46
        Top = 22
        Width = 45
        Height = 27
        Performance = kspDoubleBuffer
        ShowHint = True
        Transparent = False
        OnClick = BtnCutToCbClick
        OnMouseUp = BtnCutToCbMouseUp
        BlackAndWhiteGlyph = False
        Caption = #3588#3633#3604#3621#3629#3585
        State = kbsNormal
        ParentShowHint = False
        TabOrder = 3
        WordWrap = False
        ShowCaption = True
        ShowGlyph = True
        SkinObject = 'Button'
      end
    end
    object Panel14: TPanel
      Left = 3
      Top = 33
      Width = 180
      Height = 24
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object ChkCutAll: TSeSkinCheckBox
        Left = 15
        Top = 3
        Width = 98
        Height = 20
        Performance = kspDoubleBuffer
        Transparent = True
        OnClick = ChkCutAllClick
        Caption = #3648#3621#3639#3629#3585#3607#3633#3657#3591#3627#3617#3604
        AllowGrayed = False
        Alignment = ktaLeftJustify
        Checked = True
        Spacing = 5
        State = cbChecked
        WordWrap = False
        TabOrder = 0
        SkinObject = 'CheckBox'
      end
    end
  end
  object Panel15: TPanel
    Left = 4
    Top = 41
    Width = 393
    Height = 552
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 2
    Caption = 'Panel15'
    TabOrder = 6
    object Panel16: TPanel
      Left = 2
      Top = 2
      Width = 389
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      OnResize = Panel16Resize
      object RdUpLine: TRadioButton
        Left = 160
        Top = 16
        Width = 73
        Height = 17
        Caption = #3605#3633#3604#3610#3609#3648#3626#3657#3609
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RdDownLine: TRadioButton
        Left = 304
        Top = 16
        Width = 81
        Height = 17
        Caption = #3605#3633#3604#3621#3656#3634#3591#3648#3626#3657#3609
        TabOrder = 1
      end
    end
    object Chart1: TChart
      Left = 2
      Top = 43
      Width = 389
      Height = 507
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Gradient.EndColor = 16744448
      Gradient.Visible = True
      Title.Font.Charset = THAI_CHARSET
      Title.Font.Color = clBlue
      Title.Font.Height = -24
      Title.Font.Name = 'AngsanaUPC'
      Title.Font.Style = [fsBold]
      Title.Text.Strings = (
        'TChart')
      Legend.TextStyle = ltsRightValue
      Legend.Visible = False
      View3D = False
      OnAfterDraw = Chart1AfterDraw
      Align = alClient
      BorderStyle = bsSingle
      TabOrder = 1
      OnDblClick = Chart1DblClick
      OnMouseMove = Chart1MouseMove
      object Series1: TBarSeries
        Marks.ArrowLength = 20
        Marks.Visible = False
        SeriesColor = -1
        AfterDrawValues = Series1AfterDrawValues
        BeforeDrawValues = Series1BeforeDrawValues
        OnDblClick = Series1DblClick
        MultiBar = mbStacked
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
      end
    end
  end
  object Panel18: TPanel
    Left = 923
    Top = 41
    Width = 259
    Height = 552
    Align = alRight
    BorderWidth = 2
    TabOrder = 7
    Visible = False
    object SortListView1: TSortListView
      Left = 3
      Top = 57
      Width = 253
      Height = 438
      Align = alClient
      Checkboxes = True
      Columns = <
        item
          Caption = #3619#3627#3633#3626#3648#3592#3657#3634#3617#3639#3629
          Width = 60
        end
        item
          Alignment = taRightJustify
          Caption = #3594#3639#3656#3629#3648#3592#3657#3634#3617#3639#3629
          Width = 100
        end
        item
          Caption = #3592#3635#3609#3623#3609#3648#3591#3636#3609
          Width = 70
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      GridLines = True
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      SortType = stText
      TabOrder = 0
      ViewStyle = vsReport
    end
    object Panel19: TPanel
      Left = 3
      Top = 3
      Width = 253
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      Caption = #3618#3629#3604#3607#3637#3656#3605#3637#3629#3629#3585#3649#3621#3657#3623
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object Panel20: TPanel
      Left = 3
      Top = 495
      Width = 253
      Height = 54
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object Label1: TLabel
        Left = 8
        Top = 2
        Width = 34
        Height = 13
        Caption = '0 '#3611#3619#3632#3605#3641
      end
      object Label3: TLabel
        Left = 211
        Top = 2
        Width = 25
        Height = 13
        Alignment = taRightJustify
        Caption = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SeSkinButton7: TSeSkinButton
        Left = 178
        Top = 22
        Width = 65
        Height = 27
        Performance = kspDoubleBuffer
        ShowHint = True
        Transparent = False
        BlackAndWhiteGlyph = False
        Caption = #3614#3636#3617#3614#3660
        State = kbsNormal
        ParentShowHint = False
        TabOrder = 0
        WordWrap = False
        ShowCaption = True
        ShowGlyph = True
        SkinObject = 'Button'
      end
      object SeSkinButton6: TSeSkinButton
        Left = 15
        Top = 22
        Width = 65
        Height = 27
        Performance = kspDoubleBuffer
        ShowHint = True
        Transparent = False
        BlackAndWhiteGlyph = False
        Caption = 'Export'
        State = kbsNormal
        ParentShowHint = False
        TabOrder = 1
        WordWrap = False
        ShowCaption = True
        ShowGlyph = True
        SkinObject = 'Button'
      end
    end
    object Panel21: TPanel
      Left = 3
      Top = 33
      Width = 253
      Height = 24
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object SeSkinCheckBox1: TSeSkinCheckBox
        Left = 15
        Top = 3
        Width = 98
        Height = 20
        Performance = kspDoubleBuffer
        Transparent = True
        Caption = #3648#3621#3639#3629#3585#3607#3633#3657#3591#3627#3617#3604
        AllowGrayed = False
        Alignment = ktaLeftJustify
        Checked = True
        Spacing = 5
        State = cbChecked
        WordWrap = False
        TabOrder = 0
        SkinObject = 'CheckBox'
      end
    end
  end
  object Panel22: TPanel
    Left = 882
    Top = 41
    Width = 41
    Height = 552
    Align = alRight
    TabOrder = 8
    Visible = False
  end
  object Panel23: TPanel
    Left = 397
    Top = 41
    Width = 87
    Height = 552
    Align = alRight
    TabOrder = 9
    object RdgNumType: TRadioGroup
      Left = 3
      Top = 53
      Width = 80
      Height = 444
      Caption = #3611#3619#3632#3648#3616#3607#3648#3621#3586
      ItemIndex = 13
      Items.Strings = (
        #3623#3636#3656#3591#3610#3609
        #3627#3609#3657#3634#3610#3609
        #3585#3621#3634#3591#3610#3609
        #3627#3621#3633#3591#3610#3609' '
        #3623#3636#3656#3591#3621#3656#3634#3591
        #3627#3609#3657#3634#3621#3656#3634#3591
        #3627#3621#3633#3591#3621#3656#3634#3591
        '2 '#3605#3633#3623#3610#3609
        '2 '#3605#3633#3623#3650#3605#3658#3604
        '2 '#3605#3633#3623#3617#3637
        '2 '#3605#3633#3623#3627#3609#3657#3634
        '2 '#3605#3633#3623#3627#3621#3633#3591
        '2 '#3605#3633#3623#3621#3656#3634#3591
        '3 '#3605#3633#3623#3610#3609
        '3 '#3605#3633#3623#3650#3605#3658#3604
        '3 '#3605#3633#3623#3621#3656#3634#3591
        '4 '#3605#3633#3623#3610#3609
        '4/3 '#3650#3605#3658#3604
        '5 '#3605#3633#3623#3610#3609
        '5/3 '#3650#3605#3658#3604)
      TabOrder = 0
      OnClick = RdgNumTypeClick
    end
  end
  object ChartPopMenu: TPopupMenu
    Left = 352
    Top = 49
    object N1: TMenuItem
      Caption = #3605#3637#3629#3629#3585
      OnClick = Chart1DblClick
    end
    object N2: TMenuItem
      Caption = #3605#3637#3614#3633#3585#3652#3623#3657#3585#3656#3629#3609
    end
  end
  object XLS: TXLSReadWriteII
    Version = xvExcel97
    Formats = <
      item
        Name = 'Format 0'
        Protection = [cpLocked]
        HorizAlignment = chaGeneral
        VertAlignment = cvaBottom
        Indent = 0
        Rotation = 0
        FormatOptions = []
        FontIndex = 0
        FillPatternForeColor = xcAutomatic
        FillPatternBackColor = xcAutomatic
        FillPatternPattern = 0
        BorderTopColor = xcAutomatic
        BorderTopStyle = cbsNone
        BorderLeftColor = xcAutomatic
        BorderLeftStyle = cbsNone
        BorderRightColor = xcAutomatic
        BorderRightStyle = cbsNone
        BorderBottomColor = xcAutomatic
        BorderBottomStyle = cbsNone
        BorderDiagColor = xcAutomatic
        BorderDiagStyle = cbsNone
        BorderDiagLines = dlNone
      end>
    Sheets = <
      item
        Name = 'Sheet 1'
        DefaultColWidth = 8
        DefaultRowHeight = 0
        PrintSettings.Copies = 1
        PrintSettings.MarginBottom = -1.000000000000000000
        PrintSettings.MarginLeft = -1.000000000000000000
        PrintSettings.MarginRight = -1.000000000000000000
        PrintSettings.MarginTop = -1.000000000000000000
        PrintSettings.Options = [psoPortrait]
        PrintSettings.PaperSize = psA4
        PrintSettings.ScalingFactor = 100
        PrintSettings.StartingPage = 1
        PrintSettings.RowsOnEachPage = '-1:-1'
        PrintSettings.ColsOnEachPage = '-1:-1'
        PrintSettings.HorizPagebreaks = <>
        PrintSettings.VertPagebreaks = <>
        PrintSettings.Resolution = 600
        MergedCells = <>
        Options = [soGridlines, soRowColHeadings, soShowZeros]
        WorkspaceOptions = [woShowAutoBreaks, woRowSumsBelow, woColSumsRight, woOutlineSymbols]
        CalcCount = 100
        Delta = 0.001000000000000000
        Zoom = 100
        ZoomPreview = 100
        RecalcFormulas = True
        Notes = <>
        SheetPictures = <>
        ColumnFormats = <>
        Charts = <>
        FixedRows = 0
        FixedCols = 0
        Validations = <>
      end>
    Workbook.Left = 100
    Workbook.Top = 100
    Workbook.Width = 10000
    Workbook.Height = 7000
    Workbook.SelectedTab = 0
    Workbook.Options = [woHScroll, woVScroll, woTabs]
    OptionsDialog.SaveExtLinkVal = False
    OptionsDialog.CalcCount = 0
    OptionsDialog.CalcMode = cmAutomatic
    OptionsDialog.ShowObjects = soShowAll
    OptionsDialog.Iteration = False
    OptionsDialog.PrecisionAsDisplayed = False
    OptionsDialog.R1C1Mode = False
    OptionsDialog.RecalcBeforeSave = False
    OptionsDialog.Uncalced = False
    Font.Name = 'Arial'
    Font.Charset = ANSI_CHARSET
    Font.Color = xcBlack
    Font.Size = 10
    Font.Style = []
    Font.SubSuperScript = xssNone
    Font.Underline = xulNone
    Codepage = 1200
    BookProtected = False
    Backup = False
    RefreshAll = False
    WriteUnicodeStrings = False
    FuncArgSeparator = ','
    StrTRUE = 'TRUE'
    StrFALSE = 'FALSE'
    ShowFormulas = False
    PictureOptions = [poDeleteTempFiles]
    Pictures = <>
    IsMac = False
    AreaNames = <>
    PreserveMacros = False
    ComponentVersion = '1.14.05'
    Left = 768
    Top = 248
    Fonts = <
      item
        Name = 'Arial'
        Charset = ANSI_CHARSET
        Color = xcBlack
        Size = 10
        Style = []
        SubSuperScript = xssNone
        Underline = xulNone
      end
      item
        Name = 'Arial'
        Charset = ANSI_CHARSET
        Color = xcBlack
        Size = 10
        Style = []
        SubSuperScript = xssNone
        Underline = xulNone
      end
      item
        Name = 'Arial'
        Charset = ANSI_CHARSET
        Color = xcBlack
        Size = 10
        Style = []
        SubSuperScript = xssNone
        Underline = xulNone
      end
      item
        Name = 'Arial'
        Charset = ANSI_CHARSET
        Color = xcBlack
        Size = 10
        Style = []
        SubSuperScript = xssNone
        Underline = xulNone
      end
      item
        Name = 'Arial'
        Charset = ANSI_CHARSET
        Color = xcBlack
        Size = 10
        Style = []
        SubSuperScript = xssNone
        Underline = xulNone
      end>
  end
  object SaveXLSDialog: TSaveDialog
    DefaultExt = 'xls'
    Filter = 'Excell Files (*.XLS)|*.xls'
    Left = 801
    Top = 248
  end
  object MenuCutClpbrd: TPopupMenu
    Left = 777
    Top = 368
    object N13: TMenuItem
      Caption = #3588#3633#3604#3621#3629#3585#3586#3657#3629#3617#3641#3621#3605#3634#3617#3611#3619#3632#3648#3616#3607#3648#3621#3586' ('#3617#3637#3648#3588#3619#3639#3656#3629#3591#3627#3617#3634#3618')'
      OnClick = N13Click
    end
    object N28: TMenuItem
      Caption = #3588#3633#3604#3621#3629#3585#3586#3657#3629#3617#3641#3621#3648#3593#3614#3634#3632#3648#3621#3586#3649#3621#3632#3592#3635#3609#3623#3609#3648#3591#3636#3609
      OnClick = N28Click
    end
  end
end
