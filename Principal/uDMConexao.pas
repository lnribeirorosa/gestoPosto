unit uDMConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DBXInterBase, Data.DB, Data.SqlExpr,
  Data.DBXFirebird, IniFiles, Forms, JvJCLUtils, Data.FMTBcd, Datasnap.Provider,
  Datasnap.DBClient, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;


type
  TConfigura = record
   CaminhoBanco  :String;
   FBClient      :String;
   Usuario       :String;
   Senha         :String;
   Versao        :String;
  end;

type
  TDMConexao = class(TDataModule)
    sqcConexaoPrincipal: TSQLConnection;
    dspUsuario: TDataSetProvider;
    cdsBomba: TClientDataSet;
    dspBomba: TDataSetProvider;
    FDConnection: TFDConnection;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    fsqUsuario: TFDQuery;
    cdsUsuario: TClientDataSet;
    cdsUsuarioUSUA_CODIGO: TIntegerField;
    cdsUsuarioUSUA_NOME: TStringField;
    cdsUsuarioUSUA_LOGIN: TStringField;
    cdsUsuarioUSUA_SENHA: TStringField;
    fsqBomba: TFDQuery;
    cdsControleBomba: TClientDataSet;
    dspControleBomba: TDataSetProvider;
    fsqControleBomba: TFDQuery;
    cdsBombas: TClientDataSet;
    IntegerField2: TIntegerField;
    dspBombas: TDataSetProvider;
    fsqBombas: TFDQuery;
    cdsControleBombaCODIGO_CONTROLE_BOMBA: TIntegerField;
    cdsControleBombaCODIGO_BOMBA: TIntegerField;
    cdsControleBombaQTDE_CONTROLE_BOMBA: TFMTBCDField;
    cdsControleBombaVALOR_CONTROLE_BOMBA: TFMTBCDField;
    cdsControleBombaTOTAL_CONTROLE_BOMBA: TFMTBCDField;
    cdsControleBombaPERCENTUAL_CONTROLE_BOMBA: TFMTBCDField;
    cdsControleBombaDATA: TDateField;
    cdsTanque: TClientDataSet;
    dspTanque: TDataSetProvider;
    fsqTanque: TFDQuery;
    cdsTanqueCODIGO_TANQUE: TIntegerField;
    cdsTanqueDESCRICAO_TANQUE: TStringField;
    cdsBombasCODIGO_TANQUE: TIntegerField;
    cdsTanques: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    dspTanques: TDataSetProvider;
    fsqTanques: TFDQuery;
    cdsBombaCODIGO_BOMBA: TIntegerField;
    cdsBombaCODIGO_TANQUE: TIntegerField;
    cdsBombasDESCRICAO_BOMBA: TStringField;
    cdsBombaDESCRICAO_BOMBA: TStringField;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    cdsControleBombaDESCRICAO_BOMBA: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    Configuracao: TIniFile;
    procedure ConectionDatabase;
  public
    { Public declarations }
    FConfig: TConfigura;
  end;

var
  DMConexao: TDMConexao;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TDMConexao.ConectionDatabase;
begin
  sqcConexaoPrincipal.Close;
  sqcConexaoPrincipal.ConnectionName   := 'BANCO';
  sqcConexaoPrincipal.DriverName       := 'Interbase';
  sqcConexaoPrincipal.GetDriverFunc    := 'getSQLDriverINTERBASE';
  sqcConexaoPrincipal.LibraryName      := 'dbxint30.dll';

  sqcConexaoPrincipal.Params.Clear;
  sqcConexaoPrincipal.Params.add('drivername=FIREBIRD');
  sqcConexaoPrincipal.Params.add('librarynameosx=libsqlfb.dylib');
  sqcConexaoPrincipal.Params.add('vendorlibwin64=fbclient.dll');
  sqcConexaoPrincipal.Params.add('vendorlibosx=/Library/Frameworks/Firebird.framework/Firebird');
  sqcConexaoPrincipal.Params.add('Database=' + FConfig.CaminhoBanco);
  sqcConexaoPrincipal.Params.add('password=' + FConfig.Senha);
  sqcConexaoPrincipal.Params.add('sqldialect=3');
  sqcConexaoPrincipal.Params.add('user_name=' + FConfig.Usuario);
  sqcConexaoPrincipal.Params.add('trim char=False');
  sqcConexaoPrincipal.Open;

  FDConnection.Params.Values['Server']        := '127.0.0.1/3051';
  FDConnection.Params.Values['Database']      := FConfig.CaminhoBanco;
  FDConnection.Params.Values['User_Name']     := FConfig.Usuario;
  FDConnection.Params.Values['Password']      := FConfig.Senha;
  FDConnection.Params.Values['CharacterSet']  := 'WIN1252';

  try
   FDConnection.Open();
  except
   on E:Exception do
//    raise ShowMessage('Ocorreu o seguinte erro ao conectar no banco de dados: %s', [E.Message]);
  end;
end;

procedure TDMConexao.DataModuleCreate(Sender: TObject);
begin
  Configuracao          := TIniFile.Create(Copy(ExtractFilePath(Application.ExeName), 1,Length(ExtractFilePath(Application.ExeName))-4) + 'Database\Configuracao.ini');
  FConfig.CaminhoBanco  := UpperCase(Configuracao.ReadString('ACESSO', 'caminho', ''));
  FConfig.Usuario       := UpperCase(Configuracao.ReadString('ACESSO', 'usuario', ''));
  FConfig.Senha         := (Configuracao.ReadString('ACESSO', 'senha', ''));
  FConfig.FBClient      := UpperCase(Configuracao.ReadString('ACESSO', 'fbclient', ''));
  FConfig.Versao        := UpperCase(Configuracao.ReadString('ACESSO', 'versao', ''));

  ConectionDatabase;


end;

end.
