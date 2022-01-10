unit uCadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroMestre, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Datasnap.DBClient, Vcl.Mask, JvExMask,
  JvToolEdit, JvBaseEdits, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinLilian,
  dxSkinsDefaultPainters, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxButtonEdit;

type
  TfrmCadUsuario = class(TfrmCadastroMestre)
    Label2: TLabel;
    edtUSUA_NOME: TDBEdit;
    lblUSUA_NOME: TLabel;
    edtUSUA_LOGIN: TDBEdit;
    lblUSUA_LOGIN: TLabel;
    edtUSUA_SENHA: TDBEdit;
    lblUSUA_SENHA: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Filtrar; override;
  end;

var
  frmCadUsuario: TfrmCadUsuario;

implementation

{$R *.dfm}

uses uDMCadUsuario, uFuncoesComuns, uDMConexao;

procedure TfrmCadUsuario.btnAlterarClick(Sender: TObject);
begin
  inherited;
  edtUSUA_SENHA.Field.AsString := TFuncoes.CriptografaSenha(edtUSUA_SENHA.Field.AsString, 2);
end;

procedure TfrmCadUsuario.btnGravarClick(Sender: TObject);
begin
  edtUSUA_SENHA.Field.AsString := TFuncoes.CriptografaSenha(edtUSUA_SENHA.Field.AsString, 1);
  inherited;
end;

procedure TfrmCadUsuario.Filtrar;
begin
  inherited;

end;

procedure TfrmCadUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  cdsCadastro                         := DMConexao.cdsUsuario;
  Cadastro.TabelaPrincipal            := 'USUARIO';
  Cadastro.ChavePrimaria              := 'USUA_CODIGO';
  Cadastro.ShowRegistrosAberturaTela  := True;
end;

end.
