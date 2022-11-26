unit UiniUtils;

interface

uses
  System.IOUtils,

  Vcl.Forms,

  TypInfo,
  IniFiles;

type
  TSECAO = (CONFIGURACOES, INFORMACOES_GERAIS, CONFIGURACOES_DATABASE);

type
  TPROPRIEDADE = (NOME_DATABASE, SERVER, USER_NAME, PASSWORD, DRIVERID, PORT, LOGADO);

type
  TIniUtils = class
  private

  protected

  public
    constructor Create();
    destructor Destroy; override;

    class procedure gravarPropriedade(PSecao: TSECAO;
      PPropriedade: TPROPRIEDADE; PValor: String);
    class function lerPropriedade(PSecao: TSECAO;
      PPropriedade: TPROPRIEDADE): String;

    const VALOR_VERDADEIRO : String = 'true';
    const VALOR_FALSO      : String = 'false';
//    const VALOR_DATABASE   : String = 'ravin';
//    const VALOR_SERVER     : String = 'localhost';
//    const VALOR_USER_NAME  : String = 'root';
//    const VALOR_PASSWORD   : String = 'root';
//    const VALOR_DRIVER_ID  : String = 'MySQL';
//    const VALOR_PORT       : String = '3306';
  end;

implementation

{ TIniUltis }

constructor TIniUtils.Create;
begin
  inherited;

end;

destructor TIniUtils.Destroy;
begin

  inherited;
end;

class procedure TIniUtils.gravarPropriedade(PSecao: TSECAO;
  PPropriedade: TPROPRIEDADE; PValor: String);
var
  LcaminhoArquivoIni: String;
  LarquivoINI: TIniFile;
  LNomeSecao: String;
  LNomePropriedade: String;
begin
  LcaminhoArquivoIni := TPath.Combine(TPath.Combine(TPath.GetDocumentsPath,
    'ravin_sources'), 'configuracoes.ini');
  LarquivoINI := TIniFile.Create(LcaminhoArquivoIni);

  LNomeSecao := GetEnumName(TypeInfo(TSECAO), Integer(PSecao));
  LNomePropriedade := GetEnumName(TypeInfo(TPROPRIEDADE),Integer(PPropriedade));

  LarquivoINI.WriteString(LNomeSecao, LNomePropriedade, PValor);
  LarquivoINI.Free;
end;

class function TIniUtils.lerPropriedade(PSecao: TSECAO;
  PPropriedade: TPROPRIEDADE): String;
var
  LcaminhoArquivoIni: String;
  LarquivoINI: TIniFile;
  LNomeSecao: String;
  LNomePropriedade: String;
begin
  LcaminhoArquivoIni := TPath.Combine(TPath.Combine(TPath.GetDocumentsPath,
    'ravin_sources'), 'configuracoes.ini');

  LNomeSecao := GetEnumName(TypeInfo(TSECAO), Integer(PSecao));
  LNomePropriedade := GetEnumName(TypeInfo(TPROPRIEDADE),Integer(PPropriedade));

  LarquivoINI := TIniFile.Create(LcaminhoArquivoIni);
  Result := LarquivoINI.ReadString(LNomeSecao, LNomePropriedade, '');
  LarquivoINI.Free;
end;

end.
