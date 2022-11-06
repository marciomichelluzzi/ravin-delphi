object frmCartaoPainelControle: TfrmCartaoPainelControle
  Left = 0
  Top = 0
  Width = 101
  Height = 52
  Color = clWhite
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object lblCartaoPainelControleTitulo: TLabel
    Left = 0
    Top = 0
    Width = 101
    Height = 15
    Align = alTop
    Alignment = taCenter
    Caption = 'Mesas Livres'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 78
  end
  object lblCartaoPainelControleValor: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 18
    Width = 95
    Height = 31
    Align = alClient
    Alignment = taCenter
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -27
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 15
    ExplicitHeight = 33
  end
end
