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
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    1024
    768)
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMesas: TPanel
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
    object lblAtendente: TLabel
      Left = 11
      Top = 148
      Width = 78
      Height = 19
      Caption = 'Atendente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCadastroMesa: TLabel
      Left = 8
      Top = 17
      Width = 171
      Height = 25
      Caption = 'Cadastro de Mesa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -21
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object lblCodigo: TLabel
      Left = 11
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
    object lblId: TLabel
      Left = 11
      Top = 92
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
    object lblListaMesas: TLabel
      Left = 11
      Top = 321
      Width = 143
      Height = 25
      Caption = 'Lista de Mesas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -21
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object lblNome: TLabel
      Left = 11
      Top = 177
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
    object lblNumero: TLabel
      Left = 11
      Top = 231
      Width = 62
      Height = 19
      Caption = 'N'#250'mero:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblQtdMaxPessoas: TLabel
      Left = 11
      Top = 258
      Width = 234
      Height = 19
      Caption = 'Quantidade m'#225'xima de pessoas:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblStatus: TLabel
      Left = 11
      Top = 121
      Width = 53
      Height = 19
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
      Left = 72
      Top = 204
      Width = 929
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
      Left = 79
      Top = 229
      Width = 921
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
      Left = 36
      Top = 94
      Width = 966
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
      Left = 64
      Top = 177
      Width = 937
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
      Top = 258
      Width = 752
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
    object grdMesas: TDBGrid
      Left = 8
      Top = 352
      Width = 993
      Height = 383
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsMesas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
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
    object cbxAtendente: TDBLookupComboBox
      Left = 95
      Top = 148
      Width = 908
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
      TabOrder = 6
    end
    object cbxStatus: TDBLookupComboBox
      Left = 70
      Top = 119
      Width = 933
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
      TabOrder = 7
    end
    object DBNavigatorMesas: TDBNavigator
      AlignWithMargins = True
      Left = 8
      Top = 48
      Width = 992
      Height = 25
      DataSource = dsMesas
      VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 8
    end
  end
  object tblMesas: TFDTable
    Active = True
    BeforePost = tblMesasBeforePost
    IndexFieldNames = 'id'
    Connection = dmRavin.cnxBancoDeDados
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    UpdateOptions.KeyFields = 'id'
    TableName = 'ravin.mesa'
    Left = 848
    Top = 8
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
    Left = 800
    Top = 8
  end
  object dsPessoas: TDataSource
    DataSet = qryPessoas
    Left = 688
    Top = 8
  end
  object qryPessoas: TFDQuery
    Connection = dmRavin.cnxBancoDeDados
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    UpdateOptions.KeyFields = 'id'
    SQL.Strings = (
      'select * from pessoa where tipoPessoa = '#39'F'#39)
    Left = 736
    Top = 8
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
    Active = True
    IndexFieldNames = 'id'
    Connection = dmRavin.cnxBancoDeDados
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    UpdateOptions.KeyFields = 'id'
    TableName = 'ravin.statusmesa'
    Left = 968
    Top = 8
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
    Left = 912
    Top = 8
  end
end
