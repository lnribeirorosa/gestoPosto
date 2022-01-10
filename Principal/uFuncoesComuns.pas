unit uFuncoesComuns;

interface
    uses DBGrids, JvDBUltimGrid, DB, SqlExpr, TypInfo, StdCtrls, Windows, Graphics, Controls, ComCtrls, DBXCommon, SysUtils, Vcl.Forms, JvCipher,
    Datasnap.DBClient, cxGridDBTableView, Vcl.Clipbrd;
 type
     TFuncoes = class
     private
     public
       class procedure SetaGrid(Grid: TcxGridDBTableView);
       class function BuscaDados(Tabela: String; Filtro: String): TSQLQuery;
       class procedure FSetFocus(Obj: TWincontrol);
       class function ExecutaBanco(FSQL: String): Boolean;
       class function MensagemPadrao(Mensagem: String; Opcao: Integer): boolean;
       class function CriptografaSenha(Senha: String; Opcao: Integer): String;
       class function TrataErro(Erro: String): string;
       class procedure ReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
       var Action: TReconcileAction);
       class procedure ExtractQuery(const Message: string);
   end;

implementation

{ TFuncoes }

uses uDMConexao;

class function TFuncoes.BuscaDados(Tabela, Filtro: String): TSQLQuery;
begin
  try
    Result := TSQLQuery.Create(nil);
    Result.SQLConnection := DMConexao.sqcConexaoPrincipal;
    Result.SQL.Text := 'SELECT * FROM ' + Tabela + ' WHERE ' + Filtro;
    Result.Open;
  finally
  end;
end;

class procedure TFuncoes.ExtractQuery(const Message: string);
begin
  Clipboard.AsText := Message;
end;

class function TFuncoes.CriptografaSenha(Senha: String; Opcao: Integer): String;
var encSenha: TJvCaesarCipher;
begin
  Result := '';
  try
    encSenha     := TJvCaesarCipher.Create(nil);
    encSenha.Key := 'SYSMAISMAISPRODUTIVIDADEPARASUAEMPRESA';
    case Opcao of
      01: //Criptografa
      begin
        encSenha.Decoded := Senha;
        Result           := encSenha.Encoded;
      end;
      02: //Descriptografa
      begin
        encSenha.Encoded := Senha;
        Result           := encSenha.Decoded;
      end;
    end;

  finally
    FreeAndNil(encSenha);
  end;
end;

class function TFuncoes.ExecutaBanco(FSQL: String): Boolean;
var Transacao: TdbxTransaction;
begin
  try
    Result := False;
    Transacao := DMConexao.sqcConexaoPrincipal.BeginTransaction;
    DMConexao.sqcConexaoPrincipal.ExecuteDirect(FSQL);
    DMConexao.sqcConexaoPrincipal.CommitFreeAndNil(Transacao);
    Result := True;
    except
    on Exception do
    begin
       DMConexao.sqcConexaoPrincipal.RollbackFreeAndNil(Transacao);
       Result := False;
//       MensagemPadrao(e.Message + '  ' + FSQl, 0);
    end;
  end;
end;
class procedure TFuncoes.FSetFocus(Obj: TWincontrol);
var TabSheet, Pag: TWinControl;
    Continuar: Integer;
begin
  if Obj = nil then
    exit;

  Pag := Obj;
  TabSheet := Obj;
  Continuar      := 1;

  while (Continuar = 1) do
  begin
    if ((Pag = nil) or(TabSheet = nil)) or
        ((Pag.Parent = nil) or (TabSheet.Parent = nil)) then
      Break;

    Pag := Pag.Parent;
    if Pag.ClassType = TPageControl then
    begin
      TPageControl(Pag).ActivePageIndex := TTabSheet(TabSheet).PageIndex;
      Continuar := 0;
    end
    else
      TabSheet := TabSheet.Parent;
  end;

  if Obj.CanFocus then
  begin
    Obj.SetFocus;
  end;
end;

class function TFuncoes.MensagemPadrao(Mensagem: String;
  Opcao: Integer): boolean;
begin
  case Opcao of
    0: Application.MessageBox(PChar(Mensagem), 'Gestão - Todos os direitos reservados: Eliene Ribeiro Rosa', Opcao); // Alerta
    4: Result := (Application.MessageBox(Pchar(Mensagem), 'Gestão: ', MB_YESNO + MB_DEFBUTTON2) = ID_NO); // Confirmacao
  end;
end;

class procedure TFuncoes.ReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
   TrataErro(e.Message);
end;

class procedure TFuncoes.SetaGrid(Grid: TcxGridDBTableView);
var i: Integer;
begin
  for i := 0 to Grid.ColumnCount - 1 do
  begin
    if (Grid.Columns[i].DataBinding = nil) or (Grid.Columns[i].DataBinding.Field = nil) then
      Continue;

    case Grid.Columns[i].DataBinding.Field.DataType of
      ftDate, ftTimeStamp:
      begin
         Grid.Columns[i].Width := 100;
      end;
      ftString:
      begin
        Grid.Columns[i].Width := Grid.Columns[i].DataBinding.Field.Size;
      end;
      ftFMTBcd:
      begin
        Grid.Columns[i].Width := 80;
      end;
    end;

    if Grid.Columns[i].DataBinding.Field.DisplayLabel <> '' then
    begin
      if Length(Grid.Columns[i].DataBinding.Field.DisplayLabel) >  Grid.Columns[i].Width then
        Grid.Columns[i].Width := Length(Grid.Columns[i].DataBinding.Field.DisplayLabel);

    end
    else
    begin
      if Length(Grid.Columns[i].DataBinding.Field.FullName) >  Grid.Columns[i].Width then
        Grid.Columns[i].Width := Length(Grid.Columns[i].DataBinding.Field.FullName);
    end;
  end;
end;

class function TFuncoes.TrataErro(Erro: String): string;
var mensagem, aux, aux2, Tabela1, Tabela2, Texto: string;
    Pos1, Pos2: integer;
begin
  Result := '';

  if Pos('must have a value', Erro) <> 0 then
  begin
    Pos1 := Pos('''', Erro);
    mensagem := Erro;
    Delete(mensagem, Pos1, 1);
    Pos2 := Pos('''', mensagem);
    mensagem := copy(Erro, Pos1 + 1, Pos2 - Pos1);

    Aux := 'Campo com preenchimento obrigatório. Verifique! " '+ mensagem + ' ".';
  end
  else if Pos('violation of PRIMARY or UNIQUE KEY constraint', Erro) <> 0 then
    Aux := 'Código em duplicidade. Registro já incluido.'
  else if Pos(UpperCase('Input value'), UpperCase(Erro)) <> 0 then
    Aux := 'Campo preenchido incorretamente.'
  else if Pos('violation of FOREIGN KEY constraint', Erro) <> 0 then
  begin
    if Pos('Foreign key references are present for the record', Erro) = 0 then
    begin
      aux   := copy(Erro, 41, Length(Erro));

      pos1  := pos('on table', aux) - 2;
      aux2  := copy(aux, pos1, Length(aux));
      Texto := aux;

      Texto := StringReplace(Texto, aux2, '', []);

      pos1    := pos('_', Texto);
      Tabela1 := copy(Texto, 1, pos1 - 1);
      Tabela2 := Copy(Texto, pos1 + 1, Length(Texto));

      Aux := 'Registro da tabela: ' + Tabela2 + ' informado para Tabela ' + Tabela1 + ', não Existe.';
    end
    else
    begin
      pos1 := pos('table', Erro) + 5;
      Pos2 := (pos('Foreign', Erro) - pos1);
      Tabela1 := copy(Erro, pos1, pos2);
      Aux := 'O Registro faz referência a tabela: ' + Tabela1;
    end;
  end
  else
    Aux := 'Ocorreu o seguinte erro: '+ UpperCase(Erro) + '. Entre em contato com o suporte técnico.';

  if Aux <> '' then
    Result := Aux;
end;

end.
