unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UContext;

type
  TfrmPrincipal = class(TForm)
    edtEmail: TEdit;
    Label1: TLabel;
    cmbAlgoritmo: TComboBox;
    Label2: TLabel;
    btnValidar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnValidarClick(Sender: TObject);
  private
    { Private declarations }
    FContext: UContext.TContext;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnValidarClick(Sender: TObject);
var
  xTipoValidacao: TTipoValidacao;
  xEmailValido: boolean;
begin
  // Preenche o tipo de valida��o conforme sele��o no ComboBox
  case cmbAlgoritmo.ItemIndex of
    0: xTipoValidacao := avDLL;
    1: xTipoValidacao := avRegExLib;
    2: xTipoValidacao := avMailBoxLayer;
  end;

  // Chama o m�todo do Context que, por sua vez, encaminha ao Concrete Strategy
  // Obs: "EditEmail" � um campo de texto para informar o e-mail a ser validado
  xEmailValido := FContext.ValidarEmail(xTipoValidacao, edtEmail.Text);

  // Apresenta o resultado na tela
  if xEmailValido then
    ShowMessage('O endere�o de e-mail � v�lido!')
  else
    ShowMessage('O endere�o de e-mail est� incorreto.');
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FContext.Free;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FContext := UContext.TContext.Create;
end;

end.
