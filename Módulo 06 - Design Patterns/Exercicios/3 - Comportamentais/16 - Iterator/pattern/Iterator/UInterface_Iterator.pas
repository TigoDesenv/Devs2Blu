unit UInterface_Iterator;

interface

type
  IIterator = interface
    //Move para o primeiro objeto da lista
    procedure PrimeiroObjeto;

    //Move para o pr�ximo objeto da lista
    procedure ProximoObjeto;

    //Retorna o objeto atual da lista
    function ObjetoAtual: TObject;

    //Verifica se est� no fim da lista
    function FimLista: Boolean;
  end;

implementation

end.
