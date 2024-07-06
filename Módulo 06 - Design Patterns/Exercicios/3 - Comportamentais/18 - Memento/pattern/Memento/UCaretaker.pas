unit UCaretaker;

interface

uses
  Generics.Collections, UMemento;

type
  TCaretaker = class
    private
      FHistoricoAlteracoes: TObjectDictionary<String, TMemento>;
    public
      constructor Create;
      destructor Destroy; override;

      //M�todo para adicionar um novo Memento na lista
      procedure Adicionar(const aDataHora: String; aMemento: TMemento);

      //Fun��o para retornar um Memento conforme a data e hora
      function Obter(const aDataHora: String): TMemento;
  end;

implementation

{ TCaretaker }

procedure TCaretaker.Adicionar(const aDataHora: String; aMemento: TMemento);
begin
  //Adiciona o Memento no dicionario de objetos
  FHistoricoAlteracoes.Add(aDataHora, aMemento);
end;

constructor TCaretaker.Create;
begin
  //Cria o dicionario de objetos
  // "doOwnsValues" significa que o pr�prio dicionario ir� liberar os objetos internos
  FHistoricoAlteracoes := TObjectDictionary<String, TMemento>.Create([doOwnsValues]);
end;

destructor TCaretaker.Destroy;
begin
  FHistoricoAlteracoes.Free;
  inherited;
end;

function TCaretaker.Obter(const aDataHora: String): TMemento;
begin
  //Obt�m o memento conforme a chave, que � uma combina��o da data e hora
  Result := FHistoricoAlteracoes.Items[aDataHora];
end;

end.
