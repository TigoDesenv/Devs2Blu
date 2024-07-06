unit uFrmGit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TConsumo = (Residencia, Comercio , Industria, Fazenda);

  TForm1 = class(TForm)
    rdImovel: TRadioGroup;
    edtConsumo: TEdit;
    lbResultado: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Label1: TLabel;
    Label3: TLabel;
    edtDesconto: TEdit;
    procedure Button1Click(Sender: TObject);
  private
  procedure CalculaKw;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  self.CalculaKw;
end;


procedure TForm1.CalculaKw;
const
  cResidencia = 0.60;
  cComercio   = 0.48;
  cIndustria  = 1.29;
  cFazenda    = 2.18;

begin


  case TConsumo(rdImovel.ItemIndex) of
    Residencia:
    begin
      lbResultado.Caption := 'Seu Consumo foi de: ' + FormatFloat
                            ('0.00', (StrToFloat(edtConsumo.text) * cResidencia)- StrToFloatDef(edtDesconto.Text, 0));
    end;
    Comercio:
    begin
       lbResultado.Caption := 'Seu Consumo foi de: ' + FormatFloat
                             ('0.00', (StrToFloat(edtConsumo.text) * cComercio)- StrToFloatDef(edtDesconto.Text, 0));

    end;
    Industria:
    begin
      lbResultado.Caption := 'Seu Consumo foi de: ' + FormatFloat
                            ('0.00', (StrToFloat(edtConsumo.text) * cIndustria)- StrToFloatDef(edtDesconto.Text, 0));
    end;
    Fazenda:
    begin
      lbResultado.Caption := 'Seu Consumo foi de: ' + FormatFloat
                            ('0.00', (StrToFloat(edtConsumo.text) * cFazenda)- StrToFloatDef(edtDesconto.Text, 0));
    end;
  end;

end;

end.
 { Faça um algoritmo que calcule o valor da conta de luz de uma pessoa. Sabe-se que o cálculo
da conta de luz segue a tabela abaixo:
  Tipo de Cliente Valor do KW/h
    a. (Residência) 0,60;
    b. (Comércio) 0,48;
    c. (Indústria) 1,29.}