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

  UfrmItemMenu, Vcl.Buttons, VclTee.TeeGDIPlus, VclTee.TeEngine,
  VclTee.TeeProcs, VclTee.Chart, VclTee.Series, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

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
    pnlFundoPainelGestao: TPanel;
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
    Chart1: TChart;
    qryQuantidadeVendida: TFDQuery;
    qryQuantidadeVendidaPeriodo: TStringField;
    qryQuantidadeVendidaValor: TFloatField;
    SerieQuantidadeVendida: TBarSeries;
    procedure frmMenuItemClienteslblTituloClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure spbMenuClick(Sender: TObject);
    procedure spbMesasClick(Sender: TObject);
    procedure spbComandasClick(Sender: TObject);
    procedure spbClientesClick(Sender: TObject);
    procedure spbProdutosClick(Sender: TObject);
    procedure spbSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    MenuExpandido: Boolean;
    procedure CarregarGraficoQuantidadeVendida();
  public

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
  UformUtils, UdmRavin;

procedure TfrmPainelGestao.CarregarGraficoQuantidadeVendida;
var
  LChartSerie: TBarSeries;
begin
  qryQuantidadeVendida.Active := false;
  qryQuantidadeVendida.Active := true;

  qryQuantidadeVendida.First;

  while not qryQuantidadeVendida.Eof do
  begin
    Chart1.Series[0].Add(qryQuantidadeVendida.Fields[1].AsFloat,
      qryQuantidadeVendida.Fields[0].AsString);
    qryQuantidadeVendida.Next();
  end;

  qryQuantidadeVendida.Active := false;
end;

procedure TfrmPainelGestao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmPainelGestao := nil;
end;

procedure TfrmPainelGestao.FormCreate(Sender: TObject);
begin
  MenuExpandido := true;
end;

procedure TfrmPainelGestao.FormShow(Sender: TObject);
begin
  CarregarGraficoQuantidadeVendida();
end;

procedure TfrmPainelGestao.frmMenuItemClienteslblTituloClick(Sender: TObject);
var
  FDialog: TForm;
begin
  TFormUtils.MostrarFormulario<TfrmClientes>(frmClientes);
end;

procedure TfrmPainelGestao.spbClientesClick(Sender: TObject);
var
  FDialog: TForm;
begin
  TFormUtils.MostrarFormulario<TfrmClientes>(frmClientes);
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

end.
