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
  System.Actions, Vcl.ActnList, FireDAC.Phys.MySQLWrapper, Vcl.ExtActns;

type
  TfrmRegistrar = class(TForm)
    imgFundo: TImage;
    pnlRegistrar: TPanel;
    lblTituloRegistrar: TLabel;
    lblSubTituloRegistrar: TLabel;
    lblTituloAutenticar: TLabel;
    lblSubTituloAutenticar: TLabel;
    edtNome: TEdit;
    edtCpf: TEdit;
    edtLogin: TEdit;
    edtSenha: TEdit;
    edtConfirmarSenha: TEdit;
    frmBotaoPrimario1: TfrmBotaoPrimario;
    procedure lblSubTituloAutenticarClick(Sender: TObject);
    procedure frmBotaoPrimario1spbBotaoPrimarioClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetMainForm(NovoMainForm: TForm);
  public
    { Public declarations }
  end;

var
  frmRegistrar: TfrmRegistrar;

implementation

uses
  UusuarioDao,
  Uusuario, UfrmLogin, UvalidadorUsuario;

{$R *.dfm}

procedure TfrmRegistrar.frmBotaoPrimario1spbBotaoPrimarioClick(Sender: TObject);
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

      TValidadorUsuario.Validar(LUsuario, edtConfirmarSenha.Text);
      LDao := TUsuarioDAO.Create();
      LDao.InserirUsuario(LUsuario);

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

procedure TfrmRegistrar.lblSubTituloAutenticarClick(Sender: TObject);
begin
  if not Assigned(frmLogin) then
  begin
    Application.CreateForm(TfrmLogin, frmLogin);
  end;

  SetMainForm(frmLogin);
  frmLogin.Show();

  Close();
end;

procedure TfrmRegistrar.SetMainForm(NovoMainForm: TForm);
var
  tmpMain: ^TCustomForm;
begin
  tmpMain := @Application.Mainform;
  tmpMain^ := NovoMainForm;
end;

end.
