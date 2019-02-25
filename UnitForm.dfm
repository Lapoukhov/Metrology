object FrmView: TFrmView
  Left = 47
  Top = 192
  Caption = #1084#1077#1090#1088#1080#1082#1080' '#1061#1086#1083#1089#1090#1077#1076#1072
  ClientHeight = 655
  ClientWidth = 1160
  Color = clActiveBorder
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 431
    Top = 8
    Width = 215
    Height = 19
    Caption = #1057#1091#1084#1084#1072#1088#1085#1099#1081' '#1089#1087#1077#1085' '#1087#1088#1086#1075#1088#1072#1084#1084#1099':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 782
    Top = 8
    Width = 126
    Height = 19
    Caption = #1052#1077#1090#1088#1080#1082#1072' '#1063#1077#1087#1080#1085#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 622
    Top = 447
    Width = 226
    Height = 19
    Caption = #1052#1077#1090#1088#1080#1082#1072' '#1063#1077#1087#1080#1085#1072' '#1074#1074#1086#1076#1072'/'#1074#1099#1074#1086#1076#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnLoadFile: TButton
    Left = 216
    Top = 523
    Width = 209
    Height = 40
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1072#1081#1083
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnLoadFileClick
  end
  object mmoView: TMemo
    Left = 0
    Top = 8
    Width = 425
    Height = 509
    Color = clMoneyGreen
    Lines.Strings = (
      '')
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object btnParc: TButton
    Left = 216
    Top = 569
    Width = 209
    Height = 41
    Caption = #1055#1086#1089#1095#1080#1090#1072#1090#1100' '#1084#1077#1090#1088#1080#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnParcClick
  end
  object lvOperators: TListView
    Left = 622
    Top = 33
    Width = 130
    Height = 401
    Columns = <
      item
        Caption = 'j'
        Width = 39
      end
      item
        Caption = #1057
        Width = 86
      end>
    GridLines = True
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    ViewStyle = vsReport
  end
  object lvOperands: TListView
    Left = 431
    Top = 33
    Width = 185
    Height = 400
    Columns = <
      item
        Caption = 'i'
        Width = 37
      end
      item
        Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
        Width = 98
      end
      item
        Caption = #1057#1087#1077#1085
        Width = 44
      end>
    GridLines = True
    TabOrder = 4
    ViewStyle = vsReport
  end
  object EditSummaSpen: TEdit
    Left = 652
    Top = 0
    Width = 100
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object lvP: TListView
    Left = 758
    Top = 33
    Width = 130
    Height = 401
    Color = clHighlightText
    Columns = <
      item
        Caption = #8470
        Width = 36
      end
      item
        Caption = 'P'
        Width = 88
      end>
    GridLines = True
    TabOrder = 6
    ViewStyle = vsReport
  end
  object lvPuts: TListView
    Left = 454
    Top = 472
    Width = 130
    Height = 183
    Columns = <
      item
        Caption = #8470
        Width = 40
      end
      item
        Caption = 'Puts'
        Width = 85
      end>
    GridLines = True
    TabOrder = 7
    ViewStyle = vsReport
  end
  object lvT: TListView
    Left = 894
    Top = 33
    Width = 130
    Height = 401
    Color = clHighlightText
    Columns = <
      item
        Caption = #8470
        Width = 36
      end
      item
        Caption = 'T'
        Width = 88
      end>
    GridLines = True
    TabOrder = 8
    ViewStyle = vsReport
  end
  object lvM: TListView
    Left = 1030
    Top = 33
    Width = 130
    Height = 401
    Color = clHighlightText
    Columns = <
      item
        Caption = #8470
        Width = 36
      end
      item
        Caption = 'M'
        Width = 88
      end>
    GridLines = True
    TabOrder = 9
    ViewStyle = vsReport
  end
  object lvT_2: TListView
    Left = 894
    Top = 472
    Width = 130
    Height = 183
    Columns = <
      item
        Caption = #8470
        Width = 40
      end
      item
        Caption = 'T (I/O)'
        Width = 85
      end>
    GridLines = True
    TabOrder = 10
    ViewStyle = vsReport
  end
  object lvC_2: TListView
    Left = 622
    Top = 472
    Width = 130
    Height = 183
    Columns = <
      item
        Caption = #8470
        Width = 40
      end
      item
        Caption = #1057' (I/O)'
        Width = 85
      end>
    GridLines = True
    TabOrder = 11
    ViewStyle = vsReport
  end
  object lvM_2: TListView
    Left = 1030
    Top = 472
    Width = 130
    Height = 183
    Columns = <
      item
        Caption = #8470
        Width = 40
      end
      item
        Caption = 'M (I/O)'
        Width = 85
      end>
    GridLines = True
    TabOrder = 12
    ViewStyle = vsReport
  end
  object lvP_2: TListView
    Left = 758
    Top = 472
    Width = 130
    Height = 183
    Columns = <
      item
        Caption = #8470
        Width = 40
      end
      item
        Caption = 'P (I/O)'
        Width = 85
      end>
    GridLines = True
    TabOrder = 13
    ViewStyle = vsReport
  end
  object EditChepin_1: TEdit
    Left = 924
    Top = 0
    Width = 100
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
  end
  object Edit2: TEdit
    Left = 854
    Top = 444
    Width = 100
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 15
  end
  object dlgOpen: TOpenDialog
    Top = 536
  end
end
