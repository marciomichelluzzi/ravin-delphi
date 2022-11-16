unit UresourceUtils;

interface

type
  TResourceUtils = class(TObject)
  private

  protected

  public
    function carregarArquivoResource(PNomeArquivo: String;
      PNomeAplicacao: String): String;
  end;

implementation

uses
  System.IOUtils, System.Classes, System.SysUtils;

{ TResourceUtils }

function TResourceUtils.carregarArquivoResource(PNomeArquivo,
  PNomeAplicacao: String): String;
var
  LConteudoArquivo: TStringList;
  LCaminhoPastaAplicacao: String;
  LCaminhoArquivo: String;
begin
  try
    try
      LCaminhoPastaAplicacao := TPath.Combine(TPath.GetDocumentsPath, PNomeAplicacao);
      LCaminhoArquivo := TPath.Combine(LCaminhoPastaAplicacao, PNomeArquivo);

      LConteudoArquivo := TStringList.Create();
      LConteudoArquivo.LoadFromFile(LCaminhoArquivo); 
      Result := LConteudoArquivo.Text;
    except
      on E: Exception do
        raise Exception.Create('Erro ao carregar os arquivos de resource.' + 'Arquivos: '+ PNomeArquivo);
    end;

  finally
    LConteudoArquivo.Free
  end;

   Result := '';
end;

end.
