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
    procedure PopularTabelas();
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
  LCriarBase: String;
begin
  LCriarBase := cnxBancoDeDados.Params.Values['CreateDatabase'];
  if LCriarBase.Equals('True') OR LCriarBase.Equals('true') then
  begin
    CriarTabelas();
    PopularTabelas();
  end
  else
  begin
    CriarTabelas();
  end;
end;

procedure TdmRavin.cnxBancoDeDadosBeforeConnect(Sender: TObject);
var
  LCaminhoBase: String;
  LCriarBase: String;
begin
  with cnxBancoDeDados do
  begin
    try
      LCaminhoBase := 'C:\ProgramData\MySQL\MySQL Server 5.7\Data\ravin\db.opt';
      LCriarBase := BoolToStr(not FileExists(Trim(LCaminhoBase)), True);
      Params.Values['CreateDatabase'] := LCriarBase;
      Params.Values['Port'] := '3306';
      Params.Values['Host'] := 'localhost';
      Params.Values['User_Name'] := 'root';
      Params.Values['Password'] := '132600';
      Params.Values['DriverID'] := 'MySQL';
      Params.Values['User_Name'] := 'root';

      if not LCriarBase.Equals('True') then begin
        Params.Values['Database'] := 'ravin';
      end;

    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  end;
end;

procedure TdmRavin.CriarTabelas;
var
  LSql: TStringList;
  LCaminhoAquivoScripts: String;
begin
  LSql := TStringList.Create();
  LCaminhoAquivoScripts := 'C:\projects\ravin\database\createTables.sql';
  LSql.LoadFromFile(LCaminhoAquivoScripts);
  cnxBancoDeDados.ExecSQL(LSql.Text);
  LSql.Free;
end;

procedure TdmRavin.DataModuleCreate(Sender: TObject);
begin
  if not cnxBancoDeDados.Connected then
  begin
    cnxBancoDeDados.Connected := True;
  end;
end;

procedure TdmRavin.PopularTabelas;
var
  LSql: TStringList;
  LCaminhoAquivoScripts: String;
begin
  LSql := TStringList.Create();
  LCaminhoAquivoScripts := 'C:\projects\ravin\database\insertValues.sql';
  LSql.LoadFromFile(LCaminhoAquivoScripts);

  cnxBancoDeDados.StartTransaction;

  try
    cnxBancoDeDados.ExecSQL(LSql.Text);
    cnxBancoDeDados.Commit;
  except
    on E: Exception do
    begin
      ShowMessage('Não conseguiu inserir os dados no banco');
      cnxBancoDeDados.Rollback;
    end;
  end;

  LSql.Free;
end;

end.
