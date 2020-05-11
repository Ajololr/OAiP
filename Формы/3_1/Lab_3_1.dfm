object Ilya: TIlya
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Unique characters'
  ClientHeight = 308
  ClientWidth = 249
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  PopupMenu = PopupMenu
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object EnterData: TLabel
    Left = 72
    Top = 24
    Width = 105
    Height = 25
    Caption = 'Enter data:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu
  end
  object FirstUniqueStr: TLabel
    Left = 8
    Top = 230
    Width = 108
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu
  end
  object SecondUniqueStr: TLabel
    Left = 8
    Top = 268
    Width = 97
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu
  end
  object CommonStr: TLabel
    Left = 8
    Top = 192
    Width = 81
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu
  end
  object FirstStr: TEdit
    Left = 48
    Top = 68
    Width = 161
    Height = 21
    PopupMenu = PopupMenu
    TabOrder = 0
    OnChange = FirstStrChange
    OnKeyPress = FirstStrKeyPress
  end
  object SecondStr: TEdit
    Left = 48
    Top = 104
    Width = 161
    Height = 21
    PopupMenu = PopupMenu
    TabOrder = 1
    OnChange = SecondStrChange
    OnKeyPress = SecondStrKeyPress
  end
  object Find: TButton
    Left = 88
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Find'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu
    TabOrder = 2
    OnClick = FindClick
  end
  object PopupMenu: TPopupMenu
    Top = 8
  end
  object SaveFile: TSaveDialog
    Top = 8
  end
  object OpenFile: TOpenDialog
    Left = 32
    Top = 8
  end
  object MainMenu: TMainMenu
    Top = 8
    object File1: TMenuItem
      Caption = 'File'
      object Open: TMenuItem
        Caption = 'Open...'
        ShortCut = 16463
        OnClick = OpenClick
      end
      object Save: TMenuItem
        Caption = 'Save...'
        Enabled = False
        ShortCut = 16467
        OnClick = SaveClick
      end
      object N1: TMenuItem
        Caption = '-'
        Enabled = False
      end
      object Exit: TMenuItem
        Caption = 'Exit'
        ShortCut = 16453
        OnClick = ExitClick
      end
    end
    object Help: TMenuItem
      Caption = 'Help'
      object Abouttheprogram: TMenuItem
        Caption = 'About the program'
        ShortCut = 16464
        OnClick = AbouttheprogramClick
      end
      object Aboutthedeveloper: TMenuItem
        Caption = 'About the developer'
        ShortCut = 16452
        OnClick = AboutthedeveloperClick
      end
    end
  end
end
