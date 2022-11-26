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
    procedure SetarFormPrincipal(pNovoFormulario: TForm);
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  UfrmPainelGestao, UusuarioDao, Uusuario, UfrmRegistrar, UiniUtils;

{$R *.dfm}

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
    TIniUtils.gravarPropriedade(TSECAO.INFORMACOES_GERAIS, TPROPRIEDADE.LOGADO,
      TIniUtils.VALOR_VERDADEIRO);
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

procedure TfrmLogin.lblTituloRegistrarClick(Sender: TObject);
begin
  if not Assigned(frmRegistrar) then
  begin
    Application.CreateForm(TfrmRegistrar, frmRegistrar);
  end;

  SetarFormPrincipal(frmRegistrar);
  frmRegistrar.Show();

  Close();
end;

procedure TfrmLogin.Memo1Click(Sender: TObject);
 var
  LDao: TUsuarioDAO;
  LUsuario : TUsuario;
  LListaUsuarios : TList<TUsuario>;
  I: Integer;
begin
  LDao := TUsuarioDAO.Create;
  LListaUsuarios := TList<TUsuario>.Create;
  LListaUsuarios := LDao.BuscarTodosUsuarios;
  for I := 0 to LListaUsuarios.Count -1 do
  begin
    LUsuario := LListaUsuarios.Items[I];
    Memo1.Lines.Add(LUsuario.login);
    FreeAndNil(LUsuario);
  end;

    FreeAndNil(LListaUsuarios);
    FreeAndNil(LDao);
end;

procedure TfrmLogin.SetarFormPrincipal(pNovoFormulario: TForm);
var
  tmpMain: ^TCustomForm;
begin
  tmpMain := @Application.Mainform;
  tmpMain^ := pNovoFormulario;
end;

end.
