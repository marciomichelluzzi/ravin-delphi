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
    frmMenuItemPessoas: TfrmMenuItem;
    frmMenuItemProdutos: TfrmMenuItem;
    frmMenuItemConfiguracoes: TfrmMenuItem;
    frmMenuItemSobre: TfrmMenuItem;
    frmMenuItemSair: TfrmMenuItem;
    procedure FrameMenuItemMesasLabelTitleClick(Sender: TObject);
    procedure frmMenuItemSobrelblTituloClick(Sender: TObject);
    procedure frmMenuItemSairlblTituloClick(Sender: TObject);
    procedure frmMenuItemProdutoslblTituloClick(Sender: TObject);
    procedure frmMenuItemMesaslblTituloClick(Sender: TObject);
    procedure frmMenuItemComandaslblTituloClick(Sender: TObject);
  private
    { Private declarations }
    procedure ExibirFormMesas();
    procedure ExibirFormComandas();
    procedure ExibirFormProdutos();
    procedure ExibirFormSobre();
    procedure Deslogar();
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
  UfrmMesas, UfrmComandas, UiniUtils,  UformsUtils, UfrmLogin;

procedure TfrmPainelGestao.Deslogar;
begin

  TIniUtils.gravarPropriedade(TSECAO.INFORMACOES_GERAIS, TPROPRIEDADE.LOGADO,
      TIniUtils.VALOR_FALSO);
   TFormsUtils.ShowFormPrincipal(frmLogin, TfrmLogin);
   Close;
end;

procedure TfrmPainelGestao.ExibirFormComandas;
begin
  TFormsUtils.ShowForm(frmComandas, TfrmComandas);
end;

procedure TfrmPainelGestao.ExibirFormMesas;
begin
  TFormsUtils.ShowForm(frmMesas, TfrmMesas);
end;

procedure TfrmPainelGestao.ExibirFormProdutos;
begin
  TFormsUtils.ShowForm(frmProdutos, TfrmProdutos);
end;

procedure TfrmPainelGestao.ExibirFormSobre;
begin
  TFormsUtils.ShowForm(frmSobre, TfrmSobre);
end;

procedure TfrmPainelGestao.FrameMenuItemMesasLabelTitleClick(Sender: TObject);
begin
    self.ExibirFormMesas;
end;

procedure TfrmPainelGestao.frmMenuItemComandaslblTituloClick(Sender: TObject);
begin
    self.ExibirFormComandas;
end;

procedure TfrmPainelGestao.frmMenuItemMesaslblTituloClick(Sender: TObject);
begin
    self.ExibirFormMesas;
end;

procedure TfrmPainelGestao.frmMenuItemProdutoslblTituloClick(Sender: TObject);
begin
    self.ExibirFormProdutos;
end;

procedure TfrmPainelGestao.frmMenuItemSairlblTituloClick(Sender: TObject);
begin
  self.Deslogar;
end;

procedure TfrmPainelGestao.frmMenuItemSobrelblTituloClick(Sender: TObject);
begin
    self.ExibirFormSobre;
end;

end.
