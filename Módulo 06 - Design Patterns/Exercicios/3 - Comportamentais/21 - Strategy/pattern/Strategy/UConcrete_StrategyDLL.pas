unit UConcrete_StrategyDLL;

interface

uses UInterface_Strategy;

type
  TConcreteStrategyDLL = class(TInterfacedObject, IStrategy)
    public
      //Assinatura da Interface Strategy
      function ValidarEmail(const aEmail: String): Boolean;
  end;

  //Define um tipo de fun��o que corresponde ao m�todo da DLL
  TValidarEmail = function (const aEmail: String): Boolean; stdCall;

implementation

uses
  Winapi.Windows;

{ TConcreteStrategyDLL }

function TConcreteStrategyDLL.ValidarEmail(const aEmail: String): Boolean;
var
  xHandleDLL: THandle;
  xValidarEmail: TValidarEmail;
begin
  // Carrega a DLL
  xHandleDLL := LoadLibrary('ValidadorEmail.dll');
  try
    // Obt�m o endere�o do m�todo da DLL chamado "ValidarEmail"
    @xValidarEmail := GetProcAddress(xHandleDLL, 'ValidarEmail');

    // Chama o m�todo da DLL para validar o e-mail
    Result := xValidarEmail(aEmail);
  finally
    // Descarrega a DLL
    FreeLibrary(xHandleDLL);
  end;
end;

end.
