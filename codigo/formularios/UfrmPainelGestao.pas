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
  Vcl.Buttons,

  VclTee.TeeGDIPlus,
  VclTee.TeEngine,
  VclTee.TeeProcs,
  VclTee.Chart,
  VclTee.Series,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

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
    pnlQuantidadeComandas: TPanel;
    lblQuantidadeComandasTitulo: TLabel;
    pnlQuantidadeVendida: TPanel;
    lblQuantidadeVendidaTitulo: TLabel;
    pnlInformacoesGerenciais: TPanel;
    shpTotalMesasDisponiveis: TShape;
    shpQuantidadeComandasAberto: TShape;
    shpQuantidadeMesasReservadas: TShape;
    lblInformacoesGerenciaisTitulo: TLabel;
    shpQuantidadeVendida: TShape;
    chtQuantidadeVendida: TChart;
    qryQuantidadeVendida: TFDQuery;
    qryQuantidadeVendidaPeriodo: TStringField;
    qryQuantidadeVendidaValor: TFloatField;
    barQuantidadeVendida: TBarSeries;
    shpQuantidadeComandasFundo: TShape;
    chtQuantidadeComandas: TChart;
    barQuantidadeComandas: TBarSeries;
    qryQuantidadeComandas: TFDQuery;
    StringField1: TStringField;
    qryQuantidadeComandasComandas: TLargeintField;
    qryInformacoesGerenciais: TFDQuery;
    lblTotalMesasDisponiveis: TLabel;
    lblTotalMesasDisponiveisValor: TLabel;
    lblQuantidadeComandasAberto: TLabel;
    lblQuantidadeComandasAbertoValor: TLabel;
    lblQuantidadeMesasReservadas: TLabel;
    lblQuantidadeMesasReservadasValor: TLabel;
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
    procedure CarregarGraficoQuantidadeComandas();
    procedure CarregarInformacoesGerenciais();
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

procedure TfrmPainelGestao.CarregarGraficoQuantidadeComandas;
begin
  qryQuantidadeComandas.Active := false;
  qryQuantidadeComandas.Active := true;

  qryQuantidadeComandas.First;

  while not qryQuantidadeComandas.Eof do
  begin
    chtQuantidadeComandas.Series[0].Add(qryQuantidadeComandas.Fields[1].AsFloat, qryQuantidadeComandas.Fields[0].AsString);
    qryQuantidadeComandas.Next();
  end;

  qryQuantidadeComandas.Active := false;
end;

procedure TfrmPainelGestao.CarregarGraficoQuantidadeVendida;
begin
  qryQuantidadeVendida.Active := false;
  qryQuantidadeVendida.Active := true;

  qryQuantidadeVendida.First;

  while not qryQuantidadeVendida.Eof do
  begin
    chtQuantidadeVendida.Series[0].Add(qryQuantidadeVendida.Fields[1].AsFloat, qryQuantidadeVendida.Fields[0].AsString);
    qryQuantidadeVendida.Next();
  end;

  qryQuantidadeVendida.Active := false;
end;

procedure TfrmPainelGestao.CarregarInformacoesGerenciais;
begin
  qryInformacoesGerenciais.Active := false;
  qryInformacoesGerenciais.Active := true;

  qryInformacoesGerenciais.First;

  lblTotalMesasDisponiveisValor.Caption := IntToStr(qryInformacoesGerenciais.Fields[0].AsInteger);
  lblQuantidadeComandasAbertoValor.Caption := IntToStr(qryInformacoesGerenciais.Fields[1].AsInteger);
  lblQuantidadeMesasReservadasValor.Caption := IntToStr(qryInformacoesGerenciais.Fields[2].AsInteger);
  qryInformacoesGerenciais.Active := false;
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
  CarregarGraficoQuantidadeComandas();
  CarregarInformacoesGerenciais();
end;

procedure TfrmPainelGestao.frmMenuItemClienteslblTituloClick(Sender: TObject);
begin
  TFormUtils.MostrarFormulario<TfrmClientes>(frmClientes);
end;

procedure TfrmPainelGestao.spbClientesClick(Sender: TObject);
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
  TIniUtils.gravarPropriedade(TSECAO.INFORMACOES_GERAIS, TPROPRIEDADE.LOGADO, TIniUtils.VALOR_FALSO);

  TFormUtils.MostrarFormulario<TfrmAutenticar>(frmAutenticar, Self);
end;

end.
