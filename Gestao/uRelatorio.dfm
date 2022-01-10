object frmRelatorio: TfrmRelatorio
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  Caption = 'Relat'#243'rio'
  ClientHeight = 285
  ClientWidth = 989
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 605
    Top = 30
    Width = 57
    Height = 22
    Caption = 'Filtrar'
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 668
    Top = 30
    Width = 57
    Height = 22
    Caption = 'Imprimir'
    OnClick = SpeedButton2Click
  end
  object Label2: TLabel
    Left = 337
    Top = 13
    Width = 53
    Height = 13
    Caption = 'Data Inicial'
  end
  object Label3: TLabel
    Left = 473
    Top = 13
    Width = 48
    Height = 13
    Caption = 'Data Final'
  end
  object lblFuncao: TLabel
    Left = 12
    Top = 13
    Width = 32
    Height = 13
    Caption = 'Bomba'
    FocusControl = lkeBomba
  end
  object dtDataIni: TcxDateEdit
    Left = 337
    Top = 30
    TabOrder = 0
    Width = 121
  end
  object edtDataFim: TcxDateEdit
    Left = 473
    Top = 30
    TabOrder = 1
    Width = 121
  end
  object cxGrid: TcxGrid
    Left = 8
    Top = 75
    Width = 937
    Height = 202
    TabOrder = 2
    object cxGridDBTableViewRelatorio: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Append.Hint = 'Incluir'
      Navigator.Buttons.Append.Visible = True
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      DataController.DataSource = dstRelatorio
      DataController.Filter.AutoDataSetFilter = True
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.NoDataToDisplayInfoText = 'N'#227'o a dados a serem demonstrados.'
      OptionsView.ShowEditButtons = gsebAlways
      OptionsView.GroupByBox = False
      object cxGridDBTableViewRelatorioDATA: TcxGridDBColumn
        Caption = 'Data'
        DataBinding.FieldName = 'DATA'
      end
      object cxGridDBTableViewRelatorioDESCRICAO_TANQUE: TcxGridDBColumn
        Caption = 'Tanque'
        DataBinding.FieldName = 'DESCRICAO_TANQUE'
        Width = 211
      end
      object cxGridDBTableViewRelatorioDESCRICAO_BOMBA: TcxGridDBColumn
        Caption = 'Bomba'
        DataBinding.FieldName = 'DESCRICAO_BOMBA'
        Width = 165
      end
      object cxGridDBTableViewRelatorioQTDE_CONTROLE_BOMBA: TcxGridDBColumn
        Caption = 'Quantidade'
        DataBinding.FieldName = 'QTDE_CONTROLE_BOMBA'
      end
      object cxGridDBTableViewRelatorioVALOR_CONTROLE_BOMBA: TcxGridDBColumn
        Caption = 'Valor Unit'#225'rio'
        DataBinding.FieldName = 'VALOR_CONTROLE_BOMBA'
      end
      object cxGridDBTableViewRelatorioTOTAL_CONTROLE_BOMBA: TcxGridDBColumn
        Caption = 'Total'
        DataBinding.FieldName = 'TOTAL_CONTROLE_BOMBA'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableViewRelatorio
    end
  end
  object lkeBomba: TcxLookupComboBox
    Tag = 1
    Left = 10
    Top = 30
    TabStop = False
    Properties.KeyFieldNames = 'CODIGO_BOMBA'
    Properties.ListColumns = <
      item
        FieldName = 'DESCRICAO_BOMBA'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dtsBomba
    TabOrder = 3
    Width = 317
  end
  object dstRelatorio: TDataSource
    DataSet = cdsRelatorio
    Left = 328
    Top = 232
  end
  object dspRelatorio: TDataSetProvider
    DataSet = fsqRelatorio
    Left = 328
    Top = 136
  end
  object fsqRelatorio: TFDQuery
    Connection = DMConexao.FDConnection
    SQL.Strings = (
      'SELECT'
      
        'M.QTDE_CONTROLE_BOMBA, M.VALOR_CONTROLE_BOMBA, M.TOTAL_CONTROLE_' +
        'BOMBA, M.DATA, M.CODIGO_CONTROLE_BOMBA, M.CODIGO_BOMBA,'
      'D.CODIGO_TANQUE, D.DESCRICAO_BOMBA, D.CODIGO_BOMBA,'
      'T.DESCRICAO_TANQUE'
      ''
      'FROM CONTROLE_BOMBA M'
      'LEFT JOIN BOMBA D ON (D.CODIGO_BOMBA = M.CODIGO_BOMBA)'
      'LEFT JOIN TANQUE T ON (T.CODIGO_TANQUE = D.CODIGO_TANQUE)'
      'ORDER BY'
      ''
      'M.DATA, T.DESCRICAO_TANQUE, D.DESCRICAO_BOMBA')
    Left = 328
    Top = 80
  end
  object cdsRelatorio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelatorio'
    Left = 328
    Top = 184
  end
  object ppRelatorio: TppReport
    AutoStop = False
    DataPipeline = pplRelatorio
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.PaperName = 'Of'#237'cio 216 x 356mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 0
    PrinterSetup.mmMarginRight = 0
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 355600
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 5
    Template.FileName = 'C:\fortestecnologia\Relatorio\Relatorio.rtm'
    Units = utMMThousandths
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    CachePages = True
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = False
    OutlineSettings.CreatePageNodes = False
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    ThumbnailSettings.PageHighlight.Width = 3
    PDFSettings.EmbedFontOptions = []
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.AllowExtract = True
    PDFSettings.EncryptSettings.AllowAssemble = True
    PDFSettings.EncryptSettings.AllowQualityPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.EncryptSettings.EncryptionType = etRC4
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PDFSettings.PDFAFormat = pafNone
    PreviewFormSettings.PageBorder.mmPadding = 0
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    Left = 128
    Top = 88
    Version = '19.03'
    mmColumnWidth = 0
    DataPipelineName = 'pplRelatorio'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 9525
      mmPrintPosition = 0
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer16
        UserName = 'Label6'
        Border.mmPadding = 0
        Caption = 'Gest'#227'o '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4234
        mmLeft = 97896
        mmTop = 2910
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground14
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer16
        UserName = 'DBText4'
        Border.mmPadding = 0
        DataField = 'QTDE_CONTROLE_BOMBA'
        DataPipeline = pplRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatorio'
        mmHeight = 4763
        mmLeft = 22498
        mmTop = 529
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground14
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer16
        UserName = 'DBText5'
        Border.mmPadding = 0
        DataField = 'VALOR_CONTROLE_BOMBA'
        DataPipeline = pplRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatorio'
        mmHeight = 4763
        mmLeft = 40754
        mmTop = 529
        mmWidth = 23548
        BandType = 4
        LayerName = Foreground14
      end
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer16
        UserName = 'DBText6'
        Border.mmPadding = 0
        DataField = 'TOTAL_CONTROLE_BOMBA'
        DataPipeline = pplRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatorio'
        mmHeight = 4763
        mmLeft = 72504
        mmTop = 529
        mmWidth = 41275
        BandType = 4
        LayerName = Foreground14
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        DesignLayer = ppDesignLayer16
        UserName = 'DBCalc1'
        Border.mmPadding = 0
        DataField = 'TOTAL_CONTROLE_BOMBA'
        DataPipeline = pplRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRelatorio'
        mmHeight = 4498
        mmLeft = 196057
        mmTop = 3175
        mmWidth = 17198
        BandType = 8
        LayerName = Foreground14
      end
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer16
        UserName = 'Label1'
        Border.mmPadding = 0
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4233
        mmLeft = 2381
        mmTop = 1852
        mmWidth = 8467
        BandType = 8
        LayerName = Foreground14
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DATA'
      DataPipeline = pplRelatorio
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplRelatorio'
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppLabel2: TppLabel
          DesignLayer = ppDesignLayer16
          UserName = 'Label2'
          AutoSize = False
          Border.mmPadding = 0
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          Transparent = True
          mmHeight = 4763
          mmLeft = 3969
          mmTop = 1588
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
          LayerName = Foreground14
        end
        object ppDBText1: TppDBText
          DesignLayer = ppDesignLayer16
          UserName = 'DBText1'
          Border.mmPadding = 0
          DataField = 'DATA'
          DataPipeline = pplRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplRelatorio'
          mmHeight = 4763
          mmLeft = 17463
          mmTop = 1588
          mmWidth = 32808
          BandType = 3
          GroupNo = 0
          LayerName = Foreground14
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 2117
        mmPrintPosition = 0
        object ppLine1: TppLine
          DesignLayer = ppDesignLayer16
          UserName = 'Line1'
          Border.mmPadding = 0
          Weight = 0.750000000000000000
          mmHeight = 1058
          mmLeft = 529
          mmTop = 794
          mmWidth = 223838
          BandType = 5
          GroupNo = 0
          LayerName = Foreground14
        end
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'CODIGO_TANQUE'
      DataPipeline = pplRelatorio
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplRelatorio'
      NewFile = False
      object ppGroupHeaderBand5: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppDBText2: TppDBText
          DesignLayer = ppDesignLayer16
          UserName = 'DBText2'
          Border.mmPadding = 0
          DataField = 'DESCRICAO_TANQUE'
          DataPipeline = pplRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplRelatorio'
          mmHeight = 4763
          mmLeft = 23813
          mmTop = 529
          mmWidth = 134938
          BandType = 3
          GroupNo = 1
          LayerName = Foreground14
        end
        object ppLabel3: TppLabel
          DesignLayer = ppDesignLayer16
          UserName = 'Label3'
          AutoSize = False
          Border.mmPadding = 0
          Caption = 'Tanque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          Transparent = True
          mmHeight = 4763
          mmLeft = 5821
          mmTop = 529
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
          LayerName = Foreground14
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'CODIGO_BOMBA'
      DataPipeline = pplRelatorio
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplRelatorio'
      NewFile = False
      object ppGroupHeaderBand6: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        mmBottomOffset = 0
        mmHeight = 11642
        mmPrintPosition = 0
        object ppDBText3: TppDBText
          DesignLayer = ppDesignLayer16
          UserName = 'DBText3'
          Border.mmPadding = 0
          DataField = 'DESCRICAO_BOMBA'
          DataPipeline = pplRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplRelatorio'
          mmHeight = 4763
          mmLeft = 10054
          mmTop = 1588
          mmWidth = 143404
          BandType = 3
          GroupNo = 2
          LayerName = Foreground14
        end
        object ppLabel5: TppLabel
          DesignLayer = ppDesignLayer16
          UserName = 'Label5'
          AutoSize = False
          Border.mmPadding = 0
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          Transparent = True
          mmHeight = 4763
          mmLeft = 15089
          mmTop = 6875
          mmWidth = 23548
          BandType = 3
          GroupNo = 2
          LayerName = Foreground14
        end
        object ppLabel4: TppLabel
          DesignLayer = ppDesignLayer16
          UserName = 'Label4'
          AutoSize = False
          Border.mmPadding = 0
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4763
          mmLeft = 40754
          mmTop = 6875
          mmWidth = 23548
          BandType = 3
          GroupNo = 2
          LayerName = Foreground14
        end
        object ppLabel7: TppLabel
          DesignLayer = ppDesignLayer16
          UserName = 'Label7'
          AutoSize = False
          Border.mmPadding = 0
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4763
          mmLeft = 72504
          mmTop = 5817
          mmWidth = 41275
          BandType = 3
          GroupNo = 2
          LayerName = Foreground14
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppDesignLayers16: TppDesignLayers
      object ppDesignLayer16: TppDesignLayer
        UserName = 'Foreground14'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList3: TppParameterList
    end
  end
  object pplRelatorio: TppDBPipeline
    DataSource = dstRelatorio
    UserName = 'lRelatorio'
    Left = 129
    Top = 146
  end
  object dtsBomba: TDataSource
    DataSet = DMConexao.cdsBombas
    Left = 388
    Top = 235
  end
end
