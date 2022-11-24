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
    Inicialized: Boolean;
    procedure InicializarAplicacao();
    procedure ShowForm(pForm : TForm; pTForm : TComponentClass);
    procedure ShowPainelGestao();
    procedure ShowLogin();
    procedure SetarFormPrincipal(NewMainForm: TForm);
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

uses UfrmPainelGestao, UfrmLogin, UiniUtils;

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
  LLogado := TIniUtils.lerPropriedade(TSECAO.INFORMACOES_GERAIS, TPROPRIEDADE.LOGADO);

  if (LLogado = TIniUtils.VALOR_VERDADEIRO) then
  begin
     ShowPainelGestao();
   // ShowForm(frmPainelGestao, TfrmPainelGestao);
  end
  else
  begin
    ShowLogin();
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

procedure TfrmSplash.SetarFormPrincipal(NewMainForm: TForm);
var
  tmpMain: ^TCustomForm;
begin
  tmpMain := @Application.Mainform;
  tmpMain^ := NewMainForm;
end;

procedure TfrmSplash.ShowForm(pForm: TForm; pTForm : TComponentClass);
begin
 if not Assigned(pForm) then
 begin
   Application.CreateForm( pTForm, pForm);
 end;

 SetarFormPrincipal(pForm);
  pForm.Show();

  Close;
end;

procedure TfrmSplash.ShowLogin;
begin
   if not Assigned(frmLogin) then
  begin
    Application.CreateForm(TfrmLogin, frmLogin);
  end;

  SetarFormPrincipal(frmLogin);
  frmLogin.Show();

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


