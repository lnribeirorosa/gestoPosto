object frmDashboard: TfrmDashboard
  Left = 0
  Top = 0
  Caption = 'Dashboard'
  ClientHeight = 520
  ClientWidth = 949
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid2: TcxGrid
    Left = 0
    Top = 57
    Width = 949
    Height = 200
    Align = alClient
    TabOrder = 0
    ExplicitTop = 0
    ExplicitHeight = 257
    object cxGrid2ChartViewPie: TcxGridChartView
      DiagramColumn.Active = True
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGrid2ChartViewPie
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 257
    Width = 949
    Height = 263
    Align = alBottom
    TabOrder = 1
    object cxGridChartViewColumn: TcxGridChartView
      DiagramColumn.Active = True
    end
    object cxGridLevel2: TcxGridLevel
      GridView = cxGridChartViewColumn
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 949
    Height = 57
    Align = alTop
    TabOrder = 2
    object SpeedButton1: TSpeedButton
      Left = 277
      Top = 22
      Width = 57
      Height = 22
      Caption = 'Filtrar'
    end
    object Label2: TLabel
      Left = 9
      Top = 5
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label3: TLabel
      Left = 145
      Top = 5
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object dtDataIni: TcxDateEdit
      Left = 9
      Top = 22
      TabOrder = 0
      Width = 121
    end
    object edtDataFim: TcxDateEdit
      Left = 145
      Top = 22
      TabOrder = 1
      Width = 121
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsBomba
    Left = 360
    Top = 200
  end
  object cdsBomba: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBomba'
    Left = 360
    Top = 136
    object cdsBombaTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 18
      Size = 2
    end
    object cdsBombaDESCRICAO_BOMBA: TStringField
      FieldName = 'DESCRICAO_BOMBA'
      Size = 65
    end
    object cdsBombaMES: TSmallintField
      FieldName = 'MES'
      Required = True
    end
  end
  object dspBomba: TDataSetProvider
    DataSet = fsqBomba
    Left = 360
    Top = 80
  end
  object fsqBomba: TFDQuery
    Connection = DMConexao.FDConnection
    SQL.Strings = (
      'SELECT SUM(TOTAL_CONTROLE_BOMBA) AS TOTAL, B.DESCRICAO_BOMBA,'
      '       EXTRACT(MONTH FROM C.DATA) MES'
      'FROM CONTROLE_BOMBA C'
      'LEFT JOIN BOMBA B ON (B.CODIGO_BOMBA = C.CODIGO_BOMBA)'
      'LEFT JOIN TANQUE T ON (T.CODIGO_TANQUE = B.CODIGO_TANQUE)'
      'GROUP BY 2,3')
    Left = 360
    Top = 32
  end
end
