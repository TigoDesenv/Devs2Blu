unit UConcrete_StrategyMailBoxLayer;

interface

uses UInterface_Strategy;

type
  TConcreteStrategyMailBoxLayer = class(TInterfacedObject, IStrategy)
    private
      //Envia uma requisi��o � API do MailBoxLayer e recebe um JSON com retorno
      function ObterJSONValidacao(const aEmail: String): String;
    public
      //Assinatura da Interface Strategy
      function ValidarEmail(const aEmail: String): Boolean;
  end;

implementation

uses
  System.Classes, IdHTTP, System.SysUtils, JSON;

{ TConcreteStrategyMailBoxLayer }

function TConcreteStrategyMailBoxLayer.ObterJSONValidacao(
  const aEmail: String): String;
var
  xURL: string;
  xIdHTTP: TIdHTTP;
  xResposta: TMemoryStream;
begin
  // URL que ser� enviada na requisi��o
  xURL := 'https://apilayer.net/api/check';
  xURL := xURL + '?access_key=98d5dfa2c5213713e70c2476db5c01f0';
  xURL := xURL + '&email=%s&format=1';

  // Cria um objeto da classe TIdHTTP para enviar a requisi��o
  xIdHTTP := TIdHTTP.Create(nil);

  // Cria um objeto da classe TMemoryStream para receber o retorno
  xResposta := TMemoryStream.Create;
  try
    // Envia a requisi��o e recebe a resposta
    xIdHTTP.Get(Format(xURL, [aEmail]), xResposta);

    // Converte o conte�do do objeto da classe TMemoryStream para string
    SetString(Result, PAnsiChar(xResposta.Memory), xResposta.Size);
  finally
    // Libera os objetos da mem�ria
    xIdHTTP.Free;
    xResposta.Free;
  end;
end;

function TConcreteStrategyMailBoxLayer.ValidarEmail(
  const aEmail: String): Boolean;
var
  xResposta: string;
  xJSON: TJSONObject;
begin
  // Obt�m a resposta JSON da chamada � API
  xResposta := ObterJSONValidacao(aEmail);

  // Cria o objeto para trabalhar com JSON
  xJSON := TJSONObject.Create;
  try
    // Atribui o conte�do JSON ao objeto
    xJSON.Parse(TEncoding.ASCII.GetBytes(xResposta), 0);

    // Se o valor da chave "format_valid" for "true", significa que o e-mail � v�lido
    Result := xJSON.GetValue('format_valid') is TJSONTrue;
  finally
    // Libera o objeto da mem�ria
    xJSON.Free;
  end;

end;

end.
