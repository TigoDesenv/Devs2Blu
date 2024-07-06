unit UConcrete_StrategyRegExLib;

interface

uses UInterface_Strategy;

type
  TConcreteStrategyRegExLib = class(TInterfacedObject, IStrategy)
    private
      //Acessa o WebService para consultar a express�o regular
      function ObterExpressao: String;
    public
      //Assinatura da Interface Strategy
      function ValidarEmail(const aEmail: String): Boolean;
  end;

implementation

{ TConcreteStrategyRegExLib }

uses WebService.RegExLib, Soap.SOAPHTTPClient, RegularExpressions;

function TConcreteStrategyRegExLib.ObterExpressao: String;
var
  xWebServiceRegExLib: WebservicesSoap;
  xHTTPRIO: THTTPRIO;
  xExpressao: RegExpDetails;
begin
  // Cria um objeto da classe THTTPRIO
  xHTTPRIO := THTTPRIO.Create(nil);

  // Obt�m uma inst�ncia do consumidor do WebService
  xWebServiceRegExLib := GetWebservicesSoap(True, '', xHTTPRIO);

  // Consulta os dados da express�o regular (o ID 3122 corresponde a uma valida��o de e-mail)
  xExpressao := xWebServiceRegExLib.getRegExpDetails(3122);

  // Obt�m a string referente � express�o regular
  Result := xExpressao.regular_expression;

  // Libera o objeto da mem�ria
  xExpressao.Free;
end;

function TConcreteStrategyRegExLib.ValidarEmail(const aEmail: String): Boolean;
var
  xRegEx: TRegEx;
begin
  // Cria uma inst�ncia do record TRegEx informando a express�o consultada no WebService
  xRegEx := TRegEx.Create(ObterExpressao);

  // Valida o e-mail com a express�o regular
  Result := xRegEx.Match(aEmail).Success;
end;

end.
