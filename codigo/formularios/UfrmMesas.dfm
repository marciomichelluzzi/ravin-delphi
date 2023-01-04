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
    Top = 520
    Width = 1008
    Height = 240
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      1008
      240)
    object lblAtendente: TLabel
      AlignWithMargins = True
      Left = 8
      Top = 100
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
      Top = 156
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
      Top = 44
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
      Top = 129
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
      Top = 185
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
      Top = 212
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
      Top = 71
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
      Top = 154
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
      Top = 181
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
      Top = 42
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
      Top = 127
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
      Top = 210
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
      Top = 98
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
      Top = 69
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
  end
  object pnlListaMesas: TPanel
    AlignWithMargins = True
    Left = 8
    Top = 140
    Width = 1008
    Height = 372
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 0
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 297
    ExplicitHeight = 463
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
      Top = 74
      Width = 992
      Height = 290
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
    object DBNavigatorMesas: TDBNavigator
      AlignWithMargins = True
      Left = 8
      Top = 41
      Width = 992
      Height = 25
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 0
      DataSource = dsMesas
      VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      Align = alTop
      TabOrder = 1
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
    ExplicitLeft = 13
    object Shape3: TShape
      Left = 8
      Top = 44
      Width = 104
      Height = 73
      Brush.Color = 16250871
      Pen.Color = clWhite
      Shape = stRoundRect
    end
    object Shape6: TShape
      Left = 118
      Top = 44
      Width = 104
      Height = 73
      Brush.Color = 16250871
      Pen.Color = clWhite
      Shape = stRoundRect
    end
    object Shape7: TShape
      Left = 228
      Top = 44
      Width = 104
      Height = 73
      Brush.Color = 16250871
      Pen.Color = clWhite
      Shape = stRoundRect
    end
    object lblInformacoesGenerenciaisTitulo: TLabel
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
      ExplicitLeft = 40
      ExplicitTop = 32
    end
    object lblTotalMesas: TLabel
      Left = 8
      Top = 54
      Width = 104
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Total de mesas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object lblMesasDisponiveis: TLabel
      Left = 118
      Top = 54
      Width = 104
      Height = 15
      Alignment = taCenter
      AutoSize = False
      Caption = 'Dispon'#237'veis'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object lblMesasReservadas: TLabel
      Left = 228
      Top = 54
      Width = 104
      Height = 15
      Alignment = taCenter
      AutoSize = False
      Caption = 'Reservadas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object Shape1: TShape
      Left = 338
      Top = 44
      Width = 104
      Height = 73
      Brush.Color = 16250871
      Pen.Color = clWhite
      Shape = stRoundRect
    end
    object lblMesasOcupadas: TLabel
      Left = 338
      Top = 54
      Width = 104
      Height = 15
      Alignment = taCenter
      AutoSize = False
      Caption = 'Ocupadas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object lblTotalMesasValor: TLabel
      Left = 8
      Top = 81
      Width = 104
      Height = 20
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblMesasDisponiveisValor: TLabel
      Left = 118
      Top = 81
      Width = 104
      Height = 20
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblMesasReservadasValor: TLabel
      Left = 228
      Top = 81
      Width = 104
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblMesasOcupadasValor: TLabel
      Left = 338
      Top = 81
      Width = 104
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object tblMesas: TFDTable
    BeforePost = tblMesasBeforePost
    OnNewRecord = tblMesasNewRecord
    IndexFieldNames = 'id'
    OnUpdateRecord = tblMesasUpdateRecord
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
  object qryInformacoesGerenciais: TFDQuery
    Connection = dmRavin.cnxBancoDeDados
    SQL.Strings = (
      
        'select '#10'(SELECT count(1) FROM mesa) as '#39'Total de mesas'#39', '#10'(SELEC' +
        'T count(1) FROM mesa where statusMesaId = 1) as '#39'Mesas livres'#39','#10 +
        '(SELECT count(1) FROM mesa where statusMesaId = 2) as '#39'Mesas res' +
        'ervadas'#39','#10'(SELECT count(1) FROM mesa where statusMesaId = 3) as ' +
        #39'Mesas ocupadas'#39','#10'(SELECT count(1) FROM mesa where statusMesaId ' +
        '= 4) as '#39'Mesas indispon'#237'veis'#39)
    Left = 928
    Top = 72
  end
end
