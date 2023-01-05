object frmComandas: TfrmComandas
  Left = 0
  Top = 0
  Caption = 'Comandas'
  ClientHeight = 885
  ClientWidth = 1024
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlItensComanda: TPanel
    AlignWithMargins = True
    Left = 423
    Top = 140
    Width = 593
    Height = 737
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    Align = alRight
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object lblListaProdutosComanda: TLabel
      AlignWithMargins = True
      Left = 8
      Top = 8
      Width = 577
      Height = 25
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alTop
      Caption = 'Lista de produtos da comanda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -21
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 288
    end
    object dbgComandaProdutos: TDBGrid
      AlignWithMargins = True
      Left = 8
      Top = 82
      Width = 577
      Height = 647
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alClient
      DataSource = dtsComandaProdutos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Roboto'
      TitleFont.Style = []
      OnDrawColumnCell = dbgComandaProdutosDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'lookupComandaCodigo'
          Title.Caption = 'C'#243'digo da comanda'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lookupProdutoNome'
          Title.Caption = 'Produto'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lookupStatusComandaProdutoNome'
          Title.Caption = 'Status'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Title.Caption = 'Quantidade'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valorTotal'
          Title.Caption = 'Valor total'
          Visible = True
        end>
    end
    object dbnComandaProdutos: TDBNavigator
      AlignWithMargins = True
      Left = 8
      Top = 41
      Width = 577
      Height = 25
      Margins.Left = 8
      Margins.Top = 0
      Margins.Right = 8
      Margins.Bottom = 8
      DataSource = dtsComandaProdutos
      VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      Align = alTop
      TabOrder = 1
    end
  end
  object pnlComanda: TPanel
    AlignWithMargins = True
    Left = 8
    Top = 140
    Width = 409
    Height = 737
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    Align = alLeft
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Roboto'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    object lblListaMesas: TLabel
      AlignWithMargins = True
      Left = 8
      Top = 8
      Width = 393
      Height = 25
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alTop
      Caption = 'Lista de Comandas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -21
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 182
    end
    object dbnMesas: TDBNavigator
      AlignWithMargins = True
      Left = 8
      Top = 41
      Width = 393
      Height = 25
      Margins.Left = 8
      Margins.Top = 0
      Margins.Right = 8
      Margins.Bottom = 8
      DataSource = dtsComandas
      VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      Align = alTop
      TabOrder = 0
    end
    object dbgComandas: TDBGrid
      AlignWithMargins = True
      Left = 8
      Top = 74
      Width = 393
      Height = 462
      Margins.Left = 8
      Margins.Top = 0
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alClient
      DataSource = dtsComandas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Roboto'
      TitleFont.Style = []
      OnDrawColumnCell = dbgComandasDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'id'
          Title.Caption = 'Id'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'codigo'
          Title.Caption = 'C'#243'digo'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lookupMesaNome'
          Title.Caption = 'Mesa'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lookupClienteNome'
          Title.Caption = 'Cliente'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lookupStatusComandaNome'
          Title.Caption = 'Status'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor'
          Visible = True
        end>
    end
    object pnlCadastroComanda: TPanel
      AlignWithMargins = True
      Left = 0
      Top = 544
      Width = 409
      Height = 193
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      DesignSize = (
        409
        193)
      object lblCadastroComanda: TLabel
        AlignWithMargins = True
        Left = 8
        Top = 16
        Width = 393
        Height = 25
        Margins.Left = 8
        Margins.Top = 16
        Margins.Right = 8
        Margins.Bottom = 8
        Align = alTop
        Caption = 'Cadastro de Comandas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -21
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 221
      end
      object lblCliente: TLabel
        Left = 8
        Top = 137
        Width = 54
        Height = 19
        Caption = 'Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCodigo: TLabel
        Left = 8
        Top = 81
        Width = 55
        Height = 19
        Caption = 'C'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblId: TLabel
        Left = 8
        Top = 54
        Width = 19
        Height = 19
        Caption = 'Id:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblMesa: TLabel
        Left = 8
        Top = 166
        Width = 44
        Height = 19
        Caption = 'Mesa:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblValor: TLabel
        Left = 8
        Top = 108
        Width = 43
        Height = 19
        Caption = 'Valor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtCodigo: TDBEdit
        AlignWithMargins = True
        Left = 70
        Top = 79
        Width = 331
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        BevelInner = bvNone
        BevelOuter = bvNone
        DataField = 'codigo'
        DataSource = dtsComandas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edtId: TDBEdit
        AlignWithMargins = True
        Left = 33
        Top = 52
        Width = 368
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        BevelInner = bvNone
        BevelOuter = bvNone
        DataField = 'id'
        DataSource = dtsComandas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edtValor: TDBEdit
        AlignWithMargins = True
        Left = 57
        Top = 106
        Width = 344
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        BevelInner = bvNone
        BevelOuter = bvNone
        DataField = 'valor'
        DataSource = dtsComandas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object lcbAtendente: TDBLookupComboBox
        Left = 58
        Top = 162
        Width = 343
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        DataField = 'mesaId'
        DataSource = dtsComandas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        KeyField = 'id'
        ListField = 'nome'
        ListSource = dtsMesas
        ParentFont = False
        TabOrder = 3
      end
      object lcbStatus: TDBLookupComboBox
        Left = 68
        Top = 133
        Width = 333
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        DataField = 'clienteId'
        DataSource = dtsComandas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        KeyField = 'id'
        ListField = 'nome'
        ListSource = dtsPessoas
        ParentFont = False
        TabOrder = 4
      end
    end
  end
  object pnlInformacoesGerenciais: TPanel
    AlignWithMargins = True
    Left = 8
    Top = 8
    Width = 1008
    Height = 124
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object lblInformacoesGerenciaisTitulo: TLabel
      AlignWithMargins = True
      Left = 8
      Top = 8
      Width = 992
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
    object Shape3: TShape
      Left = 8
      Top = 44
      Width = 129
      Height = 73
      Brush.Color = 16250871
      Pen.Color = clWhite
      Shape = stRoundRect
    end
    object lblTotalComandas: TLabel
      Left = 8
      Top = 54
      Width = 129
      Height = 15
      Alignment = taCenter
      AutoSize = False
      Caption = 'Total de comandas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTotalComandasValor: TLabel
      Left = 8
      Top = 75
      Width = 129
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape6: TShape
      Left = 143
      Top = 44
      Width = 104
      Height = 73
      Brush.Color = 16250871
      Pen.Color = clWhite
      Shape = stRoundRect
    end
    object lblComandasPagasValor: TLabel
      Left = 143
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
    object Shape7: TShape
      Left = 253
      Top = 44
      Width = 104
      Height = 73
      Brush.Color = 16250871
      Pen.Color = clWhite
      Shape = stRoundRect
    end
    object lblComandasEmAberto: TLabel
      Left = 253
      Top = 54
      Width = 104
      Height = 15
      Alignment = taCenter
      AutoSize = False
      Caption = 'Em Aberto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblComandasEmAbertoValor: TLabel
      Left = 253
      Top = 75
      Width = 104
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 35236
      Font.Height = -27
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape1: TShape
      Left = 363
      Top = 44
      Width = 104
      Height = 73
      Brush.Color = 16250871
      Pen.Color = clWhite
      Shape = stRoundRect
    end
    object lblComandasFechadas: TLabel
      Left = 363
      Top = 54
      Width = 104
      Height = 15
      Alignment = taCenter
      AutoSize = False
      Caption = 'Fechadas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblComandasFechadasValor: TLabel
      Left = 363
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
    object lblComandasPagas: TLabel
      Left = 143
      Top = 54
      Width = 104
      Height = 15
      Alignment = taCenter
      AutoSize = False
      Caption = 'Pagas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object tblComandas: TFDTable
    BeforePost = tblComandasBeforePost
    OnNewRecord = tblComandasNewRecord
    IndexFieldNames = 'id'
    OnUpdateRecord = tblComandasUpdateRecord
    Connection = dmRavin.cnxBancoDeDados
    TableName = 'ravin.comanda'
    Left = 656
    Top = 344
    object tblComandasid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tblComandasmesaId: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'mesaId'
      Origin = 'mesaId'
    end
    object tblComandasstatusComandaId: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'statusComandaId'
      Origin = 'statusComandaId'
    end
    object tblComandasclienteId: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'clienteId'
      Origin = 'clienteId'
    end
    object tblComandascodigo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'codigo'
      Origin = 'codigo'
      Size = 255
    end
    object tblComandasvalor: TSingleField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
    end
    object tblComandascriadoEm: TDateTimeField
      FieldName = 'criadoEm'
      Origin = 'criadoEm'
      Required = True
    end
    object tblComandascriadoPor: TStringField
      FieldName = 'criadoPor'
      Origin = 'criadoPor'
      Required = True
      Size = 255
    end
    object tblComandasalteradoEm: TDateTimeField
      FieldName = 'alteradoEm'
      Origin = 'alteradoEm'
      Required = True
    end
    object tblComandasalteradoPor: TStringField
      FieldName = 'alteradoPor'
      Origin = 'alteradoPor'
      Required = True
      Size = 255
    end
    object tblComandaslookupMesaNome: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupMesaNome'
      LookupDataSet = tblMesas
      LookupKeyFields = 'id'
      LookupResultField = 'nome'
      KeyFields = 'mesaId'
      Lookup = True
    end
    object tblComandaslookupClienteNome: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupClienteNome'
      LookupDataSet = tblPessoas
      LookupKeyFields = 'id'
      LookupResultField = 'nome'
      KeyFields = 'clienteId'
      Lookup = True
    end
    object tblComandaslookupStatusComandaNome: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupStatusComandaNome'
      LookupDataSet = tblStatusComanda
      LookupKeyFields = 'id'
      LookupResultField = 'nome'
      KeyFields = 'statusComandaId'
      Lookup = True
    end
  end
  object dtsComandas: TDataSource
    DataSet = tblComandas
    Left = 824
    Top = 344
  end
  object tblMesas: TFDTable
    IndexFieldNames = 'id'
    Connection = dmRavin.cnxBancoDeDados
    TableName = 'ravin.mesa'
    Left = 656
    Top = 400
  end
  object dtsMesas: TDataSource
    DataSet = tblMesas
    Left = 824
    Top = 400
  end
  object dtsPessoas: TDataSource
    DataSet = tblPessoas
    Left = 824
    Top = 520
  end
  object tblPessoas: TFDTable
    IndexFieldNames = 'id'
    Connection = dmRavin.cnxBancoDeDados
    TableName = 'ravin.pessoa'
    Left = 656
    Top = 520
  end
  object dtsComandaProdutos: TDataSource
    DataSet = tblComandaProdutos
    Left = 824
    Top = 576
  end
  object tblStatusComanda: TFDTable
    IndexFieldNames = 'id'
    Connection = dmRavin.cnxBancoDeDados
    TableName = 'ravin.statuscomanda'
    Left = 656
    Top = 632
  end
  object dtsStatusComanda: TDataSource
    Left = 824
    Top = 632
  end
  object tblComandaProdutos: TFDTable
    BeforePost = tblComandaProdutosBeforePost
    IndexFieldNames = 'comandaId'
    MasterSource = dtsComandas
    MasterFields = 'id'
    Connection = dmRavin.cnxBancoDeDados
    TableName = 'ravin.comandaproduto'
    Left = 656
    Top = 576
    object tblComandaProdutosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = True
    end
    object tblComandaProdutoscomandaId: TIntegerField
      FieldName = 'comandaId'
      Origin = 'comandaId'
      Required = True
    end
    object tblComandaProdutosprodutoId: TIntegerField
      FieldName = 'produtoId'
      Origin = 'produtoId'
      Required = True
    end
    object tblComandaProdutosstatusComandaProdutoId: TIntegerField
      FieldName = 'statusComandaProdutoId'
      Origin = 'statusComandaProdutoId'
      Required = True
    end
    object tblComandaProdutosquantidade: TLongWordField
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Required = True
    end
    object tblComandaProdutosvalorTotal: TFloatField
      FieldName = 'valorTotal'
      Origin = 'valorTotal'
      Required = True
    end
    object tblComandaProdutoscriadoEm: TDateTimeField
      FieldName = 'criadoEm'
      Origin = 'criadoEm'
      Required = True
    end
    object tblComandaProdutoscriadoPor: TStringField
      FieldName = 'criadoPor'
      Origin = 'criadoPor'
      Required = True
      Size = 255
    end
    object tblComandaProdutosalteradoEm: TDateTimeField
      FieldName = 'alteradoEm'
      Origin = 'alteradoEm'
      Required = True
    end
    object tblComandaProdutosalteradoPor: TStringField
      FieldName = 'alteradoPor'
      Origin = 'alteradoPor'
      Required = True
      Size = 255
    end
    object tblComandaProdutoslookupProdutoNome: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupProdutoNome'
      LookupDataSet = tblProdutos
      LookupKeyFields = 'id'
      LookupResultField = 'nome'
      KeyFields = 'produtoId'
      Lookup = True
    end
    object tblComandaProdutoslookupComandaCodigo: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupComandaCodigo'
      LookupDataSet = tblComandas
      LookupKeyFields = 'id'
      LookupResultField = 'codigo'
      KeyFields = 'comandaId'
      Lookup = True
    end
    object tblComandaProdutoslookupStatusComandaProdutoNome: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupStatusComandaProdutoNome'
      LookupDataSet = tblStatusComandaProduto
      LookupKeyFields = 'id'
      LookupResultField = 'nome'
      KeyFields = 'statusComandaProdutoId'
      Lookup = True
    end
  end
  object tblProdutos: TFDTable
    IndexFieldNames = 'id'
    Connection = dmRavin.cnxBancoDeDados
    TableName = 'ravin.produto'
    Left = 656
    Top = 464
  end
  object dtsProdutos: TDataSource
    DataSet = tblProdutos
    Left = 824
    Top = 464
  end
  object tblStatusComandaProduto: TFDTable
    IndexFieldNames = 'id'
    Connection = dmRavin.cnxBancoDeDados
    TableName = 'ravin.statuscomandaproduto'
    Left = 660
    Top = 288
  end
  object dtsStatusComandaProduto: TDataSource
    Left = 820
    Top = 288
  end
  object qryInformacoesGerenciais: TFDQuery
    Connection = dmRavin.cnxBancoDeDados
    SQL.Strings = (
      
        'select (SELECT count(1) FROM comanda) as '#39'Total de Comandas'#39', '#10'(' +
        'SELECT count(1) FROM comanda where statusComandaId = 1) as '#39'Em a' +
        'berto'#39','#10'(SELECT count(1) FROM comanda where statusComandaId = 2)' +
        ' as '#39'Fechada'#39','#10'(SELECT count(1) FROM comanda where statusComanda' +
        'Id = 3) as '#39'Paga'#39)
    Left = 880
    Top = 56
  end
end
