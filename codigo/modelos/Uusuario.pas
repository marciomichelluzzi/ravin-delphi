unit Uusuario;

interface


type
  TUsuario = class(TObject)
  private
    FId: Integer;
    FPessoaId: Integer;
    FLogin: String;
    FSenha: String;

  protected

  public
    property Id: Integer read FId write FId;
    property PessoaId: Integer read FPessoaId write FPessoaId;
    property Login: String read FLogin write FLogin;
    property Senha: String read FSenha write FSenha;
  end;

implementation

end.
