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
  public
    { Public declarations }
  end;

var
  frmComandas: TfrmComandas;

implementation

{$R *.dfm}

uses UdmRavin;

procedure TfrmComandas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  tblComandas.Active := false;
  tblComandaProdutos.Active := false;
  tblMesas.Active := false;
  tblPessoas.Active := false;
  tblPessoas.Active := false;
  tblStatusComanda.Active := false;
  tblStatusComandaProduto.Active := false;
  frmComandas := nil;
end;

procedure TfrmComandas.FormCreate(Sender: TObject);
begin
  tblComandas.Active := true;
  tblComandaProdutos.Active := true;
  tblMesas.Active := true;
  tblPessoas.Active := true;
  tblPessoas.Active := true;
  tblStatusComanda.Active := true;
  tblStatusComandaProduto.Active := true;
end;

procedure TfrmComandas.FormShow(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
    if Self.Components[i] is TDBEdit then
      TDBEdit(Self.Components[i]).Field.Alignment := taLeftJustify;
end;

procedure TfrmComandas.tblComandaProdutosBeforePost(DataSet: TDataSet);
begin
  if tblComandaProdutos.State = TDataSetState.dsInsert then
  begin
    tblComandaProdutoscriadoPor.Value := 'Marcio';
    tblComandaProdutoscriadoEm.Value := Now();
  end;
  tblComandaProdutosalteradoPor.Value := 'Marcio';
  tblComandaProdutosalteradoEm.Value := Now();
end;

procedure TfrmComandas.tblComandasBeforePost(DataSet: TDataSet);
begin
  if tblComandas.State = TDataSetState.dsInsert then
  begin
    tblComandascriadoPor.Value := 'Marcio';
    tblComandascriadoEm.Value := Now();
  end;
  tblComandasalteradoPor.Value := 'Marcio';
  tblComandasalteradoEm.Value := Now();
end;

end.
