unit UfrmRegistrar;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Actions,

  FireDAC.Phys.MySQLWrapper,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  UfrmBotaoPrimario,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  UfrmAutenticar,

  Vcl.ActnList,
  Vcl.ExtActns,
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
    frmBotaoPrimarioRegistrar: TfrmBotaoPrimario;
    edtLogin: TEdit;
    edtSenha: TEdit;
    edtConfirmarSenha: TEdit;
    mskCpf: TMaskEdit;
    procedure lblSubTituloAutenticarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure Registrar();
  public
    { Public declarations }
  end;

var
  frmRegistrar: TfrmRegistrar;

implementation

uses
  UusuarioDao,
  Uusuario,
  UvalidadorUsuario,
  UformUtils;

{$R *.dfm}

procedure TfrmRegistrar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmRegistrar := nil;
end;

procedure TfrmRegistrar.lblSubTituloAutenticarClick(Sender: TObject);
begin
  TFormUtils.MostrarFormulario<TfrmAutenticar>(frmAutenticar, Self);
end;

procedure TfrmRegistrar.Registrar;
var
  LUsuario: TUsuario;
  LDao: TUsuarioDAO;
begin
  LUsuario := nil;
  LDao := nil;

  try
    try
      LUsuario := TUsuario.Create();
      LUsuario.login := edtLogin.Text;
      LUsuario.senha := edtSenha.Text;
      LUsuario.pessoaId := 0;
      LUsuario.criadoEm := Now();
      LUsuario.criadoPor := 'admin';
      LUsuario.alteradoEm := Now();
      LUsuario.alteradoPor := 'admin';

      TValidadorUsuario.Validar(LUsuario, edtConfirmarSenha.Text, mskCpf.Text);

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

end.
