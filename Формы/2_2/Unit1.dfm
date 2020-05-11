object Lab1_3: TLab1_3
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Binary code'
  ClientHeight = 87
  ClientWidth = 418
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
    Left = 8
    Top = 21
    Width = 173
    Height = 33
    Caption = 'Enter number:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Result: TLabel
    Left = 286
    Top = 21
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
    Left = 245
    Top = 21
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
  object Number: TEdit
    Left = 192
    Top = 18
    Width = 49
    Height = 41
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    PopupMenu = PopupMenu
    TabOrder = 1
    OnChange = NumberChange
    OnKeyPress = NumberKeyPress
  end
  object MainMenu: TMainMenu
    Left = 80
    Top = 24
    object Fi1: TMenuItem
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
    Left = 48
    Top = 24
  end
  object SaveFile: TSaveDialog
    Left = 24
    Top = 24
  end
  object PopupMenu: TPopupMenu
    Left = 16
    Top = 24
  end
end
