object FrmElevador: TFrmElevador
  Left = 0
  Top = 0
  Caption = 'Elevador'
  ClientHeight = 273
  ClientWidth = 652
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pFundo: TPanel
    Left = 0
    Top = 0
    Width = 652
    Height = 273
    Align = alClient
    Color = clWhite
    Enabled = False
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 37
      Top = 33
      Width = 133
      Height = 16
      Caption = 'Quantidade Andares'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 29
      Top = 71
      Width = 134
      Height = 16
      Caption = 'Capacidade Elevador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 360
      Top = 33
      Width = 131
      Height = 16
      Caption = 'Quantidade Pessoas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 408
      Top = 71
      Width = 79
      Height = 16
      Caption = 'Andar Atual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 328
      Top = 123
      Width = 57
      Height = 16
      Caption = 'Hist'#243'rico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnMovePessoas: TButton
      Left = 176
      Top = 218
      Width = 146
      Height = 25
      Caption = 'Movimenta Pessoas'
      TabOrder = 0
      OnClick = btnMovePessoasClick
    end
    object btnMovimetaElevador: TButton
      Left = 20
      Top = 218
      Width = 138
      Height = 25
      Caption = 'Movimentar Elevador'
      TabOrder = 1
      OnClick = btnMovimetaElevadorClick
    end
    object edtCapacidadeElev: TEdit
      Left = 176
      Top = 69
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 2
      Text = '0'
      TextHint = 'Capacidade Elevador'
      OnExit = edtCapacidadeElevExit
    end
    object edtMovAndar: TEdit
      Left = 504
      Top = 69
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 3
      TextHint = 'Andar'
    end
    object edtQTDPessoas: TEdit
      Left = 504
      Top = 31
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 4
      TextHint = 'Quantidade Pessoas'
    end
    object edtTotalAndares: TEdit
      Left = 176
      Top = 31
      Width = 121
      Height = 21
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 5
      Text = '0'
      TextHint = 'QTD Andares'
    end
    object mmHistórico: TMemo
      Left = 328
      Top = 145
      Width = 297
      Height = 67
      ScrollBars = ssVertical
      TabOrder = 6
    end
    object rdgFuncElevadorSD: TRadioGroup
      Left = 20
      Top = 128
      Width = 138
      Height = 84
      Caption = 'Func'#245'es Elevador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'Subir'
        'Descer')
      ParentFont = False
      TabOrder = 7
    end
    object rdgFuncPessoasES: TRadioGroup
      Left = 176
      Top = 128
      Width = 146
      Height = 84
      Caption = 'Func'#245'es Pessoas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'Entrar'
        'Sair')
      ParentFont = False
      TabOrder = 8
    end
  end
  object pInicial: TPanel
    Left = 20
    Top = 31
    Width = 605
    Height = 181
    Color = clMedGray
    ParentBackground = False
    TabOrder = 1
    object Label6: TLabel
      Left = 31
      Top = 19
      Width = 241
      Height = 29
      Caption = 'Informa'#231#245'es iniciais'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 21
      Top = 69
      Width = 133
      Height = 16
      Caption = 'Quantidade Andares'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 20
      Top = 99
      Width = 134
      Height = 16
      Caption = 'Capacidade Elevador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Button1: TButton
      Left = 21
      Top = 133
      Width = 260
      Height = 25
      Caption = 'Aplicar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object edtIniTotalAndares: TEdit
      Left = 160
      Top = 67
      Width = 121
      Height = 21
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      Text = '0'
      TextHint = 'QTD Andares'
    end
    object edtIniCapacidadeElev: TEdit
      Left = 160
      Top = 97
      Width = 121
      Height = 21
      TabOrder = 2
      Text = '0'
      TextHint = 'Capacidade Elevador'
      OnExit = edtCapacidadeElevExit
    end
  end
end
