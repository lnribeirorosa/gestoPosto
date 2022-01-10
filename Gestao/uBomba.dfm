inherited frmCadBomba: TfrmCadBomba
  Caption = 'Cadastro de Bomba'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControlCadastro: TPageControl
    inherited TabSheetConsulta: TTabSheet
      inherited cxGrid: TcxGrid
        inherited cxGridDBTableView1: TcxGridDBTableView
          inherited cxGridDBTableViewEdit: TcxGridDBColumn
            IsCaptionAssigned = True
          end
        end
      end
    end
    inherited TabInfcadastrais: TTabSheet
      ExplicitLeft = 8
      object lblCodigo: TLabel
        Left = 3
        Top = 2
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = edtCodigo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblFuncao: TLabel
        Left = 3
        Top = 49
        Width = 36
        Height = 13
        Caption = 'Tanque'
        FocusControl = lkeTanque
      end
      object Label1: TLabel
        Left = 4
        Top = 96
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object edtCodigo: TDBEdit
        Tag = 1
        Left = 3
        Top = 18
        Width = 190
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'CODIGO_BOMBA'
        DataSource = dtsCadastro
        ReadOnly = True
        TabOrder = 1
      end
      object lkeTanque: TcxLookupComboBox
        Tag = 1
        Left = 3
        Top = 66
        TabStop = False
        Properties.KeyFieldNames = 'CODIGO_TANQUE'
        Properties.ListColumns = <
          item
            FieldName = 'DESCRICAO_TANQUE'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dtsTanque
        TabOrder = 0
        OnExit = lkeTanqueExit
        Width = 190
      end
      object edtDescricao: TDBEdit
        Tag = 1
        Left = 3
        Top = 114
        Width = 190
        Height = 21
        DataField = 'DESCRICAO_BOMBA'
        DataSource = dtsCadastro
        TabOrder = 2
      end
    end
  end
  inherited cdsCadastro: TClientDataSet
    Left = 720
    Top = 214
  end
  inherited dtsCadastro: TDataSource
    Left = 720
    Top = 164
  end
  object dtsTanque: TDataSource
    DataSet = DMConexao.cdsTanques
    OnStateChange = dtsCadastroStateChange
    Left = 720
    Top = 116
  end
end
