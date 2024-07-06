unit USubSystem_CotacaoDolar;

interface

type
  TSubsystemCotacaoDolar = class
  public
    function ConsultarCotacaoDolar: Real;
  end;

implementation

{ TSubsystemCotacaoDolar }

uses FachadaWSSGS1, Soap.SOAPHTTPClient, System.SysUtils;

function TSubsystemCotacaoDolar.ConsultarCotacaoDolar: Real;
var
  xWebServiceCotacao: FachadaWSSGS;
  xHTTPRIO: THTTPRIO;
  xFormatSettings: TFormatSettings;
begin
  // cria uma inst�ncia da classe THTTPRIO
  xHTTPRIO := THTTPRIO.Create(nil);

  // obt�m uma inst�ncia do WSDL
  xWebServiceCotacao := GetFachadaWSSGS(True, '', xHTTPRIO);

  // customiza o separador de decimais para evitar erro de convers�o
  FormatSettings.DecimalSeparator := '.';

  // invoca o WebService para buscar a cota��o do D�lar do dia
  Result := StrToFloat(xWebServiceCotacao.getUltimoValorVO(1).ultimoValor.sValor, FormatSettings);
end;

end.
