unit uDashboard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinLilian,
  dxSkinsDefaultPainters, cxCustomData, Data.DB, cxDBData, Data.FMTBcd,
  Datasnap.Provider, Datasnap.DBClient, Data.SqlExpr, cxGridCustomView,
  cxGridChartView, cxGridDBChartView, cxClasses, cxGridLevel, cxGrid,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TfrmDashboard = class(TForm)
    DataSource1: TDataSource;
    cdsBomba: TClientDataSet;
    dspBomba: TDataSetProvider;
    cxGrid2: TcxGrid;
    cxGridLevel1: TcxGridLevel;
    cxGrid2ChartViewPie: TcxGridChartView;
    cxGrid1: TcxGrid;
    cxGridChartViewColumn: TcxGridChartView;
    cxGridLevel2: TcxGridLevel;
    fsqBomba: TFDQuery;
    cdsBombaTOTAL: TFMTBCDField;
    cdsBombaDESCRICAO_BOMBA: TStringField;
    cdsBombaMES: TSmallintField;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    dtDataIni: TcxDateEdit;
    edtDataFim: TcxDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }

    procedure GerarGraficoPizza(GridChartView: TcxGridChartView);
    procedure GerarGraficoBarra(GridChartView: TcxGridChartView);
  public
    { Public declarations }
  end;

var
  frmDashboard: TfrmDashboard;

implementation

{$R *.dfm}

uses uDMConexao;

procedure TfrmDashboard.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmDashboard := Nil;
end;

procedure TfrmDashboard.FormCreate(Sender: TObject);
var ASeries: TcxGridChartSeries;
    i: Integer;
begin
   GerarGraficoPizza(cxGrid2ChartViewPie);
   GerarGraficoBarra(cxGridChartViewColumn);
end;

procedure TfrmDashboard.GerarGraficoBarra(GridChartView: TcxGridChartView);
var i: Integer;
    ASeries: TcxGridChartSeries;
begin
  cdsBomba.Close;
  cdsBomba.Open;

  cdsBomba.First;

  GridChartView.Title.Text:= 'Dasboard - Gráfico de Barras' ;
  GridChartView.DiagramPie.Active := False;

   GridChartView.ClearSeries;
   i:=0;
   while not cdsBomba.Eof do
    begin
     with GridChartView.CreateSeries do
      begin
       DisplayText:= cdsBombaDESCRICAO_BOMBA.AsString;
       AddValue (cdsBombaTOTAL.AsFloat);
       GridChartView.Categories.Values [i]:= cdsBombaDESCRICAO_BOMBA.AsString;
       i:= i + 1;
      end;
      cdsBomba.next;
    end;
   GridChartView.DiagramColumn.Active := True
end;

procedure TfrmDashboard.GerarGraficoPizza(GridChartView: TcxGridChartView);
var i: Integer;
    ASeries: TcxGridChartSeries;
begin
  cdsBomba.Close;
  cdsBomba.Open;

  cdsBomba.First;

  GridChartView.Title.Text:= 'Dasboard Funcionário - Gráfico Pizza' ;
  GridChartView.DiagramPie.Active := False;

   GridChartView.ClearSeries;
   with GridChartView.CreateSeries do
    begin
      i:=0;
      DisplayText:= 'Gráfico';
      while not cdsBomba.Eof do
       begin
         AddValue (cdsBombaTOTAL.AsFloat);
         GridChartView.Categories.Values [i]:= cdsBombaDESCRICAO_BOMBA.AsString;
         i:= i + 1;
         cdsBomba.next;
        end;
    end;

   GridChartView.DiagramPie.Active := True
end;

end.
