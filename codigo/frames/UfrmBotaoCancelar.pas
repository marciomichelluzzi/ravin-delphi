unit UfrmBotaoCancelar;

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
  Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TfrmBotaoCancelar = class(TFrame)
    pnlFundo: TPanel;
    spbBotaoCancelar: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
