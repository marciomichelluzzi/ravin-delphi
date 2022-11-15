unit UusuarioDao;

interface

uses
  Uusuario,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.UI,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  System.Generics.Collections;

type
  TUsuarioDAO = class(TObject)
    procedure Salvar(PObjeto: TUsuario);
    function BuscarPorLoginSenha(PLogin: String; PSenha: String): TUsuario;
    function Buscar(PId: Integer): TUsuario;
    function BuscarTodos(): TList<TUsuario>;
    procedure Excluir(PId: Integer);
  end;

implementation

{ TUsuarioDAO<T> }

uses
  System.SysUtils,
  System.DateUtils,
  UdmRavin;

function TUsuarioDAO.Buscar(PId: Integer): TUsuario;
var
  LfdQuery: TFDQuery;
  Lusuario: TUsuario;
begin
  try
    LfdQuery := TFDQuery.Create(nil);
    LfdQuery.Connection := dmRavin.cnxBancoDeDados;
    LfdQuery.SQL.Text := 'SELECT * FROM usuario WHERE id = :id';
    LfdQuery.ParamByName('id').AsInteger := PId;
    LfdQuery.Open;

    Lusuario := nil;

    if not LfdQuery.IsEmpty then
    begin
      Lusuario := TUsuario.Create();
      Lusuario.Id := LfdQuery.FieldByName('id').AsInteger;
      Lusuario.PessoaId := LfdQuery.FieldByName('pessoaId').AsInteger;
      Lusuario.Login := LfdQuery.FieldByName('login').AsString;
      Lusuario.Senha := LfdQuery.FieldByName('senha').AsString;
    end;

    Result := Lusuario;
  finally
    LfdQuery.Free;
  end;
end;

function TUsuarioDAO.BuscarPorLoginSenha(PLogin, PSenha: String): TUsuario;
var
  LfdQuery: TFDQuery;
  Lusuario: TUsuario;
begin
  try
    LfdQuery := TFDQuery.Create(nil);
    LfdQuery.Connection := dmRavin.cnxBancoDeDados;
    LfdQuery.SQL.Text :=
      'SELECT * FROM usuario WHERE login = :login AND senha = :senha';
    LfdQuery.ParamByName('login').AsString := PLogin;
    LfdQuery.ParamByName('senha').AsString := PSenha;
    LfdQuery.Open;

    Lusuario := nil;

    if not LfdQuery.IsEmpty then
    begin
      Lusuario := TUsuario.Create();
      Lusuario.Id := LfdQuery.FieldByName('id').AsInteger;
      Lusuario.PessoaId := LfdQuery.FieldByName('pessoaId').AsInteger;
      Lusuario.Login := LfdQuery.FieldByName('login').AsString;
      Lusuario.Senha := LfdQuery.FieldByName('senha').AsString;
    end;

    Result := Lusuario;
  finally
    LfdQuery.Free;
  end;
end;

function TUsuarioDAO.BuscarTodos: TList<TUsuario>;
var
  LlistaUsuarios: TList<TUsuario>;
begin

end;

procedure TUsuarioDAO.Excluir(PId: Integer);
begin

end;

procedure TUsuarioDAO.Salvar(PObjeto: TUsuario);
var
  LfdQuery: TFDQuery;
begin
  try
    LfdQuery := TFDQuery.Create(nil);

    with LfdQuery do
    begin
      Connection := dmRavin.cnxBancoDeDados;
      SQL.Text := ' INSERT INTO usuario ' +
        ' (login, senha, criadoEm, criadoPor, alteradoEm, alteradoPor) ' +
        ' VALUES ' +
        ' (:login, :senha, :criadoEm, :criadoPor, :alteradoEm, :alteradoPor) ';
      ParamByName('login').AsString := PObjeto.Login;
      ParamByName('senha').AsString := PObjeto.Senha;
      ParamByName('criadoEm').AsDateTime := now;
      ParamByName('criadoPor').AsString := PObjeto.Login;
      ParamByName('alteradoEm').AsDateTime := now();
      ParamByName('alteradoPor').AsString := PObjeto.Login;
    end;

    LfdQuery.ExecSQL();
  finally
    LfdQuery.Free;
  end;
end;

end.
