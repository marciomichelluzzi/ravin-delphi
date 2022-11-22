unit UfrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TfrmLogin = class(TForm)
    pnlLogin: TPanel;
    imgLogo: TImage;
    lblTitulo: TLabel;
    lblTituloRegistrar: TLabel;
    lblSubTitulo: TLabel;
    lblSubtituloRegistrar: TLabel;
    edtLogin: TEdit;
    edtSenha: TEdit;
    btnLogar: TButton;
    Button1: TButton;
    procedure btnLogarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure SetarFormPrincipal(PNovoFormulario: TForm);
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses UfrmPainelGestao, UusuarioDao, Uusuario;

procedure TfrmLogin.btnLogarClick(Sender: TObject);
var
  LDao: TUsuarioDao;
  LUsuario: TUsuario;

  LLogin: String;
  LSenha: String;
begin

  LDao := TUsuarioDao.Create;

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

    Close();
  end
  else
  begin
    ShowMessage('Login e/ou senha inválidos');
  end;

  FreeAndNil(LDao);
  FreeAndNil(LUsuario);
end;

procedure TfrmLogin.Button1Click(Sender: TObject);
var
  LUsuario: TUsuario;
  LDao : TUsuarioDao;
begin
  LUsuario := TUsuario.Create();
  LUsuario.login := 'teste';
  LUsuario.senha := '123';
  LUsuario.pessoaId := 1;
  Lusuario.criadoEm := Now();
  LUsuario.criadoPor := 'marcio';
  LUsuario.alteradoEm := Now();
  Lusuario.alteradoPor := 'marcio';

  LDao := TUsuarioDao.create();
  LDao.InserirUsuario(LUsuario);

  
  FreeAndNil(LDao);
  FreeAndNil(LUsuario);
end;

procedure TfrmLogin.SetarFormPrincipal(PNovoFormulario: TForm);
var
  tmpMain: ^TCustomForm;
begin
  tmpMain := @Application.Mainform;
  tmpMain^ := PNovoFormulario;
end;

end.
