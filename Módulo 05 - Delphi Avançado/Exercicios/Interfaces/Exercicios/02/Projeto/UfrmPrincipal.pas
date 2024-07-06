unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    Label1: TLabel;
    edtNumero1: TEdit;
    Label2: TLabel;
    edtNumero2: TEdit;
    cmbOperacao: TComboBox;
    btnCalcular: TButton;
    Label3: TLabel;
    lblResultado: TLabel;
    procedure btnCalcularClick(Sender: TObject);
  private
    { Private declarations }

    procedure Calcular;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UCalculatorService, UCalculatorServiceDefault;

procedure TfrmPrincipal.btnCalcularClick(Sender: TObject);
begin
  Self.Calcular;
end;

procedure TfrmPrincipal.Calcular;
var
  xNum1, xNum2: Double;
  xCalculatorService: TCalculatorService;
begin
  if not TryStrToFloat(edtNumero1.Text, xNum1) then
    raise Exception.Create('N�mero 1 inv�lido');

  if not TryStrToFloat(edtNumero2.Text, xNum2) then
    raise Exception.Create('N�mero 2 inv�lido');

  xCalculatorService := TCalculatorService.Create(xNum1, xNum2, TCalculatorServiceDefault.Create);
  try
    lblResultado.Caption := 'Resultado �: ' +
       xCalculatorService.processCalc(TTypeCalc(cmbOperacao.ItemIndex)).ToString;
  finally
    FreeAndNil(xCalculatorService);
  end;
end;

end.
