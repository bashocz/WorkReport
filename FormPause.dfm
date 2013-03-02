object FormPauses: TFormPauses
  Left = 419
  Top = 451
  BorderStyle = bsDialog
  Caption = 'P'#345'est'#225'vky'
  ClientHeight = 193
  ClientWidth = 380
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 8
    Width = 14
    Height = 13
    Caption = 'Od'
  end
  object Label2: TLabel
    Left = 104
    Top = 8
    Width = 14
    Height = 13
    Caption = 'Do'
  end
  object Label3: TLabel
    Left = 152
    Top = 8
    Width = 26
    Height = 13
    Caption = 'Popis'
  end
  object CBoxWorked1: TCheckBox
    Left = 296
    Top = 32
    Width = 73
    Height = 17
    TabStop = False
    Caption = 'Pracovn'#237'?'
    TabOrder = 3
  end
  object EditDescript1: TEdit
    Left = 152
    Top = 32
    Width = 137
    Height = 21
    MaxLength = 50
    TabOrder = 2
    OnKeyPress = EditKeyPress
  end
  object EditFrom1: TEdit
    Left = 56
    Top = 32
    Width = 41
    Height = 21
    TabOrder = 0
    OnExit = EditTimeExit
    OnKeyPress = EditKeyPress
  end
  object EditTo1: TEdit
    Left = 104
    Top = 32
    Width = 41
    Height = 21
    TabOrder = 1
    OnExit = EditTimeExit
    OnKeyPress = EditKeyPress
  end
  object ButtonClr1: TButton
    Left = 8
    Top = 32
    Width = 41
    Height = 25
    Caption = 'Sma'#382
    TabOrder = 20
    TabStop = False
    OnClick = ButtonClr1Click
  end
  object CBoxWorked2: TCheckBox
    Left = 296
    Top = 56
    Width = 73
    Height = 17
    TabStop = False
    Caption = 'Pracovn'#237'?'
    TabOrder = 7
  end
  object EditDescript2: TEdit
    Left = 152
    Top = 56
    Width = 137
    Height = 21
    MaxLength = 50
    TabOrder = 6
    OnKeyPress = EditKeyPress
  end
  object EditFrom2: TEdit
    Left = 56
    Top = 56
    Width = 41
    Height = 21
    TabOrder = 4
    OnExit = EditTimeExit
    OnKeyPress = EditKeyPress
  end
  object EditTo2: TEdit
    Left = 104
    Top = 56
    Width = 41
    Height = 21
    TabOrder = 5
    OnExit = EditTimeExit
    OnKeyPress = EditKeyPress
  end
  object ButtonClr2: TButton
    Left = 8
    Top = 56
    Width = 41
    Height = 25
    Caption = 'Sma'#382
    TabOrder = 21
    TabStop = False
    OnClick = ButtonClr2Click
  end
  object CBoxWorked3: TCheckBox
    Left = 296
    Top = 80
    Width = 73
    Height = 17
    TabStop = False
    Caption = 'Pracovn'#237'?'
    TabOrder = 11
  end
  object EditDescript3: TEdit
    Left = 152
    Top = 80
    Width = 137
    Height = 21
    MaxLength = 50
    TabOrder = 10
    OnKeyPress = EditKeyPress
  end
  object EditFrom3: TEdit
    Left = 56
    Top = 80
    Width = 41
    Height = 21
    TabOrder = 8
    OnExit = EditTimeExit
    OnKeyPress = EditKeyPress
  end
  object EditTo3: TEdit
    Left = 104
    Top = 80
    Width = 41
    Height = 21
    TabOrder = 9
    OnExit = EditTimeExit
    OnKeyPress = EditKeyPress
  end
  object ButtonClr3: TButton
    Left = 8
    Top = 80
    Width = 41
    Height = 25
    Caption = 'Sma'#382
    TabOrder = 22
    TabStop = False
    OnClick = ButtonClr3Click
  end
  object CBoxWorked4: TCheckBox
    Left = 296
    Top = 104
    Width = 73
    Height = 17
    TabStop = False
    Caption = 'Pracovn'#237'?'
    TabOrder = 15
  end
  object EditDescript4: TEdit
    Left = 152
    Top = 104
    Width = 137
    Height = 21
    MaxLength = 50
    TabOrder = 14
    OnKeyPress = EditKeyPress
  end
  object EditFrom4: TEdit
    Left = 56
    Top = 104
    Width = 41
    Height = 21
    TabOrder = 12
    OnExit = EditTimeExit
    OnKeyPress = EditKeyPress
  end
  object EditTo4: TEdit
    Left = 104
    Top = 104
    Width = 41
    Height = 21
    TabOrder = 13
    OnExit = EditTimeExit
    OnKeyPress = EditKeyPress
  end
  object ButtonClr4: TButton
    Left = 8
    Top = 104
    Width = 41
    Height = 25
    Caption = 'Sma'#382
    TabOrder = 23
    TabStop = False
    OnClick = ButtonClr4Click
  end
  object CBoxWorked5: TCheckBox
    Left = 296
    Top = 128
    Width = 73
    Height = 17
    TabStop = False
    Caption = 'Pracovn'#237'?'
    TabOrder = 19
  end
  object EditDescript5: TEdit
    Left = 152
    Top = 128
    Width = 137
    Height = 21
    MaxLength = 50
    TabOrder = 18
    OnKeyPress = EditKeyPress
  end
  object EditFrom5: TEdit
    Left = 56
    Top = 128
    Width = 41
    Height = 21
    TabOrder = 16
    OnExit = EditTimeExit
    OnKeyPress = EditKeyPress
  end
  object EditTo5: TEdit
    Left = 104
    Top = 128
    Width = 41
    Height = 21
    TabOrder = 17
    OnExit = EditTimeExit
    OnKeyPress = EditKeyPress
  end
  object ButtonClr5: TButton
    Left = 8
    Top = 128
    Width = 41
    Height = 25
    Caption = 'Sma'#382
    TabOrder = 24
    TabStop = False
    OnClick = ButtonClr5Click
  end
  object ButtonOk: TButton
    Left = 208
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 25
  end
  object ButtonCancel: TButton
    Left = 296
    Top = 160
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Storno'
    ModalResult = 2
    TabOrder = 26
  end
end
