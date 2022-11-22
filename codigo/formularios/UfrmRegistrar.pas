unit UfrmRegistrar;

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
  UfrmBotaoPrimario,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  System.Actions, Vcl.ActnList, Vcl.ExtActns;

type
  TfrmRegistrar = class(TForm)
    imgFundo: TImage;
    pnlRegistrar: TPanel;
    lblTituloRegistrar: TLabel;
    lblSubTituloRegistrar: TLabel;
    lblTituloAutenticar: TLabel;
    lblSubTituloAutenticar: TLabel;
    edtNome: TEdit;
    edtCpf: TEdit;
    edtLogin: TEdit;
    edtSenha: TEdit;
    edtConfirmarSenha: TEdit;
    frmBotaoPrimario1: TfrmBotaoPrimario;
    procedure lblSubTituloAutenticarClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetMainForm(NovoMainForm: TForm);
  public
    { Public declarations }
  end;

var
  frmRegistrar: TfrmRegistrar;

implementation

uses
  UusuarioDao,
  Uusuario;

{$R *.dfm}

procedure TfrmRegistrar.lblSubTituloAutenticarClick(Sender: TObject);
begin
//  if not Assigned(frmAutenticar) then
//  begin
//    Application.CreateForm(TfrmAutenticar, frmAutenticar);
//  end;
//
//  SetMainForm(frmAutenticar);
//  frmAutenticar.Show();
//
//  Close();
end;

procedure TfrmRegistrar.SetMainForm(NovoMainForm: TForm);
var
  tmpMain: ^TCustomForm;
begin
  tmpMain := @Application.Mainform;
  tmpMain^ := NovoMainForm;
end;

end.
