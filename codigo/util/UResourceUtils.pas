unit UResourceUtils;

interface

uses
  System.Classes,
  System.IOUtils,
  System.SysUtils,

  Vcl.Forms,
  Vcl.Dialogs;

type
  TResourcesUtils = class(TObject)
    class function CarregarResourcesTexto(PNomeArquivo: String;
      PNomeAplicacao: String): String;
  end;

implementation

class function TResourcesUtils.CarregarResourcesTexto(PNomeArquivo: String;
  PNomeAplicacao: String): String;
var
  LStringList: TStringList;
  LCaminhoArquivo: String;
begin
  Result := '';
  LStringList := TStringList.Create;
  try
    try
      LCaminhoArquivo := TPath.Combine(TPath.Combine(TPath.GetDocumentsPath,
        PNomeAplicacao), PNomeArquivo);
      LStringList.LoadFromFile(LCaminhoArquivo, TEncoding.UTF8);
      Result := LStringList.Text;
    finally
      LStringList.Free;
    end;
  except
    on E: Exception do begin
      ShowMessage(E.Message);
    end;
  end;
end;

end.
