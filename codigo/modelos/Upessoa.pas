unit Upessoa;

interface

type TPessoa = class(TObject)
  private
    Fid: Integer;
    Fnome: String;
    Ftipopessoa: String;
    Fcpf  : String;
    Ftelefone: Integer;
    Fdatanascimento: TDate;
    FAtivo : Integer;
    FcriadoEm: TDateTime;
    FcriadoPor: String;
    FalteradoEm: TDateTime;
    FalteradoPor: String;

  protected

  public
   property id: Integer read Fid write Fid;
   property nome: String read Fnome write Fnome;
   property tipoPessoa: String read Ftipopessoa write Ftipopessoa;
   property cpf: String read Fcpf write Fcpf;
   property telefone: Integer read Ftelefone write Ftelefone;
   property dataNascimento: TDate read Fdatanascimento write Fdatanascimento;
   property ativo: Integer read Fativo write Fativo;
   property criadoEm: TDateTime read FcriadoEm write FcriadoEm;
   property criadoPor: String read FcriadoPor write FcriadoPor;
   property alteradoEm: TDateTime read FalteradoEm write FalteradoEm;
   property alteradoPor: String read FalteradoPor write FalteradoPor;
end;

implementation

end.
