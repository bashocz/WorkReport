unit FormPause;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormPauses = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ButtonClr1: TButton;
    ButtonClr2: TButton;
    ButtonClr3: TButton;
    ButtonClr4: TButton;
    ButtonClr5: TButton;
    EditFrom1: TEdit;
    EditFrom2: TEdit;
    EditFrom3: TEdit;
    EditFrom4: TEdit;
    EditFrom5: TEdit;
    EditTo1: TEdit;
    EditTo2: TEdit;
    EditTo3: TEdit;
    EditTo4: TEdit;
    EditTo5: TEdit;
    EditDescript1: TEdit;
    EditDescript2: TEdit;
    EditDescript3: TEdit;
    EditDescript4: TEdit;
    EditDescript5: TEdit;
    CBoxWorked1: TCheckBox;
    CBoxWorked2: TCheckBox;
    CBoxWorked3: TCheckBox;
    CBoxWorked4: TCheckBox;
    CBoxWorked5: TCheckBox;
    ButtonOk: TButton;
    ButtonCancel: TButton;
    procedure EditTimeExit(Sender: TObject);
    procedure EditKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonClr1Click(Sender: TObject);
    procedure ButtonClr2Click(Sender: TObject);
    procedure ButtonClr3Click(Sender: TObject);
    procedure ButtonClr4Click(Sender: TObject);
    procedure ButtonClr5Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    PauseDay: integer;
  public
    { Public declarations }
    procedure SetPauseForm(DispDay: integer);
    procedure GetPauseForm;
  end;

var
  FormPauses: TFormPauses;

implementation

{$R *.dfm}

uses
  FormMain;

procedure TFormPauses.SetPauseForm(DispDay: integer);
begin
  PauseDay:=DispDay;
  if (ReportData[DispYear,DispMonth].Days[PauseDay].PauseCount > 0) then
  begin
    if (ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[1].StartTime < 1) then
      EditFrom1.Text:=FormatDateTime('h:nn', ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[1].StartTime)
    else
      EditFrom1.Text:='00:00';
    if (ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[1].EndTime < 1) then
      EditTo1.Text:=FormatDateTime('h:nn', ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[1].EndTime)
    else
      EditTo1.Text:='00:00';
    EditDescript1.Text:=ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[1].Description;
    CBoxWorked1.Checked:=ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[1].IsWorked;
  end
  else
  begin
    EditFrom1.Text:='';
    EditTo1.Text:='';
    EditDescript1.Text:='';
    CBoxWorked1.Checked:=False;
  end;

  if (ReportData[DispYear,DispMonth].Days[PauseDay].PauseCount > 1) then
  begin
    if (ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[2].StartTime < 1) then
      EditFrom2.Text:=FormatDateTime('h:nn', ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[2].StartTime)
    else
      EditFrom2.Text:='00:00';
    if (ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[2].EndTime < 1) then
      EditTo2.Text:=FormatDateTime('h:nn', ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[2].EndTime)
    else
      EditTo2.Text:='00:00';
    EditDescript2.Text:=ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[2].Description;
    CBoxWorked2.Checked:=ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[2].IsWorked;
  end
  else
  begin
    EditFrom2.Text:='';
    EditTo2.Text:='';
    EditDescript2.Text:='';
    CBoxWorked2.Checked:=False;
  end;

  if (ReportData[DispYear,DispMonth].Days[PauseDay].PauseCount > 2) then
  begin
    if (ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[3].StartTime < 1) then
      EditFrom3.Text:=FormatDateTime('h:nn', ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[3].StartTime)
    else
      EditFrom3.Text:='00:00';
    if (ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[3].EndTime < 1) then
      EditTo3.Text:=FormatDateTime('h:nn', ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[3].EndTime)
    else
      EditTo3.Text:='00:00';
    EditDescript3.Text:=ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[3].Description;
    CBoxWorked3.Checked:=ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[3].IsWorked;
  end
  else
  begin
    EditFrom3.Text:='';
    EditTo3.Text:='';
    EditDescript3.Text:='';
    CBoxWorked3.Checked:=False;
  end;

  if (ReportData[DispYear,DispMonth].Days[PauseDay].PauseCount > 3) then
  begin
    if (ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[4].StartTime < 1) then
      EditFrom4.Text:=FormatDateTime('h:nn', ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[4].StartTime)
    else
      EditFrom4.Text:='00:00';
    if (ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[4].EndTime < 1) then
      EditTo4.Text:=FormatDateTime('h:nn', ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[4].EndTime)
    else
      EditTo4.Text:='00:00';
    EditDescript4.Text:=ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[4].Description;
    CBoxWorked4.Checked:=ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[4].IsWorked;
  end
  else
  begin
    EditFrom4.Text:='';
    EditTo4.Text:='';
    EditDescript4.Text:='';
    CBoxWorked4.Checked:=False;
  end;

  if (ReportData[DispYear,DispMonth].Days[PauseDay].PauseCount > 4) then
  begin
    if (ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[5].StartTime < 1) then
      EditFrom5.Text:=FormatDateTime('h:nn', ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[5].StartTime)
    else
      EditFrom5.Text:='00:00';
    if (ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[5].EndTime < 1) then
      EditTo5.Text:=FormatDateTime('h:nn', ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[5].EndTime)
    else
      EditTo5.Text:='00:00';
    EditDescript5.Text:=ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[5].Description;
    CBoxWorked5.Checked:=ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[5].IsWorked;
  end
  else
  begin
    EditFrom5.Text:='';
    EditTo5.Text:='';
    EditDescript5.Text:='';
    CBoxWorked5.Checked:=False;
  end;
end;

procedure TFormPauses.GetPauseForm;
var
  PauseIdx: integer;
  idx: integer;
  OutOfWork: double;
begin
  PauseIdx:=0;
  if (EditFrom1.Text <> '') then
  begin
    PauseIdx:=PauseIdx+1;
    ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].StartTime:=StrToTime(EditFrom1.Text);
    if not (ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].StartTime > 0) then
      ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].StartTime:=1;
    ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].EndTime:=StrToTime(EditTo1.Text);
    if not (ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].EndTime > 0) then
      ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].EndTime:=1;
    ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].Description:=EditDescript1.Text;
    ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].IsWorked:=CBoxWorked1.Checked;
  end;
  if (EditFrom2.Text <> '') then
  begin
    PauseIdx:=PauseIdx+1;
    ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].StartTime:=StrToTime(EditFrom2.Text);
    if not (ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].StartTime > 0) then
      ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].StartTime:=1;
    ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].EndTime:=StrToTime(EditTo2.Text);
    if not (ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].EndTime > 0) then
      ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].EndTime:=1;
    ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].Description:=EditDescript2.Text;
    ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].IsWorked:=CBoxWorked2.Checked;
  end;
  if (EditFrom3.Text <> '') then
  begin
    PauseIdx:=PauseIdx+1;
    ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].StartTime:=StrToTime(EditFrom3.Text);
    if not (ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].StartTime > 0) then
      ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].StartTime:=1;
    ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].EndTime:=StrToTime(EditTo3.Text);
    if not (ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].EndTime > 0) then
      ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].EndTime:=1;
    ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].Description:=EditDescript3.Text;
    ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].IsWorked:=CBoxWorked3.Checked;
  end;
  if (EditFrom4.Text <> '') then
  begin
    PauseIdx:=PauseIdx+1;
    ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].StartTime:=StrToTime(EditFrom4.Text);
    if not (ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].StartTime > 0) then
      ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].StartTime:=1;
    ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].EndTime:=StrToTime(EditTo4.Text);
    if not (ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].EndTime > 0) then
      ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].EndTime:=1;
    ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].Description:=EditDescript4.Text;
    ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].IsWorked:=CBoxWorked4.Checked;
  end;
  if (EditFrom5.Text <> '') then
  begin
    PauseIdx:=PauseIdx+1;
    ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].StartTime:=StrToTime(EditFrom5.Text);
    if not (ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].StartTime > 0) then
      ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].StartTime:=1;
    ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].EndTime:=StrToTime(EditTo5.Text);
    if not (ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].EndTime > 0) then
      ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].EndTime:=1;
    ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].Description:=EditDescript5.Text;
    ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[PauseIdx].IsWorked:=CBoxWorked5.Checked;
  end;
  ReportData[DispYear,DispMonth].Days[PauseDay].PauseCount:=PauseIdx;
  for idx:=PauseIdx+1 to 5 do
  begin
    ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[idx].StartTime:=0;
    ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[idx].EndTime:=0;
    ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[idx].Description:='';
    ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[idx].IsWorked:=False;
  end;
  OutOfWork:=0;
  for idx:=1 to 5 do
  begin
    if (not ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[idx].IsWorked) then
      OutOfWork:=OutOfWork+
        (ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[idx].EndTime -
         ReportData[DispYear,DispMonth].Days[PauseDay].Pauses[idx].StartTime);
  end;
  ReportData[DispYear,DispMonth].Days[PauseDay].TimeOutOfCompany:=OutOfWork;
end;

procedure TFormPauses.EditTimeExit(Sender: TObject);
var
  value: TDateTime;
  err: integer;
begin
  err:=0;
  if ((Sender as TEdit).Text = '') then
  begin
    err:=0;
    value:=0;
  end
  else
  begin
    if (not TryStrToTime((Sender as TEdit).Text, value)) then
      err:=1
    else
      (Sender as TEdit).Text:=FormatDateTime('h:nn', value);
  end;
  if (err <> 0) then
    (Sender as TEdit).SetFocus;
end;

procedure TFormPauses.EditKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    FindNextControl((Sender as TEdit),True,True,False).SetFocus;
end;

procedure TFormPauses.ButtonClr1Click(Sender: TObject);
begin
  EditFrom1.Text:='';
  EditTo1.Text:='';
  EditDescript1.Text:='';
  CBoxWorked1.Checked:=False;
end;

procedure TFormPauses.ButtonClr2Click(Sender: TObject);
begin
  EditFrom2.Text:='';
  EditTo2.Text:='';
  EditDescript2.Text:='';
  CBoxWorked2.Checked:=False;
end;

procedure TFormPauses.ButtonClr3Click(Sender: TObject);
begin
  EditFrom3.Text:='';
  EditTo3.Text:='';
  EditDescript3.Text:='';
  CBoxWorked3.Checked:=False;
end;

procedure TFormPauses.ButtonClr4Click(Sender: TObject);
begin
  EditFrom4.Text:='';
  EditTo4.Text:='';
  EditDescript4.Text:='';
  CBoxWorked4.Checked:=False;
end;

procedure TFormPauses.ButtonClr5Click(Sender: TObject);
begin
  EditFrom5.Text:='';
  EditTo5.Text:='';
  EditDescript5.Text:='';
  CBoxWorked5.Checked:=False;
end;

procedure TFormPauses.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (EditFrom1.Text <> '') and (EditTo1.Text = '') then
  begin
    CanClose:=False;
    EditTo1.SetFocus;
  end;
  if (EditFrom1.Text = '') and (EditTo1.Text <> '') then
  begin
    CanClose:=False;
    EditFrom1.SetFocus;
  end;
  if (EditFrom2.Text <> '') and (EditTo2.Text = '') then
  begin
    CanClose:=False;
    EditTo2.SetFocus;
  end;
  if (EditFrom2.Text = '') and (EditTo2.Text <> '') then
  begin
    CanClose:=False;
    EditFrom2.SetFocus;
  end;
  if (EditFrom3.Text <> '') and (EditTo3.Text = '') then
  begin
    CanClose:=False;
    EditTo3.SetFocus;
  end;
  if (EditFrom3.Text = '') and (EditTo3.Text <> '') then
  begin
    CanClose:=False;
    EditFrom3.SetFocus;
  end;
  if (EditFrom4.Text <> '') and (EditTo4.Text = '') then
  begin
    CanClose:=False;
    EditTo4.SetFocus;
  end;
  if (EditFrom4.Text = '') and (EditTo4.Text <> '') then
  begin
    CanClose:=False;
    EditFrom4.SetFocus;
  end;
  if (EditFrom5.Text <> '') and (EditTo5.Text = '') then
  begin
    CanClose:=False;
    EditTo5.SetFocus;
  end;
  if (EditFrom5.Text = '') and (EditTo5.Text <> '') then
  begin
    CanClose:=False;
    EditFrom5.SetFocus;
  end;
end;

end.
