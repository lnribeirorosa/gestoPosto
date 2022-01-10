program dprGestao;

uses
  Vcl.Forms,
  uMestre in '..\Principal\uMestre.pas' {frmMestre},
  uTelaPrincipal in 'uTelaPrincipal.pas' {frmTelaPrincipal},
  uCadastroMestre in '..\Principal\uCadastroMestre.pas' {frmCadastroMestre},
  uFramePesquisa in '..\Principal\uFramePesquisa.pas' {FramePesquisa: TFrame},
  uCadUsuario in 'uCadUsuario.pas' {frmCadUsuario},
  uDMConexao in '..\Principal\uDMConexao.pas' {DMConexao: TDataModule},
  uFuncoesComuns in '..\Principal\uFuncoesComuns.pas',
  uLogin in '..\Principal\uLogin.pas' {frmLogin},
  uBomba in 'uBomba.pas' {frmCadBomba},
  uRelatorio in 'uRelatorio.pas' {frmRelatorio},
  uControleAbastecimento in 'uControleAbastecimento.pas' {frmCadControleBomba},
  uTanque in 'uTanque.pas' {frmCadTanque};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Gestão';
  Application.CreateForm(TDMConexao, DMConexao);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.

