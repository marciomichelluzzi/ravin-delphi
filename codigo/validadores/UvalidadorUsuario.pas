unit UvalidadorUsuario;

interface

uses
  System.SysUtils,
  Uusuario;

type
  TValidadorUsuario = class
  private

  protected

  public
    class procedure Validar(PUsuario: TUsuario; PSenhaConfirmacao: String; PCpf: String);
  end;

implementation

{ TValidadorUsuario }

uses UvalidaCpf;

class procedure TValidadorUsuario.Validar(PUsuario: TUsuario; PSenhaConfirmacao: String; PCpf: String);
begin
  if not isCPF(PCpf) then
  begin
    raise Exception.Create('CPF inválido');
  end;

  if PUsuario.login.IsEmpty then
  begin
    raise Exception.Create('O campo login não pode ser vazio');
  end;

  if PUsuario.senha.IsEmpty then
  begin
    raise Exception.Create('O campo senha não pode ser vazio');
  end;

  if PUsuario.senha <> PSenhaConfirmacao then
  begin
    raise Exception.Create('A senha e a confirmação ' + 'devem ser iguais');
  end;
end;

end.
