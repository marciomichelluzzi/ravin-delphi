unit UfrmProdutos;

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
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ExtCtrls,
  Vcl.DBCtrls,
  Vcl.StdCtrls,
  Vcl.Mask,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmProdutos = class(TForm)
    dbnProdutos: TDBNavigator;
    edtId: TDBEdit;
    lblId: TLabel;
    lblNome: TLabel;
    edtNome: TDBEdit;
    lblCadastroProduto: TLabel;
    lblDescricao: TLabel;
    lblPrecoCusto: TLabel;
    LabelCode: TLabel;
    edtCodigo: TDBEdit;
    edtPrecoCusto: TDBEdit;
    edtPrecoVenda: TDBEdit;
    edtTempoPreparo: TDBEdit;
    lblPrecoVenda: TLabel;
    lblTempoPreparo: TLabel;
    lblObservacoes: TLabel;
    tblProdutos: TFDTable;
    tblProdutosid: TFDAutoIncField;
    tblProdutosnome: TStringField;
    tblProdutosdescricao: TStringField;
    tblProdutoscodigo: TStringField;
    tblProdutosprecoCusto: TFloatField;
    tblProdutosprecoVenda: TFloatField;
    tblProdutostempoDePreparo: TTimeField;
    tblProdutosobservacoes: TStringField;
    tblProdutosativo: TBooleanField;
    tblProdutoscriadoEm: TDateTimeField;
    tblProdutoscriadoPor: TStringField;
    tblProdutosalteradoEm: TDateTimeField;
    tblProdutosalteradoPor: TStringField;
    dsProdutos: TDataSource;
    cbxAtivo: TDBCheckBox;
    lblAtivo: TLabel;
    memDescricao: TDBMemo;
    memObservacoes: TDBMemo;
    pnlCadastroProdutos: TPanel;
    pnlListaProdutos: TPanel;
    lblListaProdutos: TLabel;
    grdProdutos: TDBGrid;
    pnlInformacoesGerenciais: TPanel;
    Label2: TLabel;
    shpTotalProduos: TShape;
    shpProdutosDisponiveis: TShape;
    lblProdutosDisponiveis: TLabel;
    lblProdutosDisponiveisValor: TLabel;
    shpProdutosIndisponiveis: TShape;
    lblProdutosIndisponiveis: TLabel;
    lblProdutosIndisponiveisValor: TLabel;
    lblTotalProdutos: TLabel;
    lblTotalProdutosValor: TLabel;
    qryInformacoesGerenciais: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure tblProdutosBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure grdProdutosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tblProdutosNewRecord(DataSet: TDataSet);
    procedure tblProdutosUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
  private
    procedure SetarCamposAuditoriaProduto();
    procedure AtivarDatasets();
    procedure DesativarDatasets();
    procedure CarregarInformacoesGerenciais();
  public

  end;

var
  frmProdutos: TfrmProdutos;

implementation

{$R *.dfm}

uses
  UdmRavin,
  UformUtils,
  UiniUtils,
  UhackDBGrid;

procedure TfrmProdutos.AtivarDatasets;
begin
  tblProdutos.Active := true;
end;

procedure TfrmProdutos.CarregarInformacoesGerenciais;
begin
  qryInformacoesGerenciais.Active := false;
  qryInformacoesGerenciais.Active := true;

  qryInformacoesGerenciais.First;

  lblTotalProdutosValor.Caption := IntToStr(qryInformacoesGerenciais.Fields[0].AsInteger);
  lblProdutosDisponiveisValor.Caption := IntToStr(qryInformacoesGerenciais.Fields[1].AsInteger);
  lblProdutosIndisponiveisValor.Caption := IntToStr(qryInformacoesGerenciais.Fields[2].AsInteger);
  qryInformacoesGerenciais.Active := false;
end;

procedure TfrmProdutos.DesativarDatasets;
begin
  tblProdutos.Active := false;
end;

procedure TfrmProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DesativarDatasets();
  Action := caFree;
  frmProdutos := nil;
end;

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin
  AtivarDatasets();
  CarregarInformacoesGerenciais();
end;

procedure TfrmProdutos.FormShow(Sender: TObject);
begin
  TFormUtils.AlinharCamposDBEdit<TfrmProdutos>(Self);
end;

procedure TfrmProdutos.grdProdutosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  UhackDBGrid.SetarLinhaSelecionada(THackDBGrid(grdProdutos), State, Rect, DataCol, Column);
end;

procedure TfrmProdutos.SetarCamposAuditoriaProduto();
var
  LLogin: String;
begin
  LLogin := TIniUtils.lerPropriedade(TSECAO.INFORMACOES_GERAIS, TPROPRIEDADE.LOGIN_ATUAL);
  if tblProdutos.State = TDataSetState.dsInsert then
  begin
    tblProdutoscriadoPor.AsString := LLogin;
    tblProdutoscriadoEm.AsDateTime := Now();
  end;
  tblProdutosalteradoPor.AsString := LLogin;
  tblProdutosalteradoEm.AsDateTime := Now();
end;

procedure TfrmProdutos.tblProdutosBeforePost(DataSet: TDataSet);
begin
  SetarCamposAuditoriaProduto();
end;

procedure TfrmProdutos.tblProdutosNewRecord(DataSet: TDataSet);
begin
  CarregarInformacoesGerenciais();
end;

procedure TfrmProdutos.tblProdutosUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
  AOptions: TFDUpdateRowOptions);
begin
  CarregarInformacoesGerenciais();
end;

end.
