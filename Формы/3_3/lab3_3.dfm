object Ilya: TIlya
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Ilya'
  ClientHeight = 218
  ClientWidth = 330
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object EnterSize: TLabel
    Left = 36
    Top = 25
    Width = 94
    Height = 24
    Caption = 'Enter size:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Result: TLabel
    Left = 36
    Top = 152
    Width = 4
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Calculate: TButton
    Left = 108
    Top = 113
    Width = 87
    Height = 25
    Caption = 'Order'
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
  object Size: TEdit
    Left = 136
    Top = 25
    Width = 25
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu
    TabOrder = 1
    OnChange = SizeEditChange
    OnKeyPress = KeyPress
  end
  object SG: TStringGrid
    Left = 36
    Top = 55
    Width = 253
    Height = 53
    ColCount = 10
    DefaultColWidth = 24
    Enabled = False
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    PopupMenu = PopupMenu
    TabOrder = 2
    OnKeyPress = SGKeyPress
    ColWidths = (
      24
      24
      24
      24
      24
      23
      24
      24
      25
      24)
    RowHeights = (
      24
      24)
  end
  object SetSize: TButton
    Left = 186
    Top = 24
    Width = 87
    Height = 25
    Caption = 'Set Size'
    Enabled = False
    TabOrder = 3
    OnClick = SetSizeClick
  end
  object MainMenu: TMainMenu
    Left = 288
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
    Left = 16
    Top = 8
  end
  object SaveFile: TSaveDialog
    Left = 16
    Top = 8
  end
  object PopupMenu: TPopupMenu
    Left = 16
    Top = 8
  end
end
