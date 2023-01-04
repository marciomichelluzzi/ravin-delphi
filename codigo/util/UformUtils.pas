unit UformUtils;

interface

uses
  System.Classes,
  Vcl.Forms;

type
  TFormUtils = class(TObject)

  private

  protected

  public

    class procedure SetarFormularioPrincipal(PNovoFormulario: TForm);
    class procedure MostrarFormulario<T: TForm>(PFormlarioNovo: TForm;
      PFormularioAnterior: TForm = nil;
      PSetarFormularioPrincipal: Boolean = true;
      PFecharFormAnterior: Boolean = true);
    class procedure AlinharCamposDBEdit<T: TForm>(PFormulario: TForm);

  end;

implementation

uses
  Vcl.DBCtrls;

{ TFormUtils }

class procedure TFormUtils.AlinharCamposDBEdit<T>(PFormulario: TForm);
var
  i: Integer;
begin
  // Varre todos os componentes do formulário e aqueles que foram do tipo TDBEdit
  // centraliza o texto
  for i := 0 to PFormulario.ComponentCount - 1 do
    if PFormulario.Components[i] is TDBEdit then
      TDBEdit(PFormulario.Components[i]).Field.Alignment := taLeftJustify;
end;

class procedure TFormUtils.MostrarFormulario<T>(PFormlarioNovo: TForm;
  PFormularioAnterior: TForm; PSetarFormularioPrincipal: Boolean;
  PFecharFormAnterior: Boolean);
begin
  // Verifica se é necessário instanciar o novo formulário
  if not Assigned(PFormlarioNovo) then
  begin
    Application.CreateForm(T, PFormlarioNovo);
  end;

  // Caso o formulário anterior seja passado como parâmetro o novo formulário
  // será também o novo MainForm da aplicação
  if Assigned(PFormularioAnterior) then
  begin
    if PSetarFormularioPrincipal then
      TFormUtils.SetarFormularioPrincipal(PFormlarioNovo);
    PFormlarioNovo.Show();
    if PFecharFormAnterior then
      PFormularioAnterior.Close;
  end
  else
    PFormlarioNovo.ShowModal();
end;

class procedure TFormUtils.SetarFormularioPrincipal(PNovoFormulario: TForm);
var
  tmpMain: ^TCustomForm;
begin
  tmpMain := @Application.Mainform;
  tmpMain^ := PNovoFormulario;
end;

end.
