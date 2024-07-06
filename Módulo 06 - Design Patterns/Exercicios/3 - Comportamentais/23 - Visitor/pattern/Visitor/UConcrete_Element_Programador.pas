unit UConcrete_Element_Programador;

interface

uses UConcrete_Element_Funcionario;

type
  TProgramador = class(TFuncionario)
    public
      procedure Accept(aVisitor: IInterface); override;
  end;

implementation

{ TProgramador }

uses UInterface_Visitor;

procedure TProgramador.Accept(aVisitor: IInterface);
var
  xConcreteVisitor: IVisitor;
begin
  //Aplica um typecast do parametro para o tipo IVisitor
  xConcreteVisitor := aVisitor as IVisitor;

  //Chama o m�todo "Visit" do Concrete Visitor, enviando a pr�pria instancia como parametro
  //Essa instancia � o que indicar� qual sobrecarga do m�todo "Visit" ser� chamado
  xConcreteVisitor.Visit(Self);
end;

end.
