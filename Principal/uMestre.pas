unit uMestre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TypInfo, ComCtrls, ExtCtrls, jpeg, JvComponentBase,
  JvFormAutoSize, Grids, DBGrids, JvToolEdit, Mask, JvExMask, ActnList, DBCtrls,
  JvDBUltimGrid, JvDBControls, JvBaseEdits, JvDBTreeView, SQLExpr, Buttons,
  JvArrowButton;

type

  TfrmMestre = class(TForm)

    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }



  public
    { Public declarations }
    procedure Mudacor(Sender: TObject);
  end;
var
  frmMestre: TfrmMestre;


implementation

{$R *.dfm}

{ TfrmMestre }

procedure TfrmMestre.FormActivate(Sender: TObject);
begin
//  Screen.OnActiveControlChange := Mudacor;
  self.BringToFront;
end;

procedure TfrmMestre.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to self.ComponentCount-1 do
  begin
    if (IsPublishedProp(Components[i], 'ReadOnly')) and
       (IsPublishedProp(Components[i], 'Color')) then
    begin
      TEdit(Components[i]).CharCase :=  ecUpperCase;
      TEdit(Components[i]).OnEnter := Mudacor;
    end;
  end;
end;

procedure TfrmMestre.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case key of
    27:
    begin
      Self.Close;
      Abort;
    end;
  end;
end;

procedure TfrmMestre.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case key of
    #13:
    begin

      if ActiveControl<>nil then
      begin
         if  (ActiveControl.ClassType <> TJvDBUltimGrid) and ((ActiveControl.ClassType <> TDBGrid)) then
         begin
            key := #0;
            Keybd_event(VK_TAB,0,0,0);
         end;
      end;
    end;
  end;
end;

procedure TfrmMestre.Mudacor(Sender: TObject);
var nI: Integer;
begin
  try
    for nI := 0 to ComponentCount-1 do
    begin
      if (IsPublishedProp(Components[nI], 'ReadOnly')) and
         (IsPublishedProp(Components[nI], 'Color')) then
      begin
        if TEdit(Components[nI]).Focused then
          TEdit(Components[nI]).Color := RGB(220,233,241)
        else
          TEdit(Components[nI]).Color := clWhite;
      end;
    end;
  except

  end;
end;
end.
