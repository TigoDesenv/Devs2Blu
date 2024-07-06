unit uFrmPrincipal;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uElevador, Vcl.ExtCtrls;
type
  TEnumElevadorSD = (Subir, Descer);
  TEnumPessoaES = (Entrar, Sair);
  TFrmElevador = class(TForm)
    edtTotalAndares: TEdit;
    edtCapacidadeElev: TEdit;
    edtQTDPessoas: TEdit;
    edtMovAndar: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    mmHistórico: TMemo;
    rdgFuncElevadorSD: TRadioGroup;
    btnMovimetaElevador: TButton;
    rdgFuncPessoasES: TRadioGroup;
    btnMovePessoas: TButton;
    pFundo: TPanel;
    pInicial: TPanel;
    Label6: TLabel;
    Button1: TButton;
    Label7: TLabel;
    Label8: TLabel;
    edtIniTotalAndares: TEdit;
    edtIniCapacidadeElev: TEdit;
    function FuncoesdoElevador: String;
    function FuncoesPessoasDoElevador: String;
    procedure FormCreate(Sender: TObject);
    procedure btnMovimetaElevadorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCapacidadeElevExit(Sender: TObject);
    procedure btnMovePessoasClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FPesso_elevador : TElevador;
    MovimentosCaixa  : TStringlist;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmElevador: TFrmElevador;

implementation
{$R *.dfm}
procedure TFrmElevador.btnMovePessoasClick(Sender: TObject);
begin
  FuncoesPessoasDoElevador;
end;

procedure TFrmElevador.btnMovimetaElevadorClick(Sender: TObject);
begin
  FuncoesdoElevador;
end;
procedure TFrmElevador.Button1Click(Sender: TObject);
begin
  if (StrToIntDef(edtIniTotalAndares.Text, 0) <= 0) or (StrToIntDef(edtIniCapacidadeElev.Text, 0) <= 0) then
    ShowMessage('Valores inválidos Verifique !!!')
  else
  begin
    edtTotalAndares.Text := edtIniTotalAndares.Text;
    edtCapacidadeElev.Text := edtIniCapacidadeElev.Text;
    pInicial.Visible := False;
    pFundo.Enabled := True;
  end;
end;

procedure TFrmElevador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FPesso_elevador);
end;

procedure TFrmElevador.edtCapacidadeElevExit(Sender: TObject);
begin
  FPesso_elevador.CapacidadeCarga := StrToIntDef(edtCapacidadeElev.Text, 0);
end;

procedure TFrmElevador.FormCreate(Sender: TObject);
begin
  FPesso_elevador := TElevador.Create(StrToIntDef(edtTotalAndares.Text, 0), StrToIntDef(edtCapacidadeElev.Text, 0));
end;

function TFrmElevador.FuncoesdoElevador: String;
begin
  Result := '';
  FPesso_elevador.QTDAndares := StrToInt(edtTotalAndares.Text);
  FPesso_elevador.CapacidadeCarga := StrToInt(edtCapacidadeElev.Text);
  Try
    case TEnumElevadorSD(rdgFuncElevadorSD.ItemIndex) of
      Subir:
      begin
        Result := FPesso_elevador.Subir(StrToIntDef(edtMovAndar.Text, 0)+ 1);
        if Result = '' then
        begin
//          ShowMessage('Subindo... Subindo... Subindo');
        end;
      end;
      Descer:
      begin
        Result := FPesso_elevador.Descer(StrToIntDef(edtMovAndar.Text, 0)- 1);
        if Result = '' then
        begin
//          ShowMessage('Descendo... Descendo... Descendo');
        end;
      end;
    end;
  Except
     raise Exception.Create('Error!!! Arrume e tente de novo');
  End;
  if Result = '' then
  begin
    edtMovAndar.Text := IntToStr(FPesso_elevador.Andar);
    if StrToIntDef(edtQTDPessoas.Text, 0) <= 0 then
      mmHistórico.Lines.Add('Estamos no ' + edtMovAndar.Text + 'º Andar.')
    else
      mmHistórico.Lines.Add('Estamos no ' + edtMovAndar.Text + 'º Andar. Com lotação de '+ edtQTDPessoas.Text + ' pessoa(s).');
  end
  else
    ShowMessage(Result);
end;
function TFrmElevador.FuncoesPessoasDoElevador: String;
begin
  Result := '';
  FPesso_elevador.QTDAndares := StrToInt(edtTotalAndares.Text);
  FPesso_elevador.CapacidadeCarga := StrToInt(edtCapacidadeElev.Text);
  Try
    case TEnumPessoaES(rdgFuncPessoasES.ItemIndex) of
      Entrar:
      begin
        Result := FPesso_elevador.Entrar(StrToIntDef(edtQTDPessoas.Text, 0)+ 1);
        if Result = '' then
        begin
//          ShowMessage('Entrando + 1...');
        end;
      end;
      Sair:
      begin
        Result := FPesso_elevador.Sair(StrToIntDef(edtQTDPessoas.Text, 0)- 1);
        if Result = '' then
        begin
//          ShowMessage('Saindo + 1...');
        end;
      end;
    end;
  Except
     raise Exception.Create('Error!!! arrume e tente de novo');
  End;
  if Result = '' then
  begin
    edtQTDPessoas.Text := IntToStr(FPesso_elevador.QTDPessoas);
    mmHistórico.Lines.Add('Estamos Com ' + edtQTDPessoas.Text + ' Pessoa(s) dentro do Elevador.');
  end
  else
    ShowMessage(Result);
end;

{4. Crie uma classe denominada Elevador para armazenar as informações
de um elevador dentro de um prédio.
A classe deve armazenar o andar atual (térreo = 0), total de
andares no prédio (desconsiderando o térreo), capacidade do
elevador e quantas pessoas estão presentes nele.
A classe deve também disponibilizar os seguintes métodos:
   a.	Inicializa: que deve receber como parâmetros a capacidade
   do elevador e o total de andares no prédio
   (os elevadores sempre começam no térreo e vazio - usar o constructor);
   b.	Entra: para acrescentar uma pessoa no elevador
   (só deve acrescentar se ainda houver espaço);
   c.	Sai: para remover uma pessoa do elevador
   (só deve remover se houver alguém dentro dele);
   d.	Sobe: para subir um andar
   (não deve subir se já estiver no último andar);
   e.	Desce: para descer um andar
   (não deve descer se já estiver no térreo); }
end.


