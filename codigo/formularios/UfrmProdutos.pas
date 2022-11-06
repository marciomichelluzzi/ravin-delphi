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
    grdProducts: TDBGrid;
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
    lblListaProdutos: TLabel;
    cbxAtivo: TDBCheckBox;
    lblAtivo: TLabel;
    memDescricao: TDBMemo;
    memObservacoes: TDBMemo;
    pnlProdutos: TPanel;
    procedure FormShow(Sender: TObject);
    procedure tblProdutosBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

implementation

{$R *.dfm}

uses UdmRavin;

procedure TfrmProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  tblProdutos.Active := false;
  frmProdutos := nil;
end;

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin
  tblProdutos.Active := true;
end;

procedure TfrmProdutos.FormShow(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
    if Self.Components[i] is TDBEdit then
      TDBEdit(Self.Components[i]).Field.Alignment := taLeftJustify;
end;

procedure TfrmProdutos.tblProdutosBeforePost(DataSet: TDataSet);
begin
  if tblProdutos.State = TDataSetState.dsInsert then
  begin
    tblProdutoscriadoPor.Value := 'Marcio';
    tblProdutoscriadoEm.Value := Now();
  end;
  tblProdutosalteradoPor.Value := 'Marcio';
  tblProdutosalteradoEm.Value := Now();
end;

end.
