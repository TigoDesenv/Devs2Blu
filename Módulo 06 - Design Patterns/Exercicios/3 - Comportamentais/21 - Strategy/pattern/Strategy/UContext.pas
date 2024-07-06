unit UContext;

interface

uses UInterface_Strategy;

type
  TTipoValidacao = (avDLL, avRegExLib, avMailBoxLayer);

  TContext = class
  private
    // Vari�vel para manter uma refer�ncia ao Concrete Strategy selecionado
    FStrategy: IStrategy;
  public
    // M�todo respons�vel por encaminhar a valida��o do e-mail ao Concrete Strategy
    function ValidarEmail(const aTipoValidacao: TTipoValidacao; const aEmail: String): Boolean;
  end;

implementation

{ TContext }

uses UConcrete_StrategyDLL, UConcrete_StrategyMailBoxLayer,
  UConcrete_StrategyRegExLib;

function TContext.ValidarEmail(const aTipoValidacao: TTipoValidacao;
  const aEmail: String): Boolean;
begin
  // Cria a inst�ncia de um Concrete Strategy conforme o tipo de valida��o selecionado
  case aTipoValidacao of
    avDLL:
      FStrategy := TConcreteStrategyDLL.Create;
    avRegExLib:
      FStrategy := TConcreteStrategyRegExLib.Create;
    avMailBoxLayer:
      FStrategy := TConcreteStrategyMailBoxLayer.Create;
  end;

  // Chama a fun��o "ValidarEmail" do Concrete Strategy
  Result := FStrategy.ValidarEmail(aEmail);
end;

end.
