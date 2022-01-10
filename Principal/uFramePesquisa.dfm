object FramePesquisa: TFramePesquisa
  Left = 0
  Top = 0
  Width = 662
  Height = 75
  TabOrder = 0
  object lblFoco: TLabel
    Left = 0
    Top = 0
    Width = 662
    Height = 13
    Align = alTop
    Caption = '                                                     [F6]'
    ExplicitWidth = 179
  end
  object lblFiltro: TLabel
    Left = 3
    Top = 17
    Width = 29
    Height = 13
    Caption = '&Filtro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pgcPesquisa: TPageControl
    Left = 160
    Top = 13
    Width = 265
    Height = 56
    ActivePage = tabTexto
    TabOrder = 0
    object tabTexto: TTabSheet
      Caption = 'tabTexto'
      TabVisible = False
      object lblTexto: TLabel
        Left = 8
        Top = 2
        Width = 28
        Height = 13
        Caption = 'Texto'
      end
      object edtTexto: TEdit
        Left = 8
        Top = 18
        Width = 249
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
      end
    end
    object tabNumero: TTabSheet
      Caption = 'tabNumero'
      ImageIndex = 1
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lblValor: TLabel
        Left = 8
        Top = 2
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object lblA: TLabel
        Left = 104
        Top = 22
        Width = 6
        Height = 13
        Caption = #224
        Visible = False
      end
      object edtValorIni: TJvCalcEdit
        Left = 8
        Top = 18
        Width = 89
        Height = 21
        NumGlyphs = 3
        TabOrder = 0
        ZeroEmpty = False
        DisabledTextColor = clWindowText
        DisabledColor = clBtnFace
        DecimalPlacesAlwaysShown = False
      end
      object edtValorFim: TJvCalcEdit
        Left = 121
        Top = 18
        Width = 89
        Height = 21
        NumGlyphs = 3
        TabOrder = 1
        ZeroEmpty = False
        DisabledTextColor = clWindowText
        DisabledColor = clBtnFace
        DecimalPlacesAlwaysShown = False
      end
    end
    object tabData: TTabSheet
      Caption = 'tabData'
      ImageIndex = 2
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lblData: TLabel
        Left = 8
        Top = 2
        Width = 23
        Height = 13
        Caption = 'Data'
      end
      object Label1: TLabel
        Left = 107
        Top = 2
        Width = 6
        Height = 13
        Caption = #224
        Visible = False
      end
      object edtDataIni: TJvDateEdit
        Left = 8
        Top = 18
        Width = 89
        Height = 21
        ShowNullDate = False
        TabOrder = 0
      end
      object edtDataFim: TJvDateEdit
        Left = 107
        Top = 18
        Width = 89
        Height = 21
        ShowNullDate = False
        TabOrder = 1
      end
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 30
    Width = 159
    Height = 32
    ActivePage = TabOperacoes
    TabOrder = 1
    object TabOperacaoTexto: TTabSheet
      TabVisible = False
      object cbbOperacaoTexto: TJvComboBox
        Left = 0
        Top = 0
        Width = 151
        Height = 21
        Align = alClient
        Style = csDropDownList
        TabOrder = 0
        Text = 'Todos'
        OnCloseUp = cbbOperacaoTextoCloseUp
        Items.Strings = (
          'Todos'
          'Igual'
          'Diferente'
          'Iniciado'
          'Terminado'
          'Contendo')
        ItemIndex = 0
      end
    end
    object TabOperacoes: TTabSheet
      Caption = 'TabOperacoes'
      ImageIndex = 1
      TabVisible = False
      object cbbOperacoes: TJvComboBox
        Left = 0
        Top = 0
        Width = 151
        Height = 21
        Align = alClient
        Style = csDropDownList
        TabOrder = 0
        Text = 'Todos'
        OnCloseUp = cbbOperacoesCloseUp
        Items.Strings = (
          'Todos'
          'Igual  '
          'Diferente'
          'Maior'
          'Menor'
          'Intervalo')
        ItemIndex = 0
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 431
    Top = 0
    Width = 58
    Height = 72
    Caption = '[F7]'
    TabOrder = 2
    object Label2: TLabel
      Left = 23
      Top = 15
      Width = 3
      Height = 13
    end
    object btnPesquisar: TBitBtn
      Left = 3
      Top = 29
      Width = 40
      Height = 30
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF494749302C2F5F5D5DA0
        999DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F74443443734
        3426262742403E575555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E8E8
        312F2F424040403C3C3A3837262527282528FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFE9E9E9353334555451524F4E48464442403E2D2B2C3A393CFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFEAE9E93B39386B67656965625D5857555251383637343435FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFEAEAEA3F3C3C827E7B827D7B74706F6B68674543
        43363537FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3D3C3A9995939F9B988D8988
        85807F555454706E70FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFEEECEDBFB8BDB0A9ABA0999DAAA3A6B6AFB3F7F7F7FFFFFFD5D0D26D686945
        4444ADA7A5A39F9C6A6665717170FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFE7E4E6B1ABACBDBCBCCDC6C0CEC2B6CBBEB3CBBCB2BCB9B69A97998D86
        8AA6999ECECCC88783814341407D7876757373FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDCD8DAC1BFBFD5CCC3E4C9A9ECC99DEACA9EEAC99FE9C89E
        EBC59ADABCA1B7B2AA888185C6C2C1CDC9C86C6667868585FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFD8D3D5CBC8C9DACFC0ECD0A6ECD3ADECD4AFEC
        D5B2ECD4AFEBD2ADEAD0A9EBCCA4EAC79FC6B2A38A8485A99EA2FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0BBBDDDD2C6EFD9B0F0DB
        BAEFDEBEF0E0BFF1E0C0F0E0BFEFDEBDEEDAB9ECD7B3ECD0ACEFD0A4B6ABA480
        7A7DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3CCCED8D7D6
        EFDDBBF1E1C1F2E5C7F4E8CAF4EBCDF4EBCEF4EBCDF4E8CBF2E5C6F1E0C0EFDB
        BAEDD6B1E3CAA7989698BEBABCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFC2BCBEE2DBCEF4E6C6F4ECCEF7EFD2F5F0D4F5F1D5F5F1D5F5F1D5F5F0D4
        F7EFD2F4EBCDF2E5C6EFDEBDF1DBB3B4A9A1938E91FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFBFBBBDEEE8DDF7EFD2F5F1D5F5F1D5F6F1D5F6F1D6F6
        F1D6F6F1D6F6F1D5F5F1D5F5F1D5F5ECD0F3E5C7F1E0BFD3C3AA817C7DFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8C4C5F3EFDFF9F4E1F7F2D3F6F1
        D7F6F1D8F7F1D8F7F1D9F7F1D8F6F1D8F6F1D6F6F1D5F5F0D5F5EDD0F4E7C7D5
        C6B06F686DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8C4C5F4F0E1
        FAF6E4F8F4DFF7F0D7F8F2DEF7F3E0F8F3DAF8F2DBF7F2DAF7F1D9F6F1D7F6F1
        D5F5F1D5F7EDCFD7CBB46F696DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFBFB7BBEAE7DBFAF6E5FAF5E5F9F9EAFFFEFCFFFEFCFBF8EEF8F2DEF8F3DD
        F7F2DBF7F1D9F6F1D7F5F1D5FBF2D5C4BDAC928C8EFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC7BEC0DDDED9FCF8E7FAF6E7FCFAF3FEFFFCFEFEFCFD
        FDF8F9F4E3F8F4DFF8F3DCF7F2D9F7F0D8F8F3DAFBF7E0A9A7A1B7B3B5FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEAEBC8C4C4EFEDDFFCF8E8FBF7
        ECFEFFFBFEFFFEFCFBF6FBF9EFFBF9ECFAF7E9FAF7E8FBF6E6FEFAE9DDD9CA83
        7E7FF5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDB6B9
        D1CFCDF8F5E7FCFAEBFBF8ECFCFAEFFCFAF4FCFAF0FBF8EDFAF8EAFBF7E8FFF9
        EAE6E4D4A29C9CACA7A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFB9B2B4CECCCAEFECE1FFFDF2FEFBF1FDFBF1FDFAF0FDFAED
        FDFAEBFFFDEEDFDCCEA6A3A09F979AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFB9BBBCB7B6D0CECBE7E4DEF4
        F1E8F2F0E5EFEDE1DDDBD0C0BCB6969292AFAAADFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E5
        E7BFBABCA59D9FACA6A6A6A1A19E97979B9496A8A2A5FAFAFAFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      TabOrder = 0
      OnClick = btnPesquisarClick
    end
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesquisa'
    Left = 600
    Top = 9
  end
  object sqqPesquisa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMConexao.sqcConexaoPrincipal
    Left = 472
    Top = 9
  end
  object dspPesquisa: TDataSetProvider
    DataSet = sqqPesquisa
    Left = 536
    Top = 9
  end
end
