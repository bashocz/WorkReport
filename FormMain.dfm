object FormReport: TFormReport
  Left = 234
  Top = 112
  Width = 1017
  Height = 776
  HorzScrollBar.Visible = False
  Caption = 'Work Report - v06/2005'
  Color = clBtnFace
  Font.Charset = EASTEUROPE_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000FFF
    0FF0FF0FFF000FFF0FFFFF0FFF000FFF0FF0FF0FFF000FFFFFFFFFFFFF0000FF
    FFF0FFFFF00000FFFFFFFFFFF000000FFFFFFFFF000000000F333F0000000000
    031113000000000003313300000000003333333000000000331313300000000F
    FF0FFFFF00000000FF0FFFF0000000000FF0FF000000000000F0F00000008823
    0000882300008823000080030000C0070000C0070000E00F0000F83F0000F83F
    0000F83F0000F01F0000F01F0000E00F0000F01F0000F83F0000FC7F0000}
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object GridReport: TStringGrid
    Left = 0
    Top = 78
    Width = 1009
    Height = 644
    Align = alClient
    ColCount = 15
    DefaultColWidth = 54
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedCols = 0
    RowCount = 33
    FixedRows = 2
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnDrawCell = GridReportDrawCell
    OnMouseDown = GridReportMouseDown
    OnSelectCell = GridReportSelectCell
    ColWidths = (
      21
      21
      22
      22
      76
      316
      73
      67
      67
      48
      48
      48
      48
      48
      48)
  end
  object EditDescript: TEdit
    Left = 168
    Top = 142
    Width = 318
    Height = 22
    AutoSize = False
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 100
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
    Visible = False
    OnExit = EditDescriptExit
    OnKeyPress = EditDescriptKeyPress
  end
  object ComboDayType: TComboBox
    Left = 23
    Top = 142
    Width = 129
    Height = 22
    Style = csDropDownList
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ItemHeight = 14
    ParentFont = False
    TabOrder = 1
    Visible = False
    OnChange = ComboDayTypeChange
    Items.Strings = (
      'W - Pracovn'#237' den'
      'B - Slu'#382'ebn'#237' cesta'
      'V - dovolen'#225
      'H - p'#367'l den dovolen'#233
      'D - n'#225'hradn'#237' volno'
      'S - nemoc'
      'O - p'#345'es'#269'as')
  end
  object EditProjectNumber: TEdit
    Left = 485
    Top = 163
    Width = 75
    Height = 22
    AutoSize = False
    BiDiMode = bdLeftToRight
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 10
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    Visible = False
    OnExit = EditProjectNumberExit
    OnKeyPress = EditProjectNumberKeyPress
  end
  object EditProjectExt: TEdit
    Left = 559
    Top = 142
    Width = 69
    Height = 22
    AutoSize = False
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 4
    Visible = False
    OnExit = EditProjectExtExit
    OnKeyPress = EditProjectExtKeyPress
  end
  object EditProjectHours: TEdit
    Left = 627
    Top = 163
    Width = 69
    Height = 22
    AutoSize = False
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 5
    Visible = False
    OnExit = EditProjectHoursExit
    OnKeyPress = EditProjectHoursKeyPress
  end
  object EditArrival: TEdit
    Left = 793
    Top = 163
    Width = 50
    Height = 22
    AutoSize = False
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 6
    Visible = False
    OnExit = EditArrivalExit
    OnKeyPress = EditArrivalKeyPress
  end
  object EditLeaving: TEdit
    Left = 842
    Top = 142
    Width = 50
    Height = 22
    AutoSize = False
    BiDiMode = bdLeftToRight
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 7
    Visible = False
    OnExit = EditLeavingExit
    OnKeyPress = EditLeavingKeyPress
  end
  object EditHoursAtHome: TEdit
    Left = 744
    Top = 142
    Width = 50
    Height = 22
    AutoSize = False
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 8
    Visible = False
    OnExit = EditHoursAtHomeExit
    OnKeyPress = EditHoursAtHomeKeyPress
  end
  object ControlBar1: TControlBar
    Left = 0
    Top = 0
    Width = 1009
    Height = 78
    Align = alTop
    Anchors = [akTop]
    AutoSize = True
    BevelInner = bvNone
    BevelKind = bkNone
    TabOrder = 9
    DesignSize = (
      1009
      78)
    object PanelName: TPanel
      Left = 11
      Top = 2
      Width = 209
      Height = 22
      Alignment = taRightJustify
      Anchors = []
      BevelOuter = bvNone
      Caption = 'Jm'#233'no a p'#345#237'jmen'#237':'
      DockSite = True
      TabOrder = 0
      object LabelName: TLabel
        Left = 0
        Top = 3
        Width = 84
        Height = 13
        Caption = 'Jm'#233'no a p'#345#237'jmen'#237':'
      end
      object EditName: TEdit
        Left = 88
        Top = 0
        Width = 121
        Height = 21
        TabOrder = 0
        OnChange = EditNameChange
      end
    end
    object PanelDate: TPanel
      Left = 233
      Top = 2
      Width = 417
      Height = 22
      Alignment = taRightJustify
      Anchors = []
      BevelOuter = bvNone
      Caption = 'Datum:'
      DockSite = True
      TabOrder = 1
      object LabelMonth: TLabel
        Left = 0
        Top = 3
        Width = 32
        Height = 13
        Caption = 'M'#283's'#237'c:'
      end
      object ButtonMounth1: TSpeedButton
        Left = 38
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Leden'
        GroupIndex = 2
        Down = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333303303030303333303030003000333333303030300
          0333333303030300033333000330330303333333333333333333333333303333
          3333333333303333333333333330333333333333333033333333333330303333
          3333333333003333333333333330333333333333333333333333}
        OnClick = ButtonMounthClick
      end
      object ButtonMounth2: TSpeedButton
        Left = 62
        Top = 0
        Width = 23
        Height = 22
        Hint = #218'nor'
        GroupIndex = 2
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333033300030033333303330333030333330033003300
          3333330333033303033333000300030033333333333333333333333330000333
          3333333330333333333333333303333333333333333033333333333333330333
          3333333330330333333333333300333333333333333333333333}
        OnClick = ButtonMounthClick
      end
      object ButtonMounth3: TSpeedButton
        Left = 86
        Top = 0
        Width = 23
        Height = 22
        Hint = 'B'#345'ezen'
        GroupIndex = 2
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333030303030303333303030003030333330303030300
          3333330003030303033333030330330033333333333333333333333333003333
          3333333330330333333333333333033333333333330033333333333333330333
          3333333330330333333333333300333333333333333333333333}
        OnClick = ButtonMounthClick
      end
      object ButtonMounth4: TSpeedButton
        Left = 110
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Duben'
        GroupIndex = 2
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333030303330303333300030333030333330303003300
          3333330303030303033333303300330033333333333333333333333333303333
          3333333333303333333333333000033333333333303033333333333333033333
          3333333333033333333333333330333333333333333333333333}
        OnClick = ButtonMounthClick
      end
      object ButtonMounth5: TSpeedButton
        Left = 134
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Kv'#283'ten'
        GroupIndex = 2
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333030303033033333303030003303333330303030330
          3333330003030303033333030330330303333333333333333333333333003333
          3333333330330333333333333333033333333333303303333333333330003333
          3333333330333333333333333000033333333333333333333333}
        OnClick = ButtonMounthClick
      end
      object ButtonMounth6: TSpeedButton
        Left = 158
        Top = 0
        Width = 23
        Height = 22
        Hint = #268'erven'
        GroupIndex = 2
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333303330330303333303030303000333333303030300
          0333333303030300033333000303030303333333333333333333333333003333
          3333333330330333333333333033033333333333300033333333333330333333
          3333333330330333333333333300333333333333333333333333}
        OnClick = ButtonMounthClick
      end
      object ButtonMounth7: TSpeedButton
        Left = 182
        Top = 0
        Width = 23
        Height = 22
        Hint = #268'ervenec'
        GroupIndex = 2
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333303330330003333303030303033333333303030303
          3333333303030303333333000303030333333333333333333333333333033333
          3333333333033333333333333330333333333333333033333333333333330333
          3333333333330333333333333000033333333333333333333333}
        OnClick = ButtonMounthClick
      end
      object ButtonMounth8: TSpeedButton
        Left = 206
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Srpen'
        GroupIndex = 2
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333030330333033333300030303030333330303030300
          0333330303030303333333303303033003333333333333333333333333003333
          3333333330330333333333333033033333333333330033333333333330330333
          3333333330330333333333333300333333333333333333333333}
        OnClick = ButtonMounthClick
      end
      object ButtonMounth9: TSpeedButton
        Left = 230
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Z'#225#345#237
        GroupIndex = 2
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333003300030333333333030333033333333033003300
          3333330333033303033333300300030033333333333333333333333333003333
          3333333330330333333333333333033333333333330003333333333330330333
          3333333330330333333333333300333333333333333333333333}
        OnClick = ButtonMounthClick
      end
      object ButtonMounth10: TSpeedButton
        Left = 254
        Top = 0
        Width = 23
        Height = 22
        Hint = #344#237'jen'
        GroupIndex = 2
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333303330033033333303030333303333330303033330
          3333330303033330333333303330030003333333333333333333333330330033
          3333333330303303333333333030330333333333303033033333333030303303
          3333333300303303333333333033003333333333333333333333}
        OnClick = ButtonMounthClick
      end
      object ButtonMounth11: TSpeedButton
        Left = 278
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Listopad'
        GroupIndex = 2
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333030330333033333300030303303333330003030303
          0333330003030303033333030330330303333333333333333333333333033303
          3333333333033303333333333303330333333333330333033333333303030303
          3333333330033003333333333303330333333333333333333333}
        OnClick = ButtonMounthClick
      end
      object ButtonMounth12: TSpeedButton
        Left = 302
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Prosinec'
        GroupIndex = 2
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333003300033003333303030333033333330303003303
          3333330303033303333333003300033003333333333333333333333330300003
          3333333330303333333333333033033333333333303330333333333030333303
          3333333300303303333333333033003333333333333333333333}
        OnClick = ButtonMounthClick
      end
      object LabelYear: TLabel
        Left = 337
        Top = 3
        Width = 23
        Height = 13
        Caption = 'Rok:'
      end
      object EditYear: TSpinEdit
        Left = 364
        Top = 0
        Width = 53
        Height = 22
        Color = clBtnFace
        EditorEnabled = False
        MaxValue = 2099
        MinValue = 2003
        TabOrder = 0
        Value = 2005
        OnChange = EditYearChange
      end
    end
    object PanelReportFile: TPanel
      Left = 887
      Top = 2
      Width = 120
      Height = 22
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = 'Jm'#233'no souboru:'
      TabOrder = 2
      object LabelReportFile: TLabel
        Left = 80
        Top = 3
        Width = 94
        Height = 15
        Caption = 'LabelReportFile'
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
    end
    object PanelInfo: TPanel
      Left = 11
      Top = 28
      Width = 751
      Height = 48
      BevelOuter = bvNone
      TabOrder = 3
      Visible = False
      object LabelWorkingDays: TLabel
        Left = 8
        Top = 3
        Width = 109
        Height = 13
        Caption = 'Po'#269'et pracovn'#237'ch dn'#367':'
      end
      object LabelWorkedDays: TLabel
        Left = 168
        Top = 3
        Width = 129
        Height = 13
        Caption = 'Po'#269'et odpracovan'#253'ch dn'#367':'
      end
      object LabelWorkedHours: TLabel
        Left = 361
        Top = 3
        Width = 137
        Height = 13
        Caption = 'Po'#269'et odpracovan'#253'ch hodin:'
      end
      object LabelAveDayHours: TLabel
        Left = 562
        Top = 3
        Width = 140
        Height = 13
        Caption = 'Pr'#367'm'#283'r odprac. hodin na den:'
      end
      object LabelWorkingHours: TLabel
        Left = 0
        Top = 25
        Width = 117
        Height = 13
        Caption = 'Po'#269'et pracovn'#237'ch hodin:'
      end
      object LabelOvettimeHours: TLabel
        Left = 403
        Top = 25
        Width = 94
        Height = 13
        Caption = 'P'#345'es'#269'asov'#233' hodiny:'
      end
      object LabelMealTickets: TLabel
        Left = 216
        Top = 25
        Width = 81
        Height = 13
        Caption = 'Po'#269'et stravenek:'
      end
      object LabelAveDayOvertimeHours: TLabel
        Left = 557
        Top = 27
        Width = 145
        Height = 13
        Caption = 'Pr'#367'm'#283'r p'#345'es'#269'as. hodin na den:'
      end
      object PanelWorkingDays: TPanel
        Left = 120
        Top = 0
        Width = 45
        Height = 20
        Alignment = taRightJustify
        BevelOuter = bvLowered
        Color = clCream
        TabOrder = 0
      end
      object PanelWorkedDays: TPanel
        Left = 299
        Top = 0
        Width = 45
        Height = 20
        Alignment = taRightJustify
        BevelOuter = bvLowered
        Color = clCream
        TabOrder = 1
      end
      object PanelWorkedHours: TPanel
        Left = 500
        Top = 0
        Width = 45
        Height = 20
        Alignment = taRightJustify
        BevelOuter = bvLowered
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object PanelAveDayHours: TPanel
        Left = 704
        Top = 0
        Width = 45
        Height = 20
        Alignment = taRightJustify
        BevelOuter = bvLowered
        Color = clCream
        TabOrder = 3
      end
      object PanelWorkingHours: TPanel
        Left = 120
        Top = 22
        Width = 45
        Height = 20
        Alignment = taRightJustify
        BevelOuter = bvLowered
        Color = clCream
        TabOrder = 4
      end
      object PanelOvertimeHours: TPanel
        Left = 500
        Top = 22
        Width = 45
        Height = 20
        Alignment = taRightJustify
        BevelOuter = bvLowered
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
      object PanelMealTickets: TPanel
        Left = 299
        Top = 22
        Width = 45
        Height = 20
        Alignment = taRightJustify
        BevelOuter = bvLowered
        Color = clCream
        TabOrder = 6
      end
      object PanelAveDayOvertimeHours: TPanel
        Left = 704
        Top = 22
        Width = 45
        Height = 20
        Alignment = taRightJustify
        BevelOuter = bvLowered
        Color = clCream
        TabOrder = 7
      end
    end
    object PanelInfoLight: TPanel
      Left = 663
      Top = 2
      Width = 144
      Height = 22
      BevelOuter = bvNone
      TabOrder = 4
      object LabelOvettimeHours2: TLabel
        Left = 0
        Top = 3
        Width = 94
        Height = 13
        Caption = 'P'#345'es'#269'asov'#233' hodiny:'
      end
      object PanelOvertimeHours2: TPanel
        Left = 97
        Top = 0
        Width = 45
        Height = 20
        Alignment = taRightJustify
        BevelOuter = bvLowered
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object MainMenu: TMainMenu
    Top = 80
    object MenuFile: TMenuItem
      Caption = 'Soubor'
      OnClick = MenuMainClick
      object MenuOpen: TMenuItem
        Bitmap.Data = {
          26040000424D2604000000000000360000002800000012000000120000000100
          180000000000F003000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F6E1CFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF816100FF9F2A8F6F1DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFA8A8A8737373553F2A553F2A3D3D3D3D3D3DB4B4B4806100FF9F2A
          D9A77DFF9F2A8F6F1C7373737474743D3D3DA7A7A7FFFFFF0000FFFFFF919191
          A9FFFF99F8FF99F8FF55DFFF55BFD3806100D9A77DD9A77DD9A77DD9A77DFF9F
          2A8F6F1D55DFFF55C0D43D3D3DFFFFFF0000FFFFFF919191A9FFFFA9FFFFA9FF
          FFA9FFFF806100D9A77DFFFFC3FFFFC3D9A77DD9A77DD9A77DFF9F2A8F6F1D55
          DFFF3D3D3DFFFFFF0000FFFFFF919191A9FFFFA9FFFFA9FFFFE1BE788F6F1C8F
          6F1C8F6E1CFFFFC3FFFFC4D9A77D8F6F1D8F6F1C8F6F1CE1BE78737373FFFFFF
          0000FFFFFF909090A9FFFFA9FFFFA9FFFFA9FFFFA9FFFFA9FFFF9D7C30FFFFC3
          FFFFC3FFF1AB9D7C30B4B4B499F8FF55DFFF3D3D3DFFFFFF0000FFFFFF919191
          D8E9ECA9FFFFA9FFFFA9FFFFA9FFFFA9FFFFAB8A40FFFFC3FFFFC3D9A77DFBD7
          9198F7FF55DFFFAADFD53D3D3DFFFFFF0000FFFFFF919191A9FFFFA9FFFFA9FF
          FFA9FFFFA9FFFFB9974FD9A77DFFF0AAFFFFC3AB8A4099F7FF99F7FF99F8FF55
          DFFF595959FFFFFF0000FFFFFFA8A8A8D8E9ECA9FFFFD8E9ECA9FFFFA8FEFFB9
          974EFFE49EFFF0AAE1BE77FBD790A9FFFFA9FFFFA9FFFFA9FFFF666666FFFFFF
          0000FFFFFFB4B4B4A9FFFFD8E9ECA9FFFFA8FEFFAB893FD9A77DFBD790E1BE78
          A9FFFFA9FFFFA9FFFFA9FFFFA9FFFFA9FFFF737373FFFFFF0000FFFFFFC1C1C1
          D8E9ECA9FFFFD8E9ECD4B16AD4B26BD4B26BD4B26BEECB84C6C6C6C6C6C6AADF
          D555BFD354BFD355BFD3818181FFFFFF0000FFFFFFCCCCCCB5B5B5B4B4B4B4B4
          B4CBCBCBAADFD5AADFD555DFFF55DFFF55DFFF55DFFF55DFFF55DFFF55DFFF54
          BFD3C1C1C1FFFFFF0000FFFFFFFFFFFFDADADA00F2FF00F2FF00F1FF00F1FF55
          BFD3E6E6E68D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8DFFFFFFFFFFFF
          0000FFFFFFFFFFFF9B9B9B54FFFF67F4FF67F4FF67F4FF00F1FFB4B4B4FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFF9B9B9B8D8D8D8D8D8D8D8D8D9B9B9BFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000}
        Caption = 'Otev'#345#237't ...'
        ShortCut = 16463
        OnClick = MenuOpenClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object MenuSave: TMenuItem
        Bitmap.Data = {
          EE030000424DEE03000000000000360000002800000012000000110000000100
          180000000000B803000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFA7A7A77373
          737373735959595959594B4B4B4B4B4B3D3D3D303030303030303030A7A7A7FF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFA7A7A7633600CDCDCDE6E6E6C1C1C1C1
          C1C1CDCDCDF0F0F0EDEDEDE6E6E6A7A7A7333333303030A7A7A7FFFFFFFFFFFF
          0000FFFFFF633600633600633600DADADAE6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
          E6E6E6E6E6E6DADADACB8C44633600303030303030FFFFFF0000FFFFFF633600
          CB8C44633600D9A77DD9A77DD9A77DD9A77DD9A77DCB8C44CB8C44CB8C44CB8C
          44CB8C446336007F5B00303030FFFFFF0000FFFFFF633600D9A77D633600D9A7
          7DD9A77DD9A77DD9A77DD9A77DD9A77DCB8C44CB8C44CB8C44CB8C44633600CB
          8C44303030FFFFFF0000FFFFFF633600D9A77D633600D9A77DD9A77DD9A77DD9
          A77DD9A77DD9A77DD9A77DCB8C44CB8C44CB8C44633600CB8C443D3D3DFFFFFF
          0000FFFFFF633600D9A77D633600AA3F2A633600633600633600633600633600
          633600633600633600CB8C44633600CB8C444B4B4BFFFFFF0000FFFFFF633600
          D9A77D6336009A9A9AAAFFFF99F8FF99F8FF99F8FF99F8FF99F8FF99F8FF99F8
          FF633600633600CB8C444B4B4BFFFFFF0000FFFFFF633600D9A77D633600AAFF
          FFCDCDCDA7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7C1C1C199F8FF633600CB
          8C444B4B4BFFFFFF0000FFFFFF633600D9A77D7F5B00AAFFFFAAFFFFAAFFFFAA
          FFFFAAFFFFAAFFFFAAFFFFAAFFFFAAFFFF99F8FF7F5B00CB8C444B4B4BFFFFFF
          0000FFFFFF633600D9A77D7F5B00AAFFFFCDCDCDA7A7A7A7A7A7A7A7A7A7A7A7
          A7A7A7A7A7A7C1C1C199F8FF7F5B00CB8C444B4B4BFFFFFF0000FFFFFF633600
          D9A77D989898AAFFFFAAFFFFAAFFFFAAFFFFAAFFFFAAFFFFAAFFFFAAFFFFAAFF
          FF99F8FF989898CB8C44595959FFFFFF0000FFFFFF633600D9A77DA6A6A6D8E9
          ECCDCDCDCB8C44CB8C44A7A7A7A7A7A7A7A7A7A7A7A7C1C1C199F8FFA6A6A6D9
          A77D666666FFFFFF0000FFFFFFA7A7A76336007F5B00D8E9ECD8E9ECAAFFFFAA
          FFFFAAFFFFAAFFFFAAFFFFAAFFFFAAFFFFAAFFFF7F5B00633600A7A7A7FFFFFF
          0000FFFFFFFFFFFFFFFFFFA7A7A7633600633600633600633600633600633600
          6336006336006336006336009A9A9AFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
        Caption = 'Ulo'#382'it ...'
        ShortCut = 16467
        OnClick = MenuSaveClick
      end
      object MenuSaveBack: TMenuItem
        Bitmap.Data = {
          AA030000424DAA03000000000000360000002800000011000000110000000100
          1800000000007403000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF3D3D3DFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3D3D3DFFFF
          FF00FFFFFFFFFFFFB1B1B1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFB1B1B1FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
          FFFF4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4BFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF4B4B4BDDC9B8DDC9B8DDC9B8DD
          C9B8DDC9B8DDC9B8DDC9B8DDC9B8DDC9B84B4B4BFFFFFFFFFFFFFFFFFF00FFFF
          FFFFFFFFFFFFFF4B4B4BD9A77DD9A77DD9A77DD9A77DD9A77DD9A77DD9A77DD9
          A77DD9A77D4B4B4BFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF4B4B4BD9A7
          7DD9A77DD9A77DD9A77DD9A77DD9A77DD9A77DD9A77DD9A77D4B4B4BFFFFFFFF
          FFFFFFFFFF00FFFFFFFFFFFFFFFFFF4B4B4BD9A77D7373737373737373737373
          737373737373737373737373734B4B4BFFFFFFFFFFFFFFFFFF00FFFFFF3D3D3D
          FFFFFFB1B1B1D9A77DAAFFFFAAFFFFAAFFFFAAFFFF99F8FF99F8FF99F8FF9A9A
          9AB1B1B1FFFFFFB1B1B13D3D3D00FFFFFFFFFFFFFFFFFF4B4B4BAAFFFFAAFFFF
          A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7AAFFFF99F8FF4B4B4BFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFF4B4B4BAAFFFFAAFFFFAAFFFFAAFFFFAAFFFFAAFFFF
          AAFFFFAAFFFF99F8FF4B4B4BFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF4B
          4B4BFFFFFFAAFFFFCB8C44CB8C44A7A7A7A7A7A7A7A7A799F8FFAAFFFF4B4B4B
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF4B4B4BFFFFFFFFFFFFAAFFFFAA
          FFFFAAFFFFAAFFFFAAFFFFAAFFFFAAFFFF4B4B4BFFFFFFFFFFFFFFFFFF00FFFF
          FFFFFFFFFFFFFFFFFFFF4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B
          4B4B4B4B4BFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFB1B1B1FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFB1B1B1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB1B1B1FF
          FFFFFFFFFF00FFFFFF3D3D3DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3D3D
          3DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3D3D3DFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF00}
        Caption = 'Ulo'#382'it z'#225'lohu ...'
        ShortCut = 24659
        OnClick = MenuSaveBackClick
      end
    end
    object MenuView: TMenuItem
      Caption = 'Zobrazit'
      object MenuName: TMenuItem
        Caption = 'Jm'#233'no'
        Checked = True
        ShortCut = 16433
        OnClick = MenuNameClick
      end
      object MenuDate: TMenuItem
        Caption = 'Datum'
        Checked = True
        ShortCut = 16434
        OnClick = MenuDateClick
      end
      object MenuReportFile: TMenuItem
        Caption = 'Jm'#233'no souboru'
        Checked = True
        ShortCut = 16435
        OnClick = MenuReportFileClick
      end
      object MenuInfo: TMenuItem
        Caption = 'Informa'#269'n'#237' panel'
        ShortCut = 16436
        OnClick = MenuInfoClick
      end
      object MenuInfoLight: TMenuItem
        Caption = 'Jednoduch'#253' info panel'
        Checked = True
        ShortCut = 16437
        OnClick = MenuInfoLightClick
      end
    end
    object MenuReport: TMenuItem
      Caption = 'Report'
      OnClick = MenuMainClick
      object MenuFillProjectName: TMenuItem
        Caption = 'Jm'#233'na projekt'#367
        ShortCut = 32846
        OnClick = MenuFillProjectNameClick
      end
      object MenuShowProject: TMenuItem
        Caption = 'Statistika projekt'#367
        ShortCut = 32851
        OnClick = MenuShowProjectClick
      end
      object MenuN1: TMenuItem
        Caption = '-'
      end
      object MenuPrintHours: TMenuItem
        Caption = 'Tisk pracovn'#237'ho v'#253'kazu'
        ShortCut = 16464
        OnClick = MenuPrintHoursClick
      end
      object MenuPrintProject: TMenuItem
        Caption = 'Tisk statistiky projekt'#367
        ShortCut = 24656
      end
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'uwr'
    Filter = 'Work report data files (*.uwr)|*.uwr'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Title = 'Otev'#345#237't work report'
    Left = 32
    Top = 80
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'uwr'
    Filter = 'Work report data files (*.uwr)|*.uwr'
    Title = 'Ulo'#382'it work report'
    Left = 64
    Top = 80
  end
  object PrintDialog: TPrintDialog
    Left = 96
    Top = 80
  end
  object XPManifest1: TXPManifest
    Left = 128
    Top = 80
  end
end
