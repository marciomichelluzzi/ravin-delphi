unit UfrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.Buttons, Vcl.StdCtrls, UfrmBotaoPrimario, System.Generics.Collections;

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
    frmBotaoPrimario1: TfrmBotaoPrimario;
    Memo1: TMemo;
    procedure frmBotaoPrimario1spbBotaoPrimarioClick(Sender: TObject);
    procedure lblTituloRegistrarClick(Sender: TObject);
    procedure Memo1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ExibirFormRegistrar();
    procedure ExibirFormPainelGestao();
    procedure LoginUsuario();
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  UfrmPainelGestao, UusuarioDao, Uusuario, UfrmRegistrar, UiniUtils, UformsUtils;

{$R *.dfm}

procedure TfrmLogin.ExibirFormPainelGestao;
begin
  TFormsUtils.ShowFormPrincipal(frmPainelGestao, TfrmPainelGestao);
  Close();
end;

procedure TfrmLogin.ExibirFormRegistrar;
begin
  TFormsUtils.ShowFormPrincipal(frmRegistrar, TfrmRegistrar);
  Close();
end;

procedure TfrmLogin.frmBotaoPrimario1spbBotaoPrimarioClick(Sender: TObject);
begin
  Self.LoginUsuario;
end;

procedure TfrmLogin.lblTituloRegistrarClick(Sender: TObject);
begin
  Self.ExibirFormRegistrar;
end;

procedure TfrmLogin.LoginUsuario;
var
  LDao: TUsuarioDAO;
  LUsuario: TUsuario;

  LLogin: String;
  LSenha: String;
begin
  LDao := TUsuarioDAO.Create;
  LLogin := edtLogin.Text;
  LSenha := edtSenha.Text;

try
  LUsuario := LDao.BuscarUsuarioPorLoginSenha(LLogin, LSenha);

  if Assigned(LUsuario) then
  begin
    TIniUtils.gravarPropriedade(TSECAO.INFORMACOES_GERAIS, TPROPRIEDADE.LOGADO,
      TIniUtils.VALOR_VERDADEIRO);
    TIniUtils.gravarPropriedade(TSECAO.INFORMACOES_GERAIS, TPROPRIEDADE.ULTIMO_ACESSO, DateToStr(Now()));
      Self.ExibirFormPainelGestao;
  end
  else
  begin
    FreeAndNil(LDao);
    ShowMessage('Login e/ou senha inválidos!');
  end;
finally
    FreeAndNil(LDao);
    FreeAndNil(LUsuario);
end;
end;

procedure TfrmLogin.Memo1Click(Sender: TObject);
 var
  LDao: TUsuarioDAO;
  LUsuario : TUsuario;
  LListaUsuarios : TList<TUsuario>;
  I: Integer;
begin
  LDao := TUsuarioDAO.Create;
  LListaUsuarios := LDao.BuscarTodosUsuarios;
  for I := 0 to LListaUsuarios.Count -1 do
  begin
    LUsuario := LListaUsuarios.Items[I];
    Memo1.Lines.Add(LUsuario.login);
    FreeAndNil(LUsuario);
  end;
    FreeAndNil(LDao);
    FreeAndNil(LListaUsuarios);
end;

end.
