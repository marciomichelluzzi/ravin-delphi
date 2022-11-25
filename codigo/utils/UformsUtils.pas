unit UformsUtils;

interface

uses
  Vcl.Forms, System.Classes ;

type
  TFormsUtils = class(TObject)
  private

  protected

  public
    class procedure ShowForm(pForm : TForm; pTForm : TComponentClass);
    class procedure SetarFormPrincipal(NewMainForm: TForm);
  end;

implementation

{ TFormsUtils }

class procedure TFormsUtils.SetarFormPrincipal(NewMainForm: TForm);
  var
  tmpMain: ^TCustomForm;
begin
  tmpMain := @Application.Mainform;
  tmpMain^ := NewMainForm;
end;

class procedure TFormsUtils.ShowForm(pForm: TForm; pTForm: TComponentClass);
begin
  if not Assigned(pForm) then
 begin
   Application.CreateForm(pTForm, pForm);
 end;

  SetarFormPrincipal(pForm);
  pForm.Show();

  //close;
end;

end.
