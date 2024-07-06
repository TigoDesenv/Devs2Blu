unit UProduct;

interface

uses
  System.Classes;

type
  TProduct = class
    private
      //Objeto que armazenar� o conte�do HTML
      FConteudoHTML: TStringList;
    public
      constructor Create;
      destructor Destroy; override;

      //Concatena o conte�do HTML ao objeto "FConteudoHTML"
      procedure Adicionar(const aTexto: String);

      //Abre uma caixa de di�logo para salvar o arquivo HTML
      procedure SalvarArquivo;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ TProduct }

procedure TProduct.Adicionar(const aTexto: String);
begin
  FConteudoHTML.Add(aTexto);
end;

constructor TProduct.Create;
begin
  FConteudoHTML := TStringList.Create;
end;

destructor TProduct.Destroy;
begin
  FreeAndNil(FConteudoHTML);
  inherited;
end;

procedure TProduct.SalvarArquivo;
var
  xSaveDialog: TSaveDialog;
begin
  xSaveDialog := TSaveDialog.Create(nil);
  try
    xSaveDialog.Execute;
    FConteudoHTML.SaveToFile(xSaveDialog.FileName);
  finally
    FreeAndNil(xSaveDialog);
  end;
end;

end.
