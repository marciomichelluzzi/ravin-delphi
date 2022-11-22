unit UfrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
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
    btnTeste: TButton;
    frmBotaoPrimario1: TfrmBotaoPrimario;
    procedure btnTesteClick(Sender: TObject);
    procedure frmBotaoPrimario1spbBotaoPrimarioClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetarFormPrincipal(pNovoFormulario: TForm);
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  UfrmPainelGestao, UusuarioDao, Uusuario;

{$R *.dfm}

procedure TfrmLogin.btnTesteClick(Sender: TObject);
var
  LUsuario: TUsuario;
  LDao: TUsuarioDAO;
begin
  LUsuario := TUsuario.Create();
  with LUsuario do
  begin
    login := 'teste';
    senha := 'teste123';
    pessoaId := 1;
    criadoEm := Now();
    criadoPor := 'Victor';
    alteradoEm := Now();
    alteradoPor := 'Victor';

    LDao := TUsuarioDAO.Create();
    LDao.InserirUsuario(LUsuario);

    FreeAndNil(LDao);
    FreeAndNil(LUsuario);
  end;
end;



procedure TfrmLogin.frmBotaoPrimario1spbBotaoPrimarioClick(Sender: TObject);
var
  LDao: TUsuarioDAO;
  LUsuario: TUsuario;

  LLogin: String;
  LSenha: String;
begin

  LDao := TUsuarioDAO.Create;
  LLogin := edtLogin.Text;
  LSenha := edtSenha.Text;

  LUsuario := LDao.BuscarUsuarioPorLoginSenha(LLogin, LSenha);

  if Assigned(LUsuario) then
  begin
    if not Assigned(frmPainelGestao) then
    begin
      Application.CreateForm(TfrmPainelGestao, frmPainelGestao);
    end;

    SetarFormPrincipal(frmPainelGestao);
    frmPainelGestao.Show();

    FreeAndNil(LDao);
    FreeAndNil(LUsuario);

    Close();
  end
  else
  begin
    FreeAndNil(LDao);
    ShowMessage('Login e/ou senha inválidos!');
  end;

end;

procedure TfrmLogin.SetarFormPrincipal(pNovoFormulario: TForm);
var
  tmpMain: ^TCustomForm;
begin
  tmpMain := @Application.Mainform;
  tmpMain^ := pNovoFormulario;
end;

end.
