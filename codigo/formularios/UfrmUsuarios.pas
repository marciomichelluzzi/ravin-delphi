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

end.
