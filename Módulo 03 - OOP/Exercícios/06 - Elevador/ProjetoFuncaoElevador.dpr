program ProjetoFuncaoElevador;
uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {FrmElevador},
  uElevador in 'uElevador.pas';

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmElevador, FrmElevador);
  Application.Run;
end.
