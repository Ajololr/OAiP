object Lab1_2: TLab1_2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = '2 in the power of N'
  ClientHeight = 123
  ClientWidth = 293
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  PopupMenu = PopupMenu
  Position = poDesktopCenter
  Visible = True
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 40
    Width = 15
    Height = 33
    Caption = '2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Result: TLabel
    Left = 110
    Top = 40
    Width = 8
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Calculate: TButton
    Left = 71
    Top = 40
    Width = 33
    Height = 33
    Caption = '='
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = CalculateClick
  end
  object Power: TEdit
    Left = 40
    Top = 21
    Width = 25
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    PopupMenu = PopupMenu
    TabOrder = 1
    OnChange = PowerChange
    OnKeyPress = PowerKeyPress
  end
  object MainMenu: TMainMenu
    Left = 64
    Top = 80
    object Fi1: TMenuItem
      Caption = 'File'
      object Open: TMenuItem
        Caption = 'Open...'
        ShortCut = 16463
        OnClick = OpenClick
      end
      object Save: TMenuItem
        Caption = 'Save...'
        ShortCut = 16467
        OnClick = SaveClick
      end
      object Nothing: TMenuItem
        Caption = '-'
      end
      object Exit: TMenuItem
        Caption = 'Exit'
        ShortCut = 16453
        OnClick = ExitClick
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object Aboutprogram: TMenuItem
        Caption = 'About the program'
        ShortCut = 16464
        OnClick = AboutprogramClick
      end
      object Aboutthedeveloper: TMenuItem
        Caption = 'About the developer'
        ShortCut = 16452
        OnClick = AboutthedeveloperClick
      end
    end
  end
  object OpenFile: TOpenDialog
    Left = 16
    Top = 80
  end
  object SaveFile: TSaveDialog
    Left = 112
    Top = 80
  end
  object PopupMenu: TPopupMenu
    Left = 160
    Top = 80
  end
end
