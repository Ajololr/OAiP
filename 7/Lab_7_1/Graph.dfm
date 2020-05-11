object GraphForm: TGraphForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Androsov Ilya, 851001'
  ClientHeight = 397
  ClientWidth = 376
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
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ResultLbl: TLabel
    Left = 72
    Top = 323
    Width = 6
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SearchBtn: TButton
    Left = 168
    Top = 352
    Width = 97
    Height = 37
    Caption = 'Search'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu
    TabOrder = 0
    OnClick = SearchBtnClick
  end
  object ValueEdit: TEdit
    Left = 120
    Top = 352
    Width = 33
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu
    TabOrder = 1
    OnChange = ValueEditChange
    OnKeyPress = ValueEditKeyPress
  end
  object PopupMenu: TPopupMenu
    Left = 16
    Top = 104
  end
  object MainMenu: TMainMenu
    Left = 16
    Top = 56
    object FileMenu: TMenuItem
      Caption = 'File'
      object Save: TMenuItem
        Caption = 'Save...'
        Enabled = False
        OnClick = SaveClick
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
    Left = 16
    Top = 8
  end
end
