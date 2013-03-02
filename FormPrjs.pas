unit FormPrjs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TFormProjects = class(TForm)
    GridProject: TStringGrid;
    ButtonOk: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FillFormProjects;
  end;

var
  FormProjects: TFormProjects;

implementation

{$R *.dfm}

uses
  FormMain;

procedure TFormProjects.FillFormProjects;
var
  iP, iPx: integer;
  IsFind: boolean;
begin
  GridProject.RowCount:=2;
  iP:=SumMax;
  while (iP > 0) do
  begin
    if (ReportData[DispYear, DispMonth].ProjectSum[iP].ProjectHours > 0) or (iP = 1) then
    begin
      if (GridProject.RowCount = 2) then
        GridProject.RowCount:=iP+1;
      GridProject.Cells[0, GridProject.RowCount-iP]:=ReportData[DispYear, DispMonth].ProjectSum[iP].ProjectNumber;
      GridProject.Cells[2, GridProject.RowCount-iP]:=Format('%3.2f', [ReportData[DispYear, DispMonth].ProjectSum[iP].ProjectHours]);
      if (iP > 1) then
      begin
        iPx:=High(ProjectName); IsFind:=False;
        while (iPx > 0) and (not IsFind) do
        begin
          if (ReportData[DispYear, DispMonth].ProjectSum[iP].ProjectNumber = ProjectName[iPx].ProjectNumber) then
          begin
            if (ProjectName[iPx].ProjectName <> '') then
              GridProject.Cells[1, GridProject.RowCount-iP]:=ProjectName[iPx].ProjectName
            else
              GridProject.Cells[1, GridProject.RowCount-iP]:='Beze jména';
            IsFind:=True;
          end;
          iPx:=iPx-1;
        end;
        if (not IsFind) then
      end
      else
        GridProject.Cells[1, GridProject.RowCount-iP]:='Nezaøazené projekty';
    end;
    iP:=iP-1;
  end;
end;

procedure TFormProjects.FormCreate(Sender: TObject);
begin
  GridProject.Cells[0,0]:='Projekt';
  GridProject.Cells[1,0]:='Jméno projektu';
  GridProject.Cells[2,0]:='Hodiny';
end;

end.
