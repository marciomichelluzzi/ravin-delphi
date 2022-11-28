unit UvalidadorUsuario;

interface

uses
  Uusuario, System.SysUtils;

type TValidadorUsuario = class
  private

  protected

  public
  class procedure Validar(PUsuario : TUsuario; PSenhaConfirmacao, PCpf : String);
  class function ValidarCpf(pCpf : String): boolean;
end;

implementation

{ TValidadorUsuario }

class procedure TValidadorUsuario.Validar(PUsuario: TUsuario; PSenhaConfirmacao, pCpf : String);
var
  LCpfValido : Boolean;
begin
  LCpfValido := ValidarCpf(PCpf);

  if (PCpf.IsEmpty) then
  begin
    raise Exception.Create('O campo CPF não pode ser vazio');
  end;

  if not (LCpfValido) then
  begin
    raise Exception.Create('O CPF deve ser valido');
  end;

  if (PUsuario.login.isEmpty) then
  begin
    raise Exception.Create('O campo login não pode ser vazio');
  end;

  if (PUsuario.senha.IsEmpty) then
  begin
    raise Exception.Create('O campo senha não pode ser vazio');
  end;

  if (PUsuario.senha <> PSenhaConfirmacao) then
  begin
    raise Exception.Create('A senha e a confirmação devem ser iguais');
  end;

end;

class function TValidadorUsuario.ValidarCpf(pCpf : String): boolean;
var  dig10, dig11, CPF : string;
    s, i, r, peso: integer;
begin
  CPF := pCpf;

  if ((CPF = '00000000000') or (CPF = '11111111111') or
      (CPF = '22222222222') or (CPF = '33333333333') or
      (CPF = '44444444444') or (CPF = '55555555555') or
      (CPF = '66666666666') or (CPF = '77777777777') or
      (CPF = '88888888888') or (CPF = '99999999999') or
      (length(CPF) <> 11))
     then begin
              ValidarCpf := false;
              exit;
            end;
  try

    s := 0;
    peso := 10;
    for i := 1 to 9 do
    begin

      s := s + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11))
       then dig10 := '0'
    else str(r:1, dig10);

    s := 0;
    peso := 11;
    for i := 1 to 10 do
    begin
      s := s + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11))
       then dig11 := '0'
    else str(r:1, dig11);

    if ((dig10 = CPF[10]) and (dig11 = CPF[11])) then
    begin
     ValidarCpf := true;
    end

    else
     ValidarCpf := false;
  except
    ValidarCpf := false
  end;
end;

end.
