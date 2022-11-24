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
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

uses UfrmPainelGestao, UfrmAutenticar, UiniUtils;

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
begin
  LLogado := TIniUtils.lerPropriedade(TSECAO.INFORMACOES_GERAIS,
    TPROPRIEDADE.LOGADO);

  if LLogado = TIniUtils.VALOR_VERDADEIRO then
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
