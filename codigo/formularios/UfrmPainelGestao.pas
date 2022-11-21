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
    Shape3: TShape;
    procedure FrameMenuItemMesasLabelTitleClick(Sender: TObject);
    procedure frmMenuItemSobrelblTituloClick(Sender: TObject);
    procedure frmMenuItemSairlblTituloClick(Sender: TObject);
    procedure frmMenuItemProdutoslblTituloClick(Sender: TObject);
    procedure frmMenuItemMesaslblTituloClick(Sender: TObject);
    procedure frmMenuItemComandaslblTituloClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetarFormPrincipal(NovoMainForm: TForm);
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
  UfrmMesas, UfrmComandas, UfrmAutenticar;

procedure TfrmPainelGestao.FrameMenuItemMesasLabelTitleClick(Sender: TObject);
begin
  if (not Assigned(frmMesas)) then
  begin
    Application.CreateForm(TfrmMesas, frmMesas);
  end;
  frmMesas.show();
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
  if (not Assigned(frmAutenticar)) then
  begin
    Application.CreateForm(TfrmSobre, frmSobre)
  end;

  SetarFormPrincipal(frmAutenticar);
  frmAutenticar.show();

  Self.Close();
end;

procedure TfrmPainelGestao.frmMenuItemSobrelblTituloClick(Sender: TObject);
begin
  if (not Assigned(frmSobre)) then
  begin
    Application.CreateForm(TfrmSobre, frmSobre)
  end;
  frmSobre.show();
end;

procedure TfrmPainelGestao.SetarFormPrincipal(NovoMainForm: TForm);
var
  tmpMain: ^TCustomForm;
begin
  tmpMain := @Application.Mainform;
  tmpMain^ := NovoMainForm;
end;

end.
