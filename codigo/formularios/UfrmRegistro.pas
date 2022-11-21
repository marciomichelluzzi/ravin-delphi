unit UfrmRegistro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, UfrmBotaoPrimario;

type
  TUfrmRegistrar = class(TForm)
    pnlRegistrar: TPanel;
    lblTituloRegistrar: TLabel;
    lblSubtituloRegistrar: TLabel;
    edtNome: TEdit;
    edtCpf: TEdit;
    edtLogin: TEdit;
    edtSenha: TEdit;
    edtConfirmarSenha: TEdit;
    lblSubtituloAutenticar: TLabel;
    lblTituloAutenticar: TLabel;
    frmBotaoAutenticar1: TfrmBotaoAutenticar;
    imgPlanoFundo: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UfrmRegistrar: TUfrmRegistrar;

implementation

{$R *.dfm}

end.
