object frmCadastroCliente: TfrmCadastroCliente
  Left = 0
  Top = 0
  ActiveControl = edtNome
  Caption = 'Cadastro de cliente'
  ClientHeight = 475
  ClientWidth = 640
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCadastroCliente: TPanel
    AlignWithMargins = True
    Left = 8
    Top = 8
    Width = 624
    Height = 459
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      624
      459)
    object lblCadastroCliente: TLabel
      AlignWithMargins = True
      Left = 17
      Top = 17
      Width = 590
      Height = 25
      Margins.Left = 16
      Margins.Top = 16
      Margins.Right = 16
      Margins.Bottom = 8
      Align = alTop
      Caption = 'Cadastro de Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -21
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 183
    end
    object edtNome: TEdit
      AlignWithMargins = True
      Left = 17
      Top = 66
      Width = 590
      Height = 27
      Margins.Left = 16
      Margins.Top = 16
      Margins.Right = 16
      Margins.Bottom = 8
      Align = alTop
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TextHint = 'Nome'
    end
    object edtTelefone: TEdit
      AlignWithMargins = True
      Left = 17
      Top = 139
      Width = 590
      Height = 27
      Margins.Left = 16
      Margins.Top = 0
      Margins.Right = 16
      Margins.Bottom = 8
      Align = alTop
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 1
      TextHint = 'Telefone'
    end
    object mskCpf: TMaskEdit
      AlignWithMargins = True
      Left = 17
      Top = 104
      Width = 590
      Height = 27
      Margins.Left = 16
      Margins.Right = 16
      Margins.Bottom = 8
      Align = alTop
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = ''
      TextHint = 'CPF'
    end
    object dtpDataNascimento: TDateTimePicker
      AlignWithMargins = True
      Left = 17
      Top = 177
      Width = 590
      Height = 27
      Margins.Left = 16
      Margins.Right = 16
      Margins.Bottom = 8
      Align = alTop
      Date = 44892.000000000000000000
      Time = 0.125994178240944200
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
    end
    inline lblInformacoesGerenciais: TfrmBotaoPrimario
      Left = 17
      Top = 400
      Width = 120
      Height = 45
      Anchors = [akLeft, akBottom]
      Color = clWhite
      ParentBackground = False
      ParentColor = False
      TabOrder = 4
      ExplicitLeft = 17
      ExplicitTop = 400
      ExplicitWidth = 120
      ExplicitHeight = 45
      inherited pnlFundo: TPanel
        Width = 120
        Height = 45
        ExplicitWidth = 120
        ExplicitHeight = 45
        inherited spbBotaoPrimario: TSpeedButton
          Width = 120
          Height = 45
          Caption = 'Salvar'
          OnClick = lblInformacoesGerenciaisspbBotaoPrimarioClick
          ExplicitLeft = -192
          ExplicitTop = 32
          ExplicitWidth = 320
          ExplicitHeight = 50
        end
      end
    end
    inline frmBotaoCancelar: TfrmBotaoCancelar
      Left = 143
      Top = 400
      Width = 120
      Height = 45
      Anchors = [akLeft, akBottom]
      TabOrder = 5
      ExplicitLeft = 143
      ExplicitTop = 400
      ExplicitWidth = 120
      ExplicitHeight = 45
      inherited pnlFundo: TPanel
        Width = 120
        Height = 45
        ExplicitWidth = 120
        ExplicitHeight = 45
        inherited spbBotaoCancelar: TSpeedButton
          Width = 120
          Height = 45
          Caption = 'Cancelar'
          OnClick = frmBotaoCancelarspbBotaoCancelarClick
          ExplicitLeft = 16
          ExplicitTop = 0
          ExplicitWidth = 104
          ExplicitHeight = 45
        end
      end
    end
    inline frmBotaoExcluir: TfrmBotaoExcluir
      Left = 269
      Top = 400
      Width = 120
      Height = 45
      Anchors = [akLeft, akBottom]
      TabOrder = 6
      ExplicitLeft = 269
      ExplicitTop = 400
      ExplicitWidth = 120
      ExplicitHeight = 45
      inherited pnlFundo: TPanel
        Width = 120
        Height = 45
        ExplicitWidth = 120
        ExplicitHeight = 45
        inherited spbBotaoExcluir: TSpeedButton
          Width = 120
          Height = 45
          Caption = 'Excluir'
          OnClick = frmBotaoExcluirspbBotaoExcluirClick
          ExplicitWidth = 120
          ExplicitHeight = 45
        end
      end
    end
  end
end
