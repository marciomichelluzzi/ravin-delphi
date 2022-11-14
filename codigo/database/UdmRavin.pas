unit UdmRavin;

interface

uses
  System.SysUtils,
  System.Classes,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.UI,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,

  Vcl.Dialogs;

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

uses UResourceUtils;
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
begin
  cnxBancoDeDados.ExecSQL(TResourcesUtils.CarregarResourcesTexto
    ('createTables.sql', 'ravin'));
end;

procedure TdmRavin.DataModuleCreate(Sender: TObject);
begin
  if not cnxBancoDeDados.Connected then
  begin
    cnxBancoDeDados.Connected := True;
  end;
end;

procedure TdmRavin.PopularTabelas;
begin
  cnxBancoDeDados.ExecSQL(TResourcesUtils.CarregarResourcesTexto
    ('insertValues.sql', 'ravin'));
end;

end.
