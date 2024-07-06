unit UConcrete_Colleague;

interface

uses UInterface_Colleague, UInterface_Mediator;

type
  TConcreteColleague = class(TInterfacedObject, IColleague)
    private
      FNome: String;

      //Vari�vel para armazenar uma referencia ao Mediator
      FMediator: IMediator;
    public
      constructor Create(const aNome: String; aMediator: IMediator);

      //Chama o Mediator para enviar a proposta ao destinatario
      function EnviarProposta(const aDestinatario, aProposta: String): String;

      //Retorna uma mensagem de recebimento da proposta
      function ReceberProposta(const aRemetente, aProposta: String): String;

      //Obt�m o nome do membro
      function ObterNome: String;

      //Chama o Mediator para adicionar o usu�rio no dicionario
      function Entrar: String;

      //Chama o Mediator para remover o usu�rio do dicionario
      function Sair: String;
  end;

implementation

uses
  System.SysUtils;

{ TConcreteColleague }

constructor TConcreteColleague.Create(const aNome: String;
  aMediator: IMediator);
begin
  FNome     := aNome;
  FMediator := aMediator;
end;

function TConcreteColleague.Entrar: String;
begin
  //Adiciona o usu�rio no dicionaro
  Result := FMediator.AdicionarMembro(Self);
end;

function TConcreteColleague.EnviarProposta(const aDestinatario,
  aProposta: String): String;
begin
  //Envia a proposta atrav�s do Mediator
  Result := FMediator.EnviarProposta(Self.ObterNome, aDestinatario, aProposta);
end;

function TConcreteColleague.ObterNome: String;
begin
  Result := FNome;
end;

function TConcreteColleague.ReceberProposta(const aRemetente,
  aProposta: String): String;
begin
  //Retorna uma mensagem indicando o recebimento da proposta
  Result := Format('De [%s] para [%s]: %s', [aRemetente, Self.ObterNome, aProposta]);
end;

function TConcreteColleague.Sair: String;
begin
  //Remove o usu�rio do dicionario
  Result := FMediator.RemoverMembro(Self.ObterNome);
end;

end.
