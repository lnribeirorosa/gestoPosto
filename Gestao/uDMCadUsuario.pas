unit uDMCadUsuario;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Datasnap.Provider, Datasnap.DBClient;

type
  TDMCadUsuario = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCadUsuario: TDMCadUsuario;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses uDMConexao;

{$R *.dfm}

end.
