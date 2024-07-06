program Project3;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  xEntrada: String;
  xMeuNome: String;
  xMinhaIdade: Byte;
  xCasado: Boolean;
  xCotacaoDolar: Currency;

begin
  try
    xMeuNome      := 'Tiago';
    xMinhaIdade   := 33;
    xCasado       := True;
    xCotacaoDolar := 5.50;

    Writeln ('Meu nome �: ' + xMeuNome);
    Writeln ('Minha idade �: ' + IntToStr(xMinhaIdade));
    Writeln ('Sou casado: ' + BoolToStr(xCasado));
    Writeln ('Cota��o do D�lar: ' + FloatToStr(xCotacaoDolar));

    Readln(xEntrada);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
