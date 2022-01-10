unit uRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinLilian, dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Vcl.StdCtrls, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxCalendar, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxButtonEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, ppDB,
  ppDBPipe, ppParameter, ppDesignLayer, ppBands, ppClass, ppPrnabl, ppCtrls,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, Datasnap.DBClient,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.Provider, System.DateUtils,
  ppStrtch, ppMemo;

type
  TfrmRelatorio = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    dtDataIni: TcxDateEdit;
    Label2: TLabel;
    edtDataFim: TcxDateEdit;
    Label3: TLabel;
    cxGrid: TcxGrid;
    cxGridDBTableViewRelatorio: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    dstRelatorio: TDataSource;
    dspRelatorio: TDataSetProvider;
    fsqRelatorio: TFDQuery;
    cdsRelatorio: TClientDataSet;
    ppRelatorio: TppReport;
    ppDesignLayers16: TppDesignLayers;
    ppDesignLayer16: TppDesignLayer;
    ppParameterList3: TppParameterList;
    pplRelatorio: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel6: TppLabel;
    lkeBomba: TcxLookupComboBox;
    lblFuncao: TLabel;
    cxGridDBTableViewRelatorioQTDE_CONTROLE_BOMBA: TcxGridDBColumn;
    cxGridDBTableViewRelatorioVALOR_CONTROLE_BOMBA: TcxGridDBColumn;
    cxGridDBTableViewRelatorioTOTAL_CONTROLE_BOMBA: TcxGridDBColumn;
    cxGridDBTableViewRelatorioDATA: TcxGridDBColumn;
    cxGridDBTableViewRelatorioDESCRICAO_BOMBA: TcxGridDBColumn;
    cxGridDBTableViewRelatorioDESCRICAO_TANQUE: TcxGridDBColumn;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel5: TppLabel;
    ppLabel4: TppLabel;
    ppLabel7: TppLabel;
    dtsBomba: TDataSource;
    ppLine1: TppLine;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorio: TfrmRelatorio;

implementation

{$R *.dfm}

uses uDMConexao, uFuncoesComuns;

procedure TfrmRelatorio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmRelatorio := nil;
end;

procedure TfrmRelatorio.FormCreate(Sender: TObject);
begin
  dtDataIni.Text  :=  DateToStr(StartOfTheMonth(date));
  edtDataFim.Text :=  DateToStr(date);

  DMConexao.cdsBombas.Close;
  DMConexao.cdsBombas.Open;

end;

procedure TfrmRelatorio.SpeedButton1Click(Sender: TObject);
var Sql: TStringList;
begin
    Sql := TStringList.Create;
    try
     if ((dtDataIni.Text = '') or (edtDataFim.Text = ''))  then
      begin
       TFuncoes.MensagemPadrao('As Datas devem ser informadas!', 0);
       Exit;
      end;

      if ((StrToDate(dtDataIni.Text)) >= (StrToDate(edtDataFim.Text))) then
       begin
        TFuncoes.MensagemPadrao('A Data Inicial deve ser menor que a Data Final!', 0);
        Exit;
       end;

     Sql.Add(' SELECT M.QTDE_CONTROLE_BOMBA, M.VALOR_CONTROLE_BOMBA, M.TOTAL_CONTROLE_BOMBA, M.DATA, M.CODIGO_CONTROLE_BOMBA, M.CODIGO_BOMBA, ');
     Sql.Add('        D.CODIGO_TANQUE, D.DESCRICAO_BOMBA, D.CODIGO_BOMBA,                                                                     ');
     Sql.Add('        T.DESCRICAO_TANQUE                                                                                                      ');
     Sql.Add(' FROM CONTROLE_BOMBA M                                                                                                          ');
     Sql.Add(' LEFT JOIN BOMBA D ON (D.CODIGO_BOMBA = M.CODIGO_BOMBA)                                                                         ');
     Sql.Add(' LEFT JOIN TANQUE T ON (T.CODIGO_TANQUE = D.CODIGO_TANQUE)                                                                      ');
     Sql.Add(' WHERE M.DATA BETWEEN :DataIni and :DataFim');


     if lkeBomba.EditValue > 0 then
      begin
        Sql.Add('  AND M.CODIGO_BOMBA = ' + IntToStr(lkeBomba.EditValue));
      end;

     Sql.Add('ORDER BY M.DATA, D.CODIGO_TANQUE, D.CODIGO_BOMBA');
     fsqRelatorio.SQL                                     := Sql;
     dstRelatorio.DataSet                                 := nil;
     cdsRelatorio.Close;

     cxGridDBTableViewRelatorio.DataController.DataSource := nil;
     cdsRelatorio.FetchParams;

     cdsRelatorio.ParamByName('DataIni').AsDate           := dtDataIni.Date;
     cdsRelatorio.ParamByName('DataFim').AsDate           := edtDataFim.Date;

     cdsRelatorio.Open;

     dstRelatorio.DataSet                                 :=  cdsRelatorio;
     cxGridDBTableViewRelatorio.DataController.DataSource :=  dstRelatorio;
    finally
     Sql.Free;
    end;

end;

procedure TfrmRelatorio.SpeedButton2Click(Sender: TObject);
begin
  if cdsRelatorio.RecordCount = 0  then
   begin
    TFuncoes.MensagemPadrao('Não há informações a serem impressas!', 0);
    Exit;
   end;

 cdsRelatorio.DisableControls;
 try
   ppRelatorio.Print;
 finally
   cdsRelatorio.EnableControls;
 end;
end;

end.
