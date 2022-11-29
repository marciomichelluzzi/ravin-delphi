unit Unit2;

interface

uses
  Upessoa, FireDAC.Comp.Client;

type
  TPessoaDAO = class(TObject)

 private

  protected

  public
    procedure InserirPessoa(PPessoa : TPessoa);
    function BuscarIdPessoaMaisRecente(): Integer;
  end;

implementation

uses
  UdmRavin;

{ TPessoaDAO }

function TPessoaDAO.BuscarIdPessoaMaisRecente: Integer;
begin

end;

procedure TPessoaDAO.InserirPessoa(PPessoa: TPessoa);
var
  LQuery : TFDQuery;
begin
  LQuery := TFDQuery.Create(nil);
  with LQuery do
  begin
  Connection := dmRavin.cnxBancoDeDados;
  SQL.Add('INSERT INTO usuario ');
  SQL.Add(' (login, senha, pessoaId, criadoEm, criadoPor, alteradoEm, alteradoPor) ');
  SQL.add(' VALUES  (:login, :senha, :pessoaId, :criadoEm, :criadoPor, :alteradoEm, :alteradoPor)');

  ParamByName('login').AsString := PUsuario.login;
  ParamByName('senha').AsString := PUsuario.senha;
  ParamByName('pessoaId').AsInteger := PUsuario.pessoaId;
  ParamByName('criadoEm').AsDateTime := PUsuario.criadoEm;
  ParamByName('criadoPor').AsString := PUsuario.criadoPor;
  ParamByName('alteradoEm').AsDateTime := PUsuario.alteradoEm;
  ParamByName('alteradoPor').AsString := PUsuario.alteradoPor;
  ExecSQL();
  end;

  FreeAndNil(LQuery);
end;
end;

end.
