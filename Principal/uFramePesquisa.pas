unit uFramePesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  Vcl.ComCtrls, JvToolEdit, Vcl.Mask, JvExMask, JvBaseEdits, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.FMTBcd, Datasnap.Provider, Data.SqlExpr,
  JvExStdCtrls, JvCombobox, StrUtils;


type
  TipoCombo       = (tcIgual, tcDiferente, tcMaior, tcMenor, tcIntervalo, tcIniciado, tcTerminado, tcContendo,tcEm, tcTodos);
  TFramePesquisa = class(TFrame)
    cdsConsulta: TClientDataSet;
    lblFoco: TLabel;
    pgcPesquisa: TPageControl;
    tabTexto: TTabSheet;
    lblTexto: TLabel;
    edtTexto: TEdit;
    tabNumero: TTabSheet;
    lblValor: TLabel;
    edtValorIni: TJvCalcEdit;
    edtValorFim: TJvCalcEdit;
    tabData: TTabSheet;
    lblData: TLabel;
    Label1: TLabel;
    edtDataIni: TJvDateEdit;
    edtDataFim: TJvDateEdit;
    sqqPesquisa: TSQLQuery;
    dspPesquisa: TDataSetProvider;
    PageControl1: TPageControl;
    TabOperacaoTexto: TTabSheet;
    TabOperacoes: TTabSheet;
    cbbOperacaoTexto: TJvComboBox;
    cbbOperacoes: TJvComboBox;
    lblFiltro: TLabel;
    lblA: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    btnPesquisar: TBitBtn;
    procedure cbbOperacoesCloseUp(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure cbbOperacaoTextoCloseUp(Sender: TObject);
  private
    { Private declarations }
    FTipoCombo: TipoCombo;
    function getOperacao(ApenasOp: Boolean = False): String;
    function getTipoOperacao(ActiveComponet: TJvComboBox) : TipoCombo;

  public
    { Public declarations }
    FTipoCampo: TFieldType;
    FNomeCampo: String;
    FTextoCampo: String;
    FTabela: String;
    FValorCampo: String;
    FCamposSQL: String;
    FClick: Boolean;
    FSQL: String;
    procedure FrameShow;
  end;

implementation

{$R *.dfm}

uses uDMConexao;


{ TFramePesquisa }

procedure TFramePesquisa.btnPesquisarClick(Sender: TObject);
var tecla: Word;
begin

  sqqPesquisa.SQL.Text := 'SELECT ' + FCamposSQL + ' FROM ' + FTabela + ' M '  + FSQL + IfThen(FTipoCombo <> tcTodos,  ' WHERE ' +  getOperacao, '');


  cdsConsulta.Close;
  cdsConsulta.Open;
//  FSQL :=   sqqPesquisa.SQL.Text;
  Tecla := vk_F7;
  FClick := True;
  TForm(Owner).OnKeyDown(Sender, Tecla, []);
  FClick := False;
end;

procedure TFramePesquisa.cbbOperacaoTextoCloseUp(Sender: TObject);
begin
  getTipoOperacao(cbbOperacaoTexto);
end;

procedure TFramePesquisa.cbbOperacoesCloseUp(Sender: TObject);
begin
  edtValorFim.Visible := (cbbOperacoes.ItemIndex = 5) and (TabOperacoes.Visible);
  edtDataFim.Visible  := (cbbOperacoes.ItemIndex = 5) and (TabOperacoes.Visible);
  getTipoOperacao(cbbOperacoes);
end;

procedure TFramePesquisa.FrameShow;
begin
  FClick                   := False;
  tabTexto.Visible         := False;
  tabNumero.Visible        := False;
  tabData.Visible          := False;
  TabOperacaoTexto.Visible := False;
  TabOperacoes.Visible     := False;

  case FTipoCampo of
    ftString:
    begin
      tabTexto.Visible := True;
      lblTexto.Caption := FTextoCampo;

    end;
    ftInteger, ftFMTBcd:
    begin
      tabNumero.Visible := true;
      lblValor.Caption  := FTextoCampo;
    end;

    ftTimeStamp, ftDate:
    begin
      tabData.Visible := true;
      lblData.Caption := FTextoCampo;
    end;
  end;

  if tabTexto.Visible then
  begin
    TabOperacaoTexto.Visible :=  true;
    TabOperacoes.Visible     := not TabOperacaoTexto.Visible;
    lblFiltro.FocusControl   := cbbOperacaoTexto;
    getTipoOperacao(cbbOperacaoTexto);
//    cbbOperacaoTextoCloseUp(nil);
  end
  else
  begin
    TabOperacoes.Visible     :=  true;
    lblFiltro.FocusControl   := cbbOperacoes;
//    cbbOperacoesCloseUp(nil);
    getTipoOperacao(cbbOperacoes);
  end;

  edtValorFim.Visible := (cbbOperacoes.ItemIndex = 4) and (TabOperacoes.Visible);
  edtDataFim.Visible  := (cbbOperacoes.ItemIndex = 4) and (TabOperacoes.Visible);

end;

function TFramePesquisa.getOperacao(ApenasOp: Boolean = False): String;
var Filtro_Aux: String;

  procedure getTexto;
    var Dec: Char;
  begin
    Dec :=  FormatSettings.DecimalSeparator;
    try
       FormatSettings.DecimalSeparator := '.';
      case FTipoCampo of
        ftString:
        begin
          FValorCampo := '%%';
          if Trim(edtTexto.Text) <> '' then
          begin
            if FTipoCombo in [tcIgual, tcDiferente]  then
            begin
              if edtTexto.Text <> QuotedStr('') then
                FValorCampo := QuotedStr(edtTexto.Text)
              else
                FValorCampo := edtTexto.Text;
            end
            else
              FValorCampo := edtTexto.Text;
          end;//if texto
        end;//ftstring
        ftDate, ftTimeStamp:
          case FTipoCombo of
            tcIgual, tcDiferente, tcMaior, tcMenor:
            begin
              if edtDataIni.Date > 0 then
              begin
                FValorCampo := FormatDateTime('dd/mm/yyyy', edtDataIni.Date);
              end;
            end;
            tcIntervalo:
            begin
              if edtDataIni.Date >  0 then
              begin
                FValorCampo := FormatDateTime('dd/mm/yyyy', edtDataIni.Date) + ' and '+
                               FormatDateTime('dd/mm/yyyy', edtDataFim.Date);
              end;
            end;
          end;
          ftSmallint, ftInteger, ftFloat, ftCurrency, ftBCD, ftFMTBcd:
          begin
            case FTipoCombo of
              tcIgual, tcDiferente, tcMaior, tcMenor:
              begin
                FValorCampo := FloatToStr(edtValorIni.Value);
              end;
              tcIntervalo:
              begin
                FValorCampo := FloatToStr(edtValorIni.Value) + ' and '+
                               FloatToStr(edtValorFim.Value);
              end;
            end;
          end;//ftdate
        end;
    finally
       FormatSettings.DecimalSeparator := Dec;
    end;
  end;
begin

  Result := '';
  getTexto;

  case FTipoCombo of
    tcIgual:         Filtro_Aux := ' =  ' ;
    tcDiferente:     Filtro_Aux := ' <> ';
    tcMaior:         Filtro_Aux := ' >  ';
    tcMenor:         Filtro_Aux := ' <  ';
    tcIntervalo:     Filtro_Aux := ' between ';
    tcIniciado:      Filtro_Aux := UpperCase('M.' + FNomeCampo) + ' like ' + QuotedStr(FValorCampo + '%' );
    tcTerminado:     Filtro_Aux := UpperCase('M.' + FNomeCampo) + ' like ' + QuotedStr('%' + FValorCampo);
    tcContendo:
    begin
      Filtro_Aux := UpperCase('M.' + FNomeCampo) + ' like ' + QuotedStr('%' + FValorCampo + '%');
      if Pos('+', Filtro_Aux) > 0 then
        Filtro_Aux := StringReplace(Filtro_Aux, '+', ' %', [rfReplaceAll]);
    end;
    tcEm:
    begin
      if (FTipoCampo = ftTimeStamp) or (FTipoCampo = ftDate) then
        FValorCampo := StringReplace(FValorCampo, '/', '.', [rfReplaceAll]);

      FValorCampo := '''' + StringReplace(FValorCampo, ',', '''' + ',' + '''', [rfReplaceAll]);
      FValorCampo := FValorCampo + '''';

      Filtro_Aux := UpperCase('M.' + FNomeCampo) + ' in (' + FValorCampo + ')';
    end;
  end;

  if (FValorCampo = '') then
  begin
    if (FTipoCampo = ftString) then
    begin
      if (FTipoCombo = tcIgual) or (FTipoCombo = tcDiferente) then
        FValorCampo := QuotedStr('');
    end
    else
    if(FTipoCampo = ftTimeStamp) then
    begin
      if (Filtro_Aux = '=') then
        Filtro_Aux := UpperCase('M.' + FNomeCampo)  + ' is NULL'
      else
        Filtro_Aux := ' not ' + UpperCase('M.' + FNomeCampo) + ' is NULL';
    end;
  end;

  if  FTipoCombo  in [tcIgual, tcDiferente, tcMaior, tcMenor, tcIntervalo] then
  begin
    if (FTipoCampo <> ftTimeStamp) then
    begin
      Filtro_Aux := Filtro_Aux + FValorCampo;
      if not ApenasOp then
        Filtro_Aux := UpperCase('M.' + FNomeCampo) + Filtro_Aux;
    end
    else
    begin
      if FValorCampo <> '' then
      begin
        Filtro_Aux := Filtro_Aux + FValorCampo;
        if not ApenasOp then
          Filtro_Aux := UpperCase('M.' + FNomeCampo) + Filtro_Aux;
      end;
    end;
  end;

  if not ApenasOp then
    Result := '(' + Filtro_Aux + ')'
  else
    Result := Filtro_Aux;
end;

function TFramePesquisa.getTipoOperacao(ActiveComponet: TJvComboBox): TipoCombo;
begin
  if PageControl1.ActivePage = TabOperacoes then
   begin
    case ActiveComponet.ItemIndex of
      0: FTipoCombo := tcTodos;
      1: FTipoCombo := tcIgual;
      2: FTipoCombo := tcDiferente;
      3: FTipoCombo := tcMaior;
      4: FTipoCombo := tcMenor;
      5: FTipoCombo := tcIntervalo;
    end;
   end
  else
   begin
    case ActiveComponet.ItemIndex of
      0: FTipoCombo := tcTodos;
      1: FTipoCombo := tcIgual;
      2: FTipoCombo := tcDiferente;
      3: FTipoCombo := tcIniciado;
      4: FTipoCombo := tcTerminado;
      5: FTipoCombo := tcContendo;
    end;
   end;
end;

end.
