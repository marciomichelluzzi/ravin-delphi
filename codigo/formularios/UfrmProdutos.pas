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

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ExtCtrls,
  Vcl.DBCtrls,
  Vcl.StdCtrls,
  Vcl.Mask;

type
  TfrmProdutos = class(TForm)
    dbnProducts: TDBNavigator;
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
    grdProducts: TDBGrid;
    Panel2: TPanel;
    Shape3: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure tblProdutosBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    procedure SetarCamposAuditoriaProduto();
    procedure AtivarDatasets();
    procedure DesativarDatasets();
  public

  end;

var
  frmProdutos: TfrmProdutos;

implementation

{$R *.dfm}

uses
  UdmRavin,
  UformUtils,
  UiniUtils;

procedure TfrmProdutos.AtivarDatasets;
begin
  tblProdutos.Active := true;
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
end;

procedure TfrmProdutos.FormShow(Sender: TObject);
begin
  TFormUtils.AlinharCamposDBEdit<TfrmProdutos>(Self);
end;

procedure TfrmProdutos.SetarCamposAuditoriaProduto();
var
  LLogin: String;
begin
  LLogin := TIniUtils.lerPropriedade(TSECAO.INFORMACOES_GERAIS,
    TPROPRIEDADE.LOGIN_ATUAL);
  if tblProdutos.State = TDataSetState.dsInsert then
  begin
    tblProdutoscriadoPor.Value := LLogin;
    tblProdutoscriadoEm.Value := Now();
  end;
  tblProdutosalteradoPor.Value := LLogin;
  tblProdutosalteradoEm.Value := Now();
end;

procedure TfrmProdutos.tblProdutosBeforePost(DataSet: TDataSet);
begin
  SetarCamposAuditoriaProduto();
end;

end.
