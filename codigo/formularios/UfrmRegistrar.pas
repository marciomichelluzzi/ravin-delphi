unit UfrmRegistrar;

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
  UfrmBotaoPrimario,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  System.Actions, Vcl.ActnList, FireDAC.Phys.MySQLWrapper, Vcl.ExtActns,
  Vcl.Mask;

type
  TfrmRegistrar = class(TForm)
    imgFundo: TImage;
    pnlRegistrar: TPanel;
    lblTituloRegistrar: TLabel;
    lblSubTituloRegistrar: TLabel;
    lblTituloAutenticar: TLabel;
    lblSubTituloAutenticar: TLabel;
    edtNome: TEdit;
    edtLogin: TEdit;
    edtSenha: TEdit;
    edtConfirmarSenha: TEdit;
    frmBotaoPrimario1: TfrmBotaoPrimario;
    medtCPF: TMaskEdit;
    procedure lblSubTituloAutenticarClick(Sender: TObject);
    procedure frmBotaoPrimario1spbBotaoPrimarioClick(Sender: TObject);
  private
    { Private declarations }
    procedure RegistrarUsuario();
    procedure ExibirFormLogin();
  public
    { Public declarations }
  end;

var
  frmRegistrar: TfrmRegistrar;

implementation

uses
  UusuarioDao,
  Uusuario, UfrmLogin, UvalidadorUsuario, UformsUtils;

{$R *.dfm}

procedure TfrmRegistrar.ExibirFormLogin;
begin
   TFormsUtils.ShowFormPrincipal(frmLogin, TfrmLogin);
   Close();
end;

procedure TfrmRegistrar.frmBotaoPrimario1spbBotaoPrimarioClick(Sender: TObject);
begin
  Self.RegistrarUsuario;
end;

procedure TfrmRegistrar.lblSubTituloAutenticarClick(Sender: TObject);
begin
  Self.ExibirFormLogin;
end;

procedure TfrmRegistrar.RegistrarUsuario;
var
  LUsuario: TUsuario;
  LDao: TUsuarioDAO;
begin
  try
    try
      LUsuario := TUsuario.Create();
      with LUsuario do
      begin
        login := edtLogin.Text;
        senha := edtSenha.Text;
        pessoaId := 1;
        criadoEm := Now();
        criadoPor := 'admin';
        alteradoEm := Now();
        alteradoPor := 'admin';
      end;

      TValidadorUsuario.Validar(LUsuario, edtConfirmarSenha.Text, medtCPF.Text);
      LDao := TUsuarioDAO.Create();
      LDao.InserirUsuario(LUsuario);

    if Assigned(LUsuario) then
    begin
      Self.ExibirFormLogin;
    end;
    except
      on E: EMySQLNativeException do
      begin
        ShowMessage('Erro ao inserir o usuario no banco');
      end;
      on E: Exception do
        ShowMessage(E.Message);
    end;
  finally
    if Assigned(LDao) then
    begin
      FreeAndNil(LDao);
    end;
    FreeAndNil(LUsuario);
  end;
end;

end.
