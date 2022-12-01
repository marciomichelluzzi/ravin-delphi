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
  UfrmItemMenu;

type
  TfrmPainelGestao = class(TForm)
    pnlMenu: TPanel;
    lblPainelGestaoTitulo: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    shpQtdPedidosPorDia: TShape;
    Shape4: TShape;
    Shape5: TShape;
    imgLogomarca: TImage;
    lblNomeUsuario: TLabel;
    frmMenuItemMesas: TfrmMenuItem;
    frmMenuItemComandas: TfrmMenuItem;
    frmMenuItemClientes: TfrmMenuItem;
    frmMenuItemProdutos: TfrmMenuItem;
    frmMenuItemConfiguracoes: TfrmMenuItem;
    frmMenuItemSobre: TfrmMenuItem;
    frmMenuItemSair: TfrmMenuItem;
    Timer1: TTimer;
    Button1: TButton;
    procedure FrameMenuItemMesasLabelTitleClick(Sender: TObject);
    procedure frmMenuItemSobrelblTituloClick(Sender: TObject);
    procedure frmMenuItemSairlblTituloClick(Sender: TObject);
    procedure frmMenuItemProdutoslblTituloClick(Sender: TObject);
    procedure frmMenuItemMesaslblTituloClick(Sender: TObject);
    procedure frmMenuItemComandaslblTituloClick(Sender: TObject);
    procedure frmMenuItemClienteslblTituloClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }

    procedure MinhaThreadAcabou(Sender: TObject);
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
  UfrmCadastroCliente,
  UfrmClientes,
  UfrmListaClientes, UminhaThread;

procedure TfrmPainelGestao.Button1Click(Sender: TObject);
var
  thread: TMinhaThread;
begin
  Timer1.Enabled := not Timer1.Enabled;

  thread := TMinhaThread.Create();
  thread.FreeOnTerminate := true;
  thread.OnTerminate := MinhaThreadAcabou;
  thread.start();





end;

procedure TfrmPainelGestao.FrameMenuItemMesasLabelTitleClick(Sender: TObject);
begin
  if (not Assigned(frmMesas)) then
  begin
    Application.CreateForm(TfrmMesas, frmMesas);
  end;
  frmMesas.show();
end;

procedure TfrmPainelGestao.frmMenuItemClienteslblTituloClick(Sender: TObject);
begin
  if (not Assigned(frmListaClientes)) then
  begin
    Application.CreateForm(TfrmListaClientes, frmListaClientes);
  end;
  frmListaClientes.show();
end;

procedure TfrmPainelGestao.frmMenuItemComandaslblTituloClick(Sender: TObject);
begin
  if (not Assigned(frmComandas)) then
  begin
    Application.CreateForm(TfrmComandas, frmComandas);
  end;

  frmComandas.show();
end;

procedure TfrmPainelGestao.frmMenuItemMesaslblTituloClick(Sender: TObject);
begin
  if (not Assigned(frmMesas)) then
  begin
    Application.CreateForm(TfrmMesas, frmMesas);
  end;
  frmMesas.show();
end;

procedure TfrmPainelGestao.frmMenuItemProdutoslblTituloClick(Sender: TObject);
begin
  if (not Assigned(frmProdutos)) then
  begin
    Application.CreateForm(TfrmProdutos, frmProdutos);
  end;
  frmProdutos.show();
end;

procedure TfrmPainelGestao.frmMenuItemSairlblTituloClick(Sender: TObject);
begin
  TIniUtils.gravarPropriedade(TSECAO.INFORMACOES_GERAIS, TPROPRIEDADE.LOGADO,
    TIniUtils.VALOR_FALSO);
  Application.Terminate();
end;

procedure TfrmPainelGestao.frmMenuItemSobrelblTituloClick(Sender: TObject);
begin
  if (not Assigned(frmSobre)) then
  begin
    Application.CreateForm(TfrmSobre, frmSobre)
  end;
  frmSobre.show();
end;

procedure TfrmPainelGestao
.MinhaThreadAcabou(Sender: TObject);
begin

end;

procedure TfrmPainelGestao.Timer1Timer(Sender: TObject);
begin
  ShowMessage('Cento de salgado');
end;

end.
