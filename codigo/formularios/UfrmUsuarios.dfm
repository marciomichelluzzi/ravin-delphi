object frmUsuarios: TfrmUsuarios
  Left = 0
  Top = 0
  ActiveControl = memListaUsuarios
  Caption = 'Excluir'
  ClientHeight = 320
  ClientWidth = 591
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object memListaUsuarios: TMemo
    AlignWithMargins = True
    Left = 8
    Top = 8
    Width = 575
    Height = 273
    TabOrder = 0
  end
  object btnCarregarUsuarios: TButton
    Left = 8
    Top = 287
    Width = 575
    Height = 25
    Caption = 'Carregar usu'#225'rios'
    TabOrder = 1
    OnClick = btnCarregarUsuariosClick
  end
end
