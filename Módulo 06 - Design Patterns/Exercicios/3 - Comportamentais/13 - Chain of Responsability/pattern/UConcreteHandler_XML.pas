unit UConcreteHandler_XML;

interface

uses
  UInterfaceHandler, DBClient;

type
  TParserXML = class(TInterfacedObject, IParser)
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
  System.SysUtils, XMLIntf, XMLDoc;

{ TParserXML }

procedure TParserXML.ProcessarInclusao(const aNomeArquivo: string; const aDataSet: TClientDataSet);
var
  FXMLDocument: IXMLDocument;
  FNodeImportacao: IXMLNode;
  xNodeDados: IXMLNode;
  xContador: Integer;
begin
  // Verifica se a extens�o do arquivo � compat�vel com a fun��o da classe
  if UpperCase(ExtractFileExt(aNomeArquivo)) <> '.XML' then
  begin
    // Se n�o houver um Parser superior, significa que a mensagem chegou ao fim da cadeia
    if not Assigned(FProximoParser) then
      raise Exception.Create('Formato desconhecido.');

    // Transfere a mensagem para o pr�ximo Parser (Concrete Handler)
    FProximoParser.ProcessarInclusao(aNomeArquivo, aDataSet);
    Exit;
  end;

  // Carrega e abre o arquivo XML
  FXMLDocument := LoadXMLDocument(aNomeArquivo);
  FXMLDocument.Active := True;

  // Seleciona o n� principal do XML (importacao)
  FNodeImportacao := FXMLDocument.DocumentElement;

  // Executa um loop nos filhos do n� principal
  for xContador := 0 to Pred(FNodeImportacao.ChildNodes.Count) do
  begin
    // Acessa o n� filho atual
    xNodeDados := FNodeImportacao.ChildNodes[xContador];

    // Preenche o DataSet com os dados do n�
    aDataSet.Append;
    aDataSet.FieldByName('Codigo').AsString := xNodeDados.ChildNodes['codigo'].Text;
    aDataSet.FieldByName('Nome').AsString   := xNodeDados.ChildNodes['nome'].Text;
    aDataSet.FieldByName('Cidade').AsString := xNodeDados.ChildNodes['cidade'].Text;
    aDataSet.Post;
  end;
end;

procedure TParserXML.SetProximoParser(aParser: IParser);
begin
  // Atribui o pr�ximo Parser
  FProximoParser := aParser;
end;

end.
