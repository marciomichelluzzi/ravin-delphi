unit UfrmSobre;

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
  Vcl.StdCtrls,

  UfrmLogomarca;

type
  TfrmSobre = class(TForm)
    lblTitulo: TLabel;
    lblSubTitulo: TLabel;
    frmLogo: TfrmLogo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

  public

  end;

var
  frmSobre: TfrmSobre;

implementation

{$R *.dfm}

procedure TfrmSobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmSobre := nil;
end;

end.
