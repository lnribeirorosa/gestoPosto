inherited frmTelaPrincipal: TfrmTelaPrincipal
  Caption = 'Gest'#227'o - Bemer'
  ClientHeight = 317
  ClientWidth = 1192
  Color = clWhite
  Menu = MainMenu1
  Position = poDesktopCenter
  PrintScale = poNone
  ScreenSnap = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 1208
  ExplicitHeight = 376
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 1192
    Height = 13
    Align = alTop
    Caption = 'Label1'
    ExplicitWidth = 31
  end
  object MainMenu1: TMainMenu
    Left = 888
    object Ajuda1: TMenuItem
      Caption = 'Ajuda'
      OnClick = Ajuda1Click
    end
    object Cadastros1: TMenuItem
      Caption = '&Cadastros'
      object Usurios1: TMenuItem
        Caption = '&Usu'#225'rio'
        OnClick = Usurios1Click
      end
      object anque1: TMenuItem
        Caption = 'Tanque'
        OnClick = anque1Click
      end
      object Funo1: TMenuItem
        Caption = '&Bomba'
        OnClick = Funo1Click
      end
    end
    object Movimentao1: TMenuItem
      Caption = 'Movimenta'#231#227'o'
      object ControleAbastecimento1: TMenuItem
        Caption = 'Controle Abastecimento'
        OnClick = ControleAbastecimento1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object Relatorio1: TMenuItem
        Caption = '&Relatorio'
        OnClick = Relatorio1Click
      end
    end
  end
end
