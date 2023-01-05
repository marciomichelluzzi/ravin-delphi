unit UfrmComandas;

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
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.DBCtrls,
  Vcl.Mask,
  Vcl.Grids,
  Vcl.DBGrids,

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
  TfrmComandas = class(TForm)
    tblComandas: TFDTable;
    dtsComandas: TDataSource;
    tblComandasid: TFDAutoIncField;
    tblComandasmesaId: TIntegerField;
    tblComandasclienteId: TIntegerField;
    tblComandascodigo: TStringField;
    tblComandasvalor: TSingleField;
    tblComandascriadoEm: TDateTimeField;
    tblComandascriadoPor: TStringField;
    tblComandasalteradoEm: TDateTimeField;
    tblComandasalteradoPor: TStringField;
    tblMesas: TFDTable;
    dtsMesas: TDataSource;
    dtsPessoas: TDataSource;
    tblPessoas: TFDTable;
    lblId: TLabel;
    lblValor: TLabel;
    lblCliente: TLabel;
    lblCodigo: TLabel;
    lblMesa: TLabel;
    edtId: TDBEdit;
    edtCodigo: TDBEdit;
    edtValor: TDBEdit;
    lcbAtendente: TDBLookupComboBox;
    lcbStatus: TDBLookupComboBox;
    dbnMesas: TDBNavigator;
    tblComandaslookupMesaNome: TStringField;
    tblComandaslookupClienteNome: TStringField;
    dbgComandas: TDBGrid;
    pnlItensComanda: TPanel;
    dbgComandaProdutos: TDBGrid;
    dtsComandaProdutos: TDataSource;
    lblListaMesas: TLabel;
    lblListaProdutosComanda: TLabel;
    tblComandasstatusComandaId: TIntegerField;
    tblStatusComanda: TFDTable;
    dtsStatusComanda: TDataSource;
    tblComandaslookupStatusComandaNome: TStringField;
    tblComandaProdutos: TFDTable;
    tblComandaProdutosid: TFDAutoIncField;
    tblComandaProdutosprodutoId: TIntegerField;
    tblComandaProdutosstatusComandaProdutoId: TIntegerField;
    tblComandaProdutosquantidade: TLongWordField;
    tblComandaProdutosvalorTotal: TFloatField;
    tblComandaProdutoscriadoEm: TDateTimeField;
    tblComandaProdutoscriadoPor: TStringField;
    tblComandaProdutosalteradoEm: TDateTimeField;
    tblComandaProdutosalteradoPor: TStringField;
    tblProdutos: TFDTable;
    dtsProdutos: TDataSource;
    tblComandaProdutoslookupProdutoNome: TStringField;
    dbnComandaProdutos: TDBNavigator;
    tblComandaProdutoscomandaId: TIntegerField;
    tblComandaProdutoslookupComandaCodigo: TStringField;
    pnlComanda: TPanel;
    tblStatusComandaProduto: TFDTable;
    dtsStatusComandaProduto: TDataSource;
    tblComandaProdutoslookupStatusComandaProdutoNome: TStringField;
    pnlInformacoesGerenciais: TPanel;
    lblInformacoesGerenciaisTitulo: TLabel;
    pnlCadastroComanda: TPanel;
    lblCadastroComanda: TLabel;
    qryInformacoesGerenciais: TFDQuery;
    Shape3: TShape;
    lblTotalComandas: TLabel;
    lblTotalComandasValor: TLabel;
    lblComandasPagas: TLabel;
    Shape6: TShape;
    lblComandasPagasValor: TLabel;
    Shape7: TShape;
    lblComandasEmAberto: TLabel;
    lblComandasEmAbertoValor: TLabel;
    Shape1: TShape;
    lblComandasFechadas: TLabel;
    lblComandasFechadasValor: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tblComandasBeforePost(DataSet: TDataSet);
    procedure tblComandaProdutosBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure tblComandasUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure tblComandasNewRecord(DataSet: TDataSet);
    procedure dbgComandasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgComandaProdutosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure SetarCamposAuditoriaComanda();
    procedure SetarCamposAuditoriaComandaProduto();
    procedure AtivarDatasets();
    procedure DesativarDatasets();
    procedure CarregarInformacoesGerenciais();
  public
    { Public declarations }
  end;

var
  frmComandas: TfrmComandas;

implementation

{$R *.dfm}

uses
  UdmRavin,
  UiniUtils,
  UformUtils, UhackDBGrid;

procedure TfrmComandas.AtivarDatasets;
begin
  tblComandas.Active := true;
  tblComandaProdutos.Active := true;
  tblMesas.Active := true;
  tblPessoas.Active := true;
  tblPessoas.Active := true;
  tblStatusComanda.Active := true;
  tblStatusComandaProduto.Active := true;
end;

procedure TfrmComandas.CarregarInformacoesGerenciais;
begin
  qryInformacoesGerenciais.Active := false;
  qryInformacoesGerenciais.Active := true;

  qryInformacoesGerenciais.First;

  lblTotalComandasValor.Caption := IntToStr(qryInformacoesGerenciais.Fields[0].AsInteger);
  lblComandasEmAbertoValor.Caption := IntToStr(qryInformacoesGerenciais.Fields[1].AsInteger);
  lblComandasFechadasValor.Caption := IntToStr(qryInformacoesGerenciais.Fields[2].AsInteger);
  lblComandasPagasValor.Caption := IntToStr(qryInformacoesGerenciais.Fields[3].AsInteger);
  qryInformacoesGerenciais.Active := false;
end;

procedure TfrmComandas.dbgComandaProdutosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  UhackDBGrid.SetarLinhaSelecionada(THackDBGrid(dbgComandaProdutos), State, Rect, DataCol, Column);
end;

procedure TfrmComandas.dbgComandasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  UhackDBGrid.SetarLinhaSelecionada(THackDBGrid(dbgComandas), State, Rect, DataCol, Column);
end;

procedure TfrmComandas.DesativarDatasets;
begin
  tblComandas.Active := false;
  tblComandaProdutos.Active := false;
  tblMesas.Active := false;
  tblPessoas.Active := false;
  tblPessoas.Active := false;
  tblStatusComanda.Active := false;
  tblStatusComandaProduto.Active := false;
end;

procedure TfrmComandas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DesativarDatasets();
  Action := caFree;
  frmComandas := nil;
end;

procedure TfrmComandas.FormCreate(Sender: TObject);
begin
  AtivarDatasets();
end;

procedure TfrmComandas.FormShow(Sender: TObject);
begin
  TFormUtils.AlinharCamposDBEdit<TfrmComandas>(Self);
  CarregarInformacoesGerenciais();
end;

procedure TfrmComandas.SetarCamposAuditoriaComanda();
var
  LLogin: String;
begin
  LLogin := TIniUtils.lerPropriedade(TSECAO.INFORMACOES_GERAIS, TPROPRIEDADE.LOGIN_ATUAL);
  if tblComandas.State = TDataSetState.dsInsert then
  begin
    tblComandascriadoPor.AsString := LLogin;
    tblComandascriadoEm.AsDateTime := Now();
  end;
  tblComandasalteradoPor.AsString := LLogin;
  tblComandasalteradoEm.AsDateTime := Now();
end;

procedure TfrmComandas.SetarCamposAuditoriaComandaProduto();
var
  LLogin: String;
begin
  LLogin := TIniUtils.lerPropriedade(TSECAO.INFORMACOES_GERAIS, TPROPRIEDADE.LOGIN_ATUAL);
  if tblComandaProdutos.State = TDataSetState.dsInsert then
  begin
    tblComandaProdutoscriadoPor.AsString := LLogin;
    tblComandaProdutoscriadoEm.AsDateTime := Now();
  end;
  tblComandaProdutosalteradoPor.AsString := LLogin;
  tblComandaProdutosalteradoEm.AsDateTime := Now();
end;

procedure TfrmComandas.tblComandaProdutosBeforePost(DataSet: TDataSet);
begin
  SetarCamposAuditoriaComandaProduto();
end;

procedure TfrmComandas.tblComandasBeforePost(DataSet: TDataSet);
begin
  SetarCamposAuditoriaComanda();
end;

procedure TfrmComandas.tblComandasNewRecord(DataSet: TDataSet);
begin
  CarregarInformacoesGerenciais();
end;

procedure TfrmComandas.tblComandasUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
  AOptions: TFDUpdateRowOptions);
begin
  CarregarInformacoesGerenciais();
end;

end.
