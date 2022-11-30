unit UfrmClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TfrmClientes = class(TForm)
    pnlClientes: TPanel;
    procedure pnlClientesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

{$R *.dfm}

uses UfrmCadastroCliente;

procedure TfrmClientes.pnlClientesClick(Sender: TObject);
begin
  if not Assigned(frmCadastroCliente) then
  begin
    Application.CreateForm(TfrmCadastroCliente, frmCadastroCliente);
  end;

  frmCadastroCliente.Show();
end;

end.
