unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    btnCalcular: TButton;
    Memo1: TMemo;
    procedure btnCalcularClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UFacade;

procedure TfrmPrincipal.btnCalcularClick(Sender: TObject);
var
  xFidelidade: Smallint;
  xPreco: Real;
  xFacade: TFacade;
  xValorVenda: Double;
begin
  xFidelidade := 0; //0,1,2,3
  xPreco      := 100;

  // cria uma inst�ncia do Fa�ade
  xFacade := TFacade.Create;
  try
    // chama o m�todo do Fa�ade que, por sua vez,
    // executa as opera��es de todos os Subsystems
    xValorVenda := xFacade.CalcularValorDeVenda(xFidelidade, xPreco);

    // exibe uma mensagem com o valor de venda calculado
    ShowMessage(FormatFloat('###,###,##0.00', xValorVenda));

    // carrega o log da opera��o (gerado por um dos Subsystems)
    Memo1.Lines.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Historico.txt');
  finally
    // libera o objeto da mem�ria
    FreeAndNil(xFacade);
  end;
end;

end.
