unit UfrmSplash;

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

  UfrmLogomarca;

type
  TfrmSplash = class(TForm)
    pnlFundo: TPanel;
    tmrSplash: TTimer;
    frmLogo: TfrmLogo;
    procedure tmrSplashTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
    Inicializado: Boolean;
    procedure InicializarAplicacao();
    procedure ShowPainelGestao();
    procedure ShowLogin();
    procedure SetarFormPrincipal(PNovoFormulario: TForm);
  public
    { Public declarations }
    function VerificarDeveLogar(): Boolean;

    // Número máximo de dias que o usuário fica logado
    // sem precisar autenticar novamente
  const
    MAX_DIAS_LOGIN: Integer = 5;
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

uses
  UfrmPainelGestao,
  UfrmAutenticar,
  UiniUtils,
  System.DateUtils;

procedure TfrmSplash.FormCreate(Sender: TObject);
begin
  Inicializado := false;
  tmrSplash.Enabled := false;
  tmrSplash.Interval := 1000;
end;

procedure TfrmSplash.FormPaint(Sender: TObject);
begin
  tmrSplash.Enabled := not Inicializado;
end;

procedure TfrmSplash.InicializarAplicacao;
var
  LLogado: String;
  LDeveLogar: Boolean;
begin
  // Carregando se o usuário está logado
  LLogado := TIniUtils.lerPropriedade(TSECAO.INFORMACOES_GERAIS,
    TPROPRIEDADE.LOGADO);

  LDeveLogar := VerificarDeveLogar();

  if (LLogado = TIniUtils.VALOR_VERDADEIRO) AND (not LDeveLogar) then
  begin
    ShowPainelGestao();
  end
  else
  begin
    ShowLogin();
  end;
end;

procedure TfrmSplash.tmrSplashTimer(Sender: TObject);
begin
  tmrSplash.Enabled := false;
  if not Inicializado then
  begin
    Inicializado := true;
    InicializarAplicacao();
  end;
end;

function TfrmSplash.VerificarDeveLogar: Boolean;
var
  LDataString: String;
  LDataUltimoLogin: TDateTime;
  LDataExpiracaoLogin: TDateTime;
  LExisteDataUltimoLogin: Boolean;
begin
  // LDataUltimoLogin := now();
  // Carregando a datahora do ultimo login do usuário
  LDataString := TIniUtils.lerPropriedade(
    TSECAO.INFORMACOES_GERAIS,
    TPROPRIEDADE.DATAHORA_ULTIMO_LOGIN);

  try
    //Converte a data de String para DateTime
    LDataUltimoLogin := StrToDateTime(LDataString);

    // Calculando a data de expiração do login
    LDataExpiracaoLogin := IncDay(
      LDataUltimoLogin,
      MAX_DIAS_LOGIN);
    Result := LDataExpiracaoLogin < Now();
  except
    on E: Exception do
      Result := true;
  end;
end;

procedure TfrmSplash.SetarFormPrincipal(PNovoFormulario: TForm);
var
  tmpMain: ^TCustomForm;
begin
  tmpMain := @Application.Mainform;
  tmpMain^ := PNovoFormulario;
end;

procedure TfrmSplash.ShowLogin;
begin
  if not Assigned(frmAutenticar) then
  begin
    Application.CreateForm(TfrmAutenticar, frmAutenticar);
  end;

  SetarFormPrincipal(frmAutenticar);
  frmAutenticar.Show();

  Close;
end;

procedure TfrmSplash.ShowPainelGestao;
begin
  if not Assigned(frmPainelGestao) then
  begin
    Application.CreateForm(TfrmPainelGestao, frmPainelGestao);
  end;

  SetarFormPrincipal(frmPainelGestao);
  frmPainelGestao.Show();

  Close;
end;

end.
