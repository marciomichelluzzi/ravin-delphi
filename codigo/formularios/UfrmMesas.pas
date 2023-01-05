unit UfrmMesas;

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
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ExtCtrls,
  Vcl.DBCtrls,
  Vcl.Mask,

  Data.DB,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmMesas = class(TForm)
    tblMesas: TFDTable;
    dsMesas: TDataSource;
    lblCadastroMesa: TLabel;
    DBNavigatorMesas: TDBNavigator;
    lblId: TLabel;
    lblNome: TLabel;
    lblNumero: TLabel;
    lblStatus: TLabel;
    lblCodigo: TLabel;
    edtId: TDBEdit;
    edtNome: TDBEdit;
    edtCodigo: TDBEdit;
    edtNumero: TDBEdit;
    edtQtdMaxPessoas: TDBEdit;
    lblQtdMaxPessoas: TLabel;
    lblAtendente: TLabel;
    cbxAtendente: TDBLookupComboBox;
    dsPessoas: TDataSource;
    tblMesasid: TFDAutoIncField;
    tblMesasnome: TStringField;
    tblMesascodigo: TStringField;
    tblMesasnumero: TLongWordField;
    tblMesasquantidadeMaximaPessoas: TLongWordField;
    tblMesascriadoEm: TDateTimeField;
    tblMesascriadoPor: TStringField;
    tblMesasalteradoEm: TDateTimeField;
    tblMesasalteradoPor: TStringField;
    tblMesasatendenteId: TIntegerField;
    tblMesaslookupAtendenteNome: TStringField;
    qryPessoas: TFDQuery;
    qryPessoasid: TFDAutoIncField;
    qryPessoasnome: TStringField;
    qryPessoastipoPessoa: TStringField;
    qryPessoascpf: TStringField;
    qryPessoastelefone: TLongWordField;
    qryPessoasativo: TBooleanField;
    qryPessoascriadoEm: TDateTimeField;
    qryPessoascriadoPor: TStringField;
    qryPessoasalteradoEm: TDateTimeField;
    qryPessoasalteradoPor: TStringField;
    cbxStatus: TDBLookupComboBox;
    tblStatusMesa: TFDTable;
    dsStatusMesa: TDataSource;
    tblMesaslookupStatusMesa: TStringField;
    tblMesasstatusMesaId: TIntegerField;
    pnlCadastroMesas: TPanel;
    tblStatusMesaid: TFDAutoIncField;
    tblStatusMesanome: TStringField;
    pnlListaMesas: TPanel;
    grdMesas: TDBGrid;
    lblListaMesas: TLabel;
    pnlInformacoesGerenciais: TPanel;
    Shape3: TShape;
    Shape6: TShape;
    Shape7: TShape;
    lblInformacoesGenerenciaisTitulo: TLabel;
    qryInformacoesGerenciais: TFDQuery;
    lblTotalMesas: TLabel;
    lblMesasDisponiveis: TLabel;
    lblMesasReservadas: TLabel;
    Shape1: TShape;
    lblMesasOcupadas: TLabel;
    lblTotalMesasValor: TLabel;
    lblMesasDisponiveisValor: TLabel;
    lblMesasReservadasValor: TLabel;
    lblMesasOcupadasValor: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure tblMesasBeforePost(DataSet: TDataSet);
    procedure tblMesasNewRecord(DataSet: TDataSet);
    procedure tblMesasUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure grdMesasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure SetarCamposAuditoriaMesa();
    procedure AtivarDatasets();
    procedure DesativarDatasets();
    procedure CarregarInformacoesGerenciais();
  public
    { Public declarations }
  end;

var
  frmMesas: TfrmMesas;

implementation

{$R *.dfm}

uses UdmRavin, UformUtils, UiniUtils, UhackDBGrid;

procedure TfrmMesas.AtivarDatasets;
begin
  tblMesas.Active := true;
  tblStatusMesa.Active := true;
  qryPessoas.Active := true;
end;

procedure TfrmMesas.CarregarInformacoesGerenciais;
begin
  qryInformacoesGerenciais.Active := false;
  qryInformacoesGerenciais.Active := true;

  qryInformacoesGerenciais.First;

  lblTotalMesasValor.Caption := IntToStr(qryInformacoesGerenciais.Fields[0].AsInteger);
  lblMesasDisponiveisValor.Caption := IntToStr(qryInformacoesGerenciais.Fields[1].AsInteger);
  lblMesasReservadasValor.Caption := IntToStr(qryInformacoesGerenciais.Fields[2].AsInteger);
  lblMesasOcupadasValor.Caption := IntToStr(qryInformacoesGerenciais.Fields[3].AsInteger);
  qryInformacoesGerenciais.Active := false;
end;

procedure TfrmMesas.DesativarDatasets;
begin
  tblMesas.Active := false;
  tblStatusMesa.Active := false;
  qryPessoas.Active := false;
end;

procedure TfrmMesas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DesativarDatasets();
  Action := caFree;
  frmMesas := nil;
end;

procedure TfrmMesas.FormCreate(Sender: TObject);
begin
  AtivarDatasets();
end;

procedure TfrmMesas.FormShow(Sender: TObject);
begin
  TFormUtils.AlinharCamposDBEdit<TfrmMesas>(Self);
  CarregarInformacoesGerenciais();
end;

procedure TfrmMesas.grdMesasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  UhackDBGrid.SetarLinhaSelecionada(THackDBGrid(grdMesas), State, Rect, DataCol, Column);
end;

procedure TfrmMesas.SetarCamposAuditoriaMesa;
var
  LLogin: String;
begin
  LLogin := TIniUtils.lerPropriedade(TSECAO.INFORMACOES_GERAIS, TPROPRIEDADE.LOGIN_ATUAL);
  if tblMesas.State = TDataSetState.dsInsert then
  begin
    tblMesascriadoPor.AsString := LLogin;
    tblMesascriadoEm.AsDateTime := Now();
  end;
  tblMesasalteradoPor.AsString := LLogin;
  tblMesasalteradoEm.AsDateTime := Now();
end;

procedure TfrmMesas.tblMesasBeforePost(DataSet: TDataSet);
begin
  SetarCamposAuditoriaMesa();
end;

procedure TfrmMesas.tblMesasNewRecord(DataSet: TDataSet);
begin
  CarregarInformacoesGerenciais();
end;

procedure TfrmMesas.tblMesasUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  CarregarInformacoesGerenciais();
end;

end.
