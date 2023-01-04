unit UfrmClientes;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Generics.Collections,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,

  UfrmBotaoPrimario,
  UfrmBotaoCancelar,

  Upessoa, UfrmBotaoExcluir, Vcl.Mask;

type
  TfrmClientes = class(TForm)
    frmBotaoInserir: TfrmBotaoPrimario;
    frmBotaoFecharTela: TfrmBotaoCancelar;
    lvwClientes: TListView;
    pnlListaClientes: TPanel;
    lblListaClientesTitulo: TLabel;
    pnlInformacoesGerenciais: TPanel;
    lblInformacoesGerenciais: TLabel;
    Shape1: TShape;
    Shape5: TShape;
    Shape2: TShape;
    pnlCadastroCliente: TPanel;
    lblCadastroCliente: TLabel;
    edtNome: TEdit;
    edtTelefone: TEdit;
    mskCpf: TMaskEdit;
    dtpDataNascimento: TDateTimePicker;
    frmBotaoSalvarRegistro: TfrmBotaoPrimario;
    frmBotaoCancelarCadastro: TfrmBotaoCancelar;
    frmBotaoExcluirRegistro: TfrmBotaoExcluir;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure frmBotaoCancelarspbBotaoCancelarClick(Sender: TObject);
    procedure lvwClientesSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure frmBotaoCancelar1spbBotaoCancelarClick(Sender: TObject);
    procedure frmBotaoInserirspbBotaoPrimarioClick(Sender: TObject);
    procedure frmBotaoExcluirRegistrospbBotaoExcluirClick(Sender: TObject);
  private
    procedure CarregarListaClientes();
    procedure CarregarDadosRegistro(PClienteId: Integer);
    procedure DesalocarClientes(var PListaClientes: TList<TPessoa>);
    procedure SetarCamposCadastroCliente(PCliente: TPessoa);
  public

  end;

var
  frmClientes: TfrmClientes;

implementation

uses
  UformUtils,
  UpessoaDao;

{$R *.dfm}

procedure TfrmClientes.CarregarDadosRegistro(PClienteId: Integer);
var
  LPessoa: TPessoa;
  LPessoaDAO: TPessoaDAO;
begin
  try
    try
      LPessoaDAO := TPessoaDAO.Create();
      LPessoa := LPessoaDAO.CarregarClientePorId(PClienteId);

      if Assigned(LPessoa) then
      begin
        SetarCamposCadastroCliente(LPessoa);
      end
      else
      begin
        raise Exception.Create('Usuário não foi encontrado');
      end;
    except
      on E: Exception do
    end;
  finally
    if Assigned(LPessoa) then
    begin
      FreeAndNil(LPessoaDAO);
      FreeAndNil(LPessoa);
    end;
  end;
end;

procedure TfrmClientes.CarregarListaClientes;
var
  I: Integer;
  LPessoaDAO: TPessoaDAO;
  LListaClientes: TList<TPessoa>;
  LCliente: TPessoa;
  LItem: TListItem;
begin
  LPessoaDAO := TPessoaDAO.Create();
  try
    try
      LListaClientes := LPessoaDAO.CarregarListaClientes();

      lvwClientes.Items.Clear();

      for I := 0 to LListaClientes.Count - 1 do
      begin
        LCliente := LListaClientes.Items[I];
        LItem := lvwClientes.Items.add;
        LItem.Caption := LCliente.nome;
        LItem.Data := TObject(LCliente.id);
        LItem.SubItems.add(LCliente.cpf);
        LItem.SubItems.add(IntToStr(LCliente.telefone));
      end;

      DesalocarClientes(LListaClientes)
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  finally
    FreeAndNil(LPessoaDAO);
  end;

end;

procedure TfrmClientes.DesalocarClientes(var PListaClientes: TList<TPessoa>);
var
  I: Integer;
  LCliente: TPessoa;
begin
  for I := PListaClientes.Count - 1 downto 0 do
  begin
    LCliente := PListaClientes.Items[I];
    PListaClientes.Remove(LCliente);

    FreeAndNil(LCliente);
  end;
  FreeAndNil(PListaClientes);
end;

procedure TfrmClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmClientes := nil;
end;

procedure TfrmClientes.FormShow(Sender: TObject);
begin
  pnlListaClientes.Visible := true;
  CarregarListaClientes();
end;

procedure TfrmClientes.frmBotaoCancelar1spbBotaoCancelarClick(Sender: TObject);
begin
  pnlListaClientes.Visible := true;
  pnlCadastroCliente.Visible := false;
end;

procedure TfrmClientes.frmBotaoCancelarspbBotaoCancelarClick(Sender: TObject);
begin
  Self.Close();
end;

procedure TfrmClientes.frmBotaoExcluirRegistrospbBotaoExcluirClick
  (Sender: TObject);
var
  LPessoaDAO: TPessoaDAO;
begin
  try
    try
      LPessoaDAO := TPessoaDAO.Create();
      LPessoaDAO.DeletarClientePorCPF(mskCpf.Text);

      ShowMessage('Cliente excluído com sucesso');

      CarregarListaClientes();

      pnlListaClientes.Visible := true;
      pnlCadastroCliente.Visible := false;

    except
      on E: Exception do
        ShowMessage
          ('Você não pode excluir esse cliente pois ele já tem um histórico de comandas no sistema');
    end;
  finally
    FreeAndNil(LPessoaDAO);
  end;
end;

procedure TfrmClientes.frmBotaoInserirspbBotaoPrimarioClick(Sender: TObject);
begin
  pnlCadastroCliente.Visible := true;
  pnlListaClientes.Visible := false;
end;

procedure TfrmClientes.lvwClientesSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  pnlCadastroCliente.Visible := true;
  pnlListaClientes.Visible := false;
  CarregarDadosRegistro(Integer(Item.Data));
end;

procedure TfrmClientes.SetarCamposCadastroCliente(PCliente: TPessoa);
begin
  edtNome.Text := PCliente.nome;
  mskCpf.Text := PCliente.cpf;
  edtTelefone.Text := IntToStr(PCliente.telefone);
  dtpDataNascimento.DateTime := PCliente.dataNascimento;
end;

end.
