object frmListaClientes: TfrmListaClientes
  Left = 0
  Top = 0
  Caption = 'frmListaClientes'
  ClientHeight = 348
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbxListaClientes: TListBox
    AlignWithMargins = True
    Left = 8
    Top = 8
    Width = 836
    Height = 280
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 60
    Align = alClient
    ItemHeight = 13
    TabOrder = 0
    ExplicitHeight = 277
  end
  inline frmBotaoPrimario1: TfrmBotaoPrimario
    Left = 8
    Top = 296
    Width = 120
    Height = 45
    Color = clWhite
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 296
    ExplicitWidth = 120
    ExplicitHeight = 45
    inherited pnlFundo: TPanel
      Width = 120
      Height = 45
      inherited spbBotaoPrimario: TSpeedButton
        Width = 120
        Height = 45
        Caption = 'Inserir'
        ExplicitLeft = 0
        ExplicitTop = -8
        ExplicitWidth = 320
        ExplicitHeight = 50
      end
    end
  end
  inline frmBotaoCancelar1: TfrmBotaoCancelar
    Left = 134
    Top = 296
    Width = 120
    Height = 45
    TabOrder = 2
    ExplicitLeft = 134
    ExplicitTop = 296
    ExplicitWidth = 120
    ExplicitHeight = 45
    inherited pnlFundo: TPanel
      Width = 120
      Height = 45
      inherited spbBotaoCancelar: TSpeedButton
        Width = 120
        Height = 45
        Caption = 'Cancelar'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 120
        ExplicitHeight = 50
      end
    end
  end
end
