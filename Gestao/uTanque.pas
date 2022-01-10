unit uTanque;

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
  cxClasses, cxGridCustomView, cxGrid, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmCadTanque = class(TfrmCadastroMestre)
    lblCodigo: TLabel;
    edtCodigo: TDBEdit;
    edtDescricao: TDBEdit;
    lblDescricao: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Filtrar; override;
  end;

var
  frmCadTanque: TfrmCadTanque;

implementation

{$R *.dfm}

uses uDMConexao;

procedure TfrmCadTanque.Filtrar;
begin
  inherited;

end;

procedure TfrmCadTanque.FormCreate(Sender: TObject);
begin
  inherited;
  cdsCadastro                          := DMConexao.cdsTanque;
  Cadastro.TabelaPrincipal            := 'TANQUE';
  Cadastro.ChavePrimaria              := 'CODIGO_TANQUE';
  Cadastro.ShowRegistrosAberturaTela  := True;

end;

end.
