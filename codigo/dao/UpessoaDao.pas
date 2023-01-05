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

    procedure Inserir(PPessoa: TPessoa);
    procedure Atualizar(PPessoa: TPessoa);

  protected

  public

    function CarregarListaClientes(): TList<TPessoa>;
    function CarregarClientePorId(PClienteId: Integer): TPessoa;
    procedure DeletarClientePorCPF(PClienteCpf: String);
    procedure SalvarCliente(PCliente: TPessoa);

  end;

implementation

{ TPessoaDAO }

uses UdmRavin;

procedure TPessoaDAO.Atualizar(PPessoa: TPessoa);
var
  LQuery: TFDQuery;
begin
  try
    LQuery := TFDQuery.Create(nil);
    LQuery.Connection := dmRavin.cnxBancoDeDados;
    LQuery.SQL.Text := 'UPDATE pessoa SET ' +
      ' nome = :NOME, cpf = :CPF, dataNascimento = :DATANASCIMENTO, telefone = :TELEFONE, '
      + ' tipoPessoa = :TIPOPESSOA, ativo = :ATIVO, criadoEm = :CRIADOEM, ' +
      ' criadoPor = :CRIADOPOR, alteradoEm = :ALTERADOEM, alteradoPor = :ALTERADOPOR '
      + ' WHERE id = :ID';
    LQuery.ParamByName('NOME').AsString := PPessoa.Nome;
    LQuery.ParamByName('CPF').AsString := PPessoa.Cpf;
    LQuery.ParamByName('DATANASCIMENTO').AsDate := PPessoa.DataNascimento;
    LQuery.ParamByName('TELEFONE').AsInteger := PPessoa.Telefone;
    LQuery.ParamByName('TIPOPESSOA').AsString := PPessoa.TipoPessoa;
    LQuery.ParamByName('ATIVO').AsBoolean := PPessoa.Ativo;
    LQuery.ParamByName('CRIADOEM').AsDateTime := PPessoa.criadoEm;
    LQuery.ParamByName('CRIADOPOR').AsString := PPessoa.criadoPor;
    LQuery.ParamByName('ALTERADOEM').AsDateTime := PPessoa.alteradoEm;
    LQuery.ParamByName('ALTERADOPOR').AsString := PPessoa.alteradoPor;

    LQuery.ParamByName('ID').AsInteger := PPessoa.Id;
    LQuery.ExecSQL();
  finally
    FreeAndNil(LQuery);
  end;

end;

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

procedure TPessoaDAO.Inserir(PPessoa: TPessoa);
var
  LQuery: TFDQuery;
begin
  LQuery := TFDQuery.Create(nil);
  LQuery.Connection := dmRavin.cnxBancoDeDados;
  LQuery.SQL.Text := 'INSERT INTO pessoa ' +
    '(nome, cpf, dataNascimento, telefone, tipoPessoa, ativo, criadoEm, criadoPor, alteradoEm, alteradoPor) '
    + ' VALUES (:NOME, :CPF, :DATANASCIMENTO, :TELEFONE, :TIPOPESSOA, :ATIVO, :CRIADOEM, :CRIADOPOR, :ALTERADOEM, :ALTERADOPOR)';
  LQuery.ParamByName('NOME').AsString := PPessoa.Nome;
  LQuery.ParamByName('CPF').AsString := PPessoa.Cpf;
  LQuery.ParamByName('DATANASCIMENTO').AsDate := PPessoa.DataNascimento;
  LQuery.ParamByName('TELEFONE').AsInteger := PPessoa.Telefone;
  LQuery.ParamByName('TIPOPESSOA').AsString := PPessoa.TipoPessoa;
  LQuery.ParamByName('ATIVO').AsBoolean := PPessoa.Ativo;
  LQuery.ParamByName('CRIADOEM').AsDateTime := PPessoa.criadoEm;
  LQuery.ParamByName('CRIADOPOR').AsString := PPessoa.criadoPor;
  LQuery.ParamByName('ALTERADOEM').AsDateTime := PPessoa.alteradoEm;
  LQuery.ParamByName('ALTERADOPOR').AsString := PPessoa.alteradoPor;
  LQuery.ExecSQL();

  FreeAndNil(LQuery);
end;

procedure TPessoaDAO.SalvarCliente(PCliente: TPessoa);
begin
  if PCliente.Id = 0 then
    Inserir(PCliente)
  else
    Atualizar(PCliente);
end;

end.
