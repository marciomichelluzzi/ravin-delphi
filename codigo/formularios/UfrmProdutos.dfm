object frmProdutos: TfrmProdutos
  Left = 0
  Top = 0
  Caption = 'Produtos'
  ClientHeight = 768
  ClientWidth = 1024
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    1024
    768)
  PixelsPerInch = 96
  TextHeight = 13
  object pnlProdutos: TPanel
    Left = 8
    Top = 8
    Width = 1008
    Height = 752
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      1008
      752)
    object LabelCode: TLabel
      Left = 8
      Top = 118
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
    object lblAtivo: TLabel
      Left = 8
      Top = 397
      Width = 69
      Height = 19
      Caption = 'Situa'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCadastroProduto: TLabel
      Left = 8
      Top = 16
      Width = 194
      Height = 25
      Caption = 'Cadastro de Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -21
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object lblDescricao: TLabel
      Left = 8
      Top = 197
      Width = 76
      Height = 19
      Caption = 'Descri'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblId: TLabel
      Left = 8
      Top = 91
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
    object lblListaProdutos: TLabel
      Left = 8
      Top = 454
      Width = 166
      Height = 25
      Caption = 'Lista de Produtos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -21
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object lblNome: TLabel
      Left = 8
      Top = 145
      Width = 47
      Height = 19
      Caption = 'Nome:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblObservacoes: TLabel
      Left = 8
      Top = 345
      Width = 97
      Height = 19
      Caption = 'Observa'#231#245'es:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPrecoCusto: TLabel
      Left = 8
      Top = 240
      Width = 111
      Height = 19
      Caption = 'Pre'#231'o de custo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPrecoVenda: TLabel
      Left = 8
      Top = 267
      Width = 114
      Height = 19
      Caption = 'Pre'#231'o de venda:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTempoPreparo: TLabel
      Left = 8
      Top = 294
      Width = 136
      Height = 19
      Caption = 'Tempo de Preparo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbxAtivo: TDBCheckBox
      Left = 81
      Top = 399
      Width = 97
      Height = 17
      Caption = 'Ativo'
      DataField = 'ativo'
      DataSource = dsProdutos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edtCodigo: TDBEdit
      AlignWithMargins = True
      Left = 68
      Top = 118
      Width = 933
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BevelInner = bvNone
      BevelOuter = bvNone
      DataField = 'codigo'
      DataSource = dsProdutos
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
      Top = 91
      Width = 969
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BevelInner = bvNone
      BevelOuter = bvNone
      DataField = 'id'
      DataSource = dsProdutos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edtNome: TDBEdit
      AlignWithMargins = True
      Left = 60
      Top = 145
      Width = 941
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BevelInner = bvNone
      BevelOuter = bvNone
      DataField = 'nome'
      DataSource = dsProdutos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edtPrecoCusto: TDBEdit
      AlignWithMargins = True
      Left = 123
      Top = 240
      Width = 878
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BevelInner = bvNone
      BevelOuter = bvNone
      DataField = 'precoCusto'
      DataSource = dsProdutos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object edtPrecoVenda: TDBEdit
      AlignWithMargins = True
      Left = 127
      Top = 267
      Width = 874
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BevelInner = bvNone
      BevelOuter = bvNone
      DataField = 'precoVenda'
      DataSource = dsProdutos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object edtTempoPreparo: TDBEdit
      AlignWithMargins = True
      Left = 150
      Top = 294
      Width = 851
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BevelInner = bvNone
      BevelOuter = bvNone
      DataField = 'tempoDePreparo'
      DataSource = dsProdutos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object grdProducts: TDBGrid
      AlignWithMargins = True
      Left = 8
      Top = 485
      Width = 993
      Height = 260
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsProdutos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 7
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Roboto'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'id'
          Title.Caption = 'Id'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'codigo'
          ReadOnly = True
          Title.Caption = 'C'#243'digo'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          ReadOnly = True
          Title.Caption = 'Nome'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          ReadOnly = True
          Title.Caption = 'Descri'#231#227'o'
          Width = 250
          Visible = True
        end
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'precoCusto'
          ReadOnly = True
          Title.Caption = 'Pre'#231'o de Custo'
          Visible = True
        end
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'precoVenda'
          ReadOnly = True
          Title.Caption = 'Pre'#231'o de Venda'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tempoDePreparo'
          ReadOnly = True
          Title.Caption = 'Tempo de Preparo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'observacoes'
          ReadOnly = True
          Title.Caption = 'Observa'#231#245'es'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ativo'
          ReadOnly = True
          Title.Caption = 'Ativo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'criadoEm'
          ReadOnly = True
          Title.Caption = 'Criado em'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'criadoPor'
          ReadOnly = True
          Title.Caption = 'Criado por'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'alteradoEm'
          ReadOnly = True
          Title.Caption = 'Alterado em'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'alteradoPor'
          ReadOnly = True
          Title.Caption = 'Alterado por'
          Visible = True
        end>
    end
    object memDescricao: TDBMemo
      Left = 90
      Top = 172
      Width = 911
      Height = 62
      Anchors = [akLeft, akTop, akRight]
      DataField = 'descricao'
      DataSource = dsProdutos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object memObservacoes: TDBMemo
      Left = 111
      Top = 321
      Width = 889
      Height = 64
      Anchors = [akLeft, akTop, akRight]
      DataField = 'observacoes'
      DataSource = dsProdutos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
    object dbnProducts: TDBNavigator
      AlignWithMargins = True
      Left = 8
      Top = 44
      Width = 992
      Height = 25
      DataSource = dsProdutos
      VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 10
    end
  end
  object tblProdutos: TFDTable
    BeforePost = tblProdutosBeforePost
    IndexFieldNames = 'id'
    Connection = dmRavin.cnxBancoDeDados
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    TableName = 'ravin.produto'
    Left = 864
    Top = 424
    object tblProdutosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tblProdutosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 255
    end
    object tblProdutosdescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 255
    end
    object tblProdutoscodigo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'codigo'
      Origin = 'codigo'
      Size = 255
    end
    object tblProdutosprecoCusto: TFloatField
      FieldName = 'precoCusto'
      Origin = 'precoCusto'
      Required = True
    end
    object tblProdutosprecoVenda: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'precoVenda'
      Origin = 'precoVenda'
    end
    object tblProdutostempoDePreparo: TTimeField
      AutoGenerateValue = arDefault
      FieldName = 'tempoDePreparo'
      Origin = 'tempoDePreparo'
    end
    object tblProdutosobservacoes: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'observacoes'
      Origin = 'observacoes'
      Size = 255
    end
    object tblProdutosativo: TBooleanField
      FieldName = 'ativo'
      Origin = 'ativo'
      Required = True
    end
    object tblProdutoscriadoEm: TDateTimeField
      FieldName = 'criadoEm'
      Origin = 'criadoEm'
      Required = True
    end
    object tblProdutoscriadoPor: TStringField
      FieldName = 'criadoPor'
      Origin = 'criadoPor'
      Required = True
      Size = 255
    end
    object tblProdutosalteradoEm: TDateTimeField
      FieldName = 'alteradoEm'
      Origin = 'alteradoEm'
      Required = True
    end
    object tblProdutosalteradoPor: TStringField
      FieldName = 'alteradoPor'
      Origin = 'alteradoPor'
      Required = True
      Size = 255
    end
  end
  object dsProdutos: TDataSource
    DataSet = tblProdutos
    Left = 952
    Top = 424
  end
end
