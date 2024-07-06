unit UConcreteHandler_CSV;

interface

uses
  UInterfaceHandler, DBClient;

type
  TParserCSV = class(TInterfacedObject, IParser)
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
  System.Classes, System.SysUtils;

{ TParserCSV }

procedure TParserCSV.ProcessarInclusao(const aNomeArquivo: string; const aDataSet: TClientDataSet);
var
  xValores: TStringList;
  xLinha: TStringList;
  xContador: Integer;
begin
  // Verifica se a extens�o do arquivo � compat�vel com a fun��o da classe
  if UpperCase(ExtractFileExt(aNomeArquivo)) <> '.CSV' then
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

  // Cria a TStringList que receber� os valores de cada linha
  xLinha := TStringList.Create;
  try
    // Carrega o arquivo
    xValores.LoadFromFile(aNomeArquivo);

    // Executa um loop nos itens da TStringList
    for xContador := 0 to Pred(xValores.Count) do
    begin
      xLinha.Clear;

      // Utiliza o ExtractStrings para quebrar os valores
      // que est�o separados por v�rgula
      ExtractStrings([','], [' '], PChar(xValores[xContador]), xLinha);

      // Preenche o DataSet com os dados da linha
      aDataSet.AppendRecord([xLinha[0], xLinha[1], xLinha[2]]);
    end;
  finally
    // Libera as vari�veis da mem�ria
    FreeAndNil(xLinha);
    FreeAndNil(xValores);
  end;
end;

procedure TParserCSV.SetProximoParser(aParser: IParser);
begin
  // Atribui o pr�ximo Parser
  FProximoParser := aParser;
end;

end.
