unit UConcreteHandler_JSON;

interface

uses
  UInterfaceHandler, DBClient;

type
  TParserJSON = class(TInterfacedObject, IParser)
  private
    // Refer�ncia para o Concrete Handler superior
    FProximoParser: IParser;
  public
    // Atribui a refer�ncia do Concrete Handler superior
    procedure SetProximoParser(aParser: IParser);

    // M�todo para processar a inclus�o de dados no DataSet
    procedure ProcessarInclusao(const aNomeArquivo: string; const aDataSet: TClientDataSet);
  end;

implementation

uses
  System.Classes, JSON, System.SysUtils;

{ TParserJSON }

procedure TParserJSON.ProcessarInclusao(const aNomeArquivo: string;
  const aDataSet: TClientDataSet);
var
  xValores: TStringList;
  xJSONPrincipal: TJSONObject;
  xJSONDados: TJSONObject;
  xArrayDados: TJSONArray;
  xContador: integer;
begin
  // Verifica se a extens�o do arquivo � compat�vel com a fun��o da classe
  if UpperCase(ExtractFileExt(aNomeArquivo)) <> '.JSON' then
  begin
    // Se n�o houver um Parser superior, significa que a mensagem chegou ao fim da cadeia
    if not Assigned(FProximoParser) then
      raise Exception.Create('Formato desconhecido.');

    // Transfere a mensagem para o pr�ximo Parser (Concrete Handler)
    FProximoParser.ProcessarInclusao(aNomeArquivo, aDataSet);
    Exit;
  end;

  // Cria a TStringList que ir� carregar o arquivo selecionado
  xValores := TStringList.Create;
  try
    // Carrega o arquivo
    xValores.LoadFromFile(aNomeArquivo);

    // Interpreta o conte�do do arquivo como JSON
    xJSONPrincipal := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(xValores.Text),0) as TJSONObject;

    // Seleciona o array "dados" do JSON
    xArrayDados := xJSONPrincipal.GetValue('dados') as TJSONArray;

    // Executa um loop nos itens do array
    for xContador := 0 to Pred(xArrayDados.Count) do
    begin
      // Converte o item atual do array para um objeto JSON
      xJSONDados := xArrayDados.Items[xContador] as TJSONObject;

      // Preenche o DataSet acessando os pares do item do array
      aDataSet.Append;
      aDataSet.FieldByName('Codigo').AsString := xJSONDados.Pairs[0].JsonValue.ToString;
      aDataSet.FieldByName('Nome').AsString   := xJSONDados.Pairs[1].JsonValue.Value;
      aDataSet.FieldByName('Cidade').AsString := xJSONDados.Pairs[2].JsonValue.Value;
      aDataSet.Post;
    end;
  finally
    // Libera a vari�vel da mem�ria
    FreeAndNil(xValores);
    FreeAndNil(xJSONPrincipal);
  end;
end;

procedure TParserJSON.SetProximoParser(aParser: IParser);
begin
  // Atribui o pr�ximo Parser
  FProximoParser := aParser;
end;

end.
