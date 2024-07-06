unit UConcrete_Visitor_Salario;

interface

uses UInterface_Visitor, UConcrete_Element_Gerente,
  UConcrete_Element_Programador;

type
  TSalario = class(TInterfacedObject, IVisitor)
    // M�todo que ser� invocado quando o objeto do par�metro for da classe TProgramador
    procedure Visit(aProgramador: TProgramador); overload;

    // M�todo que ser� invocado quando o objeto do par�metro for da classe TGerente
    procedure Visit(aGerente: TGerente); overload;
  end;

implementation

uses
  System.SysUtils, DateUtils;

{ TSalario }

// C�lculo do aumento do sal�rio para gerentes
procedure TSalario.Visit(aGerente: TGerente);
var
  xQtdeAnosNaEmpresa: byte;
begin
  // Aplica um aumento de 8% no sal�rio
  aGerente.Salario := aGerente.Salario * 1.08;

  // Calcula a quantidade de anos que o gerente est� na empresa
  xQtdeAnosNaEmpresa := YearsBetween(Date, aGerente.Admissao);

  // Conforme a quantidade de anos, uma porcentagem adicional � aplicada
  case xQtdeAnosNaEmpresa of
    2..3:
      aGerente.Salario := aGerente.Salario * 1.03; // at� 3 anos: 3%
    4..5:
      aGerente.Salario := aGerente.Salario * 1.04; // at� 5 anos: 4%
    6..10:
      aGerente.Salario := aGerente.Salario * 1.05; // at� 10 anos: 5%
  end;
end;

// C�lculo do aumento do sal�rio para programadores
procedure TSalario.Visit(aProgramador: TProgramador);
var
  xPorcentagemPorDiaTrabalhado: real;
begin
  // Aplica um aumento de 6% no sal�rio
  aProgramador.Salario := aProgramador.Salario * 1.06;

  // Aplica um aumento adicional de 0,002% por cada dia trabalhado
  xPorcentagemPorDiaTrabalhado := DaysBetween(Date, aProgramador.Admissao) * 0.002;
  aProgramador.Salario := aProgramador.Salario * (1 + xPorcentagemPorDiaTrabalhado / 100);
end;

end.
