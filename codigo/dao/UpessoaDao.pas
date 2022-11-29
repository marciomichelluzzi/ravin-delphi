unit UpessoaDao;

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
  UdmRavin, System.SysUtils;

{ TPessoaDAO }

function TPessoaDAO.BuscarIdPessoaMaisRecente: Integer;
var
  LQuery : TFDQuery;
  LId : Integer;
begin
  LQuery := TFDQuery.Create(nil);
  LQuery.Connection := dmRavin.cnxBancoDeDados;
  LQuery.SQL.Text := 'SELECT id FROM pessoa WHERE criadoEm = (select max(criadoEm) from pessoa)';
  LQuery.Open();

  if not LQuery.IsEmpty then
  begin
    Lid := LQuery.FieldByName('id').AsInteger;
  end;
  LQuery.Close();
  FreeAndNil(LQuery);
  Result := LId;
end;

procedure TPessoaDAO.InserirPessoa(PPessoa: TPessoa);
var
  LQuery : TFDQuery;
begin
  LQuery := TFDQuery.Create(nil);
  with LQuery do
  begin
  Connection := dmRavin.cnxBancoDeDados;
  SQL.Add('INSERT INTO pessoa ');
  SQL.Add(' (nome, tipoPessoa, cpf, telefone, dataNascimento, ativo, criadoEm, criadoPor, alteradoEm, alteradoPor) ');
  SQL.add(' VALUES  (:nome, :tipoPessoa, :cpf, :telefone, :dataNascimento, :ativo, :criadoEm, :criadoPor, :alteradoEm, :alteradoPor)');

  ParamByName('nome').AsString := PPessoa.nome;
  ParamByName('tipoPessoa').AsString := PPessoa.tipoPessoa;
  ParamByName('cpf').AsString := PPessoa.cpf;
  ParamByName('telefone').AsInteger := PPessoa.telefone;
  ParamByName('dataNascimento').AsDate := PPessoa.dataNascimento;
  ParamByName('ativo').AsInteger := PPessoa.ativo;
  ParamByName('criadoEm').AsDateTime := PPessoa.criadoEm;
  ParamByName('criadoPor').AsString := PPessoa.criadoPor;
  ParamByName('alteradoEm').AsDateTime := PPessoa.alteradoEm;
  ParamByName('alteradoPor').AsString := PPessoa.alteradoPor;
  ExecSQL();
  end;

  FreeAndNil(LQuery);
end;


end.
