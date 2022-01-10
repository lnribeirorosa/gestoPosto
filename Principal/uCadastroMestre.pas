(*

  Herança de cadastros
  Field com
    Tag 7------------> Seram carregados na tela para consulta
    Tag 1 -----------> Campo Obrigatório
    DisplayLabel-----> Texto que aparecera na tela

*)
unit uCadastroMestre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMestre, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBUltimGrid, Vcl.ComCtrls, uFramePesquisa, Data.DB, Datasnap.DBClient,SqlExpr, TypInfo,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinLilian, dxSkinsDefaultPainters, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxButtonEdit, System.ImageList,
  Vcl.ImgList;

   type
     TCadastro = class
     private
       Dataset: TClientDataSet;
       FPrimeiroFoco: TWinControl;
       FShowRegistrosAberturaTela: Boolean;
       FTabelaPrincipal: String;
       FChavePrimaria: String;
       FFiltro: String;
       FSqlConsulta: String;

       procedure Open(Codigo: Variant);
       procedure IncluirRegistro;
       procedure EditarRegistro;
       procedure Gravar(bEdit: Boolean);
       procedure ExcluirRegistro;
       procedure ReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;  var Action: TReconcileAction);
     public
       property ShowRegistrosAberturaTela: Boolean read FShowRegistrosAberturaTela write FShowRegistrosAberturaTela;
       property TabelaPrincipal: String read FTabelaPrincipal write FTabelaPrincipal;
       property ChavePrimaria: String read FChavePrimaria write FChavePrimaria;
       property  Filtro: String read FFiltro write FFiltro;
       property  PrimeiroFoco: TWinControl read FPrimeiroFoco write FPrimeiroFoco;
       property  SqlConsulta: String read FSqlConsulta write FSqlConsulta;
   end;

type
  TfrmCadastroMestre = class(TfrmMestre)
    pnlNavegacao: TPanel;
    btnIncluir: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    PageControlCadastro: TPageControl;
    TabSheetConsulta: TTabSheet;
    TabInfcadastrais: TTabSheet;
    pnlPesquisa: TPanel;
    btnGravar: TBitBtn;
    cdsRegistros: TClientDataSet;
    dtsRegistros: TDataSource;
    Label3: TLabel;
    dtsCadastro: TDataSource;
    cxGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableViewEdit: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure JvDBUltimGrid_DadosDblClick(Sender: TObject);
    procedure dtsCadastroStateChange(Sender: TObject);
    procedure TabInfcadastraisShow(Sender: TObject);
    procedure PageControlCadastroChange(Sender: TObject);
    procedure cxGridDBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    radio: TRadioGroup;
    fFrame: TFramePesquisa;
    FCadastro: TCadastro;
  public
    { Public declarations }

    cdsCadastro: TClientDataSet;

    procedure radioClick(Sender:TObject);
    procedure SetaReadonly(Status: Boolean);
    procedure Filtrar; virtual; abstract;

    property Cadastro: TCadastro read FCadastro write FCadastro;
  end;

var
  frmCadastroMestre: TfrmCadastroMestre;

implementation

{$R *.dfm}

uses uFuncoesComuns, uDMConexao;



procedure TfrmCadastroMestre.btnGravarClick(Sender: TObject);
begin
  inherited;
  if (FCadastro.Dataset.Active) and ((FCadastro.Dataset.State in [dsInsert, dsEdit]) or
     (FCadastro.Dataset.UpdateStatus in [usInserted, usModified])) then
  begin
    FCadastro.Gravar(FCadastro.Dataset.State = dsEdit);
    Keybd_event(VK_F7,0,0,0);
  end;
end;

procedure TfrmCadastroMestre.btnAlterarClick(Sender: TObject);
begin
  inherited;
  FCadastro.Open(dtsRegistros.DataSet.FieldByName(FCadastro.ChavePrimaria).Value);
  dtsCadastro.DataSet            := FCadastro.Dataset;
  if (FCadastro.Dataset.Active) and (FCadastro.Dataset.RecordCount > 0) then
  begin
    FCadastro.EditarRegistro;
    TFuncoes.FSetFocus(FCadastro.FPrimeiroFoco);
    Keybd_event(VK_F7,0,0,0);
  end;
end;

procedure TfrmCadastroMestre.btnExcluirClick(Sender: TObject);
begin
  inherited;
  FCadastro.Open(dtsRegistros.DataSet.FieldByName(FCadastro.ChavePrimaria).Value);
  dtsCadastro.DataSet            := FCadastro.Dataset;
  if (FCadastro.Dataset.Active) and (FCadastro.Dataset.RecordCount > 0) then
  begin
    FCadastro.ExcluirRegistro;
    Keybd_event(VK_F7,0,0,0);
  end;
end;

procedure TfrmCadastroMestre.btnIncluirClick(Sender: TObject);
begin
  inherited;
  FCadastro.Open(Null);
  FCadastro.IncluirRegistro;
  dtsCadastro.DataSet :=  FCadastro.Dataset;
  TFuncoes.FSetFocus(FCadastro.FPrimeiroFoco);
end;

procedure TfrmCadastroMestre.cxGridDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);

var
  AColumn: TcxGridDBColumn;
begin
  inherited;

  AColumn := ACellViewInfo.Item as TcxGridDBColumn;

  if AColumn.Name = 'cxGridDBTableViewEdit' then
   begin
    FCadastro.Open(dtsRegistros.DataSet.FieldByName(FCadastro.ChavePrimaria).Value);
    if (FCadastro.Dataset.Active) and (FCadastro.Dataset.RecordCount > 0) then
    begin
      dtsCadastro.DataSet            := FCadastro.Dataset;
      PageControlCadastro.ActivePage := TabInfcadastrais;
      PageControlCadastroChange(Nil);
      FCadastro.Dataset.Edit;
    end;
   end;


end;

procedure TfrmCadastroMestre.cxGridDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  FCadastro.Open(dtsRegistros.DataSet.FieldByName(FCadastro.ChavePrimaria).Value);
  if (FCadastro.Dataset.Active) and (FCadastro.Dataset.RecordCount > 0) then
  begin
    dtsCadastro.DataSet            := FCadastro.Dataset;
    PageControlCadastro.ActivePage := TabInfcadastrais;
    PageControlCadastroChange(Nil);
  end;

end;

procedure TfrmCadastroMestre.dtsCadastroStateChange(Sender: TObject);
begin
  inherited;
  if dtsCadastro.DataSet = nil then
    Exit;
  SetaReadonly(dtsCadastro.DataSet.State in [dsInactive, dsBrowse]);
end;

procedure TfrmCadastroMestre.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Cadastro.Free;
  frmCadastroMestre := Nil;

end;

procedure TfrmCadastroMestre.FormCreate(Sender: TObject);
begin
  radio := TRadioGroup.Create(Self);
  radio.Caption := '[F6]';

  radio.Parent := pnlPesquisa;
  radio.Left := 0;
  radio.Top  := 0;
  radio.Columns := 3;

  radio.Height := pnlPesquisa.Height;
  radio.Width  := 0;

  inherited;
  FCadastro              := TCadastro.Create;
  FCadastro.FShowRegistrosAberturaTela := False;
end;

procedure TfrmCadastroMestre.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  case key of
    VK_F2:
    begin
      btnIncluirClick(Sender);
    end;
    VK_F3:
    begin
      btnExcluirClick(Sender);
    end;
    VK_F4:
    begin
      JvDBUltimGrid_DadosDblClick(Sender);
      btnAlterarClick(Sender);
    end;
    VK_F5:
    begin
      btnGravarClick(Sender);
    end;
    VK_F6:
    begin
      if ActiveControl.Parent.Parent <> nil then
      begin

        if fFrame <> nil then
        begin
          if ActiveControl.Parent.Parent <> fFrame.pgcPesquisa then
          begin
            if fFrame.tabTexto.Visible then
              fFrame.edtTexto.SetFocus
            else if  fFrame.tabNumero.Visible then
              fFrame.edtValorIni.SetFocus
            else if  fFrame.tabData.Visible then
              fFrame.edtDataIni.SetFocus;
          end
          else
            radio.Buttons[radio.ItemIndex].SetFocus;
        end;
      end;
    end;
    VK_F7:
    begin
      if not fFrame.FClick then
        fFrame.btnPesquisarClick(nil);

      FreeAndNil(cdsRegistros);
      cdsRegistros                                 := TClientDataSet.Create(Self);

      cdsRegistros.Data                            := fFrame.cdsConsulta.Data;

      Filtrar;

      dtsRegistros.DataSet                         := nil;
      cxGridDBTableView1.DataController.DataSource := nil;

      dtsRegistros.DataSet                         := cdsRegistros;
      cxGridDBTableView1.DataController.DataSource := dtsRegistros;

      Label3.Caption                               := fFrame.FSQL;

      TFuncoes.SetaGrid(cxGridDBTableView1);

      if cxGridDBTableView1.ColumnCount = 1 then
       begin
        cxGridDBTableView1.DataController.CreateAllItems();
        cxGridDBTableView1.Columns[cxGridDBTableView1.ColumnCount-1].Visible := False;
       end

    end;
  end;
end;

procedure TfrmCadastroMestre.FormShow(Sender: TObject);
var
  i: Integer;
  FCampos: String;
begin
  inherited;
  FCadastro.Dataset := cdsCadastro;
  FCadastro.Dataset.OnReconcileError := FCadastro.ReconcileError;
  FCampos := '';

  for i := 0 to cdsCadastro.Fields.Count -1 do
  begin
    if (cdsCadastro.Fields[i].Tag = 7) or ((cdsCadastro.Fields[i].Tag = 8)) then
    begin
      if (cdsCadastro.Fields[i].Tag = 7) then
       begin
        radio.Items.Add(cdsCadastro.Fields[i].DisplayLabel);
        radio.Buttons[radio.ControlCount-1].Name :=  cdsCadastro.Fields[i].FullName;
       end;

      FCampos := FCampos + cdsCadastro.Fields[i].FullName + ' as ' + '"' + cdsCadastro.Fields[i].DisplayLabel + '", ';
    end;
  end;

  FCampos := FCampos + FCadastro.ChavePrimaria;

  radio.Width := radio.ControlCount * 100;
  radio.OnClick := radioClick;

  fFrame := TFramePesquisa.Create(Self);

  fFrame.FCamposSQL   := FCampos;
  fFrame.Parent := pnlPesquisa;
  fFrame.Left := radio.Width + 1;
  fFrame.Top  := 20;

  if (Cadastro.SqlConsulta <> '') then
   fFrame.FSQL := Cadastro.SqlConsulta;

  fFrame.Show;
  radio.ItemIndex := 0;
  radio.SetFocus;
  radio.Buttons[0].SetFocus;

  Keybd_event(VK_F6,0,0,0);

  if FCadastro.FShowRegistrosAberturaTela then
    Keybd_event(VK_F7,0,0,0);


end;

procedure TfrmCadastroMestre.JvDBUltimGrid_DadosDblClick(Sender: TObject);
begin
  inherited;
  FCadastro.Open(dtsRegistros.DataSet.FieldByName(FCadastro.ChavePrimaria).Value);
  if (FCadastro.Dataset.Active) and (FCadastro.Dataset.RecordCount > 0) then
  begin
    dtsCadastro.DataSet            :=  FCadastro.Dataset;
    PageControlCadastro.ActivePage := TabInfcadastrais;
    PageControlCadastroChange(Nil);
  end;
end;

procedure TfrmCadastroMestre.PageControlCadastroChange(Sender: TObject);
begin
  inherited;
  if PageControlCadastro.ActivePage = TabInfcadastrais then
  begin
    if dtsCadastro.DataSet.State <> dsInsert then
      btnIncluir.SetFocus;
  end;
end;

procedure TfrmCadastroMestre.radioClick(Sender: TObject);
begin
  fFrame.FTipoCampo       := cdsCadastro.FieldByName(radio.Buttons[radio.ItemIndex].Name).DataType;
  fFrame.FTextoCampo      := cdsCadastro.FieldByName(radio.Buttons[radio.ItemIndex].Name).DisplayLabel;
  fFrame.FNomeCampo       := cdsCadastro.FieldByName(radio.Buttons[radio.ItemIndex].Name).FullName;
  fFrame.FTabela          := FCadastro.TabelaPrincipal;
  fFrame.cdsConsulta.Data := cdsCadastro.Data;
  fFrame.FrameShow;
end;

procedure TfrmCadastroMestre.SetaReadonly(Status: Boolean);
var nI: Integer;
    lbl: TLabel;
    ds: TDataSource;
    fn: string;
    c: TWinControl;
begin
  try
    for nI := 0 to ComponentCount-1 do
    begin
      if Components[nI] is TLabel then
      begin
        lbl := Components[nI] as TLabel;
        
        if (lbl.FocusControl <> nil) and (lbl.FocusControl is TWinControl) then
         begin
          
          c := TWinControl(lbl.FocusControl);

          if c.tag = 1 then
           begin
            lbl.Font.Style := [fsbold]; //Negrito
            lbl.Font.color := clMaroon; //Definimos a cor
            
           end;
         end;
      end;

      if Components[nI] is TWinControl then
      begin

        if (IsPublishedProp(Components[nI], 'TabStop')) then
        begin
          if TWinControl(Components[nI]).TabStop then
          begin
            if (Components[nI].ClassType <> TPanel) and
               (Components[nI].ClassType <> TJvDBUltimGrid) and
               (Components[nI].ClassType <> TDBGrid) and
               (Components[nI].ClassType <> TDBNavigator) then
            begin
           //   if (TWinControl(Components[nI]).Parent <> nil) and (TWinControl(Components[nI]).Parent  =  TabInfcadastrais) then
//              begin
                if TWinControl(Components[nI]).TabOrder = 0 then
                begin
                  if FCadastro <> nil then
                    FCadastro.FPrimeiroFoco := TWinControl(Components[nI]);
                end;
   //           end;
            end;
          end;
        end;
      end;

      if (IsPublishedProp(Components[nI], 'ReadOnly')) and
         (IsPublishedProp(Components[nI], 'Color')) then
      begin
          TEdit(Components[nI]).ReadOnly := Status;

      end;
    end;
  except

  end;
end;

procedure TfrmCadastroMestre.TabInfcadastraisShow(Sender: TObject);
begin
  inherited;

end;

{ TCadastro }

procedure TCadastro.EditarRegistro;
begin
  Dataset.EnableControls;
  Dataset.Edit;
end;

procedure TCadastro.ExcluirRegistro;
var texto: String;
begin
  if not(TFuncoes.MensagemPadrao('Deseja realmente excluir esse registro?', 4)) then
  begin
    Dataset.Delete;
    if Dataset.ApplyUpdates(0) = 0 then
    begin
     TFuncoes.MensagemPadrao('Registro excluido com sucesso!', 0);
    end;
  end;
end;

procedure TCadastro.Gravar(bEdit: Boolean);
var SQL: TSQLQuery;
    Chave: String;
    i: Integer;
begin
  try
    try
      if not(bEdit) then
       begin

        SQL := TFuncoes.BuscaDados('CHAVE', 'TABELA = ' + QuotedStr(TabelaPrincipal));
        if SQL.FieldByName('TABE_CODIGO').Value = null then
           Dataset.FieldByName(ChavePrimaria).Value := 1
        else
          Dataset.FieldByName(ChavePrimaria).Value := SQL.FieldByName('TABE_CODIGO').Value + 1;

        Chave := Dataset.FieldByName(ChavePrimaria).AsString;
       end;

      for i := 0 to Dataset.Fields.Count-1 do
      begin
        case Dataset.Fields[i].DataType of
          ftString:
          begin
            if Dataset.Fields[i].AsString = '' then
              Dataset.Fields[i].Value := null;
          end;
        end;

      end;

      Dataset.Post;
      if Dataset.ApplyUpdates(0) = 0 then           
      begin
        if not(bEdit) then
         begin
          if TFuncoes.ExecutaBanco('UPDATE CHAVE SET TABE_CODIGO = ' + Chave + ' WHERE TABELA = ''' + TabelaPrincipal + '''') then
          begin
            TFuncoes.MensagemPadrao('Dados Gravados com sucesso!', 0);
          end;
         end;

         if bEdit then
           TFuncoes.MensagemPadrao('Dados Gravados com sucesso!', 0);
         
      end;
    except on E: Exception do
      TFuncoes.MensagemPadrao(TFuncoes.TrataErro(E.Message), 0);
    end;
  finally
    FreeAndNil(SQL);
  end;
end;

procedure TCadastro.IncluirRegistro;
begin
  Dataset.Append;
  Dataset.FieldByName(ChavePrimaria).AsString := '999999999';
end;

procedure TCadastro.Open(Codigo: Variant);
begin
  Dataset.Close;
  Dataset.Params.ParamByName('CODIGO').Value := Codigo;
  Dataset.Open;
end;

procedure TCadastro.ReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  TFuncoes.MensagemPadrao(TFuncoes.TrataErro(e.Message), 0);
end;

end.
