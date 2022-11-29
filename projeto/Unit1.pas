unit Unit1;

interface

type TPessoa = class(TObject)
  private
    Fid: Integer;
    Fnome: String;
    Ftipopessoa: String;
    FpessoaId: Integer;
    FcriadoEm: TDateTime;
    FcriadoPor: String;
    FalteradoEm: TDateTime;
    FalteradoPor: String;

  protected

  public
   property id: Integer read Fid write Fid;
   property nome: String read Fnome write Fnome;
   property tipoPessoa: String read Ftipopessoa write Ftipopessoa;
   property telefone: Integer read FpessoaId write FpessoaId;
   property criadoEm: TDateTime read FcriadoEm write FcriadoEm;
   property criadoPor: String read FcriadoPor write FcriadoPor;
   property alteradoEm: TDateTime read FalteradoEm write FalteradoEm;
   property alteradoPor: String read FalteradoPor write FalteradoPor;
end;

implementation

end.
