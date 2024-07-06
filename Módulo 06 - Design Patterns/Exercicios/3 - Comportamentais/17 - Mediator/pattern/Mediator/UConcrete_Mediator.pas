unit UConcrete_Mediator;

interface

uses
  Generics.Collections, UInterface_Colleague, UInterface_Mediator;

type
  TConcreteMediator = class(TInterfacedObject, IMediator)
    private
      //Variavel para armazenar a lista de membros
      FListaMembros: TDictionary<String, IColleague>;
    public
      constructor Create;

      //Adiciona o objeto no dicionario
      function AdicionarMembro(aMembro: IColleague): String;

      //Remove o objeto do dicionario
      function RemoverMembro(const aNome: String): String;

      //Envia a proposta do remetente para o destinario
      function EnviarProposta(const aRemetente, aDestinatario, aProposta: String): String;

      //Busca a referencia do membro atrav�s do nome, que � a chave do par no dicionario
      function ObterMembro(const aNome: String): IColleague;

      //Liberar objetos da memoria
      procedure LiberarObjetos;
  end;

implementation

uses
  System.SysUtils;

{ TConcreteMediator }

function TConcreteMediator.AdicionarMembro(aMembro: IColleague): String;
begin
  //Adiciona o membro no dicionario
  FListaMembros.Add(aMembro.ObterNome, aMembro);

  Result := Format('Usu�rio "%s" entrou.', [aMembro.ObterNome]);
end;

constructor TConcreteMediator.Create;
begin
  //Cria o dicionario
  FListaMembros := TDictionary<String, IColleague>.Create;
end;

function TConcreteMediator.EnviarProposta(const aRemetente, aDestinatario,
  aProposta: String): String;
var
  xMembroRemetente: IColleague;
  xMembroDestinatario: IColleague;
begin
  // Encontra o remetente no dicion�rio
  xMembroRemetente := FListaMembros.Items[aRemetente];

  // Encontra o destinat�rio no dicion�rio
  xMembroDestinatario := FListaMembros.Items[aDestinatario];

  // Executa o m�todo de recebimento da proposta no destinat�rio
  Result := xMembroDestinatario.ReceberProposta(xMembroRemetente.ObterNome, aProposta);
end;

procedure TConcreteMediator.LiberarObjetos;
begin
  FListaMembros.Free;
end;

function TConcreteMediator.ObterMembro(const aNome: String): IColleague;
begin
  //Obt�m uma referencia ao objeto pelo nome (utilizado posteriormente pelo Client)
  Result := FListaMembros.Items[aNome];
end;

function TConcreteMediator.RemoverMembro(const aNome: String): String;
begin
  //Remove o membro do dicionario
  FListaMembros.Remove(aNome);

  Result := Format('Usu�rio "%s" saiu.', [aNome]);
end;

end.
