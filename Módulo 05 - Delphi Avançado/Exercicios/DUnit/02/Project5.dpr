program Project5;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {Form6},
  UCompra in 'UCompra.pas',
  TestUCompra in 'TestUCompra.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  AApplication.CreateForm(TForm6, Form6);
  pplication.Run;
end.
