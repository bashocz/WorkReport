object FormProjects: TFormProjects
  Left = 276
  Top = 300
  BorderStyle = bsDialog
  Caption = 'Statistika projekt'#367
  ClientHeight = 463
  ClientWidth = 531
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GridProject: TStringGrid
    Left = 0
    Top = 0
    Width = 529
    Height = 423
    ColCount = 3
    DefaultColWidth = 77
    DefaultRowHeight = 20
    RowCount = 20
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 0
    ColWidths = (
      77
      378
      49)
  end
  object ButtonOk: TButton
    Left = 448
    Top = 432
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Ok'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
end
