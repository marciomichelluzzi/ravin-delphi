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
  Vcl.Mask,
  Vcl.NumberBox,

  UfrmBotaoPrimario,
  UfrmBotaoCancelar,
  UfrmBotaoExcluir,

  Upessoa;

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
    nmbId: TNumberBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure frmBotaoCancelarspbBotaoCancelarClick(Sender: TObject);
    procedure lvwClientesSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure frmBotaoCancelar1spbBotaoCancelarClick(Sender: TObject);
    procedure frmBotaoInserirspbBotaoPrimarioClick(Sender: TObject);
    procedure frmBotaoExcluirRegistrospbBotaoExcluirClick(Sender: TObject);
    procedure frmBotaoSalvarRegistrospbBotaoPrimarioClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarListaClientes();
    procedure CarregarCliente(PClienteId: Integer);
    procedure DesalocarClientes(var PListaClientes: TList<TPessoa>);
    procedure SetarCamposCadastroCliente(PCliente: TPessoa);
    procedure LimparCamposCadastroCliente();
    procedure MostrarCadastroCliente();
    procedure MostrarListaClientes();
    procedure ExcluirCliente();
    procedure SalvarCliente();
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

uses
  UformUtils,
  UpessoaDao,
  UiniUtils;

{$R *.dfm}

procedure TfrmClientes.CarregarCliente(PClienteId: Integer);
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

procedure TfrmClientes.ExcluirCliente;
var
  LPessoaDAO: TPessoaDAO;
begin
  try
    try
      LPessoaDAO := TPessoaDAO.Create();
      LPessoaDAO.DeletarClientePorCPF(mskCpf.Text);

      ShowMessage('Cliente excluído com sucesso');

      MostrarListaClientes();

    except
      on E: Exception do
        ShowMessage('Você não pode excluir esse cliente pois ele já tem um histórico de comandas no sistema');
    end;
  finally
    FreeAndNil(LPessoaDAO);
  end;
end;

procedure TfrmClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmClientes := nil;
end;

procedure TfrmClientes.FormShow(Sender: TObject);
begin
  MostrarListaClientes();
end;

procedure TfrmClientes.frmBotaoCancelar1spbBotaoCancelarClick(Sender: TObject);
begin
  MostrarListaClientes();
end;

procedure TfrmClientes.frmBotaoCancelarspbBotaoCancelarClick(Sender: TObject);
begin
  Self.Close();
end;

procedure TfrmClientes.frmBotaoExcluirRegistrospbBotaoExcluirClick(Sender: TObject);
begin
  ExcluirCliente();
end;

procedure TfrmClientes.frmBotaoInserirspbBotaoPrimarioClick(Sender: TObject);
begin
  LimparCamposCadastroCliente();
  MostrarCadastroCliente();
end;

procedure TfrmClientes.frmBotaoSalvarRegistrospbBotaoPrimarioClick(Sender: TObject);
begin
  SalvarCliente();
end;

procedure TfrmClientes.LimparCamposCadastroCliente;
begin
  nmbId.ValueInt := 0;
  edtNome.Text := '';
  mskCpf.Text := '';
  edtTelefone.Text := '';
  dtpDataNascimento.DateTime := Now();
end;

procedure TfrmClientes.lvwClientesSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  CarregarCliente(Integer(Item.Data));
  MostrarCadastroCliente();
end;

procedure TfrmClientes.MostrarCadastroCliente;
begin
  pnlCadastroCliente.Visible := true;
  pnlInformacoesGerenciais.Visible := false;
  pnlListaClientes.Visible := false;
end;

procedure TfrmClientes.MostrarListaClientes;
begin
  CarregarListaClientes();
  pnlListaClientes.Visible := true;
  pnlInformacoesGerenciais.Visible := true;
  pnlCadastroCliente.Visible := false;
end;

procedure TfrmClientes.SalvarCliente;
var
  LCliente: TPessoa;
  LPessoaDAO: TPessoaDAO;
begin
  try
    try
      LPessoaDAO := TPessoaDAO.Create();
      LCliente := TPessoa.Create();

      LCliente.id := nmbId.ValueInt;
      LCliente.nome := edtNome.Text;
      LCliente.tipoPessoa := 'C';
      LCliente.dataNascimento := dtpDataNascimento.Date;
      LCliente.cpf := mskCpf.Text;
      LCliente.ativo := true;
      LCliente.alteradoEm := Now();
      LCliente.alteradoPor := 'admin';

      if LCliente.id = 0 then
      begin
        LCliente.criadoEm := Now();
        LCliente.criadoPor := 'admin';
      end;

      LPessoaDAO.SalvarCliente(LCliente);
      ShowMessage('Cliente salvo com sucesso');
      MostrarListaClientes();
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;
  finally
    FreeAndNil(LPessoaDAO);
    FreeAndNil(LCliente);
  end;
end;

procedure TfrmClientes.SetarCamposCadastroCliente(PCliente: TPessoa);
begin
  nmbId.ValueInt := PCliente.id;
  edtNome.Text := PCliente.nome;
  mskCpf.Text := PCliente.cpf;
  edtTelefone.Text := IntToStr(PCliente.telefone);
  dtpDataNascimento.DateTime := PCliente.dataNascimento;
end;

end.
