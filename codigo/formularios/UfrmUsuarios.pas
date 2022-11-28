unit UfrmUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin,
  Vcl.Grids, Vcl.Samples.Calendar, Vcl.ComCtrls;

type
  TfrmUsuarios = class(TForm)
    memListaUsuarios: TMemo;
    btnCarregarUsuarios: TButton;
    TrackBar1: TTrackBar;
    Calendar1: TCalendar;
    SpinButton1: TSpinButton;
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
  UusuarioDao, System.Generics.Collections, Uusuario, Ucomanda,
  FireDAC.Comp.Client;

{$R *.dfm}

procedure TfrmUsuarios.btnCarregarUsuariosClick(Sender: TObject);
var
  LDao: TUsuarioDao;
  LUsuario: TUsuario;
  LLista: TList<TUsuario>;
  LListaComanda: TList<TComanda>;

  LListaQuery : TList;
  I: Integer;
begin

  LDao := TUsuarioDao.Create();
  LLista := LDao.BuscarTodosUsuarios();

  for I := 0 to LLista.Count - 1 do
  begin
    LUsuario := LLista.Items[I];
    memListaUsuarios.Lines.Add(LUsuario.login);
    FreeAndNil(LUsuario);
  end;

  LListaComanda := TList<TComanda>.Create();

//  LListaComanda.Add(LUsuario);

  // for I := 0 to LLista.Count - 1 do
  // begin
  // FreeAndNil(LLista[I]);
  // end;
  FreeAndNil(LDao);
  FreeAndNil(LLista);

end;

end.
