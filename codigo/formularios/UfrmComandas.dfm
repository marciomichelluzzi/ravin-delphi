object frmComandas: TfrmComandas
  Left = 0
  Top = 0
  Caption = 'Comandas'
  ClientHeight = 741
  ClientWidth = 1024
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    1024
    741)
  PixelsPerInch = 96
  TextHeight = 13
  object pnlItensComanda: TPanel
    Left = 423
    Top = 8
    Width = 593
    Height = 725
    Anchors = [akTop, akRight, akBottom]
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      593
      725)
    object lblListaProdutosComanda: TLabel
      Left = 8
      Top = 16
      Width = 288
      Height = 25
      Caption = 'Lista de produtos da comanda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -21
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object dbgComandaProdutos: TDBGrid
      Left = 8
      Top = 93
      Width = 574
      Height = 620
      Anchors = [akLeft, akTop, akRight, akBottom]
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
      Top = 47
      Width = 568
      Height = 25
      DataSource = dtsComandaProdutos
      VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
  end
  object pnlComanda: TPanel
    Left = 8
    Top = 8
    Width = 409
    Height = 725
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
    DesignSize = (
      409
      725)
    object lblCadastroComanda: TLabel
      Left = 8
      Top = 16
      Width = 221
      Height = 25
      Caption = 'Cadastro de Comandas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -21
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object lblCliente: TLabel
      Left = 8
      Top = 148
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
      Top = 204
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
    object lblListaMesas: TLabel
      Left = 8
      Top = 260
      Width = 182
      Height = 25
      Caption = 'Lista de Comandas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -21
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object lblId: TLabel
      Left = 8
      Top = 93
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
      Top = 121
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
      Left = 6
      Top = 177
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
    object dbnMesas: TDBNavigator
      AlignWithMargins = True
      Left = 10
      Top = 47
      Width = 376
      Height = 25
      DataSource = dtsComandas
      VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object edtCodigo: TDBEdit
      AlignWithMargins = True
      Left = 68
      Top = 204
      Width = 333
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
      TabOrder = 1
    end
    object edtId: TDBEdit
      AlignWithMargins = True
      Left = 32
      Top = 93
      Width = 369
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
      TabOrder = 2
    end
    object edtValor: TDBEdit
      AlignWithMargins = True
      Left = 54
      Top = 177
      Width = 347
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
      TabOrder = 3
    end
    object lcbAtendente: TDBLookupComboBox
      Left = 57
      Top = 120
      Width = 344
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
      TabOrder = 4
    end
    object lcbStatus: TDBLookupComboBox
      Left = 66
      Top = 148
      Width = 335
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
      TabOrder = 5
    end
    object dbgComandas: TDBGrid
      AlignWithMargins = True
      Left = 10
      Top = 291
      Width = 391
      Height = 422
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dtsComandas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Roboto'
      TitleFont.Style = []
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
  end
  object tblComandas: TFDTable
    Active = True
    BeforePost = tblComandasBeforePost
    IndexFieldNames = 'id'
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
    Active = True
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
    Active = True
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
    Active = True
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
    Active = True
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
    Active = True
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
    Active = True
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
end
