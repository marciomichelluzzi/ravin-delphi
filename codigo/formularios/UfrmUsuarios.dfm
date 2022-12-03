object frmUsuarios: TfrmUsuarios
  Left = 0
  Top = 0
  Caption = 'Excluir'
  ClientHeight = 520
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
  object btnCarregarUsuarios: TButton
    Left = 8
    Top = 287
    Width = 575
    Height = 25
    Caption = 'Carregar usu'#225'rios'
    TabOrder = 0
  end
  object ListView1: TListView
    Left = 8
    Top = 119
    Width = 575
    Height = 150
    Columns = <>
    TabOrder = 1
  end
  object ListBox1: TListBox
    Left = 8
    Top = 8
    Width = 575
    Height = 97
    ItemHeight = 13
    Items.Strings = (
      'Marcio'
      'Pedro'
      'Paulo')
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 8
    Top = 318
    Width = 575
    Height = 155
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
end
