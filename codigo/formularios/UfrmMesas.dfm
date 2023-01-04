object frmMesas: TfrmMesas
  Left = 0
  Top = 0
  Caption = 'Mesas'
  ClientHeight = 768
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
  object pnlCadastroMesas: TPanel
    AlignWithMargins = True
    Left = 8
    Top = 8
    Width = 1008
    Height = 281
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      1008
      281)
    object lblAtendente: TLabel
      AlignWithMargins = True
      Left = 8
      Top = 140
      Width = 78
      Height = 19
      Margins.Left = 8
      Margins.Right = 8
      Caption = 'Atendente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCadastroMesa: TLabel
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
      Caption = 'Cadastro de Mesa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -21
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 171
    end
    object lblCodigo: TLabel
      AlignWithMargins = True
      Left = 8
      Top = 196
      Width = 55
      Height = 19
      Margins.Left = 8
      Margins.Right = 8
      Caption = 'C'#243'digo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblId: TLabel
      AlignWithMargins = True
      Left = 8
      Top = 84
      Width = 19
      Height = 19
      Margins.Left = 8
      Margins.Right = 8
      Caption = 'Id:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNome: TLabel
      AlignWithMargins = True
      Left = 8
      Top = 169
      Width = 47
      Height = 19
      Margins.Left = 8
      Margins.Right = 8
      Caption = 'Nome:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNumero: TLabel
      AlignWithMargins = True
      Left = 8
      Top = 225
      Width = 62
      Height = 19
      Margins.Left = 8
      Margins.Right = 8
      Caption = 'N'#250'mero:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblQtdMaxPessoas: TLabel
      AlignWithMargins = True
      Left = 8
      Top = 252
      Width = 234
      Height = 19
      Margins.Left = 8
      Margins.Right = 8
      Caption = 'Quantidade m'#225'xima de pessoas:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblStatus: TLabel
      AlignWithMargins = True
      Left = 8
      Top = 111
      Width = 53
      Height = 19
      Margins.Left = 8
      Margins.Right = 8
      Caption = 'Status:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCodigo: TDBEdit
      AlignWithMargins = True
      Left = 66
      Top = 194
      Width = 934
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BevelInner = bvNone
      BevelOuter = bvNone
      DataField = 'codigo'
      DataSource = dsMesas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edtNumero: TDBEdit
      AlignWithMargins = True
      Left = 74
      Top = 221
      Width = 926
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BevelInner = bvNone
      BevelOuter = bvNone
      DataField = 'numero'
      DataSource = dsMesas
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
      Top = 82
      Width = 968
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BevelInner = bvNone
      BevelOuter = bvNone
      DataField = 'id'
      DataSource = dsMesas
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
      Left = 66
      Top = 167
      Width = 934
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BevelInner = bvNone
      BevelOuter = bvNone
      DataField = 'nome'
      DataSource = dsMesas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edtQtdMaxPessoas: TDBEdit
      AlignWithMargins = True
      Left = 249
      Top = 250
      Width = 751
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BevelInner = bvNone
      BevelOuter = bvNone
      DataField = 'quantidadeMaximaPessoas'
      DataSource = dsMesas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object cbxAtendente: TDBLookupComboBox
      Left = 97
      Top = 138
      Width = 903
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      DataField = 'atendenteId'
      DataSource = dsMesas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      KeyField = 'id'
      ListField = 'nome'
      ListSource = dsPessoas
      ParentFont = False
      TabOrder = 5
    end
    object cbxStatus: TDBLookupComboBox
      Left = 66
      Top = 109
      Width = 934
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      DataField = 'statusMesaId'
      DataSource = dsMesas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      KeyField = 'id'
      ListField = 'nome'
      ListSource = dsStatusMesa
      ParentFont = False
      TabOrder = 6
    end
    object DBNavigatorMesas: TDBNavigator
      AlignWithMargins = True
      Left = 8
      Top = 41
      Width = 992
      Height = 25
      Margins.Left = 8
      Margins.Top = 0
      Margins.Right = 8
      Margins.Bottom = 8
      DataSource = dsMesas
      VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      Align = alTop
      TabOrder = 7
    end
  end
  object pnlListaMesas: TPanel
    AlignWithMargins = True
    Left = 8
    Top = 297
    Width = 1008
    Height = 463
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object lblListaMesas: TLabel
      AlignWithMargins = True
      Left = 8
      Top = 8
      Width = 992
      Height = 25
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Lista de Mesas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -21
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 143
    end
    object grdMesas: TDBGrid
      AlignWithMargins = True
      Left = 8
      Top = 41
      Width = 992
      Height = 414
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alClient
      DataSource = dsMesas
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
          FieldName = 'id'
          Title.Caption = 'Id'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lookupStatusMesa'
          Title.Caption = 'Status'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lookupAtendenteNome'
          Title.Caption = 'Atendente'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'Nome'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'codigo'
          Title.Caption = 'C'#243'digo'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'numero'
          Title.Caption = 'N'#250'mero'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidadeMaximaPessoas'
          Title.Caption = 'Quantidade m'#225'xima de pessoas'
          Width = 250
          Visible = True
        end>
    end
  end
  object tblMesas: TFDTable
    IndexFieldNames = 'id'
    Connection = dmRavin.cnxBancoDeDados
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    UpdateOptions.KeyFields = 'id'
    TableName = 'ravin.mesa'
    Left = 760
    Top = 296
    object tblMesasid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
    end
    object tblMesasnome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 255
    end
    object tblMesascodigo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'codigo'
      Origin = 'codigo'
      Size = 255
    end
    object tblMesasnumero: TLongWordField
      Alignment = taLeftJustify
      FieldName = 'numero'
      Origin = 'numero'
      Required = True
    end
    object tblMesasquantidadeMaximaPessoas: TLongWordField
      Alignment = taLeftJustify
      AutoGenerateValue = arDefault
      FieldName = 'quantidadeMaximaPessoas'
      Origin = 'quantidadeMaximaPessoas'
    end
    object tblMesascriadoEm: TDateTimeField
      FieldName = 'criadoEm'
      Origin = 'criadoEm'
      Required = True
    end
    object tblMesascriadoPor: TStringField
      FieldName = 'criadoPor'
      Origin = 'criadoPor'
      Required = True
      Size = 255
    end
    object tblMesasalteradoEm: TDateTimeField
      FieldName = 'alteradoEm'
      Origin = 'alteradoEm'
      Required = True
    end
    object tblMesasalteradoPor: TStringField
      FieldName = 'alteradoPor'
      Origin = 'alteradoPor'
      Required = True
      Size = 255
    end
    object tblMesasatendenteId: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'atendenteId'
      Origin = 'atendenteId'
    end
    object tblMesaslookupAtendenteNome: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupAtendenteNome'
      LookupDataSet = qryPessoas
      LookupKeyFields = 'id'
      LookupResultField = 'nome'
      KeyFields = 'atendenteId'
      Lookup = True
    end
    object tblMesaslookupStatusMesa: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupStatusMesa'
      LookupDataSet = tblStatusMesa
      LookupKeyFields = 'id'
      LookupResultField = 'nome'
      KeyFields = 'statusMesaId'
      Lookup = True
    end
    object tblMesasstatusMesaId: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'statusMesaId'
      Origin = 'statusMesaId'
    end
  end
  object dsMesas: TDataSource
    DataSet = tblMesas
    Left = 712
    Top = 296
  end
  object dsPessoas: TDataSource
    DataSet = qryPessoas
    Left = 576
    Top = 296
  end
  object qryPessoas: TFDQuery
    Connection = dmRavin.cnxBancoDeDados
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    UpdateOptions.KeyFields = 'id'
    SQL.Strings = (
      'select * from pessoa where tipoPessoa = '#39'F'#39)
    Left = 640
    Top = 296
    object qryPessoasid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
    end
    object qryPessoasnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 255
    end
    object qryPessoastipoPessoa: TStringField
      FieldName = 'tipoPessoa'
      Origin = 'tipoPessoa'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryPessoascpf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cpf'
      Origin = 'cpf'
      Size = 11
    end
    object qryPessoastelefone: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'telefone'
      Origin = 'telefone'
    end
    object qryPessoasativo: TBooleanField
      FieldName = 'ativo'
      Origin = 'ativo'
      Required = True
    end
    object qryPessoascriadoEm: TDateTimeField
      FieldName = 'criadoEm'
      Origin = 'criadoEm'
      Required = True
    end
    object qryPessoascriadoPor: TStringField
      FieldName = 'criadoPor'
      Origin = 'criadoPor'
      Required = True
      Size = 255
    end
    object qryPessoasalteradoEm: TDateTimeField
      FieldName = 'alteradoEm'
      Origin = 'alteradoEm'
      Required = True
    end
    object qryPessoasalteradoPor: TStringField
      FieldName = 'alteradoPor'
      Origin = 'alteradoPor'
      Required = True
      Size = 255
    end
  end
  object tblStatusMesa: TFDTable
    IndexFieldNames = 'id'
    Connection = dmRavin.cnxBancoDeDados
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    UpdateOptions.KeyFields = 'id'
    TableName = 'ravin.statusmesa'
    Left = 896
    Top = 296
    object tblStatusMesaid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
    end
    object tblStatusMesanome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 255
    end
  end
  object dsStatusMesa: TDataSource
    DataSet = tblStatusMesa
    Left = 824
    Top = 296
  end
end
