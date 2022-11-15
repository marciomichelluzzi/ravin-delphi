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
    procedure SetMainForm(NovoMainForm: TForm);
  public
    { Public declarations }
  end;

var
  frmAutenticar: TfrmAutenticar;

implementation

{$R *.dfm}

uses UfrmPainelGestao, Uusuario, UusuarioDao, UfrmRegistrar;

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
    Lusuario := LusuarioDAO.BuscarPorLoginSenha(Llogin, LSenha);

    if Assigned(Lusuario) then
    begin
      if not Assigned(frmPainelGestao) then
      begin
        Application.CreateForm(TfrmPainelGestao, frmPainelGestao);
      end;

      SetMainForm(frmPainelGestao);
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

  SetMainForm(frmRegistrar);
  frmRegistrar.Show();

  Close();
end;

procedure TfrmAutenticar.SetMainForm(NovoMainForm: TForm);
var
  tmpMain: ^TCustomForm;
begin
  tmpMain := @Application.Mainform;
  tmpMain^ := NovoMainForm;
end;

end.
