unit UvalidadorUsuario;

interface

uses
  System.SysUtils,
  Uusuario;

type TValidadorUsuario = class
  private

  protected

  public
  class procedure Validar(
    PUsuario: TUsuario;
    PSenhaConfirmacao: String);
end;

implementation

{ TValidadorUsuario }

class procedure TValidadorUsuario.Validar(
  PUsuario: TUsuario; PSenhaConfirmacao: String);
begin

  // Nome não pode ser vazio
  // Login não pode ser vazio
  // CPF é vazio
  // Quantidade de caracteres do login
  // Só numeros no CPF
  // Nome não pode aceitar numero
  // Validar caracteres especiais nos campos
  // CPF não pode ser vazio
  // Senha = Confirmação Senha
  // CPF é valido

  if PUsuario.login.IsEmpty then begin
    raise Exception.Create('O campo login não pode ser vazio');
  end;

  if PUsuario.senha.IsEmpty then
  begin
    raise Exception.Create('O campo senha não pode ser vazio');
  end;

  if PUsuario.senha <> PSenhaConfirmacao then begin
    raise Exception.Create('A senha e a confirmação ' +
      'devem ser iguais');
  end;
end;

end.
