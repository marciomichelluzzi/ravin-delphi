program Ravin;

uses
  Vcl.Forms,
  UfrmLogomarca in '..\codigo\frames\UfrmLogomarca.pas' {frmLogo: TFrame},
  UdmRavin in '..\codigo\database\UdmRavin.pas' {dmRavin: TDataModule},
  UfrmSplash in '..\codigo\formularios\UfrmSplash.pas' {frmSplash},
  UfrmMesas in '..\codigo\formularios\UfrmMesas.pas' {frmMesas},
  UfrmSobre in '..\codigo\formularios\UfrmSobre.pas' {frmSobre},
  UfrmProdutos in '..\codigo\formularios\UfrmProdutos.pas' {frmProdutos},
  UfrmPainelGestao in '..\codigo\formularios\UfrmPainelGestao.pas' {frmPainelGestao},
  UfrmComandas in '..\codigo\formularios\UfrmComandas.pas' {frmComandas},
  UresourceUtils in '..\codigo\util\UresourceUtils.pas',
  Uusuario in '..\codigo\modelos\Uusuario.pas',
  UusuarioDao in '..\codigo\dao\UusuarioDao.pas',
  UfrmBotaoPrimario in '..\codigo\frames\UfrmBotaoPrimario.pas' {frmBotaoPrimario: TFrame},
  UfrmAutenticar in '..\codigo\formularios\UfrmAutenticar.pas' {frmAutenticar},
  UfrmRegistrar in '..\codigo\formularios\UfrmRegistrar.pas' {frmRegistrar},
  UiniUtils in '..\codigo\util\UiniUtils.pas',
  UvalidadorUsuario in '..\codigo\validadores\UvalidadorUsuario.pas',
  UfrmBotaoExcluir in '..\codigo\frames\UfrmBotaoExcluir.pas' {frmBotaoExcluir: TFrame},
  UfrmBotaoCancelar in '..\codigo\frames\UfrmBotaoCancelar.pas' {frmBotaoCancelar: TFrame},
  UfrmClientes in '..\codigo\formularios\UfrmClientes.pas' {frmClientes},
  UformUtils in '..\codigo\util\UformUtils.pas',
  UvalidaCpf in '..\codigo\validadores\UvalidaCpf.pas',
  UpessoaDao in '..\codigo\dao\UpessoaDao.pas',
  Upessoa in '..\codigo\modelos\Upessoa.pas',
  UhackDBGrid in '..\codigo\componentes\UhackDBGrid.pas',
  UfrmBotaoSecundario in '..\codigo\frames\UfrmBotaoSecundario.pas' {frmBotaoSecundario: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := False;
  ReportMemoryLeaksOnShutdown := True;
  Application.CreateForm(TdmRavin, dmRavin);
  Application.CreateForm(TfrmSplash, frmSplash);
  Application.Run;
end.
