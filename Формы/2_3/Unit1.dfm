object Ilya: TIlya
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sum under the main diagonal'
  ClientHeight = 310
  ClientWidth = 312
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
    Left = 137
    Top = 272
    Width = 6
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object EnterSize: TLabel
    Left = 44
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
    Left = 44
    Top = 271
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
    Left = 137
    Top = 17
    Width = 25
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu
    TabOrder = 1
    OnChange = SizeEditChange
    OnKeyPress = KeyPress
  end
  object SG: TStringGrid
    Left = 44
    Top = 55
    Width = 205
    Height = 203
    ColCount = 8
    DefaultColWidth = 24
    Enabled = False
    FixedCols = 0
    RowCount = 8
    FixedRows = 0
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
      24
      24
      24
      24
      24
      24
      24)
  end
  object SetSize: TButton
    Left = 168
    Top = 17
    Width = 87
    Height = 25
    Caption = 'Set Size'
    Enabled = False
    TabOrder = 3
    OnClick = SetSizeClick
  end
  object MainMenu: TMainMenu
    Left = 264
    Top = 56
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
    Left = 264
    Top = 160
  end
  object SaveFile: TSaveDialog
    Left = 272
    Top = 232
  end
  object PopupMenu: TPopupMenu
    Left = 264
    Top = 104
  end
end
