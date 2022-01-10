unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMestre, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Data.FMTBcd, Data.DB,
  Data.SqlExpr, dxGDIPlusClasses;

type
  TfrmLogin = class(TfrmMestre)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    BitBtn1: TBitBtn;
    Image1: TImage;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses uFuncoesComuns, uTelaPrincipal;

procedure TfrmLogin.BitBtn1Click(Sender: TObject);
var Senha: String;
    SQL: TSQLQuery;
begin
  inherited;
  try
    Senha := TFuncoes.CriptografaSenha(edtSenha.Text, 1);
    SQL := TFuncoes.BuscaDados('USUARIO', 'USUA_LOGIN = ' + QuotedStr(edtUsuario.Text) + ' AND USUA_SENHA = ' + QuotedStr(Senha));
    if SQL.FieldByName('USUA_LOGIN').AsString <> '' then
    begin
      frmTelaPrincipal := TfrmTelaPrincipal.Create(nil);
      frmTelaPrincipal.ShowModal;
      Close;
    end
    else
    begin
     TFuncoes.MensagemPadrao('Usuário e senha não encontrados', 0);
    end;

  finally
   FreeAndNil(SQL);
   Close;
  end;

end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmLogin := Nil;

end;

end.
