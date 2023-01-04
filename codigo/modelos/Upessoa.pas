unit Upessoa;

interface

type
  TPessoa = class
  private
    Fid: Integer;
    Fnome: String;
    FtipoPessoa: String;
    Fcpf: String;
    Ftelefone: Integer;
    Fativo: Boolean;
    FcriadoEm: TDateTime;
    FcriadoPor: String;
    FalteradoEm: TDateTime;
    FalteradoPor: String;
    FdataNascimento: TDate;

  protected

  public
    property id: Integer read Fid write Fid;
    property nome: String read Fnome write Fnome;
    property tipoPessoa: String read FtipoPessoa write FtipoPessoa;
    property dataNascimento: TDate read FdataNascimento write FdataNascimento;
    property cpf: String read Fcpf write Fcpf;
    property telefone: Integer read Ftelefone write Ftelefone;
    property ativo: Boolean read Fativo write Fativo;
    property criadoEm: TDateTime read FcriadoEm write FcriadoEm;
    property criadoPor: String read FcriadoPor write FcriadoPor;
    property alteradoEm: TDateTime read FalteradoEm write FalteradoEm;
    property alteradoPor: String read FalteradoPor write FalteradoPor;
  end;

implementation

end.
