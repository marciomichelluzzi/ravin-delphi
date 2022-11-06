unit UfrmSobre;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,

  UfrmLogomarca;

type
  TfrmSobre = class(TForm)
    lblTitulo: TLabel;
    lblSubTitulo: TLabel;
    lblAlunos: TLabel;
    frmLogo: TfrmLogo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

{$R *.dfm}

end.
