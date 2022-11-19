unit UfrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.Buttons, Vcl.StdCtrls, UfrmBotaoPrimario;

type
  TfrmLogin = class(TForm)
    pnlAutenticacao: TPanel;
    imgLogo: TImage;
    edtLogin: TEdit;
    edtSenha: TEdit;
    lblTituloRegistrar: TLabel;
    lblTitulo: TLabel;
    lblSubTitulo: TLabel;
    lblSubTituloRegistras: TLabel;
    imgFundo: TImage;
    frmBotaoAutenticar1: TfrmBotaoAutenticar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

end.
