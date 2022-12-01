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
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmUsuarios = class(TForm)
    btnCarregarUsuarios: TButton;
    ListView1: TListView;
    ListBox1: TListBox;
    Memo1: TMemo;
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
  ListBox1.Items.Add('aihsa');
  Memo1.Lines.Add('sdkjfskdbdsf');
  Memo1.Lines[1];
  ListBox1.Items[1];

//  now();

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
