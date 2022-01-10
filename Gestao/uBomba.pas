unit uBomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroMestre, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinLilian,
  dxSkinsDefaultPainters, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxButtonEdit, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Datasnap.DBClient,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmCadBomba = class(TfrmCadastroMestre)
    lblCodigo: TLabel;
    edtCodigo: TDBEdit;
    lblFuncao: TLabel;
    lkeTanque: TcxLookupComboBox;
    dtsTanque: TDataSource;
    edtDescricao: TDBEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure lkeTanqueExit(Sender: TObject);
    procedure dtsCadastroStateChange(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Filtrar; override;
  end;

var
  frmCadBomba: TfrmCadBomba;

implementation

{$R *.dfm}

uses uDMConexao;

procedure TfrmCadBomba.btnGravarClick(Sender: TObject);
begin
  //
  inherited;

end;

procedure TfrmCadBomba.dtsCadastroStateChange(Sender: TObject);
begin
  inherited;
  lkeTanque.EditValue := 0;
  if cdsCadastro.FieldByName('CODIGO_TANQUE').AsInteger > 0 then
   begin
    lkeTanque.EditValue := cdsCadastro.FieldByName('CODIGO_TANQUE').AsInteger
   end;

end;

procedure TfrmCadBomba.Filtrar;
begin
  inherited;

end;

procedure TfrmCadBomba.FormCreate(Sender: TObject);
begin
  inherited;
  cdsCadastro                         := DMConexao.cdsBomba;
  Cadastro.TabelaPrincipal            := 'BOMBA';
  Cadastro.ChavePrimaria              := 'CODIGO_BOMBA';
  Cadastro.ShowRegistrosAberturaTela  := True;
  Cadastro.PrimeiroFoco               := lkeTanque;

  DMConexao.cdsTanques.Close;
  DMConexao.cdsTanques.Open;
end;

procedure TfrmCadBomba.lkeTanqueExit(Sender: TObject);
begin
  inherited;
  cdsCadastro.FieldByName('CODIGO_TANQUE').Value := lkeTanque.EditValue;
end;

end.
