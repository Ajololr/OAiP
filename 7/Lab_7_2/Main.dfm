object Ilya: TIlya
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Androsov Ilya, 851001'
  ClientHeight = 402
  ClientWidth = 331
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SetSizeLbl: TLabel
    Left = 8
    Top = 12
    Width = 98
    Height = 25
    Caption = 'Enter size:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SG: TStringGrid
    Left = 8
    Top = 43
    Width = 313
    Height = 313
    ColCount = 10
    DefaultColWidth = 30
    DefaultRowHeight = 30
    Enabled = False
    FixedColor = clBackground
    FixedCols = 0
    RowCount = 10
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    GradientEndColor = clGray
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    TabOrder = 0
    OnKeyPress = SGKeyPress
    ColWidths = (
      30
      30
      30
      30
      30
      30
      30
      30
      30
      30)
  end
  object TransformBtn: TButton
    Left = 96
    Top = 362
    Width = 121
    Height = 35
    Caption = 'Transform'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = TransformBtnClick
  end
  object SetSizeBtn: TButton
    Left = 200
    Top = 2
    Width = 121
    Height = 35
    Caption = 'Set Size'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = SetSizeBtnClick
  end
  object SizeEdit: TEdit
    Left = 112
    Top = 6
    Width = 25
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnChange = SizeEditChange
    OnKeyPress = SizeEditKeyPress
  end
  object MainMenu: TMainMenu
    Left = 216
    Top = 196
    object FileMenu: TMenuItem
      Caption = 'File'
      object Open: TMenuItem
        Caption = 'Open...'
        OnClick = OpenClick
      end
      object N: TMenuItem
        Caption = '-'
      end
      object Exit: TMenuItem
        Caption = 'Exit'
        OnClick = ExitClick
      end
    end
    object Help: TMenuItem
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
  object OpenFile: TOpenDialog
    Filter = 'TextFile|*txt'
    Left = 192
    Top = 276
  end
  object PopupMenu: TPopupMenu
    Left = 128
    Top = 252
  end
end
