object Lab_5_2: TLab_5_2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Androsov Ilya 851001'
  ClientHeight = 375
  ClientWidth = 861
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object NumberOfDots: TLabel
    Left = 144
    Top = 8
    Width = 201
    Height = 24
    Caption = 'Enter number of dots :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 113
    Top = 125
    Width = 271
    Height = 24
    Caption = 'Enter coordinates of the dots :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Result: TLabel
    Left = 189
    Top = 304
    Width = 5
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Image1: TImage
    Left = 460
    Top = 8
    Width = 393
    Height = 359
    PopupMenu = PopupMenu1
  end
  object Num: TEdit
    Left = 213
    Top = 38
    Width = 68
    Height = 21
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnChange = NumChange
    OnKeyPress = NumKeyPress
  end
  object StringGrid: TStringGrid
    Left = 80
    Top = 155
    Width = 320
    Height = 95
    ColCount = 6
    DefaultColWidth = 60
    DefaultRowHeight = 20
    Enabled = False
    RowCount = 3
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    PopupMenu = PopupMenu1
    TabOrder = 1
    OnKeyPress = StringGridKeyPress
    ColWidths = (
      60
      60
      60
      60
      60
      60)
    RowHeights = (
      20
      20
      20)
  end
  object Create: TButton
    Left = 200
    Top = 72
    Width = 89
    Height = 33
    Caption = 'Create'
    Enabled = False
    TabOrder = 2
    OnClick = CreateClick
  end
  object TryAgain: TButton
    Left = 200
    Top = 336
    Width = 89
    Height = 31
    Caption = 'Try again'
    TabOrder = 3
    Visible = False
    OnClick = TryAgainClick
  end
  object Calculate: TButton
    Left = 200
    Top = 256
    Width = 89
    Height = 33
    Caption = 'Calculate'
    Enabled = False
    TabOrder = 4
    OnClick = CalculateClick
  end
  object MainMenu1: TMainMenu
    Left = 8
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
      end
      object Exit: TMenuItem
        Caption = 'Exit'
        ShortCut = 16453
        OnClick = ExitClick
      end
    end
    object Help: TMenuItem
      Caption = 'Help'
      object Abouttheprogram1: TMenuItem
        Caption = 'About the program'
        ShortCut = 16464
        OnClick = Abouttheprogram1Click
      end
      object Aboutthedeveloper1: TMenuItem
        Caption = 'About the developer'
        ShortCut = 16452
        OnClick = Aboutthedeveloper1Click
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 8
    Top = 56
  end
  object SaveFile: TSaveDialog
    Left = 8
    Top = 104
  end
  object OpenFile: TOpenDialog
    Left = 8
    Top = 152
  end
end
