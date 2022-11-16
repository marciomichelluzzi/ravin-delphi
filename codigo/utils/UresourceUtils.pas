unit UresourceUtils;

interface

type
  TResourceUtils = class(TObject)
  private

  protected

  public
   class function carregarArquivoResource(PNomeArquivo: String;
      PNomeAplicacao: String): String; //metodo estatico
  end;

implementation

uses
  System.IOUtils, System.Classes, System.SysUtils;

{ TResourceUtils }

class function TResourceUtils.carregarArquivoResource(PNomeArquivo,
  PNomeAplicacao: String): String;
var
  LConteudoArquivo: TStringList;
  LCaminhoPastaAplicacao: String;
  LCaminhoArquivo: String;
  LConteudoTexto : String;
begin
  LConteudoArquivo := TStringList.Create();
  LConteudoTexto := '';
  try
    try
      LCaminhoPastaAplicacao := TPath.Combine(TPath.GetDocumentsPath, PNomeAplicacao);
      LCaminhoArquivo := TPath.Combine(LCaminhoPastaAplicacao, PNomeArquivo);

      LConteudoArquivo.LoadFromFile(LCaminhoArquivo); 
      LConteudoTexto := LConteudoArquivo.Text;
    except
      on E: Exception do
        raise Exception.Create('Erro ao carregar os arquivos de resource.' + 'Arquivos: '+ PNomeArquivo);
    end;

  finally
    LConteudoArquivo.Free;
  end;

   Result := LConteudoTexto;
end;

end.
