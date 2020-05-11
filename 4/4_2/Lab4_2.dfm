object Ilya: TIlya
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Ilya Androsov 851001'
  ClientHeight = 194
  ClientWidth = 457
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
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object EnterSize: TLabel
    Left = 128
    Top = 24
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
  object Answer: TLabel
    Left = 35
    Top = 155
    Width = 6
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu
  end
  object EnterNumber: TLabel
    Left = 114
    Top = 126
    Width = 128
    Height = 24
    Caption = 'Enter number:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SG: TStringGrid
    Left = 40
    Top = 67
    Width = 372
    Height = 51
    ColCount = 15
    DefaultColWidth = 24
    Enabled = False
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    PopupMenu = PopupMenu
    TabOrder = 0
    OnKeyPress = SGKeyPress
    OnKeyUp = SGKeyUp
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
      24)
    RowHeights = (
      24
      24)
  end
  object SetSize: TButton
    Left = 272
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Set size'
    TabOrder = 1
    OnClick = SetSizeClick
  end
  object SizeEdit: TSpinEdit
    Left = 232
    Top = 26
    Width = 34
    Height = 22
    EditorEnabled = False
    MaxValue = 15
    MinValue = 2
    PopupMenu = PopupMenu
    TabOrder = 2
    Value = 2
    OnChange = SizeEditChange
    OnKeyUp = SizeEditKeyUp
  end
  object NumberEdit: TEdit
    Left = 248
    Top = 126
    Width = 34
    Height = 21
    Enabled = False
    PopupMenu = PopupMenu
    TabOrder = 3
    OnChange = NumberEditChange
    OnKeyPress = NumberEditKeyPress
    OnKeyUp = NumberEditKeyUp
  end
  object FindNum: TButton
    Left = 288
    Top = 126
    Width = 73
    Height = 25
    Caption = 'Find number'
    Enabled = False
    TabOrder = 4
    OnClick = FindNumClick
  end
  object MainMenu: TMainMenu
    Left = 32
    Top = 8
    object FileMenu: TMenuItem
      Caption = 'File'
      object Open: TMenuItem
        Caption = 'Open...'
        OnClick = OpenClick
      end
      object Save: TMenuItem
        Caption = 'Save...'
        Enabled = False
        OnClick = SaveClick
      end
      object N1: TMenuItem
        Caption = '-'
        Enabled = False
      end
      object Exit: TMenuItem
        Caption = 'Exit'
        OnClick = ExitClick
      end
    end
    object HelpMenu: TMenuItem
      Caption = 'Help'
      object AboutTheProgram: TMenuItem
        Caption = 'About the program'
        OnClick = AboutTheProgramClick
      end
      object AboutTheDeveloper: TMenuItem
        Caption = 'About the developer'
        OnClick = AboutTheDeveloperClick
      end
    end
  end
  object PopupMenu: TPopupMenu
    Left = 392
    Top = 8
  end
  object SaveFile: TSaveDialog
    Filter = 'TextFile|*.txt'
    Left = 80
    Top = 8
  end
  object OpenFile: TOpenDialog
    Filter = 'TextFile|*.txt'
    Left = 360
  end
end
