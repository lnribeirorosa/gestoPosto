inherited frmCadTanque: TfrmCadTanque
  Caption = 'Cadastro Tanque'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControlCadastro: TPageControl
    ActivePage = TabInfcadastrais
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
      object lblDescricao: TLabel
        Left = 3
        Top = 45
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = edtDescricao
      end
      object edtCodigo: TDBEdit
        Tag = 1
        Left = 3
        Top = 18
        Width = 190
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'CODIGO_TANQUE'
        DataSource = dtsCadastro
        ReadOnly = True
        TabOrder = 1
      end
      object edtDescricao: TDBEdit
        Tag = 1
        Left = 3
        Top = 64
        Width = 190
        Height = 21
        DataField = 'DESCRICAO_TANQUE'
        DataSource = dtsCadastro
        TabOrder = 0
      end
    end
  end
end
