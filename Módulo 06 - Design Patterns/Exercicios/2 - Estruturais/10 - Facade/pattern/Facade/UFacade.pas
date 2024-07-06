unit UFacade;

interface

type
  TFacade = class
    public
      //Opera��o do Facade
      function CalcularValorDeVenda(const aFidelidade: Integer; const aPreco: Real): Real;
  end;

implementation

{ TFacade }

uses USubSystem_CalculoLoja, USubSystem_CotacaoDolar, USubSystem_Historico,
  System.SysUtils;

function TFacade.CalcularValorDeVenda(const aFidelidade: Integer;
  const aPreco: Real): Real;
var
  xSubsystemCotacaoDolar: TSubsystemCotacaoDolar;
  xSubsystemCalculoLoja: TSubsystemCalculoLoja;
  xSubsystemHistorico: TSubsystemHistorico;
  xCotacaoDolar: Real;
  xValorVenda: Real;
begin
  // cria as inst�ncias dos SubSsystems
  xSubsystemCotacaoDolar := TSubsystemCotacaoDolar.Create;
  xSubsystemCalculoLoja  := TSubsystemCalculoLoja.Create;
  xSubsystemHistorico    := TSubsystemHistorico.Create;
  try
    // utiliza o primeiro Subsystem para consultar a cota��o do D�lar
    xCotacaoDolar := xSubsystemCotacaoDolar.ConsultarCotacaoDolar;

    // converte em Reais
    xValorVenda := aPreco * xCotacaoDolar;

    // utiliza o segundo Subsytem para aplicar desconto e margem de venda
    xValorVenda := xSubsystemCalculoLoja.CalcularPrecoFinal(aFidelidade, xValorVenda);

    // utiliza o terceiro Subsystem para armazenar o hist�rico do c�lculo
    xSubsystemHistorico.RegistrarHistoricoDoCalculo(xCotacaoDolar, aPreco, xValorVenda);

    // retorna o valor calculado
    Result := xValorVenda;
  finally
    // libera as inst�ncias da mem�ria
    FreeAndNil(xSubsystemCotacaoDolar);
    FreeAndNil(xSubsystemCalculoLoja);
    FreeAndNil(xSubsystemHistorico);
  end;
end;

end.
