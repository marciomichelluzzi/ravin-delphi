unit UfrmAutenticar;

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
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  Vcl.StdCtrls, UfrmBotaoPrimario, UfrmBotaoSecundario;

type
  TfrmAutenticar = class(TForm)
    imgFundo: TImage;
    pnlAutenticacao: TPanel;
    lblTitulo: TLabel;
    lblSubTitulo: TLabel;
    edtLogin: TEdit;
    edtSenha: TEdit;
    frmBotaoPrimarioAutenticar: TfrmBotaoPrimario;
    ImageLogo: TImage;
    lblTituloRegistrar: TLabel;
    lblSubTituloRegistras: TLabel;
    procedure frmBotaoPrimarioAutenticarspbBotaoPrimarioClick(Sender: TObject);
    procedure lblSubTituloRegistrasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAutenticar: TfrmAutenticar;

implementation

{$R *.dfm}

uses UfrmPainelGestao, Uusuario, UusuarioDao, UfrmRegistrar, UiniUtils,
  UformUtils;

{ TfrmLogin }

procedure TfrmAutenticar.frmBotaoPrimarioAutenticarspbBotaoPrimarioClick
  (Sender: TObject);
var
  LusuarioDAO: TUsuarioDAO;
  Lusuario: TUsuario;
  Llogin: String;
  LSenha: String;
begin

  Llogin := edtLogin.Text;
  LSenha := edtSenha.Text;

  if (not Llogin.IsEmpty) and (not LSenha.IsEmpty) then
  begin
    LusuarioDAO := TUsuarioDAO.Create();
    Lusuario := LusuarioDAO.BuscarUsuarioPorLoginSenha(Llogin, LSenha);

    if Assigned(Lusuario) then
    begin
      TIniUtils.gravarPropriedade(TSECAO.INFORMACOES_GERAIS,
        TPROPRIEDADE.LOGADO, TIniUtils.VALOR_VERDADEIRO);

      if not Assigned(frmPainelGestao) then
      begin
        Application.CreateForm(TfrmPainelGestao, frmPainelGestao);
      end;

      TFormUtils.SetarFormularioPrincipal(frmPainelGestao);
      frmPainelGestao.Show();

      Close;
    end
    else
    begin
      ShowMessage('Login e/ou senha inválido');
    end;
  end
  else
  begin
    ShowMessage('Login e senha são obrigatórios');
  end;

  FreeAndNil(LusuarioDAO);
  FreeAndNil(Lusuario);

end;

procedure TfrmAutenticar.lblSubTituloRegistrasClick(Sender: TObject);
begin
  if not Assigned(frmRegistrar) then
  begin
    Application.CreateForm(TfrmRegistrar, frmRegistrar);
  end;

  TFormUtils.SetarFormularioPrincipal(frmRegistrar);
  frmRegistrar.Show();

  Close();
end;

end.
