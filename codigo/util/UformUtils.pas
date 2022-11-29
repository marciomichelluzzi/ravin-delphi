unit UformUtils;

interface

uses
  Vcl.Forms;

type
  TFormUtils = class(TObject)

  private

  protected

  public

  class procedure SetarFormularioPrincipal(PNovoFormulario: TForm);

  end;

implementation

{ TFormUtils }

class procedure TFormUtils.SetarFormularioPrincipal(PNovoFormulario: TForm);
var
  tmpMain: ^TCustomForm;
begin
  tmpMain := @Application.Mainform;
  tmpMain^ := PNovoFormulario;
end;

end.
