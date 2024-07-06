unit UProxy;

interface

uses USubject, DBClient;

type
  TCalculadorProxy = class(TInterfacedObject, ICalculador)
  private
    // Armazena uma refer�ncia para o Real Subject (objeto real)
    FCalculadorReal: ICalculador;

    // DataSet para armazenar os dados de cache
    FCacheDados: TClientDataSet;
  public
    constructor Create;
    destructor Destroy; override;

    // M�todo da Interface
    function CalcularDistancia(const aOrigem, aDestino, aKey: string): string;
  end;

implementation

uses
  System.Variants, URealSubject, System.SysUtils, Vcl.Forms, Data.DB;

{ TCalculadorProxy }

function TCalculadorProxy.CalcularDistancia(const aOrigem, aDestino, aKey: string): string;
begin
  // Verifica se o valor da dist�ncia est� no DataSet de cache
  if FCacheDados.Locate('Origem;Destino', VarArrayOf([aOrigem, aDestino]), []) then
  begin
    // Se o valor estiver no DataSet, n�o � necess�rio chamar o objeto real
    Result := FCacheDados.FieldByName('Distancia').AsString;
    Exit;
  end;

  // Cria a inst�ncia do objeto real (Real Subject) caso ela ainda n�o exista
  if not Assigned(FCalculadorReal) then
    FCalculadorReal := TCalculadorReal.Create;

  // Chama o objeto real para obter a dist�ncia usando a API do Google Maps
  Result := FCalculadorReal.CalcularDistancia(aOrigem, aDestino, aKey);

  // Adiciona os dados no DataSet de cache
  // para evitar uma nova requisi��o repetida � API, aumentando o desempenho da aplica��o
  FCacheDados.AppendRecord([aOrigem, aDestino, Result]);

  // Salva o arquivo de cache em disco
  FCacheDados.SaveToFile(ExtractFilePath(Application.ExeName) + 'Cache.xml');
end;

constructor TCalculadorProxy.Create;
var
  xArquivoCache: string;
begin
  // Cria o DataSet de cache (tabela tempor�ria)
  FCacheDados := TClientDataSet.Create(nil);

  // Se o arquivo de cache existir, � carregado
  xArquivoCache := ExtractFilePath(Application.ExeName) + 'Cache.xml';
  if FileExists(xArquivoCache) then
    FCacheDados.LoadFromFile(xArquivoCache)
  else
  begin
    // Caso contr�rio, a estrutura do DataSet � criada para ser usado pela primeira vez
    // ou a cada vez que o cache for exclu�do do diret�rio da aplica��o
    FCacheDados.FieldDefs.Add('Origem', ftString, 50);
    FCacheDados.FieldDefs.Add('Destino', ftString, 50);
    FCacheDados.FieldDefs.Add('Distancia', ftString, 10);
    FCacheDados.CreateDataSet;
  end;

  // Desliga o log de altera��es
  FCacheDados.LogChanges := False;
end;

destructor TCalculadorProxy.Destroy;
begin
  FCacheDados.Close;
  FreeAndNil(FCacheDados);
  inherited;
end;

end.
