object frmCorectNum: TfrmCorectNum
  Left = 625
  Top = 149
  Width = 357
  Height = 604
  BorderIcons = [biSystemMenu]
  Caption = #3619#3634#3618#3585#3634#3619#3606#3641#3585#3627#3623#3618
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PanelNameCor: TPanel
    Left = 0
    Top = 0
    Width = 341
    Height = 41
    Align = alTop
    Caption = #3594#3639#3656#3629#3621#3641#3585#3588#3657#3634#3607#3637#3656#3606#3641#3585#3627#3623#3618
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 514
    Width = 341
    Height = 51
    Align = alBottom
    TabOrder = 1
    object ProcessBtn: TSeSkinButton
      Left = 124
      Top = 9
      Width = 81
      Height = 27
      Performance = kspDoubleBuffer
      Transparent = False
      BlackAndWhiteGlyph = False
      Caption = #3611#3636#3604
      Font.Charset = THAI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 1
      State = kbsNormal
      TabOrder = 0
      WordWrap = False
      ShowCaption = True
      ShowGlyph = True
      SkinObject = 'Button'
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 341
    Height = 473
    Align = alClient
    BorderWidth = 3
    TabOrder = 2
    object NGridCorrect: TNiceGrid
      Left = 4
      Top = 4
      Width = 333
      Height = 465
      Cursor = 101
      ColCount = 9
      RowCount = 0
      GridColor = 16503498
      HeaderFont.Charset = THAI_CHARSET
      HeaderFont.Color = clNavy
      HeaderFont.Height = -13
      HeaderFont.Name = 'System'
      HeaderFont.Style = [fsBold]
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      SelectionColor = 16744703
      FitToWidth = True
      ReadOnly = True
      Columns = <
        item
          Title = #3648#3621#3586
          Width = 50
          Color = clSkyBlue
          HorzAlign = haCenter
          CanResize = False
          ReadOnly = True
        end
        item
          Title = #3610#3609
          Width = 66
          HorzAlign = haRight
          ReadOnly = True
        end
        item
          Title = #3621#3656#3634#3591
          Width = 71
          HorzAlign = haRight
          ReadOnly = True
        end
        item
          Title = 'ID'
          Width = 80
          HorzAlign = haRight
          Visible = False
          ReadOnly = True
        end
        item
          Title = #3621#3641#3585#3588#3657#3634
          Width = 41
          HorzAlign = haCenter
          Visible = False
        end
        item
          Title = #3648#3621#3656#3617
          Width = 43
          HorzAlign = haCenter
        end
        item
          Title = 'UserID'
          Width = 31
          Visible = False
        end
        item
          Title = 'LotType'
          Width = 97
          Visible = False
        end
        item
          Title = #3606#3641#3585
          Width = 69
          HorzAlign = haRight
        end>
      GutterKind = gkNumber
      GutterWidth = 30
      GutterFont.Charset = DEFAULT_CHARSET
      GutterFont.Color = clWindowText
      GutterFont.Height = -11
      GutterFont.Name = 'MS Sans Serif'
      GutterFont.Style = []
      ShowFooter = False
      Font.Charset = THAI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Align = alClient
      TabOrder = 0
    end
  end
end
