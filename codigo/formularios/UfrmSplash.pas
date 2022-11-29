unit UfrmSplash;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  DateUtils,
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
    Inicialized: Boolean;
    procedure InicializarAplicacao();
  public
    { Public declarations }
    function verificarLoginExipirou() : boolean;

    const diasMaximoInatividade : Integer = 5;//numero max de dias que o usuario fica logado sem precisar logar
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

uses UfrmPainelGestao, UfrmLogin, UiniUtils, UformsUtils;

procedure TfrmSplash.FormCreate(Sender: TObject);
begin
  Inicialized := false;
  tmrSplash.Enabled := false;
  tmrSplash.Interval := 1000;
end;

procedure TfrmSplash.FormPaint(Sender: TObject);
begin
  tmrSplash.Enabled := not Inicialized;
end;

procedure TfrmSplash.InicializarAplicacao;
var
  LLogado : String;
begin

  //carregando se o usuario esta logado
  LLogado := TIniUtils.lerPropriedade(TSECAO.INFORMACOES_GERAIS, TPROPRIEDADE.LOGADO);

  if (LLogado = TIniUtils.VALOR_VERDADEIRO) and (not verificarLoginExipirou) {(DaysBetween(Now(),LUltimosAcesso) < diasMaximoInatividade)//minha forma antiga }then
  begin
    TformsUtils.ShowFormPrincipal(frmPainelGestao, TfrmPainelGestao);
    Close;
  end
  else
  begin
    TformsUtils.ShowFormPrincipal(frmLogin, TfrmLogin);
    Close;
  end;
end;

procedure TfrmSplash.tmrSplashTimer(Sender: TObject);
begin
  tmrSplash.Enabled := false;
  if not Inicialized then
  begin
    Inicialized := true;
    InicializarAplicacao();
  end;
end;


function TfrmSplash.verificarLoginExipirou: boolean;
var
  LDataExpiracaoLogin : TDateTime;
  LUltimosAcesso : TDateTime; //Ultimo acesso do usuario
begin
  //carregando a data e hora do ultimo login do usuario
  LUltimosAcesso := StrToDateTime(TIniUtils.lerPropriedade(TSECAO.INFORMACOES_GERAIS, TPROPRIEDADE.ULTIMO_ACESSO));
  //calculando a data de expiracao de login
  LDataExpiracaoLogin := IncDay(LUltimosAcesso, diasMaximoInatividade);

  result := (LDataExpiracaoLogin >= now());
end;

end.


