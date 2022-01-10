object DMConexao: TDMConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 406
  Width = 1261
  object sqcConexaoPrincipal: TSQLConnection
    ConnectionName = 'Banco'
    DriverName = 'FIREBIRD'
    LoginPrompt = False
    Params.Strings = (
      'drivername=FIREBIRD'
      'librarynameosx=libsqlfb.dylib'
      'vendorlibwin64=fbclient.dll'
      'vendorlibosx=/Library/Frameworks/Firebird.framework/Firebird'
      'blobsize=-1'
      'commitretain=False'
      'Database=C:\LN\Gestao\Database\Gestao.fdb'
      'localecode=0000'
      'password=masterkey'
      'rolename=RoleName'
      'sqldialect=3'
      'isolationlevel=ReadCommitted'
      'user_name=sysdba'
      'waitonlocks=True'
      'trim char=False')
    Connected = True
    Left = 88
    Top = 56
  end
  object dspUsuario: TDataSetProvider
    DataSet = fsqUsuario
    Left = 368
    Top = 112
  end
  object cdsBomba: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspBomba'
    Left = 280
    Top = 192
    object cdsBombaCODIGO_BOMBA: TIntegerField
      Tag = 7
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO_BOMBA'
      Required = True
    end
    object cdsBombaCODIGO_TANQUE: TIntegerField
      FieldName = 'CODIGO_TANQUE'
      Required = True
    end
    object cdsBombaDESCRICAO_BOMBA: TStringField
      Tag = 7
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO_BOMBA'
      Required = True
      Size = 65
    end
  end
  object dspBomba: TDataSetProvider
    DataSet = fsqBomba
    Left = 280
    Top = 112
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Protocol=TCPIP'
      'User_Name=sysdba'
      'Password=masterkey'
      'Database=C:\fortestecnologia\Database\Gestao.fdb'
      'Server=127.0.0.1/3051'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    Connected = True
    Left = 88
    Top = 120
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 96
    Top = 192
  end
  object fsqUsuario: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT U.USUA_CODIGO, U.USUA_NOME, U.USUA_LOGIN,'
      '             U. USUA_SENHA'
      'FROM USUARIO U'
      'WHERE USUA_CODIGO =:CODIGO')
    Left = 368
    Top = 56
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object cdsUsuario: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspUsuario'
    Left = 368
    Top = 192
    object cdsUsuarioUSUA_CODIGO: TIntegerField
      Tag = 7
      DisplayLabel = 'Codigo'
      FieldName = 'USUA_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUsuarioUSUA_NOME: TStringField
      Tag = 7
      DisplayLabel = 'Nome'
      FieldName = 'USUA_NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 150
    end
    object cdsUsuarioUSUA_LOGIN: TStringField
      DisplayLabel = 'Login'
      FieldName = 'USUA_LOGIN'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsUsuarioUSUA_SENHA: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'USUA_SENHA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object fsqBomba: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT F.CODIGO_BOMBA, F.DESCRICAO_BOMBA, F.CODIGO_TANQUE'
      'FROM BOMBA F'
      'WHERE F.CODIGO_BOMBA =:CODIGO')
    Left = 280
    Top = 56
    ParamData = <
      item
        Position = 1
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object cdsControleBomba: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspControleBomba'
    Left = 448
    Top = 192
    object cdsControleBombaCODIGO_CONTROLE_BOMBA: TIntegerField
      Tag = 7
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO_CONTROLE_BOMBA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfHidden]
      Required = True
    end
    object cdsControleBombaCODIGO_BOMBA: TIntegerField
      DisplayLabel = 'Codigo_Bomba'
      FieldName = 'CODIGO_BOMBA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsControleBombaQTDE_CONTROLE_BOMBA: TFMTBCDField
      Tag = 8
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE_CONTROLE_BOMBA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 6
    end
    object cdsControleBombaVALOR_CONTROLE_BOMBA: TFMTBCDField
      Tag = 8
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_CONTROLE_BOMBA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 6
    end
    object cdsControleBombaTOTAL_CONTROLE_BOMBA: TFMTBCDField
      Tag = 8
      DisplayLabel = 'Total'
      FieldName = 'TOTAL_CONTROLE_BOMBA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsControleBombaPERCENTUAL_CONTROLE_BOMBA: TFMTBCDField
      Tag = 8
      DisplayLabel = 'Percentual'
      FieldName = 'PERCENTUAL_CONTROLE_BOMBA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsControleBombaDATA: TDateField
      Tag = 7
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
    object cdsControleBombaDESCRICAO_BOMBA: TStringField
      Tag = 8
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO_BOMBA'
      ProviderFlags = []
      Size = 65
    end
  end
  object dspControleBomba: TDataSetProvider
    DataSet = fsqControleBomba
    Left = 448
    Top = 112
  end
  object fsqControleBomba: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT CODIGO_CONTROLE_BOMBA, C.CODIGO_BOMBA,'
      'QTDE_CONTROLE_BOMBA, VALOR_CONTROLE_BOMBA, '
      'TOTAL_CONTROLE_BOMBA, PERCENTUAL_CONTROLE_BOMBA,'
      'B.DESCRICAO_BOMBA, C.DATA'
      'FROM CONTROLE_BOMBA C'
      'LEFT JOIN BOMBA B ON (B.CODIGO_BOMBA = C.CODIGO_BOMBA)'
      'WHERE C.CODIGO_CONTROLE_BOMBA =:CODIGO')
    Left = 448
    Top = 56
    ParamData = <
      item
        Position = 1
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object cdsBombas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspBombas'
    Left = 536
    Top = 192
    object IntegerField2: TIntegerField
      Tag = 7
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO_BOMBA'
    end
    object cdsBombasCODIGO_TANQUE: TIntegerField
      FieldName = 'CODIGO_TANQUE'
      Required = True
    end
    object cdsBombasDESCRICAO_BOMBA: TStringField
      FieldName = 'DESCRICAO_BOMBA'
      Required = True
      Size = 65
    end
  end
  object dspBombas: TDataSetProvider
    DataSet = fsqBombas
    Left = 536
    Top = 112
  end
  object fsqBombas: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT F.CODIGO_BOMBA, F.CODIGO_TANQUE,'
      'F.DESCRICAO_BOMBA'
      'FROM BOMBA F')
    Left = 536
    Top = 56
    ParamData = <
      item
        Position = 1
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object cdsTanque: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspTanque'
    Left = 615
    Top = 191
    object cdsTanqueCODIGO_TANQUE: TIntegerField
      Tag = 7
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO_TANQUE'
      Required = True
    end
    object cdsTanqueDESCRICAO_TANQUE: TStringField
      Tag = 7
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO_TANQUE'
      Required = True
      Size = 65
    end
  end
  object dspTanque: TDataSetProvider
    DataSet = fsqTanque
    Left = 615
    Top = 111
  end
  object fsqTanque: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT F.CODIGO_TANQUE, F.DESCRICAO_TANQUE'
      'FROM TANQUE F'
      'WHERE F.CODIGO_TANQUE=:CODIGO')
    Left = 615
    Top = 55
    ParamData = <
      item
        Position = 1
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object cdsTanques: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspTanques'
    Left = 692
    Top = 191
    object IntegerField1: TIntegerField
      Tag = 7
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO_TANQUE'
      Required = True
    end
    object StringField1: TStringField
      Tag = 7
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO_TANQUE'
      Required = True
      Size = 65
    end
  end
  object dspTanques: TDataSetProvider
    DataSet = fsqTanques
    Left = 692
    Top = 111
  end
  object fsqTanques: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT F.CODIGO_TANQUE, F.DESCRICAO_TANQUE'
      'FROM TANQUE F')
    Left = 692
    Top = 55
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 96
    Top = 248
  end
end
