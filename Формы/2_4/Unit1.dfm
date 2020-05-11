object Ilya: TIlya
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Merge of arrays A and B into ordered array C without repetitions'
  ClientHeight = 128
  ClientWidth = 526
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  PopupMenu = PopupMenu
  Visible = True
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object EnterSize: TLabel
    Left = 20
    Top = 17
    Width = 87
    Height = 24
    Caption = 'Enter size'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 308
    Top = 17
    Width = 87
    Height = 24
    Caption = 'Enter size'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Calculate: TButton
    Left = 20
    Top = 79
    Width = 82
    Height = 28
    Caption = 'Transform'
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
  object SizeA: TEdit
    Left = 110
    Top = 16
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
    OnChange = SizeAEditChange
    OnKeyPress = KeyPress
  end
  object SGA: TStringGrid
    Left = 20
    Top = 47
    Width = 203
    Height = 26
    ColCount = 8
    DefaultColWidth = 24
    Enabled = False
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    PopupMenu = PopupMenu
    TabOrder = 2
    OnKeyPress = SGAKeyPress
    OnKeyUp = SGAKeyUp
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
      24)
  end
  object SetSizeA: TButton
    Left = 136
    Top = 16
    Width = 87
    Height = 25
    Caption = 'Set Size'
    Enabled = False
    TabOrder = 3
    OnClick = SetSizeAClick
  end
  object SizeB: TEdit
    Left = 398
    Top = 17
    Width = 25
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu
    TabOrder = 4
    OnChange = SizeBEditChange
    OnKeyPress = KeyPress
  end
  object SGB: TStringGrid
    Left = 308
    Top = 47
    Width = 203
    Height = 26
    ColCount = 8
    DefaultColWidth = 24
    Enabled = False
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    PopupMenu = PopupMenu
    TabOrder = 5
    OnKeyPress = SGBKeyPress
    OnKeyUp = SGBKeyUp
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
      24)
  end
  object SetSizeB: TButton
    Left = 424
    Top = 16
    Width = 87
    Height = 25
    Caption = 'Set Size'
    Enabled = False
    TabOrder = 6
    OnClick = SetSizeBClick
  end
  object SGC: TStringGrid
    Left = 108
    Top = 79
    Width = 403
    Height = 28
    ColCount = 16
    DefaultColWidth = 24
    Enabled = False
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    PopupMenu = PopupMenu
    TabOrder = 7
    OnKeyPress = SGAKeyPress
    ColWidths = (
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24)
    RowHeights = (
      24)
  end
  object MainMenu: TMainMenu
    Left = 264
    Top = 32
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
    Left = 224
    Top = 8
  end
  object SaveFile: TSaveDialog
    Left = 224
    Top = 32
  end
  object PopupMenu: TPopupMenu
    Left = 264
    Top = 8
  end
end
