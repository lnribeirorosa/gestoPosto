unit uTelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMestre, Vcl.Menus, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, JvGIF, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, JvComponentBase, JvCipher, Vcl.Imaging.pngimage;

type
  TfrmTelaPrincipal = class(TfrmMestre)
    MainMenu1: TMainMenu;
    Ajuda1: TMenuItem;
    Cadastros1: TMenuItem;
    Usurios1: TMenuItem;
    Relatrios1: TMenuItem;
    Label1: TLabel;
    Funo1: TMenuItem;
    Relatorio1: TMenuItem;
    Movimentao1: TMenuItem;
    ControleAbastecimento1: TMenuItem;
    anque1: TMenuItem;
    procedure Ajuda1Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Relatorio1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Funo1Click(Sender: TObject);
    procedure ControleAbastecimento1Click(Sender: TObject);
    procedure anque1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelaPrincipal: TfrmTelaPrincipal;

implementation

{$R *.dfm}

uses uCadUsuario, uDMConexao, uFuncoesComuns,
  uBomba, uControleAbastecimento, uTanque, uRelatorio;

procedure TfrmTelaPrincipal.Ajuda1Click(Sender: TObject);
begin
  inherited;
  ShowMessage(DMConexao.FConfig.Versao);
end;


procedure TfrmTelaPrincipal.anque1Click(Sender: TObject);
begin
  inherited;
  frmCadTanque := TfrmCadTanque.Create(nil);
  frmCadTanque.ShowModal;

end;

procedure TfrmTelaPrincipal.ControleAbastecimento1Click(Sender: TObject);
begin
  inherited;
  frmCadControleBomba := TfrmCadControleBomba.Create(nil);
  frmCadControleBomba.ShowModal;

end;

procedure TfrmTelaPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmTelaPrincipal := nil;
end;

procedure TfrmTelaPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  if DMConexao.sqcConexaoPrincipal.Connected then
  begin
    Label1.Caption := 'Banco conectado: ' + DMConexao.FConfig.CaminhoBanco;
  end;
end;

procedure TfrmTelaPrincipal.FormShow(Sender: TObject);
begin
  inherited;
  Self.Top    := 0;
  Self.Left   := 0;
  Self.Height := Screen.WorkAreaHeight;
  Self.Width  := Screen.WorkAreaWidth
end;

procedure TfrmTelaPrincipal.Funo1Click(Sender: TObject);
begin
  inherited;
  frmCadBomba := TfrmCadBomba.Create(nil);
  frmCadBomba.ShowModal;

end;

procedure TfrmTelaPrincipal.Relatorio1Click(Sender: TObject);
begin
  inherited;
  frmRelatorio := TfrmRelatorio.Create(nil);
  frmRelatorio.ShowModal;
end;

procedure TfrmTelaPrincipal.Usurios1Click(Sender: TObject);
begin
  inherited;
  frmCadUsuario := TfrmCadUsuario.Create(nil);
  frmCadUsuario.ShowModal;

end;

end.
