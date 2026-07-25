object frmPasteNumPrice: TfrmPasteNumPrice
  Left = 659
  Top = 145
  BorderStyle = bsDialog
  Caption = #3623#3634#3591#3648#3621#3586#3649#3621#3632#3619#3634#3588#3634#3592#3634#3585#3588#3621#3636#3611#3610#3629#3619#3660#3604
  ClientHeight = 603
  ClientWidth = 460
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 128
    Top = 0
    Width = 332
    Height = 603
    Align = alClient
    BorderWidth = 2
    TabOrder = 0
    object EditGrid: TNiceGrid
      Left = 3
      Top = 41
      Width = 326
      Height = 537
      Cursor = 101
      ColCount = 2
      RowCount = 1
      AutoAddRow = True
      AlternateColor = 13434828
      GridColor = clSilver
      HeaderLine = 2
      HeaderFont.Charset = THAI_CHARSET
      HeaderFont.Color = clBlue
      HeaderFont.Height = -13
      HeaderFont.Name = 'System'
      HeaderFont.Style = [fsBold]
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clBlue
      FooterFont.Height = -13
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = [fsBold]
      SelectionColor = 16762566
      FitToWidth = True
      Columns = <
        item
          Title = #3648#3621#3586'('#3649#3621#3632#3592#3635#3609#3623#3609#3648#3591#3636#3609#3606#3657#3634#3617#3637')'
          Width = 146
          HorzAlign = haCenter
        end
        item
          Title = #3592#3635#3609#3623#3609#3648#3591#3636#3609'('#3606#3657#3634#3617#3637')'
          Width = 136
          HorzAlign = haRight
          Strings.Strings = (
            '')
        end>
      GutterKind = gkNumber
      GutterWidth = 40
      GutterFont.Charset = THAI_CHARSET
      GutterFont.Color = clBlue
      GutterFont.Height = -11
      GutterFont.Name = 'MS Sans Serif'
      GutterFont.Style = []
      ShowFooter = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Align = alClient
      TabOrder = 0
      TabStop = False
      OnKeyPress = EditGridKeyPress
      OnKeyDown = EditGridKeyDown
    end
    object Panel3: TPanel
      Left = 3
      Top = 578
      Width = 326
      Height = 22
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
    end
    object Panel2: TPanel
      Left = 3
      Top = 3
      Width = 326
      Height = 38
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object CbNumType: TsComboBox
        Left = 16
        Top = 9
        Width = 265
        Height = 21
        ItemIndex = 0
        ItemHeight = 13
        Items.Strings = (
          #3610#3609
          #3621#3656#3634#3591
          #3621#3629#3618
          #3610#3609'-'#3621#3656#3634#3591)
        Style = csDropDownList
        TabOrder = 0
        Text = #3610#3609
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
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 128
    Height = 603
    Align = alLeft
    TabOrder = 1
    object BtnCopy: TSeSkinButton
      Left = 10
      Top = 174
      Width = 110
      Height = 27
      Performance = kspDoubleBuffer
      ShowHint = True
      Transparent = False
      Visible = False
      OnClick = BtnCopyClick
      BlackAndWhiteGlyph = False
      Caption = #3623#3634#3591#3586#3657#3629#3617#3641#3621#3588#3621#3636#3611#3610#3629#3619#3660#3604
      State = kbsNormal
      ParentShowHint = False
      TabOrder = 0
      WordWrap = False
      ShowCaption = True
      ShowGlyph = True
      SkinObject = 'Button'
    end
    object SeSkinButton3: TSeSkinButton
      Left = 10
      Top = 334
      Width = 110
      Height = 35
      Performance = kspDoubleBuffer
      ShowHint = True
      Transparent = False
      OnClick = SeSkinButton3Click
      BlackAndWhiteGlyph = False
      Caption = #3648#3588#3621#3637#3618#3619#3660
      State = kbsNormal
      ParentShowHint = False
      TabOrder = 1
      WordWrap = False
      ShowCaption = True
      ShowGlyph = True
      SkinObject = 'Button'
    end
    object SeSkinButton1: TSeSkinButton
      Left = 10
      Top = 560
      Width = 110
      Height = 33
      Performance = kspDoubleBuffer
      ShowHint = True
      Transparent = False
      BlackAndWhiteGlyph = False
      Caption = #3618#3585#3648#3621#3636#3585
      Kind = bkCancel
      ModalResult = 2
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
        0000808000008080000080800000808000008080000080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        0000808000008080000080800000808000008080000080800000808000000000
        FF00000000000000000000000000808000008080000080800000808000008080
        00000000FF00000000000000000000000000808000008080000080800000FFFF
        FF00808080008080800080808000808000008080000080800000808000008080
        0000FFFFFF008080800080808000808080008080000080800000808000000000
        FF00000080000000800000008000000000008080000080800000808000000000
        FF0000008000000080000000800000000000808000008080000080800000FFFF
        FF0080808000808080008080800080808000808000008080000080800000FFFF
        FF00808080008080800080808000808080008080000080800000808000008080
        00000000FF0000008000000080000000800000000000808000000000FF000000
        8000000080000000800000000000808000008080000080800000808000008080
        0000FFFFFF008080800080808000808080008080800080800000FFFFFF008080
        8000808080008080800080808000808000008080000080800000808000008080
        0000808000000000FF0000008000000080000000800000000000000080000000
        8000000080000000000080800000808000008080000080800000808000008080
        000080800000FFFFFF0080808000808080008080800080808000808080008080
        8000808080008080800080800000808000008080000080800000808000008080
        000080800000808000000000FF00000080000000800000008000000080000000
        8000000000008080000080800000808000008080000080800000808000008080
        00008080000080800000FFFFFF00808080008080800080808000808080008080
        8000808080008080000080800000808000008080000080800000808000008080
        00008080000080800000808000000000FF000000800000008000000080000000
        0000808000008080000080800000808000008080000080800000808000008080
        0000808000008080000080800000FFFFFF008080800080808000808080008080
        8000808000008080000080800000808000008080000080800000808000008080
        000080800000808000000000FF00000080000000800000008000000080000000
        8000000000008080000080800000808000008080000080800000808000008080
        00008080000080800000FFFFFF00808080008080800080808000808080008080
        8000808080008080000080800000808000008080000080800000808000008080
        0000808000000000FF0000008000000080000000800000000000000080000000
        8000000080000000000080800000808000008080000080800000808000008080
        000080800000FFFFFF0080808000808080008080800080808000808080008080
        8000808080008080800080800000808000008080000080800000808000008080
        00000000FF0000008000000080000000800000000000808000000000FF000000
        8000000080000000800000000000808000008080000080800000808000008080
        0000FFFFFF008080800080808000808080008080800080800000FFFFFF008080
        8000808080008080800080808000808000008080000080800000808000000000
        FF00000080000000800000008000000000008080000080800000808000000000
        FF0000008000000080000000800000000000808000008080000080800000FFFF
        FF0080808000808080008080800080808000808000008080000080800000FFFF
        FF00808080008080800080808000808080008080000080800000808000000000
        FF000000FF000000FF000000FF00808000008080000080800000808000008080
        00000000FF000000FF000000FF000000FF00808000008080000080800000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00808000008080000080800000808000008080
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF008080000080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        0000808000008080000080800000808000008080000080800000808000008080
        0000808000008080000080800000808000008080000080800000}
      ParentShowHint = False
      TabOrder = 2
      WordWrap = False
      ShowCaption = True
      ShowGlyph = True
      SkinObject = 'Button'
    end
    object BtnDelEditGrid: TSeSkinButton
      Left = 10
      Top = 374
      Width = 110
      Height = 35
      Performance = kspDoubleBuffer
      ShowHint = True
      Transparent = False
      OnClick = BtnDelEditGridClick
      BlackAndWhiteGlyph = False
      Caption = #3621#3610
      State = kbsNormal
      ParentShowHint = False
      TabOrder = 3
      WordWrap = False
      ShowCaption = True
      ShowGlyph = True
      SkinObject = 'Button'
    end
    object SeSkinButton2: TSeSkinButton
      Left = 10
      Top = 6
      Width = 110
      Height = 59
      Performance = kspDoubleBuffer
      ShowHint = True
      Transparent = False
      OnClick = SeSkinButton2Click
      BlackAndWhiteGlyph = False
      Caption = #3605#3585#3621#3591
      State = kbsNormal
      ParentShowHint = False
      TabOrder = 4
      WordWrap = False
      ShowCaption = True
      ShowGlyph = True
      SkinObject = 'Button'
    end
    object SeSkinButton4: TSeSkinButton
      Left = 10
      Top = 81
      Width = 110
      Height = 91
      Performance = kspDoubleBuffer
      ShowHint = True
      Transparent = False
      OnClick = SeSkinButton4Click
      BlackAndWhiteGlyph = False
      Caption = #3623#3634#3591#3586#3657#3629#3617#3641#3621#3588#3621#3636#3611#3610#3629#3619#3660#3604
      State = kbsNormal
      ParentShowHint = False
      TabOrder = 5
      WordWrap = False
      ShowCaption = True
      ShowGlyph = True
      SkinObject = 'Button'
    end
    object SeSkinButton5: TSeSkinButton
      Left = 10
      Top = 214
      Width = 110
      Height = 35
      Hint = #3605#3633#3604#3648#3629#3634#3648#3593#3614#3634#3632#3586#3657#3629#3588#3623#3634#3617#3607#3637#3656#3629#3618#3641#3656#3627#3609#3657#3634#3648#3588#3619#3639#3656#3629#3591#3627#3617#3634#3618
      Performance = kspDoubleBuffer
      ShowHint = True
      Transparent = False
      OnClick = SeSkinButton5Click
      BlackAndWhiteGlyph = False
      Caption = #3648#3629#3634#3648#3593#3614#3634#3632#3627#3609#3657#3634
      State = kbsNormal
      ParentShowHint = False
      TabOrder = 6
      WordWrap = False
      ShowCaption = True
      ShowGlyph = True
      SkinObject = 'Button'
    end
    object SeSkinButton6: TSeSkinButton
      Left = 10
      Top = 254
      Width = 110
      Height = 35
      Hint = #3605#3633#3604#3648#3629#3634#3648#3593#3614#3634#3632#3586#3657#3629#3588#3623#3634#3617#3607#3637#3656#3629#3618#3641#3656#3627#3609#3657#3634#3648#3588#3619#3639#3656#3629#3591#3627#3617#3634#3618
      Performance = kspDoubleBuffer
      ShowHint = True
      Transparent = False
      OnClick = SeSkinButton6Click
      BlackAndWhiteGlyph = False
      Caption = #3621#3610#3649#3606#3623#3607#3637#3656#3623#3656#3634#3591
      State = kbsNormal
      ParentShowHint = False
      TabOrder = 7
      WordWrap = False
      ShowCaption = True
      ShowGlyph = True
      SkinObject = 'Button'
    end
  end
end
