inherited frmCadControleBomba: TfrmCadControleBomba
  Caption = 'Controle Bomba'
  ClientHeight = 471
  ClientWidth = 887
  ExplicitWidth = 903
  ExplicitHeight = 510
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlNavegacao: TPanel
    Width = 887
    ExplicitWidth = 887
  end
  inherited PageControlCadastro: TPageControl
    Width = 887
    Height = 412
    ActivePage = TabInfcadastrais
    ExplicitLeft = 112
    ExplicitTop = 107
    ExplicitWidth = 887
    ExplicitHeight = 412
    inherited TabSheetConsulta: TTabSheet
      ExplicitWidth = 879
      ExplicitHeight = 384
      inherited Label3: TLabel
        Top = 371
        Width = 879
        ExplicitTop = 371
      end
      inherited pnlPesquisa: TPanel
        Width = 879
        ExplicitWidth = 879
      end
      inherited cxGrid: TcxGrid
        Width = 873
        Height = 244
        ExplicitWidth = 873
        ExplicitHeight = 244
        inherited cxGridDBTableView1: TcxGridDBTableView
          inherited cxGridDBTableViewEdit: TcxGridDBColumn
            IsCaptionAssigned = True
          end
        end
      end
    end
    inherited TabInfcadastrais: TTabSheet
      ExplicitLeft = 8
      ExplicitWidth = 879
      ExplicitHeight = 384
      object lblFuncao: TLabel
        Left = 12
        Top = 13
        Width = 32
        Height = 13
        Caption = 'Bomba'
        FocusControl = lkeBomba
      end
      object lblQtde: TLabel
        Left = 11
        Top = 58
        Width = 56
        Height = 13
        Caption = 'Quantidade'
        FocusControl = edtQtde
      end
      object lblAdm: TLabel
        Left = 347
        Top = 14
        Width = 23
        Height = 13
        Caption = 'Data'
        FocusControl = ddteData
      end
      object Label1: TLabel
        Left = 176
        Top = 58
        Width = 64
        Height = 13
        Caption = 'Valor Unit'#225'rio'
        FocusControl = edtValor
      end
      object Label2: TLabel
        Left = 347
        Top = 57
        Width = 51
        Height = 13
        Caption = 'Percentual'
        FocusControl = edtValor
      end
      object Label4: TLabel
        Left = 514
        Top = 58
        Width = 24
        Height = 13
        Caption = 'Total'
        FocusControl = edtValor
      end
      object edtQtde: TcxDBCalcEdit
        Tag = 1
        Left = 11
        Top = 74
        DataBinding.DataField = 'QTDE_CONTROLE_BOMBA'
        DataBinding.DataSource = dtsCadastro
        TabOrder = 2
        OnExit = edtQtdeExit
        Width = 152
      end
      object ddteData: TcxDBDateEdit
        Tag = 1
        Left = 344
        Top = 30
        DataBinding.DataField = 'DATA'
        DataBinding.DataSource = dtsCadastro
        TabOrder = 1
        Width = 151
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
        TabOrder = 0
        OnExit = lkeBombaExit
        Width = 317
      end
      object edtValor: TcxDBCalcEdit
        Tag = 1
        Left = 175
        Top = 74
        DataBinding.DataField = 'VALOR_CONTROLE_BOMBA'
        DataBinding.DataSource = dtsCadastro
        TabOrder = 3
        OnExit = edtValorExit
        Width = 152
      end
      object edtPercentual: TcxDBCalcEdit
        Tag = 1
        Left = 344
        Top = 74
        DataBinding.DataField = 'PERCENTUAL_CONTROLE_BOMBA'
        DataBinding.DataSource = dtsCadastro
        TabOrder = 4
        OnExit = edtPercentualExit
        Width = 152
      end
      object edtTotal: TcxDBCalcEdit
        Tag = 1
        Left = 512
        Top = 74
        DataBinding.DataField = 'TOTAL_CONTROLE_BOMBA'
        DataBinding.DataSource = dtsCadastro
        Enabled = False
        TabOrder = 5
        Width = 152
      end
    end
  end
  inherited cdsRegistros: TClientDataSet
    Left = 264
    Top = 234
  end
  inherited dtsRegistros: TDataSource
    Left = 328
    Top = 234
  end
  inherited cdsCadastro: TClientDataSet
    OnNewRecord = cdsCadastroNewRecord
    Left = 112
    Top = 232
  end
  inherited dtsCadastro: TDataSource
    OnDataChange = dtsCadastroDataChange
    Left = 184
    Top = 232
  end
  object dtsBomba: TDataSource
    DataSet = DMConexao.cdsBombas
    Left = 388
    Top = 235
  end
end
