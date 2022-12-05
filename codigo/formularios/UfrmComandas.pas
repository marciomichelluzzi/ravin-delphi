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
  FireDAC.Comp.Client,

  Vcl.DBCtrls,
  Vcl.Mask,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmComandas = class(TForm)
    lblCadastroComanda: TLabel;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tblComandasBeforePost(DataSet: TDataSet);
    procedure tblComandaProdutosBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure SetarCamposAuditoriaComanda();
    procedure SetarCamposAuditoriaComandaProduto();
    procedure AtivarDatasets();
    procedure DesativarDatasets();
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
  UformUtils;

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
end;

procedure TfrmComandas.SetarCamposAuditoriaComanda();
var
  LLogin: String;
begin
  LLogin := TIniUtils.lerPropriedade(TSECAO.INFORMACOES_GERAIS,
    TPROPRIEDADE.LOGIN_ATUAL);
  if tblComandas.State = TDataSetState.dsInsert then
  begin
    tblComandascriadoPor.Value := LLogin;
    tblComandascriadoEm.Value := Now();
  end;
  tblComandasalteradoPor.Value := LLogin;
  tblComandasalteradoEm.Value := Now();
end;

procedure TfrmComandas.SetarCamposAuditoriaComandaProduto();
var
  LLogin: String;
begin
  LLogin := TIniUtils.lerPropriedade(TSECAO.INFORMACOES_GERAIS,
    TPROPRIEDADE.LOGIN_ATUAL);
  if tblComandaProdutos.State = TDataSetState.dsInsert then
  begin
    tblComandaProdutoscriadoPor.Value := LLogin;
    tblComandaProdutoscriadoEm.Value := Now();
  end;
  tblComandaProdutosalteradoPor.Value := LLogin;
  tblComandaProdutosalteradoEm.Value := Now();
end;

procedure TfrmComandas.tblComandaProdutosBeforePost(DataSet: TDataSet);
begin
  SetarCamposAuditoriaComandaProduto();
end;

procedure TfrmComandas.tblComandasBeforePost(DataSet: TDataSet);
begin
  SetarCamposAuditoriaComanda();
end;

end.
