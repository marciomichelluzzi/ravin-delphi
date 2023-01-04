unit UfrmPainelGestao;

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
  Vcl.StdCtrls,
  Vcl.Imaging.pngimage,

  UfrmItemMenu, Vcl.Buttons;

type
  TfrmPainelGestao = class(TForm)
    pnlMenu: TPanel;
    spbSair: TSpeedButton;
    spbConfiguracoes: TSpeedButton;
    spbProdutos: TSpeedButton;
    spbClientes: TSpeedButton;
    spbComandas: TSpeedButton;
    spbMesas: TSpeedButton;
    spbMenu: TSpeedButton;
    pnlFundoDashboard: TPanel;
    pnlInformacoesGerenciais: TPanel;
    lblInformacoesGerenciais: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Shape3: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Label2: TLabel;
    Shape1: TShape;
    procedure frmMenuItemClienteslblTituloClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure spbMenuClick(Sender: TObject);
    procedure spbMesasClick(Sender: TObject);
    procedure spbComandasClick(Sender: TObject);
    procedure spbClientesClick(Sender: TObject);
    procedure spbProdutosClick(Sender: TObject);
    procedure spbSairClick(Sender: TObject);
  private
    { Private declarations }

    MenuExpandido: Boolean;

    function ShowObviousModal(AForm: TForm; AParent: TWinControl = nil)
      : Integer;
    procedure SetTransparent(const isTransparent: Boolean);
  public
    { Public declarations }
  end;

var
  frmPainelGestao: TfrmPainelGestao;

implementation

{$R *.dfm}

uses
  UfrmSobre,
  UfrmProdutos,
  UfrmMesas,
  UfrmComandas,
  UiniUtils,
  UfrmClientes,
  UfrmAutenticar,
  UformUtils;

procedure TfrmPainelGestao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmPainelGestao := nil;
end;

procedure TfrmPainelGestao.FormCreate(Sender: TObject);
begin
  MenuExpandido := true;
end;

procedure TfrmPainelGestao.frmMenuItemClienteslblTituloClick(Sender: TObject);
var
  FDialog: TForm;
begin
  TFormUtils.MostrarFormulario<TfrmClientes>(frmClientes);
  // TFormUtils.MostrarFormulario<TfrmCadastroCliente>(frmCadastroCliente);
  //
  // FDialog := TfrmListaClientes.Create(Self);
  // try
  // if ShowObviousModal(FDialog) = mrOk then
  // Caption := 'OK';
  // finally
  // FDialog.Free;
  // end;
end;

function TfrmPainelGestao.ShowObviousModal(AForm: TForm;
  AParent: TWinControl = nil): Integer;
var
  Layer: TForm;
begin
  if AParent = nil then
    AParent := Application.MainForm;
  Layer := TForm.Create(nil);
  try
    Layer.AlphaBlend := True;
    Layer.AlphaBlendValue := 128;
    Layer.BorderStyle := bsNone;
    Layer.Color := clBlack;
    with AParent, ClientOrigin do
      SetWindowPos(Layer.Handle, HWND_TOP, X, Y, ClientWidth, ClientHeight,
        SWP_SHOWWINDOW);
    Result := AForm.ShowModal;
  finally
    Layer.Free;
  end;
end;

procedure TfrmPainelGestao.spbClientesClick(Sender: TObject);
var
  FDialog: TForm;
begin
  TFormUtils.MostrarFormulario<TfrmClientes>(frmClientes);
  // TFormUtils.MostrarFormulario<TfrmCadastroCliente>(frmCadastroCliente);
  //
  // FDialog := TfrmListaClientes.Create(Self);
  // try
  // if ShowObviousModal(FDialog) = mrOk then
  // Caption := 'OK';
  // finally
  // FDialog.Free;
  // end;
end;

procedure TfrmPainelGestao.spbComandasClick(Sender: TObject);
begin
  TFormUtils.MostrarFormulario<TfrmComandas>(frmComandas);
end;

procedure TfrmPainelGestao.spbMenuClick(Sender: TObject);
begin
  if MenuExpandido then
    pnlMenu.Width := 50
  else
    pnlMenu.Width := 185;

  MenuExpandido := not MenuExpandido;
end;

procedure TfrmPainelGestao.spbMesasClick(Sender: TObject);
begin
  TFormUtils.MostrarFormulario<TfrmMesas>(frmMesas);
end;

procedure TfrmPainelGestao.spbProdutosClick(Sender: TObject);
begin
  TFormUtils.MostrarFormulario<TfrmProdutos>(frmProdutos);
end;

procedure TfrmPainelGestao.spbSairClick(Sender: TObject);
begin
  TIniUtils.gravarPropriedade(TSECAO.INFORMACOES_GERAIS, TPROPRIEDADE.LOGADO,
    TIniUtils.VALOR_FALSO);

  TFormUtils.MostrarFormulario<TfrmAutenticar>(frmAutenticar, Self);
end;

procedure TfrmPainelGestao.SetTransparent(const isTransparent: Boolean);
var
  exStyle: DWORD;
begin
  exStyle := GetWindowLongPtr(Self.Handle, GWL_EXSTYLE);
  Win32Check(exStyle <> 0);

  if (isTransparent) then
  begin
    exStyle := (exStyle or WS_EX_LAYERED);
    Win32Check(SetWindowLongPtr(Self.Handle, GWL_EXSTYLE, exStyle) <> 0);

    Win32Check(SetLayeredWindowAttributes(Self.Handle, 0, 127, // 50 % von 255
      LWA_ALPHA));
  end
  else
  begin
    exStyle := (exStyle xor WS_EX_LAYERED);
    SetWindowLong(Self.Handle, GWL_EXSTYLE, exStyle);
  end;
end;

end.
