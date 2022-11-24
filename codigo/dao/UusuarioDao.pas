unit UusuarioDao;

interface

uses
  System.SysUtils,
  Uusuario,
  FireDAC.Comp.Client, System.Generics.Collections;

type
  TUsuarioDAO = class
  private

  protected

  public
    function BuscarUsuarioPorLoginSenha(PLogin: String; PSenha: String)
      : TUsuario;
    function BuscarTodosUsuarios(): TList<TUsuario>;
    procedure InserirUsuario(PUsuario: TUsuario);
  end;

implementation

{ TUsuarioDAO }

uses UdmRavin;

function TUsuarioDAO.BuscarTodosUsuarios: TList<TUsuario>;
var
  LLista: TList<TUsuario>;

  LU1, LU2, LU3: TUsuario;
  I: Integer;
  LusuarioTemp: TUsuario;
begin

  LU1 := TUsuario.Create();
  LU1.id := 1;
  LU1.login := 'Marcio';
  LU1.senha := '123';

  LU2 := TUsuario.Create();
  LU2.id := 2;
  LU2.login := 'Pedro';
  LU2.senha := '222';

  LU3 := TUsuario.Create();
  LU3.id := 3;
  LU3.login := 'Joana';
  LU3.senha := '456';

  LLista := TList<TUsuario>.Create();

  LLista.Add(LU1);
  LLista.Add(LU2);
  LLista.Add(LU3);

  LLista.Remove(LU1);
  LLista.Contains(LU3);
  LLista.IndexOf(LU2);
  LLista.Items[2] := LU2;

  for I := 0 to LLista.Count - 1 do
  begin
    LusuarioTemp := LLista.Items[I];
    LusuarioTemp.login := '';
  end;



end;

function TUsuarioDAO.BuscarUsuarioPorLoginSenha(PLogin, PSenha: String)
  : TUsuario;
var
  LQuery: TFDQuery;
  LUsuario: TUsuario;
begin
  LQuery := TFDQuery.Create(nil);
  LQuery.Connection := dmRavin.cnxBancoDeDados;
  LQuery.SQL.Text := ' SELECT * FROM usuario ' +
    ' WHERE login = :login AND senha = :senha ';
  LQuery.ParamByName('login').AsString := PLogin;
  LQuery.ParamByName('senha').AsString := PSenha;
  LQuery.Open();

  LUsuario := nil;

  if not LQuery.IsEmpty then
  begin
    LUsuario := TUsuario.Create();
    LUsuario.id := LQuery.FieldByName('id').AsInteger;
    LUsuario.login := LQuery.FieldByName('login').AsString;
    LUsuario.senha := LQuery.FieldByName('senha').AsString;
    LUsuario.pessoaId := LQuery.FieldByName('pessoaId').AsInteger;
    LUsuario.criadoEm := LQuery.FieldByName('criadoEm').AsDateTime;
    LUsuario.criadoPor := LQuery.FieldByName('criadoPor').AsString;
    LUsuario.alteradoEm := LQuery.FieldByName('alteradoEm').AsDateTime;
    LUsuario.alteradoPor := LQuery.FieldByName('alteradoPor').AsString;
  end;

  LQuery.Close();
  FreeAndNil(LQuery);
  Result := LUsuario;
end;

procedure TUsuarioDAO.InserirUsuario(PUsuario: TUsuario);
var
  LQuery: TFDQuery;
begin
  LQuery := TFDQuery.Create(nil);
  with LQuery do
  begin
    Connection := dmRavin.cnxBancoDeDados;
    SQL.Add(' INSERT INTO usuario ');
    SQL.Add(' (login, senha, pessoaId, criadoEm, ');
    SQL.Add(' criadoPor, alteradoEm, alteradoPor) ');
    SQL.Add(' VALUES (:login, :senha, :pessoaId, ');
    SQL.Add(' :criadoEm, :criadoPor, :alteradoEm, :alteradoPor)');

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

end.
