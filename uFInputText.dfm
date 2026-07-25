object frmInputText: TfrmInputText
  Left = 659
  Top = 127
  Width = 483
  Height = 722
  BorderIcons = [biSystemMenu]
  Caption = #3611#3657#3629#3609#3586#3657#3629#3617#3641#3621'-'#3609#3635#3648#3586#3657#3634#3586#3657#3629#3617#3641#3621#3592#3634#3585#3586#3657#3629#3588#3623#3634#3617' - Line'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 148
    Top = 0
    Width = 319
    Height = 660
    Align = alClient
    BorderWidth = 3
    TabOrder = 0
    object Panel1: TPanel
      Left = 4
      Top = 4
      Width = 311
      Height = 296
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 311
        Height = 77
        Align = alTop
        TabOrder = 0
        object LbCust: TLabel
          Left = 10
          Top = 33
          Width = 39
          Height = 16
          Alignment = taRightJustify
          Caption = #3621#3641#3585#3588#3657#3634' :'
          Font.Charset = THAI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 6
          Top = 10
          Width = 31
          Height = 13
          Caption = #3648#3621#3656#3617#3607#3637#3656' :'
        end
        object edCust: TsComboEdit
          Left = 8
          Top = 52
          Width = 73
          Height = 22
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
        object PanelCustName: TPanel
          Left = 90
          Top = 53
          Width = 111
          Height = 21
          Hint = #3594#3639#3656#3629'-'#3626#3585#3640#3621#3621#3641#3585#3588#3657#3634'/'#3588#3609#3626#3656#3591#3650#3614#3618
          Alignment = taLeftJustify
          BevelOuter = bvSpace
          Caption = #3648#3591#3636#3609#3626#3604
          Color = clBtnHighlight
          Font.Charset = THAI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object ChkFoundCust: TCheckBox
          Left = 109
          Top = 35
          Width = 68
          Height = 18
          Caption = #3614#3610#3621#3641#3585#3588#3657#3634
          Font.Charset = THAI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Visible = False
        end
        object edBookNo: TsCurrencyEdit
          Left = 40
          Top = 7
          Width = 48
          Height = 22
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
          OnKeyPress = edBookNoKeyPress
          AutoSize = False
          DisplayFormat = '###,##0;-###,##0;0'
          MinValue = 1.000000000000000000
          Value = 1.000000000000000000
        end
        object SpinBook: TSeSkinSpinButton
          Left = 88
          Top = 7
          Width = 15
          Height = 22
          Performance = kspNoBuffer
          Transparent = True
          Associate = edBookNo
          SpinAlign = saRight
          DownGlyph.Data = {
            0E010000424D0E01000000000000360000002800000009000000060000000100
            200000000000D800000000000000000000000000000000000000008080000080
            8000008080000080800000808000008080000080800000808000008080000080
            8000008080000080800000808000000000000080800000808000008080000080
            8000008080000080800000808000000000000000000000000000008080000080
            8000008080000080800000808000000000000000000000000000000000000000
            0000008080000080800000808000000000000000000000000000000000000000
            0000000000000000000000808000008080000080800000808000008080000080
            800000808000008080000080800000808000}
          Increment = 1
          Max = 9999
          Min = 1
          Position = 1
          UpGlyph.Data = {
            0E010000424D0E01000000000000360000002800000009000000060000000100
            200000000000D800000000000000000000000000000000000000008080000080
            8000008080000080800000808000008080000080800000808000008080000080
            8000000000000000000000000000000000000000000000000000000000000080
            8000008080000080800000000000000000000000000000000000000000000080
            8000008080000080800000808000008080000000000000000000000000000080
            8000008080000080800000808000008080000080800000808000000000000080
            8000008080000080800000808000008080000080800000808000008080000080
            800000808000008080000080800000808000}
          SkinObject = 'SpinButton'
        end
        object ChkAddBook: TCheckBox
          Left = 109
          Top = 10
          Width = 132
          Height = 17
          Hint = #3588#3637#3618#3660#3621#3633#3604' = Ctrl + <--'
          Caption = #3648#3614#3636#3656#3617#3648#3621#3656#3617#3627#3621#3633#3591#3610#3633#3609#3607#3638#3585
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          State = cbChecked
          TabOrder = 5
        end
        object ChkNamePaste: TCheckBox
          Left = 208
          Top = 56
          Width = 97
          Height = 17
          Caption = #3648#3621#3639#3629#3585#3594#3639#3656#3629#3649#3621#3632#3623#3634#3591
          Checked = True
          State = cbChecked
          TabOrder = 6
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 77
        Width = 311
        Height = 77
        Align = alTop
        TabOrder = 1
        object Label3: TLabel
          Left = 226
          Top = 29
          Width = 9
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 256
          Top = 56
          Width = 28
          Height = 13
          Caption = #3586#3638#3657#3609#3652#3611
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ChkAddPercent: TCheckBox
          Left = 8
          Top = 27
          Width = 145
          Height = 17
          Hint = #3588#3637#3618#3660#3621#3633#3604' = Ctrl + '#3621#3641#3585#3624#3619#3637#3586#3638#3657#3609
          Caption = '3 '#3605#3633#3623#3610#3609#3610#3623#3585#3648#3591#3636#3609#3649#3607#3591#3648#3614#3636#3656#3617
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object edPercent: TsCurrencyEdit
          Left = 170
          Top = 25
          Width = 49
          Height = 22
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          AutoSize = False
          DisplayFormat = '###,##0.##;-###,##0.##;0.##'
          Value = 10.000000000000000000
        end
        object ChkClpBrdFilter: TCheckBox
          Left = 8
          Top = 2
          Width = 153
          Height = 17
          Caption = #3585#3619#3629#3591#3586#3657#3629#3617#3641#3621#3592#3634#3585#3588#3621#3636#3611#3610#3629#3619#3660#3604
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          State = cbChecked
          TabOrder = 2
        end
        object ChkSetNum: TCheckBox
          Left = 171
          Top = 2
          Width = 61
          Height = 17
          Caption = #3648#3621#3586#3594#3640#3604
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          State = cbChecked
          TabOrder = 3
          Visible = False
        end
        object ChkOverPr: TCheckBox
          Left = 8
          Top = 55
          Width = 161
          Height = 17
          Caption = #3605#3619#3623#3592#3592#3633#3610#3619#3634#3588#3634#3612#3636#3604#3611#3585#3605#3636#3605#3633#3657#3591#3649#3605#3656
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          State = cbChecked
          TabOrder = 4
        end
        object edtOverPr: TsCurrencyEdit
          Left = 172
          Top = 52
          Width = 77
          Height = 22
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          AutoSize = False
          DisplayFormat = '###,##0.##;-###,##0.##;0.##'
          Value = 5000.000000000000000000
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 154
        Width = 311
        Height = 142
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object Bevel1: TBevel
          Left = 4
          Top = 84
          Width = 281
          Height = 2
        end
        object ChkLockMoney: TCheckBox
          Left = 8
          Top = 93
          Width = 97
          Height = 17
          Hint = #3588#3637#3618#3660#3621#3633#3604' = Ctrl + <--'
          Caption = #3621#3655#3629#3585#3592#3635#3609#3623#3609#3648#3591#3636#3609
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = ChkLockMoneyClick
        end
        object ChkTod: TCheckBox
          Left = 189
          Top = 93
          Width = 113
          Height = 17
          Hint = #3588#3637#3618#3660#3621#3633#3604' = Ctrl + -->'
          Caption = #3611#3657#3629#3609#3652#3617#3656#3648#3629#3634#3648#3621#3586#3585#3621#3633#3610
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = ChkTodClick
        end
        object Panel8: TPanel
          Left = 0
          Top = 0
          Width = 311
          Height = 85
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object PcNumType: TSeSkinPageControl
            Left = 0
            Top = 0
            Width = 311
            Height = 85
            Performance = kspNoBuffer
            Transparent = False
            Align = alClient
            ActivePage = SeCustomTabSheet1
            Tabs.Strings = (
              #3648#3621#3586' 1 '#3605#3633#3623
              #3648#3621#3586' 2 '#3605#3633#3623
              #3648#3621#3586' 3 '#3605#3633#3623
              #3648#3621#3586' 4 '#3605#3633#3623
              #3648#3621#3586' 5 '#3605#3633#3623)
            TabIndex = 0
            TabOrder = 0
            TabStop = True
            SkinObject = 'Tabs'
            object SeCustomTabSheet1: TSeCustomTabSheet
              Caption = #3648#3621#3586' 1 '#3605#3633#3623
              PageIndex = 0
              PageVisible = True
              object RunUpBtn: TSeSkinButton
                Left = 4
                Top = 2
                Width = 70
                Height = 27
                Hint = #3623#3636#3656#3591#3610#3609
                Performance = kspDoubleBuffer
                ShowHint = True
                Transparent = False
                OnClick = RunUpBtnClick
                BlackAndWhiteGlyph = False
                Caption = #3623#3636#3656#3591#3610#3609
                State = kbsNormal
                ParentShowHint = False
                TabOrder = 0
                WordWrap = False
                ShowCaption = True
                ShowGlyph = True
                SkinObject = 'Button'
              end
              object LeftUpBtn: TSeSkinButton
                Left = 80
                Top = 2
                Width = 70
                Height = 27
                Hint = #3611#3633#3585#3627#3609#3657#3634#3610#3609
                Performance = kspDoubleBuffer
                ShowHint = True
                Transparent = False
                OnClick = LeftUpBtnClick
                BlackAndWhiteGlyph = False
                Caption = #3611#3633#3585#3627#3609#3657#3634#3610#3609
                State = kbsNormal
                ParentShowHint = False
                TabOrder = 1
                WordWrap = False
                ShowCaption = True
                ShowGlyph = True
                SkinObject = 'Button'
              end
              object CenterUpBtn: TSeSkinButton
                Left = 155
                Top = 2
                Width = 70
                Height = 27
                Hint = #3611#3633#3585#3585#3621#3634#3591#3610#3609
                Performance = kspDoubleBuffer
                ShowHint = True
                Transparent = False
                OnClick = CenterUpBtnClick
                BlackAndWhiteGlyph = False
                Caption = #3611#3633#3585#3585#3621#3634#3591#3610#3609
                State = kbsNormal
                ParentShowHint = False
                TabOrder = 2
                WordWrap = False
                ShowCaption = True
                ShowGlyph = True
                SkinObject = 'Button'
              end
              object RightUpBtn: TSeSkinButton
                Left = 230
                Top = 2
                Width = 70
                Height = 27
                Hint = #3611#3633#3585#3627#3621#3633#3591#3610#3609
                Performance = kspDoubleBuffer
                ShowHint = True
                Transparent = False
                OnClick = RightUpBtnClick
                BlackAndWhiteGlyph = False
                Caption = #3611#3633#3585#3627#3621#3633#3591#3610#3609
                State = kbsNormal
                ParentShowHint = False
                TabOrder = 3
                WordWrap = False
                ShowCaption = True
                ShowGlyph = True
                SkinObject = 'Button'
              end
              object RunDwnBtn: TSeSkinButton
                Left = 4
                Top = 30
                Width = 70
                Height = 27
                Hint = #3623#3636#3656#3591#3621#3656#3634#3591
                Performance = kspDoubleBuffer
                ShowHint = True
                Transparent = False
                OnClick = RunDwnBtnClick
                BlackAndWhiteGlyph = False
                Caption = #3623#3636#3656#3591#3621#3656#3634#3591
                State = kbsNormal
                ParentShowHint = False
                TabOrder = 4
                WordWrap = False
                ShowCaption = True
                ShowGlyph = True
                SkinObject = 'Button'
              end
              object LeftDwnBtn: TSeSkinButton
                Left = 80
                Top = 30
                Width = 70
                Height = 27
                Hint = #3611#3633#3585#3627#3609#3657#3634#3621#3656#3634#3591
                Performance = kspDoubleBuffer
                ShowHint = True
                Transparent = False
                OnClick = LeftDwnBtnClick
                BlackAndWhiteGlyph = False
                Caption = #3611#3633#3585#3627#3609#3657#3634#3621#3656#3634#3591
                State = kbsNormal
                ParentShowHint = False
                TabOrder = 5
                WordWrap = False
                ShowCaption = True
                ShowGlyph = True
                SkinObject = 'Button'
              end
              object RightDwnBtn: TSeSkinButton
                Left = 230
                Top = 30
                Width = 70
                Height = 27
                Hint = #3611#3633#3585#3627#3621#3633#3591#3621#3656#3634#3591
                Performance = kspDoubleBuffer
                ShowHint = True
                Transparent = False
                OnClick = RightDwnBtnClick
                BlackAndWhiteGlyph = False
                Caption = #3611#3633#3585#3627#3621#3633#3591#3621#3656#3634#3591
                State = kbsNormal
                ParentShowHint = False
                TabOrder = 6
                WordWrap = False
                ShowCaption = True
                ShowGlyph = True
                SkinObject = 'Button'
              end
            end
            object SeCustomTabSheet2: TSeCustomTabSheet
              Caption = #3648#3621#3586' 2 '#3605#3633#3623
              PageIndex = 1
              PageVisible = True
              object Up2Btn: TSeSkinButton
                Left = 3
                Top = 10
                Width = 58
                Height = 40
                Hint = '2 '#3605#3633#3623#3610#3609
                Performance = kspDoubleBuffer
                ShowHint = True
                Transparent = False
                OnClick = Up2BtnClick
                BlackAndWhiteGlyph = False
                Caption = #3626#3629#3591#3605#3633#3623#3610#3609
                State = kbsNormal
                ParentShowHint = False
                TabOrder = 0
                WordWrap = False
                ShowCaption = True
                ShowGlyph = True
                SkinObject = 'Button'
              end
              object Mee2Btn: TSeSkinButton
                Left = 63
                Top = 10
                Width = 58
                Height = 40
                Hint = '2 '#3605#3633#3623#3617#3637
                Performance = kspDoubleBuffer
                ShowHint = True
                Transparent = False
                OnClick = Mee2BtnClick
                BlackAndWhiteGlyph = False
                Caption = #3626#3629#3591#3605#3633#3623#3617#3637
                State = kbsNormal
                ParentShowHint = False
                TabOrder = 1
                WordWrap = False
                ShowCaption = True
                ShowGlyph = True
                SkinObject = 'Button'
              end
              object Left2Btn: TSeSkinButton
                Left = 123
                Top = 10
                Width = 58
                Height = 40
                Hint = '2 '#3605#3633#3623#3627#3609#3657#3634
                Performance = kspDoubleBuffer
                ShowHint = True
                Transparent = False
                OnClick = Left2BtnClick
                BlackAndWhiteGlyph = False
                Caption = #3626#3629#3591#3605#3633#3623#3627#3609#3657#3634
                State = kbsNormal
                ParentShowHint = False
                TabOrder = 2
                WordWrap = False
                ShowCaption = True
                ShowGlyph = True
                SkinObject = 'Button'
              end
              object Tang2Btn: TSeSkinButton
                Left = 183
                Top = 10
                Width = 58
                Height = 40
                Hint = '2 '#3605#3633#3623#3606#3656#3634#3591
                Performance = kspDoubleBuffer
                ShowHint = True
                Transparent = False
                OnClick = Tang2BtnClick
                BlackAndWhiteGlyph = False
                Caption = #3626#3629#3591#3605#3633#3623#3606#3656#3634#3591
                State = kbsNormal
                ParentShowHint = False
                TabOrder = 3
                WordWrap = False
                ShowCaption = True
                ShowGlyph = True
                SkinObject = 'Button'
              end
              object Dwn2Btn: TSeSkinButton
                Left = 243
                Top = 10
                Width = 58
                Height = 40
                Hint = '2 '#3605#3633#3623#3621#3656#3634#3591
                Performance = kspDoubleBuffer
                ShowHint = True
                Transparent = False
                OnClick = Dwn2BtnClick
                BlackAndWhiteGlyph = False
                Caption = #3626#3629#3591#3605#3633#3623#3621#3656#3634#3591
                State = kbsNormal
                ParentShowHint = False
                TabOrder = 4
                WordWrap = False
                ShowCaption = True
                ShowGlyph = True
                SkinObject = 'Button'
              end
            end
            object Tab3: TSeCustomTabSheet
              Caption = #3648#3621#3586' 3 '#3605#3633#3623
              PageIndex = 2
              PageVisible = True
              object Btn3Up: TSeSkinButton
                Left = 11
                Top = 10
                Width = 90
                Height = 40
                Hint = '3 '#3605#3633#3623#3610#3609
                Performance = kspDoubleBuffer
                ShowHint = True
                Transparent = False
                OnClick = Btn3UpClick
                BlackAndWhiteGlyph = False
                Caption = #3626#3634#3617#3605#3633#3623#3610#3609
                State = kbsNormal
                ParentShowHint = False
                TabOrder = 0
                WordWrap = False
                ShowCaption = True
                ShowGlyph = True
                SkinObject = 'Button'
              end
              object Up3TodBtn: TSeSkinButton
                Left = 107
                Top = 10
                Width = 90
                Height = 40
                Hint = '3 '#3605#3633#3623#3650#3605#3658#3604
                Performance = kspDoubleBuffer
                ShowHint = True
                Transparent = False
                OnClick = Up3TodBtnClick
                BlackAndWhiteGlyph = False
                Caption = #3626#3634#3617#3605#3633#3623#3650#3605#3658#3604
                State = kbsNormal
                ParentShowHint = False
                TabOrder = 1
                WordWrap = False
                ShowCaption = True
                ShowGlyph = True
                SkinObject = 'Button'
              end
              object Up3DwnBtn: TSeSkinButton
                Left = 203
                Top = 10
                Width = 90
                Height = 40
                Hint = '3 '#3605#3633#3623#3621#3656#3634#3591
                Performance = kspDoubleBuffer
                ShowHint = True
                Transparent = False
                OnClick = Up3DwnBtnClick
                BlackAndWhiteGlyph = False
                Caption = #3626#3634#3617#3605#3633#3623#3621#3656#3634#3591
                State = kbsNormal
                ParentShowHint = False
                TabOrder = 2
                WordWrap = False
                ShowCaption = True
                ShowGlyph = True
                SkinObject = 'Button'
              end
            end
            object SeCustomTabSheet4: TSeCustomTabSheet
              Caption = #3648#3621#3586' 4 '#3605#3633#3623
              PageIndex = 3
              PageVisible = True
              object Up4Btn: TSeSkinButton
                Left = 11
                Top = 10
                Width = 90
                Height = 40
                Hint = '4 '#3605#3633#3623#3610#3609
                Performance = kspDoubleBuffer
                ShowHint = True
                Transparent = False
                OnClick = Up4BtnClick
                BlackAndWhiteGlyph = False
                Caption = #3626#3637#3656#3605#3633#3623#3610#3609
                State = kbsNormal
                ParentShowHint = False
                TabOrder = 0
                WordWrap = False
                ShowCaption = True
                ShowGlyph = True
                SkinObject = 'Button'
              end
              object Float4Btn: TSeSkinButton
                Left = 107
                Top = 10
                Width = 90
                Height = 40
                Hint = '4 '#3605#3633#3623#3621#3629#3618#3649#3614
                Performance = kspDoubleBuffer
                ShowHint = True
                Transparent = False
                OnClick = Float4BtnClick
                BlackAndWhiteGlyph = False
                Caption = #3626#3637#3656#3605#3633#3623#3621#3629#3618#3649#3614
                State = kbsNormal
                ParentShowHint = False
                TabOrder = 1
                WordWrap = False
                ShowCaption = True
                ShowGlyph = True
                SkinObject = 'Button'
              end
              object Btn423: TSeSkinButton
                Left = 203
                Top = 10
                Width = 90
                Height = 40
                Hint = '4 '#3605#3633#3623#3649#3611#3621#3591#3648#3611#3655#3609' 3 '#3605#3633#3623
                Performance = kspDoubleBuffer
                ShowHint = True
                Transparent = False
                OnClick = Btn423Click
                BlackAndWhiteGlyph = False
                Caption = #3649#3611#3621#3591#3648#3611#3655#3609'3 '#3605#3633#3623
                State = kbsNormal
                ParentShowHint = False
                TabOrder = 2
                WordWrap = False
                ShowCaption = True
                ShowGlyph = True
                SkinObject = 'Button'
              end
            end
            object SeCustomTabSheet5: TSeCustomTabSheet
              Caption = #3648#3621#3586' 5 '#3605#3633#3623
              PageIndex = 4
              PageVisible = True
              object Up5Btn: TSeSkinButton
                Left = 11
                Top = 10
                Width = 90
                Height = 40
                Hint = '5 '#3605#3633#3623#3610#3609
                Performance = kspDoubleBuffer
                ShowHint = True
                Transparent = False
                OnClick = Up5BtnClick
                BlackAndWhiteGlyph = False
                Caption = #3627#3657#3634#3605#3633#3623#3610#3609
                State = kbsNormal
                ParentShowHint = False
                TabOrder = 0
                WordWrap = False
                ShowCaption = True
                ShowGlyph = True
                SkinObject = 'Button'
              end
              object Float5Btn: TSeSkinButton
                Left = 107
                Top = 10
                Width = 90
                Height = 40
                Hint = '5 '#3605#3633#3623#3621#3629#3618#3649#3614
                Performance = kspDoubleBuffer
                ShowHint = True
                Transparent = False
                OnClick = Float5BtnClick
                BlackAndWhiteGlyph = False
                Caption = #3627#3657#3634#3605#3633#3623#3621#3629#3618#3649#3614
                State = kbsNormal
                ParentShowHint = False
                TabOrder = 1
                WordWrap = False
                ShowCaption = True
                ShowGlyph = True
                SkinObject = 'Button'
              end
              object Btn523: TSeSkinButton
                Left = 203
                Top = 10
                Width = 90
                Height = 40
                Hint = '5 '#3605#3633#3623#3649#3611#3621#3591#3648#3611#3655#3609' 3 '#3605#3633#3623
                Performance = kspDoubleBuffer
                ShowHint = True
                Transparent = False
                OnClick = Btn523Click
                BlackAndWhiteGlyph = False
                Caption = #3649#3611#3621#3591#3648#3611#3655#3609'3 '#3605#3633#3623
                State = kbsNormal
                ParentShowHint = False
                TabOrder = 2
                WordWrap = False
                ShowCaption = True
                ShowGlyph = True
                SkinObject = 'Button'
              end
            end
          end
        end
        object ChkAlt: TCheckBox
          Left = 8
          Top = 117
          Width = 121
          Height = 17
          Caption = #3588#3637#3618#3660#3626#3621#3633#3610#3648#3621#3586' 2,3  '#3605#3633#3623
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
        object CbAlt: TsComboBox
          Left = 136
          Top = 114
          Width = 164
          Height = 21
          ItemIndex = 1
          ItemHeight = 13
          Items.Strings = (
            '3 '#3605#3633#3623' '#3626#3621#3633#3610#3605#3635#3649#3627#3609#3656#3591' 1 '#3585#3633#3610' 2'
            '3 '#3605#3633#3623' '#3626#3621#3633#3610#3605#3635#3649#3627#3609#3656#3591' 2 '#3585#3633#3610' 3'
            '3 '#3605#3633#3623' '#3626#3621#3633#3610#3605#3635#3649#3627#3609#3656#3591' 1 '#3585#3633#3610' 3')
          Style = csDropDownList
          TabOrder = 4
          Text = '3 '#3605#3633#3623' '#3626#3621#3633#3610#3605#3635#3649#3627#3609#3656#3591' 2 '#3585#3633#3610' 3'
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
          GlyphMode.Grayed = False
        end
      end
    end
    object NumList: TRichEdit
      Left = 4
      Top = 300
      Width = 311
      Height = 356
      Align = alClient
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      PopupMenu = PMenuNumList
      ScrollBars = ssVertical
      TabOrder = 1
      OnChange = NumListChange
      OnEnter = NumListEnter
      OnKeyDown = NumListKeyDown
      OnKeyPress = NumListKeyPress
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 148
    Height = 660
    Align = alLeft
    TabOrder = 1
    OnDblClick = edCustButtonClick
    object BtnClear: TSeSkinButton
      Left = 11
      Top = 366
      Width = 125
      Height = 43
      Hint = #3621#3657#3634#3591#3586#3657#3629#3617#3641#3621
      Performance = kspDoubleBuffer
      ShowHint = True
      Transparent = False
      OnClick = BtnClearClick
      BlackAndWhiteGlyph = False
      Caption = #3648#3588#3621#3637#3618#3619#3660#3586#3657#3629#3617#3641#3621
      State = kbsNormal
      ParentShowHint = False
      TabOrder = 0
      WordWrap = False
      ShowCaption = True
      ShowGlyph = True
      SkinObject = 'Button'
    end
    object SeSkinButton4: TSeSkinButton
      Left = 11
      Top = 582
      Width = 125
      Height = 35
      Hint = #3611#3636#3604#3627#3609#3657#3634#3605#3656#3634#3591
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
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000808000000000
        0000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00000000000000
        0000808080008080800000000000000000008080800080808000808000008080
        8000FFFFFF00FFFFFF008080800080808000FFFFFF00FFFFFF00808080008080
        8000C0C0C000C0C0C0008080800080808000C0C0C000C0C0C000FFFFFF00FFFF
        FF000000000000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFF
        FF00000000000000000080808000808080000000000000000000FFFFFF00FFFF
        FF008080800080808000FFFFFF00FFFFFF008080800080808000FFFFFF00FFFF
        FF008080800080808000C0C0C000C0C0C0008080800080808000000000000000
        0000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00000000000000
        000000000000C0C0C00000000000000000008080800080808000808080008080
        8000FFFFFF00FFFFFF008080800080808000FFFFFF00FFFFFF00808080008080
        800080808000C0C0C0008080800080808000C0C0C000C0C0C000000000000000
        0000000000000000000000000000000000000000000000000000C0C0C000C0C0
        C00000000000C0C0C00080808000000000000000000000000000808080008080
        8000808080008080800080808000808080008080800080808000C0C0C000C0C0
        C00080808000C0C0C00080808000808080008080800080808000808000008080
        00008080000080800000808000008080000000000000C0C0C000000000000000
        000000000000C0C0C00080808000808080000000000080800000808000008080
        00008080000080800000808000008080000080808000C0C0C000808080008080
        800080808000C0C0C00080808000808080008080800080800000808000008080
        0000808000008080000080800000808000000000000000000000000000000000
        000000000000C0C0C00080808000808080000000000080800000808000008080
        0000808000008080000080800000808000008080800080808000808080008080
        800080808000C0C0C00080808000808080008080800080800000808000008080
        0000808000008080000080800000808000000000000080808000808080008080
        800000000000C0C0C00080808000808080000000000080800000808000008080
        0000808000008080000080800000808000008080800080808000808080008080
        800080808000C0C0C00080808000808080008080800080800000808000008080
        0000808000008080000080800000808000000000000080808000808080008080
        800000000000C0C0C00080808000808080000000000080800000808000008080
        0000808000008080000080800000808000008080800080808000808080008080
        800080808000C0C0C00080808000808080008080800080800000808000008080
        0000000000000000000000000000000000000000000000000000000000008080
        800000000000C0C0C00000000000808080000000000080800000808000008080
        0000808080008080800080808000808080008080800080808000808080008080
        800080808000C0C0C000FFFFFF00808080008080800080800000808000008080
        0000000000000000FF000000FF000000FF000000FF000000FF00000000008080
        800000000000C0C0C00080808000808080000000000080800000808000008080
        000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080008080
        800080808000C0C0C00080808000808080008080800080800000808000000000
        00000000FF000000FF000000FF000000FF000000FF0000000000808080008080
        800000000000C0C0C00080808000808080000000000080800000808000008080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000808080008080
        800080808000C0C0C00080808000808080008080800080800000808000000000
        00000000FF00000000000000FF000000FF000000000080808000808080008080
        800000000000C0C0C00080808000808080000000000080800000808000008080
        8000FFFFFF0080808000FFFFFF00FFFFFF008080800080808000808080008080
        800080808000C0C0C00080808000808080008080800080800000808000000000
        000000000000000000000000FF00000000000000000080808000808080008080
        800000000000C0C0C00080808000808080000000000080800000808000008080
        80008080800080808000FFFFFF00808080008080800080808000808080008080
        800080808000C0C0C00080808000808080008080800080800000808000008080
        0000808000000000000000000000808000000000000080808000808080008080
        80008080800000000000C0C0C000808080000000000080800000808000008080
        0000808000008080800080808000808000008080800080808000808080008080
        80008080800080808000C0C0C000808080008080800080800000808000008080
        0000808000008080000080800000808000000000000080808000808080008080
        8000808080008080800000000000C0C0C0000000000080800000808000008080
        0000808000008080000080800000808000008080800080808000808080008080
        8000808080008080800080808000C0C0C0008080800080800000808000008080
        0000808000008080000080800000808000000000000000000000000000000000
        0000000000000000000000000000000000000000000080800000808000008080
        0000808000008080000080800000808000008080800080808000808080008080
        8000808080008080800080808000808080008080800080800000}
      ParentShowHint = False
      TabOrder = 1
      WordWrap = False
      ShowCaption = True
      ShowGlyph = True
      SkinObject = 'Button'
    end
    object eng: TMemo
      Left = 21
      Top = 520
      Width = 105
      Height = 33
      Font.Charset = THAI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
    object PasteBtn: TSeSkinButton
      Left = 11
      Top = 44
      Width = 125
      Height = 61
      Hint = #3585#3619#3629#3591#3586#3657#3629#3617#3641#3621#3592#3634#3585#3588#3621#3636#3611#3610#3629#3619#3660#3604
      Performance = kspDoubleBuffer
      ShowHint = True
      Transparent = False
      OnClick = PasteBtnClick
      BlackAndWhiteGlyph = False
      Caption = #3623#3634#3591#3592#3634#3585#3588#3621#3636#3611#3610#3629#3619#3660#3604
      State = kbsNormal
      ParentShowHint = False
      TabOrder = 3
      WordWrap = False
      ShowCaption = True
      ShowGlyph = True
      SkinObject = 'Button'
    end
    object BtnSaveImport: TSeSkinButton
      Left = 11
      Top = 172
      Width = 125
      Height = 61
      Hint = #3610#3633#3609#3607#3638#3585#3586#3657#3629#3617#3641#3621#3621#3591#3600#3634#3609#3586#3657#3629#3617#3641#3621
      Performance = kspDoubleBuffer
      ShowHint = True
      Transparent = False
      OnClick = BtnSaveImportClick
      BlackAndWhiteGlyph = False
      Caption = #3610#3633#3609#3607#3638#3585
      State = kbsNormal
      ParentShowHint = False
      TabOrder = 4
      WordWrap = False
      ShowCaption = True
      ShowGlyph = True
      SkinObject = 'Button'
    end
    object BtnCopy: TSeSkinButton
      Left = 11
      Top = 286
      Width = 125
      Height = 43
      Hint = #3605#3633#3604#3586#3657#3629#3617#3641#3621#3607#3633#3657#3591#3627#3617#3604#3621#3591#3588#3621#3636#3611#3610#3629#3619#3660#3604
      Performance = kspDoubleBuffer
      ShowHint = True
      Transparent = False
      OnClick = BtnCopyClick
      BlackAndWhiteGlyph = False
      Caption = #3605#3633#3604#3586#3657#3629#3617#3641#3621#3607#3633#3657#3591#3627#3617#3604
      State = kbsNormal
      ParentShowHint = False
      TabOrder = 5
      WordWrap = False
      ShowCaption = True
      ShowGlyph = True
      SkinObject = 'Button'
    end
    object ChkMovePanel: TSeSkinCheckBox
      Left = 13
      Top = 3
      Width = 98
      Height = 20
      Performance = kspDoubleBuffer
      Transparent = True
      OnClick = ChkMovePanelClick
      Caption = #3618#3657#3634#3618#3652#3611#3607#3634#3591#3586#3623#3634
      AllowGrayed = False
      Alignment = ktaLeftJustify
      Checked = False
      Spacing = 5
      State = cbUnchecked
      WordWrap = False
      TabOrder = 6
      SkinObject = 'CheckBox'
    end
    object BtnEditGrid: TSeSkinButton
      Left = 11
      Top = 108
      Width = 125
      Height = 43
      Hint = #3648#3611#3636#3604#3605#3634#3619#3634#3591#3648#3614#3639#3656#3629#3623#3634#3591#3649#3621#3632#3649#3585#3657#3652#3586#3586#3657#3629#3617#3641#3621#3592#3634#3585#3588#3621#3636#3611#3610#3629#3619#3660#3604
      Performance = kspDoubleBuffer
      ShowHint = True
      Transparent = False
      OnClick = BtnEditGridClick
      BlackAndWhiteGlyph = False
      Caption = #3623#3634#3591#3586#3657#3629#3617#3641#3621#3614#3636#3648#3624#3625
      State = kbsNormal
      ParentShowHint = False
      TabOrder = 7
      WordWrap = False
      ShowCaption = True
      ShowGlyph = True
      SkinObject = 'Button'
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 660
    Width = 467
    Height = 23
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      467
      23)
    object lbTotalNum: TLabel
      Left = 9
      Top = 5
      Width = 49
      Height = 13
      Caption = '0 '#3619#3634#3618#3585#3634#3619
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSum: TLabel
      Left = 357
      Top = 5
      Width = 105
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #3619#3623#3617#3648#3611#3655#3609#3648#3591#3636#3609' : 0 '#3610#3634#3607
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object ApplicationEvents1: TApplicationEvents
    OnMessage = ApplicationEvents1Message
    Left = 45
    Top = 422
  end
  object PMenuNumList: TPopupMenu
    Left = 79
    Top = 422
    object N1: TMenuItem
      Caption = #3648#3621#3639#3629#3585#3607#3633#3657#3591#3627#3617#3604
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N41: TMenuItem
      Caption = #3588#3633#3604#3621#3629#3585'...'
      OnClick = N41Click
    end
    object N3: TMenuItem
      Caption = #3605#3633#3604'...'
      OnClick = N3Click
    end
    object N42: TMenuItem
      Caption = '-'
    end
    object N19: TMenuItem
      Caption = #3623#3634#3591'...'
      OnClick = N19Click
    end
  end
end
