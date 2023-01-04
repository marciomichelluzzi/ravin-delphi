unit UpessoaDao;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  FireDAC.Comp.Client,
  Upessoa;

type
  TPessoaDAO = class

  private

  protected

  public

    function CarregarListaClientes(): TList<TPessoa>;
    function CarregarClientePorId(PClienteId: Integer): TPessoa;
    procedure DeletarClientePorCPF(PClienteCpf: String);

  end;

implementation

{ TPessoaDAO }

uses UdmRavin;

function TPessoaDAO.CarregarClientePorId(PClienteId: Integer): TPessoa;
var
  LQuery: TFDQuery;
  LPessoa: TPessoa;
begin
  LQuery := TFDQuery.Create(nil);
  LQuery.Connection := dmRavin.cnxBancoDeDados;
  LQuery.SQL.Text := ' SELECT * FROM pessoa ' +
    ' WHERE tipoPessoa = ''C'' and id = :ID ';
  LQuery.ParamByName('ID').AsInteger := PClienteId;
  LQuery.Open();

  LPessoa := TPessoa.Create();

  with LPessoa do
  begin
    Id := LQuery.FieldByName('id').AsInteger;
    Nome := LQuery.FieldByName('nome').AsString;
    TipoPessoa := LQuery.FieldByName('tipoPessoa').AsString;
    DataNascimento := LQuery.FieldByName('dataNascimento').AsDateTime;
    Cpf := LQuery.FieldByName('cpf').AsString;
    Telefone := LQuery.FieldByName('telefone').AsInteger;
    Ativo := LQuery.FieldByName('ativo').AsBoolean;
    criadoEm := LQuery.FieldByName('criadoEm').AsDateTime;
    criadoPor := LQuery.FieldByName('criadoPor').AsString;
    alteradoEm := LQuery.FieldByName('alteradoEm').AsDateTime;
    alteradoPor := LQuery.FieldByName('alteradoPor').AsString;
  end;

  LQuery.Close();
  FreeAndNil(LQuery);
  Result := LPessoa;
end;

function TPessoaDAO.CarregarListaClientes(): TList<TPessoa>;
var
  LQuery: TFDQuery;
  LPessoa: TPessoa;
  LLista: TList<TPessoa>;
begin
  LQuery := TFDQuery.Create(nil);
  LQuery.Connection := dmRavin.cnxBancoDeDados;
  LQuery.SQL.Text := 'SELECT * FROM pessoa WHERE tipoPessoa = ''C''';
  LQuery.Open();

  LLista := TList<TPessoa>.Create();

  LQuery.First;

  while not LQuery.Eof do
  begin
    LPessoa := TPessoa.Create();

    with LPessoa do
    begin
      Id := LQuery.FieldByName('id').AsInteger;
      Nome := LQuery.FieldByName('nome').AsString;
      TipoPessoa := LQuery.FieldByName('tipoPessoa').AsString;
      DataNascimento := LQuery.FieldByName('dataNascimento').AsDateTime;
      Cpf := LQuery.FieldByName('cpf').AsString;
      Telefone := LQuery.FieldByName('telefone').AsInteger;
      Ativo := LQuery.FieldByName('ativo').AsBoolean;
      criadoEm := LQuery.FieldByName('criadoEm').AsDateTime;
      criadoPor := LQuery.FieldByName('criadoPor').AsString;
      alteradoEm := LQuery.FieldByName('alteradoEm').AsDateTime;
      alteradoPor := LQuery.FieldByName('alteradoPor').AsString;
    end;

    LLista.add(LPessoa);
    LQuery.Next;
  end;

  Result := LLista;

  FreeAndNil(LQuery);
end;

procedure TPessoaDAO.DeletarClientePorCPF(PClienteCpf: String);
var
  LQuery: TFDQuery;
begin
  LQuery := TFDQuery.Create(nil);
  LQuery.Connection := dmRavin.cnxBancoDeDados;
  LQuery.SQL.Text := 'DELETE FROM pessoa where id = :CPF';
  LQuery.ParamByName('CPF').AsString := PClienteCpf;
  LQuery.ExecSQL();

  FreeAndNil(LQuery);
end;

end.
