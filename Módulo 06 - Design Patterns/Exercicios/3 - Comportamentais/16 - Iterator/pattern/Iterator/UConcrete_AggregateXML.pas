unit UConcrete_AggregateXML;

interface

uses UInterface_Aggregate, Contnrs, UInterface_Iterator;

type
  TConcreteAggregateXML = class(TInterfacedObject, IAggregate)
    private
      FLista: TObjectList;
      procedure PreencherLista(const aCaminhoArquivo: String);
    public
      constructor Create(const aCaminhoArquivo: String);
      destructor Destroy; override;

      function GetLista: TObjectList;
      function GetIterator: IIterator;
  end;

implementation


{ TConcreteAggregateXML }

uses UCliente, UConcrete_Iterator,   Xml.XMLIntf, Xml.XMLDoc, System.SysUtils;

constructor TConcreteAggregateXML.Create(const aCaminhoArquivo: String);
begin
  //Cria a lista de objetos
  FLista := TObjectList.Create;

  //Chama um m�todo para carregar o arquivo e popular a lista de objetos
  Self.PreencherLista(aCaminhoArquivo);
end;

destructor TConcreteAggregateXML.Destroy;
begin
  FLista.Free;
  inherited;
end;

function TConcreteAggregateXML.GetIterator: IIterator;
begin
  Result := TConcreteIterator.Create(Self);
end;

function TConcreteAggregateXML.GetLista: TObjectList;
begin
  //Retorna uma referencia da lista
  Result := FLista;
end;

procedure TConcreteAggregateXML.PreencherLista(const aCaminhoArquivo: String);
var
  xXMLDocument: IXMLDocument;
  xNodeImportacao: IXMLNode;
  xNodeDados: IXMLNode;
  xContador: Integer;
  xCliente: TCliente;
begin
  // Carrega o arquivo XML
  xXMLDocument := LoadXMLDocument(aCaminhoArquivo);
  xXMLDocument.Active := True;

  // Seleciona o n� principal do XML (chamado "dataset")
  xNodeImportacao := xXMLDocument.DocumentElement;
  for xContador := 0 to Pred(xNodeImportacao.ChildNodes.Count) do
  begin
    // Acessa o n� filho
    xNodeDados := xNodeImportacao.ChildNodes[xContador];

    // Cria e preenche o objeto com os dados do n�
    xCliente          := TCliente.Create;
    xCliente.Codigo   := StrToInt(xNodeDados.ChildNodes['codigo'].Text);
    xCliente.Nome     := xNodeDados.ChildNodes['nome'].Text;
    xCliente.Endereco := xNodeDados.ChildNodes['endereco'].Text;
    xCliente.Pais     := xNodeDados.ChildNodes['pais'].Text;
    xCliente.Email    := xNodeDados.ChildNodes['email'].Text;

    // Adiciona o objeto na lista
    FLista.Add(xCliente);
  end;
end;

end.
