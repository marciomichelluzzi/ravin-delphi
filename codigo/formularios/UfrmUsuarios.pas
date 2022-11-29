unit UfrmUsuarios;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.DateUtils,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TfrmUsuarios = class(TForm)
    memListaUsuarios: TMemo;
    btnCarregarUsuarios: TButton;
    procedure btnCarregarUsuariosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

uses
  UusuarioDao, System.Generics.Collections, Uusuario, Ucomanda;

{$R *.dfm}

procedure TfrmUsuarios.btnCarregarUsuariosClick(Sender: TObject);
var
  LDao: TUsuarioDao;
  LUsuario: TUsuario;
  LLista: TList<TUsuario>;
  LListaComanda: TList<TComanda>;
  I: Integer;
begin

  now();

//  LDao := TUsuarioDao.Create();
//  LLista := LDao.BuscarTodosUsuarios();
//
//  for I := 0 to LLista.Count - 1 do
//  begin
//    LUsuario := LLista.Items[I];
//    memListaUsuarios.Lines.Add(LUsuario.login);
//    FreeAndNil(LUsuario);
//  end;
//
//  FreeAndNil(LLista);
end;

end.
