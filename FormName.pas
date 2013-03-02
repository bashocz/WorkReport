unit FormName;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TFormPrjName = class(TForm)
    GridProject: TStringGrid;
    ButtonOk: TButton;
    ButtonCancel: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FillFormPrjName;
    procedure FillDataPrjName;
  end;

var
  FormPrjName: TFormPrjName;

implementation

{$R *.dfm}

uses
  FormMain;

procedure TFormPrjName.FillFormPrjName;
var
  idx: integer;
begin
  if (ProjectName <> nil) then
  begin
    GridProject.RowCount:=Length(ProjectName);
    idx:=High(ProjectName);
    while (idx > 0) do
    begin
      GridProject.Cells[0, Length(ProjectName)-idx]:=ProjectName[idx].ProjectNumber;
      GridProject.Cells[1, Length(ProjectName)-idx]:=ProjectName[idx].ProjectName;
      idx:=idx-1;
    end;
  end
  else
    GridProject.RowCount:=1;
end;

procedure TFormPrjName.FillDataPrjName;
var
  idx: integer;
begin
  if (ProjectName <> nil) then
  begin
    idx:=High(ProjectName);
    while (idx > 0) do
    begin
      ProjectName[idx].ProjectName:=GridProject.Cells[1, Length(ProjectName)-idx];
      idx:=idx-1;
    end;
  end;
end;

procedure TFormPrjName.FormCreate(Sender: TObject);
begin
  GridProject.Cells[0,0]:='Projekt';
  GridProject.Cells[1,0]:='Jméno projektu';
  GridProject.ColWidths[0]:=77;
end;

end.
