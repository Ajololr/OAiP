object Ilya: TIlya
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Horner'#39's scheme'
  ClientHeight = 193
  ClientWidth = 278
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
  object Result: TLabel
    Left = 149
    Top = 158
    Width = 4
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EnterSize: TLabel
    Left = 36
    Top = 19
    Width = 64
    Height = 16
    Caption = 'Enter size'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object NumbX: TLabel
    Left = 152
    Top = 19
    Width = 48
    Height = 16
    Caption = 'Enter X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LableAnswer: TLabel
    Left = 76
    Top = 158
    Width = 67
    Height = 16
    Caption = 'The sum is'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Calculate: TButton
    Left = 152
    Top = 41
    Width = 87
    Height = 25
    Caption = 'Calculate'
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
    Left = 101
    Top = 11
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
    Top = 88
    Width = 203
    Height = 53
    ColCount = 8
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
      24
      24
      24)
    RowHeights = (
      24
      24)
  end
  object SetSize: TButton
    Left = 36
    Top = 41
    Width = 90
    Height = 25
    Caption = 'Set Size'
    Enabled = False
    TabOrder = 3
    OnClick = SetSizeClick
  end
  object XEdit: TEdit
    Left = 214
    Top = 11
    Width = 25
    Height = 24
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu
    TabOrder = 4
    OnChange = XEditChange
    OnKeyPress = KeyPress
  end
  object MainMenu: TMainMenu
    Top = 160
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
    Top = 16
  end
  object SaveFile: TSaveDialog
    Top = 64
  end
  object PopupMenu: TPopupMenu
    Top = 112
  end
end
