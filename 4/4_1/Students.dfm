object StartMenu: TStartMenu
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Androsov Ilya 851001'
  ClientHeight = 320
  ClientWidth = 559
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  PopupMenu = PopupMenu
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Menu: TLabel
    Left = 23
    Top = 0
    Width = 57
    Height = 25
    Align = alCustom
    Caption = 'Menu'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object StudentsList: TStringGrid
    Left = 0
    Top = 27
    Width = 559
    Height = 293
    Align = alBottom
    DefaultColWidth = 105
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu
    ScrollBars = ssVertical
    TabOrder = 0
    ColWidths = (
      105
      105
      105
      105
      105)
    RowHeights = (
      24)
  end
  object AddBtn: TButton
    Left = 124
    Top = 0
    Width = 74
    Height = 25
    Caption = 'Add'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = AddBtnClick
  end
  object EditBtn: TButton
    Left = 227
    Top = 0
    Width = 74
    Height = 25
    Caption = 'Edit'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = EditBtnClick
  end
  object DeleteBtn: TButton
    Left = 333
    Top = 0
    Width = 74
    Height = 25
    Caption = 'Delete'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = DeleteBtnClick
  end
  object SortBtn: TButton
    Left = 448
    Top = 0
    Width = 66
    Height = 25
    Caption = 'Sort'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = SortBtnClick
  end
  object SaveFile: TSaveDialog
    Filter = 'TextFile|*Andr'
    Left = 200
    Top = 176
  end
  object OpenFile: TOpenDialog
    Filter = 'TextFile|*Andr'
    Left = 200
    Top = 128
  end
  object MainMenu: TMainMenu
    Left = 272
    Top = 168
    object FIle1: TMenuItem
      Caption = 'FIle'
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
    object Help1: TMenuItem
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
    Left = 288
    Top = 96
  end
end
