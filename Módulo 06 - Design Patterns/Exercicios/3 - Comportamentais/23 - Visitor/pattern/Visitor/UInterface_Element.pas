unit UInterface_Element;

interface

type
  IElement = interface
    //M�todo que chamar� o Visitor para executar a opera��o
    procedure Accept(aVisitor: IInterface);
  end;

implementation

end.
