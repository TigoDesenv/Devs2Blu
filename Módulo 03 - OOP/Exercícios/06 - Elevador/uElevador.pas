unit uElevador;

interface

uses
  System.SysUtils, vcl.Dialogs;

type
  TElevador = class
    private
      FAndar: Integer;
      FQTDAndares: Integer;
      FQTDPessoas: Integer;
      FCapacidadeCarga: Integer;

      procedure SetAndar(const pValue: Integer);
      procedure SetCapacidadeCarga(const pValue: Integer);
      procedure SetQTDPessoas(const pValue: Integer);
      procedure SetQTDAndares(const pValue: Integer);

      function GetAndar: Integer;
      function GetCapacidadeCarga: Integer;
      function GetQTDPessoas: Integer;
      function GetQTDAndares: Integer;
    public
      Constructor Create(const TotalAndar: Integer; CapacidadePessoas: Integer; AndarInic: Integer = 0);

      property Andar: Integer           read GetAndar           write SetAndar;
      property QTDPessoas: Integer      read GetQTDPessoas      write SetQTDPessoas;
      property CapacidadeCarga: Integer read GetCapacidadeCarga write SetCapacidadeCarga;
      property QTDAndares: Integer      read GetQTDAndares      write SetQTDAndares;

      function Entrar(const pPessoasMaisTotal: Integer): String;
      function Sair(const pPessoasMaisTotal: Integer):String;
      function Subir(const pSobAndar: Integer): String;
      function Descer(const pDescAndar: Integer): String;
  end;

implementation

{ TElevador }

constructor TElevador.Create(const TotalAndar: Integer; CapacidadePessoas: Integer; AndarInic: Integer);
begin
  FQTDAndares := TotalAndar;
  FCapacidadeCarga := CapacidadePessoas;
  FAndar := AndarInic;
end;

function TElevador.Descer(const pDescAndar: Integer): String;
begin
  Result := '';

  if pDescAndar <= 0 then
    Result := 'Não tem SubSolo!!!';

  if Result = '' then
  begin
    FAndar := FAndar - 1;
  end;
end;

function TElevador.Subir(const pSobAndar: Integer): String;
begin
  Result := '';
  if pSobAndar > QTDAndares then
    Result := 'Estamos no último Andar, Não é possível subir mais!!!';

  if Result = '' then
  begin
    FAndar := FAndar + 1;
  end;
end;

function TElevador.Entrar(const pPessoasMaisTotal: Integer): String;
begin
  Result := '';

  if pPessoasMaisTotal > FCapacidadeCarga then
    Result := 'Não a Mais Lugar Dentro do Elevador, espere o próximo!!!';

  if Result = '' then
  begin
    FQTDPessoas := FQTDPessoas + 1;
  end;
end;

function TElevador.Sair(const pPessoasMaisTotal: Integer): String;
begin
  Result := '';

  if pPessoasMaisTotal < 0 then
    Result := 'Não há Pessoa para Descer.';

  if Result = '' then
  begin
    FQTDPessoas := FQTDPessoas - 1;
  end;
end;

function TElevador.GetAndar: Integer;
begin
  Result := FAndar;
end;

function TElevador.GetCapacidadeCarga: Integer;
begin
  Result := FCapacidadeCarga;
end;

function TElevador.GetQTDAndares: Integer;
begin
  Result := FQTDAndares;
end;

function TElevador.GetQTDPessoas: Integer;
begin
  Result := FQTDPessoas;
end;

procedure TElevador.SetAndar(const pValue: Integer);
begin
  FAndar := pValue;
end;

procedure TElevador.SetCapacidadeCarga(const pValue: Integer);
begin
  FCapacidadeCarga := pValue;
end;

procedure TElevador.SetQTDAndares(const pValue: Integer);
begin
  FQTDAndares := pValue;
end;

procedure TElevador.SetQTDPessoas(const pValue: Integer);
begin
  FQTDPessoas := pValue;
end;

end.
