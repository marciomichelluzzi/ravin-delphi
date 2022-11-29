unit UdmRavin;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.UI, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Dialogs;

type
  TdmRavin = class(TDataModule)
    cnxBancoDeDados: TFDConnection;
    drvBancoDeDados: TFDPhysMySQLDriverLink;
    wtcBancoDeDados: TFDGUIxWaitCursor;
    procedure DataModuleCreate(Sender: TObject);
    procedure cnxBancoDeDadosBeforeConnect(Sender: TObject);
    procedure cnxBancoDeDadosAfterConnect(Sender: TObject);
  private
    { Private declarations }
    procedure CriarTabelas();
    procedure InserirDados();
  public
    { Public declarations }
  end;

var
  dmRavin: TdmRavin;

implementation

uses UresourceUtils, UiniUtils;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TdmRavin.cnxBancoDeDadosAfterConnect(Sender: TObject);
var
  LCaminhoBaseDados: String;
  LCriarBaseDados: Boolean;
begin
  LCaminhoBaseDados := TIniUtils.lerPropriedade(TSECAO.BANCO,
    TPROPRIEDADE.CAMINHO_BANCO);
  LCriarBaseDados := not FileExists(LCaminhoBaseDados, true);

  If LCriarBaseDados then
  begin
    CriarTabelas();
    InserirDados();
  end;
end;

procedure TdmRavin.cnxBancoDeDadosBeforeConnect(Sender: TObject);
var
  LCaminhoBaseDados: String;
  LCriarBaseDados: Boolean;
begin
  LCaminhoBaseDados := TIniUtils.lerPropriedade(TSECAO.BANCO,
    TPROPRIEDADE.CAMINHO_BANCO);
  LCriarBaseDados := not FileExists(LCaminhoBaseDados, true);
  with cnxBancoDeDados do
  begin
    Params.Values['Server'] := TIniUtils.lerPropriedade(TSECAO.BANCO,
      TPROPRIEDADE.SERVIDOR_BANCO);
    Params.Values['User_Name'] := TIniUtils.lerPropriedade(TSECAO.BANCO,
      TPROPRIEDADE.USUARIO_BANCO);
    Params.Values['Password'] := TIniUtils.lerPropriedade(TSECAO.BANCO,
      TPROPRIEDADE.SENHA_BANCO);
    Params.Values['DriverID'] := TIniUtils.lerPropriedade(TSECAO.BANCO,
      TPROPRIEDADE.DRIVER_ID);
    Params.Values['Port'] := TIniUtils.lerPropriedade(TSECAO.BANCO,
      TPROPRIEDADE.PORTA_BANCO);

    if not LCriarBaseDados then
    begin
      Params.Values['Database'] := TIniUtils.lerPropriedade(TSECAO.BANCO,
        TPROPRIEDADE.NOME_BANCO);
    end;
  end;
end;

procedure TdmRavin.CriarTabelas;
begin
  try
    cnxBancoDeDados.ExecSQL(TResourceUtils.carregarArquivoResource
      ('createTables.sql', 'ravin'));
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TdmRavin.InserirDados;
begin
  try
    cnxBancoDeDados.StartTransaction();
    cnxBancoDeDados.ExecSQL(TResourceUtils.carregarArquivoResource
      ('insertValues.sql', 'ravin'));
    cnxBancoDeDados.Commit();
  except
    on E: Exception do
    begin
      cnxBancoDeDados.Rollback();
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TdmRavin.DataModuleCreate(Sender: TObject);
begin
  if not cnxBancoDeDados.Connected then
  begin
    cnxBancoDeDados.Connected := true;
  end;
end;

end.
