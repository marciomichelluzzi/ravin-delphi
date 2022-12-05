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
  Vcl.StdCtrls,

  UfrmBotaoPrimario,
  UfrmBotaoSecundario;

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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure Autenticar();
  public
    { Public declarations }
  end;

var
  frmAutenticar: TfrmAutenticar;

implementation

{$R *.dfm}

uses
  UfrmPainelGestao,
  Uusuario,
  UusuarioDao,
  UfrmRegistrar,
  UiniUtils,
  UformUtils;

{ TfrmLogin }

procedure TfrmAutenticar.Autenticar;
var
  LUsuarioDAO: TUsuarioDAO;
  LUsuario: TUsuario;
  LLogin: String;
  LSenha: String;
begin

  // Limpa possíveis sujeiras das variáveis locais
  LUsuario := nil;
  LUsuarioDAO := nil;

  // Pega os valores dos edits de login
  LLogin := edtLogin.Text;
  LSenha := edtSenha.Text;

  try
    try
      // Caso os valores de login e senha não sejam vazios será feita a tentitiva de
      // autenticação
      if (not LLogin.IsEmpty) and (not LSenha.IsEmpty) then
      begin
        // Tenta carregar um usuário com o login e senha informados
        LUsuarioDAO := TUsuarioDAO.Create();
        LUsuario := LUsuarioDAO.BuscarUsuarioPorLoginSenha(LLogin, LSenha);

        // Caso exista quer o usuário é levado a tela de login
        if Assigned(LUsuario) then
        begin

          // Registrando a data do ultimo login do usuário
          TIniUtils.gravarPropriedade(TSECAO.INFORMACOES_GERAIS,
            TPROPRIEDADE.DATAHORA_ULTIMO_LOGIN, DateTimeToStr(Now));

          // Registrar que o usuário efetuou o login com sucesso
          TIniUtils.gravarPropriedade(TSECAO.INFORMACOES_GERAIS,
            TPROPRIEDADE.LOGADO, TIniUtils.VALOR_VERDADEIRO);

          TIniUtils.gravarPropriedade(TSECAO.INFORMACOES_GERAIS,
            TPROPRIEDADE.LOGIN_ATUAL, LLogin);

          // Mostrando o forma de Painel de Gestão
          TFormUtils.MostrarFormulario<TfrmPainelGestao>(frmPainelGestao, Self);
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
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;
  finally
    if Assigned(LUsuario) then
      FreeAndNil(LUsuario);
    if Assigned(LUsuarioDAO) then
      FreeAndNil(LUsuarioDAO);
  end;
end;

procedure TfrmAutenticar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmAutenticar := nil;
end;

procedure TfrmAutenticar.frmBotaoPrimarioAutenticarspbBotaoPrimarioClick
  (Sender: TObject);
begin
  Autenticar();
end;

procedure TfrmAutenticar.lblSubTituloRegistrasClick(Sender: TObject);
begin
  TFormUtils.MostrarFormulario<TfrmRegistrar>(frmRegistrar, Self);
end;

end.
