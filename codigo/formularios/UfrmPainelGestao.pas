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
    procedure frmMenuItemSobrelblTituloClick(Sender: TObject);
    procedure frmMenuItemSairlblTituloClick(Sender: TObject);
    procedure frmMenuItemProdutoslblTituloClick(Sender: TObject);
    procedure frmMenuItemMesaslblTituloClick(Sender: TObject);
    procedure frmMenuItemComandaslblTituloClick(Sender: TObject);
    procedure frmMenuItemClienteslblTituloClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
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
  UfrmListaClientes,
  UfrmAutenticar,
  UformUtils;

procedure TfrmPainelGestao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmPainelGestao := nil;
end;

procedure TfrmPainelGestao.frmMenuItemClienteslblTituloClick(Sender: TObject);
begin
  TFormUtils.MostrarFormulario<TfrmListaClientes>(frmListaClientes);
end;

procedure TfrmPainelGestao.frmMenuItemComandaslblTituloClick(Sender: TObject);
begin
  TFormUtils.MostrarFormulario<TfrmComandas>(frmComandas);
end;

procedure TfrmPainelGestao.frmMenuItemMesaslblTituloClick(Sender: TObject);
begin
  TFormUtils.MostrarFormulario<TfrmMesas>(frmMesas);
end;

procedure TfrmPainelGestao.frmMenuItemProdutoslblTituloClick(Sender: TObject);
begin
  TFormUtils.MostrarFormulario<TfrmProdutos>(frmProdutos);
end;

procedure TfrmPainelGestao.frmMenuItemSairlblTituloClick(Sender: TObject);
begin
  TIniUtils.gravarPropriedade(TSECAO.INFORMACOES_GERAIS, TPROPRIEDADE.LOGADO,
    TIniUtils.VALOR_FALSO);

  TFormUtils.MostrarFormulario<TfrmAutenticar>(frmAutenticar, Self);
end;

procedure TfrmPainelGestao.frmMenuItemSobrelblTituloClick(Sender: TObject);
begin
  TFormUtils.MostrarFormulario<TfrmSobre>(frmSobre);
end;

end.
