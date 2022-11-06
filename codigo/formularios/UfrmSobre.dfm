object frmSobre: TfrmSobre
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Sobre'
  ClientHeight = 490
  ClientWidth = 650
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblTitulo: TLabel
    Left = 15
    Top = 222
    Width = 513
    Height = 29
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Caption = 'Sistema para gest'#227'o de mesas de restaurantes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object lblSubTitulo: TLabel
    Left = 15
    Top = 264
    Width = 479
    Height = 19
    Caption = 'Sistema desenvolvido pela turma do curso Dev2Blu no ano de 2022'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblAlunos: TLabel
    Left = 15
    Top = 289
    Width = 55
    Height = 19
    Caption = 'Alunos:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inline frmLogo: TfrmLogo
    Left = 0
    Top = 0
    Width = 650
    Height = 200
    Align = alTop
    Color = clWhite
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    ExplicitLeft = 216
    ExplicitTop = 48
    inherited pnlFundo: TPanel
      Width = 650
      inherited imgLogo: TImage
        Width = 650
      end
      inherited lblTitulo: TLabel
        Width = 650
        ExplicitWidth = 100
      end
    end
  end
end
