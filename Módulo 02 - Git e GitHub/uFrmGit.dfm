object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 321
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbResultado: TLabel
    Left = 200
    Top = 248
    Width = 3
    Height = 13
  end
  object Label2: TLabel
    Left = 72
    Top = 56
    Width = 95
    Height = 23
    Caption = 'Consumo '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 264
    Top = 207
    Width = 50
    Height = 23
    Caption = 'Valor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 72
    Top = 136
    Width = 89
    Height = 23
    Caption = 'Desconto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object rdImovel: TRadioGroup
    Left = 216
    Top = 88
    Width = 185
    Height = 105
    Caption = 'Tipo de Imovel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Resid'#234'ncia'
      'Com'#233'rcio'
      'Ind'#250'stria'
      'Fazenda')
    ParentFont = False
    TabOrder = 1
    TabStop = True
  end
  object edtConsumo: TEdit
    Left = 72
    Top = 85
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 72
    Top = 206
    Width = 121
    Height = 33
    Caption = 'Calcula'
    TabOrder = 3
    OnClick = Button1Click
  end
  object edtDesconto: TEdit
    Left = 72
    Top = 165
    Width = 121
    Height = 21
    TabOrder = 2
  end
end
