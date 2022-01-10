inherited frmCadUsuario: TfrmCadUsuario
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 363
  ClientWidth = 746
  Position = poScreenCenter
  ExplicitWidth = 762
  ExplicitHeight = 402
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 3
    Top = 16
    Width = 31
    Height = 13
    Caption = 'Label2'
  end
  inherited pnlNavegacao: TPanel
    Width = 746
    ExplicitWidth = 746
  end
  inherited PageControlCadastro: TPageControl
    Width = 746
    Height = 304
    ActivePage = TabInfcadastrais
    ExplicitWidth = 746
    ExplicitHeight = 304
    inherited TabSheetConsulta: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 738
      ExplicitHeight = 276
      inherited Label3: TLabel
        Top = 263
        Width = 31
        ExplicitTop = 263
      end
      inherited pnlPesquisa: TPanel
        Width = 738
        Height = 88
        ExplicitWidth = 738
        ExplicitHeight = 88
      end
      inherited cxGrid: TcxGrid
        inherited cxGridDBTableView1: TcxGridDBTableView
          inherited cxGridDBTableViewEdit: TcxGridDBColumn
            IsCaptionAssigned = True
          end
        end
      end
    end
    inherited TabInfcadastrais: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 738
      ExplicitHeight = 276
      object lblUSUA_NOME: TLabel
        Left = 3
        Top = 45
        Width = 27
        Height = 13
        Caption = 'Nome'
        FocusControl = edtUSUA_NOME
      end
      object lblUSUA_LOGIN: TLabel
        Left = 5
        Top = 93
        Width = 25
        Height = 13
        Caption = 'Login'
        FocusControl = edtUSUA_LOGIN
      end
      object lblUSUA_SENHA: TLabel
        Left = 7
        Top = 141
        Width = 30
        Height = 13
        Caption = 'Senha'
        FocusControl = edtUSUA_SENHA
      end
      object Label4: TLabel
        Left = 3
        Top = 2
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtUSUA_NOME: TDBEdit
        Tag = 1
        Left = 3
        Top = 61
        Width = 121
        Height = 21
        DataField = 'USUA_NOME'
        DataSource = dtsCadastro
        TabOrder = 0
      end
      object edtUSUA_LOGIN: TDBEdit
        Tag = 1
        Left = 3
        Top = 112
        Width = 121
        Height = 21
        DataField = 'USUA_LOGIN'
        DataSource = dtsCadastro
        TabOrder = 1
      end
      object edtUSUA_SENHA: TDBEdit
        Tag = 1
        Left = 5
        Top = 160
        Width = 121
        Height = 21
        DataField = 'USUA_SENHA'
        DataSource = dtsCadastro
        PasswordChar = '*'
        TabOrder = 2
      end
      object DBEdit1: TDBEdit
        Tag = 1
        Left = 3
        Top = 18
        Width = 121
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'USUA_CODIGO'
        DataSource = dtsCadastro
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
  inherited cdsCadastro: TClientDataSet
    Left = 440
    Top = 72
  end
  inherited dtsCadastro: TDataSource
    Left = 440
    Top = 120
  end
end
