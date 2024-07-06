unit USubSystem_Historico;

interface

type
  TSubsystemHistorico = class
  public
    procedure RegistrarHistoricoDoCalculo(const aDolar, aPreco, aValorVenda: Real);
  end;

implementation

uses
  System.SysUtils;

{ TSubsystemHistorico }

procedure TSubsystemHistorico.RegistrarHistoricoDoCalculo(const aDolar, aPreco,
  aValorVenda: Real);
var
  xArquivo: TextFile;
  xPathArquivo: string;
  xDesconto: string;
begin
  // obt�m o caminho e nome do arquivo de hist�rico
  xPathArquivo := ExtractFilePath(ParamStr(0)) + 'Historico.txt';

  // associa a vari�vel "Arquivo" com o arquivo "Historico.txt"
  AssignFile(xArquivo, xPathArquivo);

  if FileExists(xPathArquivo) then
    // se o arquivo j� existe, coloca-o em modo de edi��o
    Append(xArquivo)
  else
    // caso contr�rio, cria o arquivo
    Rewrite(xArquivo);

  // escreve os dados no arquivo "Historico.txt"
  WriteLn(xArquivo, 'Data..............: ' + FormatDateTime('dd/mm/yyyy', Now));
  WriteLn(xArquivo, 'Cota��o do D�lar..: ' + FormatFloat('###,###,##0.00', aDolar));
  WriteLn(xArquivo, 'Convers�o em R$...: ' + FormatFloat('###,###,##0.00', aDolar * aPreco));
  WriteLn(xArquivo, 'Pre�o final.......: ' + FormatFloat('###,###,##0.00', aValorVenda));

  // fecha o arquivo
  CloseFile(xArquivo);
end;

end.
