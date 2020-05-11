object Manage: TManage
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Add student'
  ClientHeight = 216
  ClientWidth = 266
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = StartMenu.PopupMenu
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 145
    Width = 53
    Height = 21
    Caption = 'Gender'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = StartMenu.PopupMenu
  end
  object Label2: TLabel
    Left = 8
    Top = 67
    Width = 84
    Height = 21
    Caption = 'Group code'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = StartMenu.PopupMenu
  end
  object Label3: TLabel
    Left = 8
    Top = 38
    Width = 105
    Height = 21
    Caption = 'Jornal number'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = StartMenu.PopupMenu
  end
  object Label4: TLabel
    Left = 8
    Top = 94
    Width = 150
    Height = 21
    Caption = 'Surname and initials'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = StartMenu.PopupMenu
  end
  object Label5: TLabel
    Left = 8
    Top = 121
    Width = 94
    Height = 21
    Caption = 'Date of birth'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = StartMenu.PopupMenu
  end
  object Label6: TLabel
    Left = 80
    Top = 8
    Width = 105
    Height = 24
    Caption = 'Enter data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 186
    Top = 123
    Width = 5
    Height = 21
    Caption = '.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = StartMenu.PopupMenu
  end
  object Label8: TLabel
    Left = 212
    Top = 123
    Width = 5
    Height = 21
    Caption = '.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = StartMenu.PopupMenu
  end
  object CancelBtn: TButton
    Left = 156
    Top = 183
    Width = 75
    Height = 25
    Caption = 'Cancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = StartMenu.PopupMenu
    TabOrder = 0
    OnClick = CancelBtnClick
  end
  object SubmitBtn: TButton
    Left = 38
    Top = 183
    Width = 75
    Height = 25
    Caption = 'Submit'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = StartMenu.PopupMenu
    TabOrder = 1
    OnClick = SubmitBtnClick
  end
  object GC: TEdit
    Left = 207
    Top = 67
    Width = 46
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = StartMenu.PopupMenu
    TabOrder = 2
    OnChange = OnChange
    OnKeyPress = GCKeyPress
  end
  object JN: TEdit
    Left = 232
    Top = 40
    Width = 21
    Height = 21
    PopupMenu = StartMenu.PopupMenu
    TabOrder = 3
    OnChange = OnChange
    OnKeyPress = JNKeyPress
    OnKeyUp = JNKeyUp
  end
  object SaI: TEdit
    Left = 164
    Top = 94
    Width = 89
    Height = 21
    PopupMenu = StartMenu.PopupMenu
    TabOrder = 4
    OnChange = OnChange
    OnKeyPress = SaIKeyPress
  end
  object Month: TEdit
    Left = 191
    Top = 121
    Width = 21
    Height = 21
    PopupMenu = StartMenu.PopupMenu
    TabOrder = 5
    OnChange = OnChange
    OnKeyPress = MonthKeyPress
    OnKeyUp = MonthKeyUp
  end
  object Day: TEdit
    Left = 164
    Top = 121
    Width = 21
    Height = 21
    PopupMenu = StartMenu.PopupMenu
    TabOrder = 6
    OnChange = OnChange
    OnKeyPress = DayKeyPress
    OnKeyUp = DayKeyUp
  end
  object Year: TEdit
    Left = 218
    Top = 121
    Width = 35
    Height = 21
    PopupMenu = StartMenu.PopupMenu
    TabOrder = 7
    OnChange = OnChange
    OnKeyPress = YearKeyPress
    OnKeyUp = YearKeyUp
  end
  object Female: TCheckBox
    Left = 151
    Top = 148
    Width = 55
    Height = 17
    Caption = 'Female'
    PopupMenu = StartMenu.PopupMenu
    TabOrder = 8
    OnClick = FemaleClick
    OnMouseLeave = OnChange
  end
  object Male: TCheckBox
    Left = 206
    Top = 148
    Width = 47
    Height = 17
    Caption = 'Male'
    PopupMenu = StartMenu.PopupMenu
    TabOrder = 9
    OnClick = MaleClick
    OnMouseLeave = OnChange
  end
end
