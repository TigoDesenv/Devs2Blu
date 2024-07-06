unit ULoggerSingleton;

interface

type
  TLoggerSingleton = class
  private
    //Vari�vel que aponta para o arquivo de log
    FArquivoLog: TextFile;

    //O construtor � declarado como privado
    //pois o m�todo principal � "ObterInstancia"
    constructor Create;
  public
    //M�todo principal do Singleton
    class function ObterInstancia: TLoggerSingleton;

    //M�todo chamado pelo "Create" indiretamente
    class function NewInstance: TObject; override;

    //M�todo para registrar o texto do par�metro no arquivo de log
    procedure RegistrarLog(const aTexto: string);
  end;

var
  Instancia: TLoggerSingleton;

implementation

uses
  System.SysUtils, Vcl.Forms;

{ TLoggerSingleton }

constructor TLoggerSingleton.Create;
var
  xDiretorioAplicacao: string;
begin
  //Associa o aquivo "Log.txt" que est� na pasta do projeto
  xDiretorioAplicacao := ExtractFilePath(Application.ExeName);
  AssignFile(FArquivoLog, xDiretorioAplicacao + 'Log.txt');

  //Se o arquivo n�o existir, � criado
  if not FileExists(xDiretorioAplicacao + 'Log.txt') then
  begin
    Rewrite(FArquivoLog);
    CloseFile(FArquivoLog);
  end;
end;

class function TLoggerSingleton.NewInstance: TObject;
begin
  //Se j� houver uma inst�ncia, ela � retornada
  //caso contr�rio, o objeto � instanciado antes de ser retornado

  if not Assigned(Instancia) then
  begin
    //Chama a fun��o "NewInstance" da heran�a (TObject)
    Instancia := TLoggerSingleton(inherited NewInstance);
  end;

  Result := Instancia;
end;

class function TLoggerSingleton.ObterInstancia: TLoggerSingleton;
begin
  //Chama o m�todo Create, que cria (uma �nica vez) e retorna a inst�ncia
  Result := TLoggerSingleton.Create;
end;

procedure TLoggerSingleton.RegistrarLog(const aTexto: string);
begin
  //Abre o arquivo de log para edi��o
  Append(FArquivoLog);

  //Escreve o texto no arquivo de log
  WriteLn(FArquivoLog, aTexto);

  //Fecha o arquivo
  CloseFile(FArquivoLog);
end;

initialization

finalization
  //Libera o Singleton da mem�ria
  FreeAndNil(Instancia);

end.
