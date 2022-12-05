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
    lblListaMesas: TLabel;
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
    grdMesas: TDBGrid;
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
    pnlMesas: TPanel;
    tblStatusMesaid: TFDAutoIncField;
    tblStatusMesanome: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure SetarCamposAuditoriaMesa();
    procedure AtivarDatasets();
    procedure DesativarDatasets();
  public
    { Public declarations }
  end;

var
  frmMesas: TfrmMesas;

implementation

{$R *.dfm}

uses UdmRavin, UformUtils, UiniUtils;

procedure TfrmMesas.AtivarDatasets;
begin
  tblMesas.Active := true;
  tblStatusMesa.Active := true;
  qryPessoas.Active := true;
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
end;

procedure TfrmMesas.SetarCamposAuditoriaMesa;
var
  LLogin: String;
begin
  LLogin := TIniUtils.lerPropriedade(TSECAO.INFORMACOES_GERAIS,
    TPROPRIEDADE.LOGIN_ATUAL);
  if tblMesas.State = TDataSetState.dsInsert then
  begin
    tblMesascriadoPor.Value := LLogin;
    tblMesascriadoEm.Value := Now();
  end;
  tblMesasalteradoPor.Value := LLogin;
  tblMesasalteradoEm.Value := Now();
end;

end.
