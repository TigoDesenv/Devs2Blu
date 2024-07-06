unit USubject;

interface

uses
  UObserver;

type
  ISubject = interface
    ['{90CC11CE-6A1A-4B6D-A4EA-CA7153C800CC}']
    // M�todo para adicionar Observers � lista
    procedure AdicionarObserver(aObserver: IObserver);

    // M�todos para remover Observers da lista
    procedure RemoverObserver(aObserver: IObserver);

    // M�todo respons�vel por notificar os Observers registrados
    procedure Notificar;
  end;

implementation

end.
