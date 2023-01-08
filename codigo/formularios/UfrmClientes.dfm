object frmClientes: TfrmClientes
  Left = 0
  Top = 0
  Caption = 'Lista de Clientes'
  ClientHeight = 553
  ClientWidth = 818
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlListaClientes: TPanel
    AlignWithMargins = True
    Left = 8
    Top = 140
    Width = 802
    Height = 405
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    Visible = False
    DesignSize = (
      802
      405)
    object lblListaClientesTitulo: TLabel
      AlignWithMargins = True
      Left = 8
      Top = 8
      Width = 786
      Height = 25
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alTop
      Caption = 'Lista de clientes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -21
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 153
    end
    inline frmBotaoFecharTela: TfrmBotaoCancelar
      AlignWithMargins = True
      Left = 134
      Top = 353
      Width = 120
      Height = 45
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Anchors = [akLeft, akBottom]
      TabOrder = 0
      ExplicitLeft = 134
      ExplicitTop = 353
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
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 120
          ExplicitHeight = 9
        end
      end
    end
    inline frmBotaoInserir: TfrmBotaoPrimario
      AlignWithMargins = True
      Left = 8
      Top = 353
      Width = 120
      Height = 45
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Anchors = [akLeft, akBottom]
      Color = clWhite
      ParentBackground = False
      ParentColor = False
      TabOrder = 1
      ExplicitLeft = 8
      ExplicitTop = 353
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
          Caption = 'Inserir'
          OnClick = frmBotaoInserirspbBotaoPrimarioClick
          ExplicitLeft = 0
          ExplicitTop = 1
          ExplicitWidth = 120
          ExplicitHeight = 45
        end
      end
    end
    object lvwClientes: TListView
      AlignWithMargins = True
      Left = 8
      Top = 41
      Width = 786
      Height = 299
      Margins.Left = 8
      Margins.Top = 0
      Margins.Right = 8
      Margins.Bottom = 65
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BiDiMode = bdLeftToRight
      BorderStyle = bsNone
      Color = clWhite
      Columns = <
        item
          Caption = 'Nome'
          Width = 300
        end
        item
          Caption = 'Cpf'
          Width = 150
        end
        item
          Caption = 'Telefone'
          Width = 150
        end
        item
          Caption = 'Status'
          Width = 100
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      GridLines = True
      RowSelect = True
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 2
      ViewStyle = vsReport
      OnSelectItem = lvwClientesSelectItem
    end
  end
  object pnlInformacoesGerenciais: TPanel
    AlignWithMargins = True
    Left = 8
    Top = 8
    Width = 802
    Height = 124
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object lblInformacoesGerenciais: TLabel
      AlignWithMargins = True
      Left = 8
      Top = 8
      Width = 786
      Height = 25
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alTop
      Caption = 'Informa'#231#245'es gerenciais'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -21
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 221
    end
    object Shape1: TShape
      Left = 8
      Top = 44
      Width = 104
      Height = 73
      Brush.Color = 16250871
      Pen.Color = clWhite
      Shape = stRoundRect
    end
    object Shape5: TShape
      Left = 118
      Top = 44
      Width = 104
      Height = 73
      Brush.Color = 16250871
      Pen.Color = clWhite
      Shape = stRoundRect
    end
    object lblClientesInativos: TLabel
      Left = 118
      Top = 54
      Width = 104
      Height = 15
      Alignment = taCenter
      AutoSize = False
      Caption = 'Inativos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblClientesInativosValor: TLabel
      Left = 118
      Top = 75
      Width = 104
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblClientesAtivos: TLabel
      Left = 8
      Top = 54
      Width = 104
      Height = 15
      Alignment = taCenter
      AutoSize = False
      Caption = 'Ativos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblClientesAtivosValor: TLabel
      Left = 8
      Top = 75
      Width = 104
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -27
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlCadastroCliente: TPanel
    AlignWithMargins = True
    Left = 8
    Top = 140
    Width = 802
    Height = 405
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    Align = alClient
    Anchors = [akLeft, akBottom]
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    Visible = False
    DesignSize = (
      802
      405)
    object lblCadastroCliente: TLabel
      AlignWithMargins = True
      Left = 8
      Top = 8
      Width = 786
      Height = 25
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
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
      Left = 8
      Top = 49
      Width = 786
      Height = 27
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 0
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
      Left = 8
      Top = 119
      Width = 786
      Height = 27
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 0
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
      Left = 8
      Top = 84
      Width = 786
      Height = 27
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 0
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
      Left = 8
      Top = 154
      Width = 786
      Height = 27
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 0
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
    inline frmBotaoSalvarRegistro: TfrmBotaoPrimario
      AlignWithMargins = True
      Left = 8
      Top = 352
      Width = 120
      Height = 45
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Anchors = [akLeft, akBottom]
      Color = clWhite
      ParentBackground = False
      ParentColor = False
      TabOrder = 4
      ExplicitLeft = 8
      ExplicitTop = 352
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
          OnClick = frmBotaoSalvarRegistrospbBotaoPrimarioClick
          ExplicitLeft = 0
          ExplicitTop = 8
          ExplicitWidth = 120
          ExplicitHeight = 37
        end
      end
    end
    inline frmBotaoCancelarCadastro: TfrmBotaoCancelar
      AlignWithMargins = True
      Left = 134
      Top = 352
      Width = 120
      Height = 45
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Anchors = [akLeft, akBottom]
      TabOrder = 5
      ExplicitLeft = 134
      ExplicitTop = 352
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
          OnClick = frmBotaoCancelar1spbBotaoCancelarClick
          ExplicitLeft = 16
          ExplicitTop = 0
          ExplicitWidth = 104
          ExplicitHeight = 45
        end
      end
    end
    inline frmBotaoExcluirRegistro: TfrmBotaoExcluir
      AlignWithMargins = True
      Left = 260
      Top = 352
      Width = 120
      Height = 45
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Anchors = [akLeft, akBottom]
      TabOrder = 6
      ExplicitLeft = 260
      ExplicitTop = 352
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
          OnClick = frmBotaoExcluirRegistrospbBotaoExcluirClick
          ExplicitLeft = 0
          ExplicitTop = 1
          ExplicitWidth = 120
          ExplicitHeight = 45
        end
      end
    end
    object nmbId: TNumberBox
      Left = 673
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 7
      Visible = False
    end
    object cbxAtivo: TCheckBox
      Left = 8
      Top = 194
      Width = 786
      Height = 17
      Caption = 'Ativo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
  end
  object qryInformacoesGerenciais: TFDQuery
    Connection = dmRavin.cnxBancoDeDados
    SQL.Strings = (
      'SELECT'
      
        '(SELECT count(1) FROM pessoa WHERE ativo = 0) as '#39'Clientes Inati' +
        'vos'#39','
      
        '(SELECT count(1) FROM pessoa WHERE ativo = 1) as '#39'Clientes Ativo' +
        's'#39)
    Left = 590
    Top = 27
  end
end
