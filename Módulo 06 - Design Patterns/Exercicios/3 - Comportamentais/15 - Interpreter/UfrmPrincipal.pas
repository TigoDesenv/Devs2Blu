unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    edtEntrada: TEdit;
    btnProcessar: TButton;
    edtSaida: TEdit;
    procedure btnProcessarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  Contnrs, UTerminalExpression, UContext, UAbstractExpression;

{$R *.dfm}

{
  Selecionar clientes com nome Beatriz
  Selecionar ID, Nome, CPF dos clientes de S�o Paulo
  Excluir cliente Jo�o
  Atualizar nome do cliente 2 para Armando Neto
}

procedure TfrmPrincipal.btnProcessarClick(Sender: TObject);
var
  xContexto: TContext;
  xArvoreSintatica: TObjectList;
  xContador: integer;
begin
  // Cria o contexto
  xContexto := TContext.Create;

  // Cria a �rrvore sint�tica
  xArvoreSintatica := TObjectList.Create;
  try
    // Preenche a entrada do contexto
    xContexto.Entrada := edtEntrada.Text;

    // Configura a �rvore sint�tica com as express�es
    xArvoreSintatica.Add(TComandoExpression.Create);
    xArvoreSintatica.Add(TColunasExpression.Create);
    xArvoreSintatica.Add(TTabelaExpression.Create);
    xArvoreSintatica.Add(TCondicaoExpression.Create);

    // Percorre as express�es para traduzir a entrada em instru��o SQL
    for xContador := 0 to Pred(xArvoreSintatica.Count) do
      TAbstractExpression(xArvoreSintatica[xContador]).Interpretar(xContexto);

    // Exibe a sa�da do contexto (SQL)
    edtSaida.Text := xContexto.Saida;
  finally
    // Libera as vari�veis da mem�ria
    FreeAndNil(xArvoreSintatica);
    FreeAndNil(xContexto);
  end;
end;

end.
