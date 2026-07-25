object fFilelist: TfFilelist
  Left = 424
  Top = 317
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Delete Import Files'
  ClientHeight = 321
  ClientWidth = 545
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 459
    Top = 222
    Width = 23
    Height = 23
    Caption = '...'
    Visible = False
    OnClick = SpeedButton1Click
  end
  object Label1: TLabel
    Left = 16
    Top = 290
    Width = 51
    Height = 13
    Caption = 'Import Dir :'
    Visible = False
  end
  object SpeedButton2: TSpeedButton
    Left = 408
    Top = 287
    Width = 26
    Height = 22
    Caption = '...'
    Visible = False
    OnClick = SpeedButton2Click
  end
  object edDir: TEdit
    Left = 80
    Top = 288
    Width = 321
    Height = 21
    TabStop = False
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 0
    Text = 'F:\Delphi\Project\LuckyNumber\Source\Backup\'
    Visible = False
  end
  object RestoreBtn: TButton
    Left = 456
    Top = 104
    Width = 75
    Height = 25
    Caption = #3609#3635#3648#3586#3657#3634
    Enabled = False
    TabOrder = 1
    Visible = False
    OnClick = RestoreBtnClick
  end
  object Button2: TButton
    Left = 456
    Top = 285
    Width = 75
    Height = 25
    Caption = #3611#3636#3604
    TabOrder = 2
    OnClick = Button2Click
  end
  object DelBtn: TButton
    Left = 456
    Top = 24
    Width = 75
    Height = 25
    Caption = #3621#3610
    Enabled = False
    TabOrder = 3
    OnClick = DelBtnClick
  end
  object FileList: TSortListView
    Left = 16
    Top = 24
    Width = 425
    Height = 286
    Checkboxes = True
    Columns = <
      item
        Caption = #3594#3639#3656#3629#3652#3615#3621#3660
        Width = 200
      end
      item
        Caption = #3626#3619#3657#3634#3591
        Width = 130
      end
      item
        Alignment = taRightJustify
        Caption = #3586#3609#3634#3604
        Width = 85
      end>
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 4
    ViewStyle = vsReport
    OnClick = FileListClick
  end
  object ChkSelAll: TCheckBox
    Left = 22
    Top = 6
    Width = 97
    Height = 17
    Caption = #3648#3621#3639#3629#3585#3607#3633#3657#3591#3627#3617#3604
    TabOrder = 5
    OnClick = ChkSelAllClick
  end
  object ApplicationEvents1: TApplicationEvents
    OnMessage = ApplicationEvents1Message
    Left = 472
    Top = 136
  end
  object BrowseForFolder: TBrowseForFolder
    StatusText = #3648#3621#3639#3629#3585' Backup Directory '
    Title = #3648#3621#3639#3629#3585' Backup Directory'
    NewDialogStyle = True
    EditBox = False
    Left = 472
    Top = 168
  end
end
