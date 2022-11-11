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
  Vcl.Dialogs, Vcl.StdCtrls, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Mask;

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
    procedure tblMesasBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMesas: TfrmMesas;

implementation

{$R *.dfm}

uses UdmRavin;

procedure TfrmMesas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  tblMesas.Active := false;
  tblStatusMesa.Active := false;
  qryPessoas.Active := false;
  frmMesas := nil;
end;

procedure TfrmMesas.FormCreate(Sender: TObject);
begin
  tblMesas.Active := true;
  tblStatusMesa.Active := true;
  qryPessoas.Active := true;
end;

procedure TfrmMesas.FormShow(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
    if Self.Components[i] is TDBEdit then
      TDBEdit(Self.Components[i]).Field.Alignment := taLeftJustify;
end;


procedure TfrmMesas.tblMesasBeforePost(DataSet: TDataSet);
begin
  if tblMesas.State = TDataSetState.dsInsert then
  begin
    tblMesascriadoPor.Value := 'Marcio';
    tblMesascriadoEm.Value := Now();
  end;
  tblMesasalteradoPor.Value := 'Marcio';
  tblMesasalteradoEm.Value := Now();
end;

end.
