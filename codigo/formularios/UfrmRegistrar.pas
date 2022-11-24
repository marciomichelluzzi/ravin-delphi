unit UfrmRegistrar;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,

  FireDAC.Phys.MySQLWrapper,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  UfrmBotaoPrimario,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  UfrmAutenticar, System.Actions, Vcl.ActnList, Vcl.ExtActns;

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
    frmBotaoPrimarioRegistrar: TfrmBotaoPrimario;
    edtLogin: TEdit;
    edtSenha: TEdit;
    edtConfirmarSenha: TEdit;
    procedure lblSubTituloAutenticarClick(Sender: TObject);
    procedure frmBotaoPrimarioRegistrarspbBotaoPrimarioClick(Sender: TObject);
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
  Uusuario,
  UvalidadorUsuario;

{$R *.dfm}

procedure TfrmRegistrar.frmBotaoPrimarioRegistrarspbBotaoPrimarioClick
  (Sender: TObject);
var
  LUsuario: TUsuario;
  LDao: TUsuarioDAO;
begin
  try
    try
      LUsuario := TUsuario.Create();
      LUsuario.login := edtLogin.Text;
      LUsuario.senha := edtSenha.Text;
      LUsuario.pessoaId := 10000;
      LUsuario.criadoEm := Now();
      LUsuario.criadoPor := 'admin';
      LUsuario.alteradoEm := Now();
      LUsuario.alteradoPor := 'admin';

      TValidadorUsuario.Validar(LUsuario, edtConfirmarSenha.Text);

      LDao := TUsuarioDAO.Create();
      LDao.InserirUsuario(LUsuario);

    except
      on E: EMySQLNativeException do
      begin
        ShowMessage('Erro ao inserir o usuário no banco');
      end;
      on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
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
  if not Assigned(frmAutenticar) then
  begin
    Application.CreateForm(TfrmAutenticar, frmAutenticar);
  end;

  SetMainForm(frmAutenticar);
  frmAutenticar.Show();

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
