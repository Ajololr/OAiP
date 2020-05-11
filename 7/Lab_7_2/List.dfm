object ListForm: TListForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Androsov Ilya, 851001'
  ClientHeight = 284
  ClientWidth = 666
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  PopupMenu = PopupMenu
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ListSG: TStringGrid
    Left = 0
    Top = 0
    Width = 666
    Height = 284
    Align = alClient
    ColCount = 21
    DefaultColWidth = 30
    DefaultRowHeight = 30
    Enabled = False
    FixedCols = 0
    RowCount = 9
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 561
    ExplicitHeight = 305
  end
  object PopupMenu: TPopupMenu
    Left = 232
    Top = 144
  end
  object MainMenu: TMainMenu
    Left = 152
    Top = 136
    object FileMenu: TMenuItem
      Caption = 'File'
      object Save1: TMenuItem
        Caption = 'Save...'
        OnClick = Save1Click
      end
      object N: TMenuItem
        Caption = '-'
      end
      object Exit: TMenuItem
        Caption = 'Exit'
        OnClick = ExitClick
      end
    end
  end
  object SaveFile: TSaveDialog
    Filter = 'TextFile|*txt'
    Left = 128
    Top = 64
  end
end
