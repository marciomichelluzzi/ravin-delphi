unit UfrmListaClientes;

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
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,

  UfrmBotaoPrimario,
  UfrmBotaoCancelar;

type
  TfrmListaClientes = class(TForm)
    frmBotaoPrimario: TfrmBotaoPrimario;
    frmBotaoCancelar: TfrmBotaoCancelar;
    lvwClientes: TListView;
    Shape1: TShape;
    Shape2: TShape;
    Shape5: TShape;
    lblInformacoesGerenciais: TLabel;
    pnlListaClientes: TPanel;
    lblListaClientesTitulo: TLabel;
    procedure frmBotaoPrimariospbBotaoPrimarioClick(Sender: TObject);
    procedure frmBotaoCancelarspbBotaoCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure CarregarListaClientes();
  public
    { Public declarations }
  end;

var
  frmListaClientes: TfrmListaClientes;

implementation

uses
  UfrmCadastroCliente,
  UformUtils;

{$R *.dfm}

procedure TfrmListaClientes.CarregarListaClientes;
begin
  // Criaria um objeto de PessoaDAO
  // Carregaria a lista de Pessoas
  // Varreria essa lista de pessoas
  // Para cada pessoa, criaria um item na TListView
  // Seta as informações do item criado
  // Destruiria a os objetos de pessoa
  // Destruiria a lista de pessoas
end;

procedure TfrmListaClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmListaClientes := nil;
end;

procedure TfrmListaClientes.FormShow(Sender: TObject);
begin
  CarregarListaClientes();
end;

procedure TfrmListaClientes.frmBotaoCancelarspbBotaoCancelarClick
  (Sender: TObject);
begin
  Close();
end;

procedure TfrmListaClientes.frmBotaoPrimariospbBotaoPrimarioClick
  (Sender: TObject);
var
  LItem: TListItem;
begin
  TFormUtils.MostrarFormulario<TfrmListaClientes>(frmListaClientes, Self);
end;

end.
