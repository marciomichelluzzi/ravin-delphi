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

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TdmRavin.cnxBancoDeDadosAfterConnect(Sender: TObject);
var
  LCriarBaseDados: Boolean;
  LCaminhoBaseDados : String;
begin
  LCaminhoBaseDados := 'C:\ProgramData\MySQL\MySQL Server 8.0\Data\ravin\pessoa.ibd';
  LCriarBaseDados := not FileExists(LCaminhoBaseDados);

    if (LCriarBaseDados) then
  begin
    CriarTabelas;
    InserirDados;
  end;
end;

procedure TdmRavin.cnxBancoDeDadosBeforeConnect(Sender: TObject);
var
  LCriarBaseDados: Boolean;
begin
  LCriarBaseDados := not FileExists('C:\ProgramData\MySQL\MySQL Server 8.0\Data\ravin\mesa.idb');
  with cnxBancoDeDados do
  begin
    Params.Values['Server'] := 'localhost';
    Params.Values['User_Name'] := 'root';
    Params.Values['Password'] := 'root';
    Params.Values['DriverID'] := 'MySQL';
    Params.Values['Port'] := '3306';

    if not(LCriarBaseDados) then
    begin
      Params.Values['Database'] := 'ravin';
    end;
  end;
end;

procedure TdmRavin.CriarTabelas;
var
  LSqlArquivoScripts: TStringList;
  LCaminhoArquivo: String;
begin
  LSqlArquivoScripts := TStringList.Create();
  LCaminhoArquivo := 'C:\Users\vgzampieri\Documents\ravin\database\createTable.sql';// NÃO DEVER SER FEITO ASSIM NO CASO CAMINHO ABSOLUTO
  LSqlArquivoScripts.LoadFromFile(LCaminhoArquivo);
  cnxBancoDeDados.ExecSQL(LSqlArquivoScripts.Text);
  FreeAndNil(LSqlArquivoScripts);
end;

procedure TdmRavin.DataModuleCreate(Sender: TObject);
begin
  if not (cnxBancoDeDados.Connected) then
  begin
    cnxBancoDeDados.Connected := true;
  end;
end;

procedure TdmRavin.InserirDados;
var
  LSqlArquivoScripts: TStringList;
  LCaminhoArquivo: String;
begin
  LSqlArquivoScripts := TStringList.Create();
  LCaminhoArquivo := 'C:\Users\vgzampieri\Documents\ravin\database\inserts.sql';// NÃO DEVER SER FEITO ASSIM
  LSqlArquivoScripts.LoadFromFile(LCaminhoArquivo);

  try
    cnxBancoDeDados.StartTransaction();
    cnxBancoDeDados.ExecSQL(LSqlArquivoScripts.Text);
    cnxBancoDeDados.Commit();
  except
    on E: Exception do
    begin
      cnxBancoDeDados.Rollback();
      ShowMessage(e.Message);
    end;
  end;

  FreeAndNil(LSqlArquivoScripts);
end;

end.
