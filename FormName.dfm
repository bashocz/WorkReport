object FormPrjName: TFormPrjName
  Left = 399
  Top = 280
  BorderStyle = bsDialog
  Caption = 'Jm'#233'na projekt'#367
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
    ColCount = 2
    DefaultColWidth = 77
    DefaultRowHeight = 20
    RowCount = 20
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goThumbTracking]
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    ColWidths = (
      77
      427)
  end
  object ButtonOk: TButton
    Left = 360
    Top = 432
    Width = 75
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 1
  end
  object ButtonCancel: TButton
    Left = 448
    Top = 432
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Storno'
    ModalResult = 2
    TabOrder = 2
  end
end
