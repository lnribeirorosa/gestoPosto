unit uControleAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastroMestre, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinLilian,
  dxSkinsDefaultPainters, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxButtonEdit, cxContainer, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  System.ImageList, Vcl.ImgList, Datasnap.DBClient, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, cxMemo,
  cxDBEdit, cxCalendar, cxCalc, Vcl.ExtDlgs, cxImage, Vcl.Imaging.pngimage;

type
  TfrmCadControleBomba = class(TfrmCadastroMestre)
    lblFuncao: TLabel;
    edtQtde: TcxDBCalcEdit;
    lblQtde: TLabel;
    ddteData: TcxDBDateEdit;
    lblAdm: TLabel;
    lkeBomba: TcxLookupComboBox;
    dtsBomba: TDataSource;
    Label1: TLabel;
    edtValor: TcxDBCalcEdit;
    edtPercentual: TcxDBCalcEdit;
    Label2: TLabel;
    Label4: TLabel;
    edtTotal: TcxDBCalcEdit;
    procedure FormCreate(Sender: TObject);
    procedure dtsCadastroDataChange(Sender: TObject; Field: TField);
    procedure lkeBombaExit(Sender: TObject);
    procedure cdsCadastroNewRecord(DataSet: TDataSet);
    procedure edtQtdeExit(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure edtPercentualExit(Sender: TObject);
  private
    { Private declarations }

    procedure SetTotal;
  public
    { Public declarations }
    procedure Filtrar; override;

  end;

var
  frmCadControleBomba: TfrmCadControleBomba;

implementation

{$R *.dfm}

uses uDMConexao;

procedure TfrmCadControleBomba.cdsCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  cdsCadastro.FieldByName('PERCENTUAL_CONTROLE_BOMBA').AsFloat := 13;
end;

procedure TfrmCadControleBomba.dtsCadastroDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  lkeBomba.EditValue := 0;
  if cdsCadastro.FieldByName('CODIGO_BOMBA').AsInteger > 0 then
   begin
    lkeBomba.EditValue := cdsCadastro.FieldByName('CODIGO_BOMBA').AsInteger
   end;
end;

procedure TfrmCadControleBomba.edtPercentualExit(Sender: TObject);
begin
  inherited;
  SetTotal;
end;

procedure TfrmCadControleBomba.edtQtdeExit(Sender: TObject);
begin
  inherited;
  SetTotal;
end;

procedure TfrmCadControleBomba.edtValorExit(Sender: TObject);
begin
  inherited;
  SetTotal;
end;

procedure TfrmCadControleBomba.Filtrar;
begin
  inherited;

end;

procedure TfrmCadControleBomba.FormCreate(Sender: TObject);
begin
  inherited;
  cdsCadastro                        := DMConexao.cdsControleBomba;
  Cadastro.TabelaPrincipal           := 'CONTROLE_BOMBA';
  Cadastro.ChavePrimaria             := 'CODIGO_CONTROLE_BOMBA';
  Cadastro.ShowRegistrosAberturaTela := True;
  Cadastro.PrimeiroFoco              := lkeBomba;


  Cadastro.SqlConsulta := 'LEFT JOIN BOMBA D ON (D.CODIGO_BOMBA = M.CODIGO_BOMBA)';

  DMConexao.cdsBombas.Close;
  DMConexao.cdsBombas.Open;

end;

procedure TfrmCadControleBomba.lkeBombaExit(Sender: TObject);
begin
  inherited;
  cdsCadastro.FieldByName('CODIGO_BOMBA').Value := lkeBomba.EditValue;
end;


procedure TfrmCadControleBomba.SetTotal;
var Total: Currency;
begin

  Total := (cdsCadastro.FieldByName('QTDE_CONTROLE_BOMBA').AsFloat * cdsCadastro.FieldByName('VALOR_CONTROLE_BOMBA').AsFloat);

  cdsCadastro.FieldByName('TOTAL_CONTROLE_BOMBA').AsFloat :=  Total +
  (Total * cdsCadastro.FieldByName('PERCENTUAL_CONTROLE_BOMBA').AsFloat) /100;

end;

end.
