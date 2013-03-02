unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Menus, StdCtrls, Buttons, Spin, ExtCtrls, IniFiles, Printers,
  ComCtrls, ToolWin, XPMan;

type
  TFormReport = class(TForm)
    MainMenu: TMainMenu;
    MenuFile: TMenuItem;
    GridReport: TStringGrid;
    ComboDayType: TComboBox;
    MenuOpen: TMenuItem;
    MenuReport: TMenuItem;
    EditDescript: TEdit;
    EditProjectNumber: TEdit;
    EditProjectExt: TEdit;
    EditProjectHours: TEdit;
    EditHoursAtHome: TEdit;
    EditArrival: TEdit;
    EditLeaving: TEdit;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    MenuSave: TMenuItem;
    MenuPrintHours: TMenuItem;
    MenuPrintProject: TMenuItem;
    PrintDialog: TPrintDialog;
    MenuN1: TMenuItem;
    MenuFillProjectName: TMenuItem;
    MenuShowProject: TMenuItem;
    MenuSaveBack: TMenuItem;
    ControlBar1: TControlBar;
    PanelName: TPanel;
    LabelName: TLabel;
    EditName: TEdit;
    PanelDate: TPanel;
    LabelMonth: TLabel;
    ButtonMounth1: TSpeedButton;
    ButtonMounth2: TSpeedButton;
    ButtonMounth3: TSpeedButton;
    ButtonMounth4: TSpeedButton;
    ButtonMounth5: TSpeedButton;
    ButtonMounth6: TSpeedButton;
    ButtonMounth7: TSpeedButton;
    ButtonMounth8: TSpeedButton;
    ButtonMounth9: TSpeedButton;
    ButtonMounth10: TSpeedButton;
    ButtonMounth11: TSpeedButton;
    ButtonMounth12: TSpeedButton;
    EditYear: TSpinEdit;
    LabelYear: TLabel;
    XPManifest1: TXPManifest;
    MenuView: TMenuItem;
    MenuName: TMenuItem;
    MenuDate: TMenuItem;
    PanelReportFile: TPanel;
    LabelReportFile: TLabel;
    MenuReportFile: TMenuItem;
    N1: TMenuItem;
    PanelInfo: TPanel;
    LabelWorkingDays: TLabel;
    PanelWorkingDays: TPanel;
    LabelWorkedDays: TLabel;
    PanelWorkedDays: TPanel;
    LabelWorkedHours: TLabel;
    PanelWorkedHours: TPanel;
    LabelAveDayHours: TLabel;
    PanelAveDayHours: TPanel;
    LabelWorkingHours: TLabel;
    LabelOvettimeHours: TLabel;
    LabelMealTickets: TLabel;
    LabelAveDayOvertimeHours: TLabel;
    PanelWorkingHours: TPanel;
    PanelOvertimeHours: TPanel;
    PanelMealTickets: TPanel;
    PanelAveDayOvertimeHours: TPanel;
    MenuInfo: TMenuItem;
    PanelInfoLight: TPanel;
    LabelOvettimeHours2: TLabel;
    PanelOvertimeHours2: TPanel;
    MenuInfoLight: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ButtonMounthClick(Sender: TObject);
    procedure EditYearChange(Sender: TObject);
    procedure GridReportDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GridReportSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ComboDayTypeChange(Sender: TObject);
    procedure EditDescriptExit(Sender: TObject);
    procedure EditProjectNumberExit(Sender: TObject);
    procedure EditProjectExtExit(Sender: TObject);
    procedure EditProjectHoursExit(Sender: TObject);
    procedure EditHoursAtHomeExit(Sender: TObject);
    procedure EditArrivalExit(Sender: TObject);
    procedure EditLeavingExit(Sender: TObject);
    procedure EditDescriptKeyPress(Sender: TObject; var Key: Char);
    procedure EditProjectNumberKeyPress(Sender: TObject; var Key: Char);
    procedure EditProjectExtKeyPress(Sender: TObject; var Key: Char);
    procedure EditProjectHoursKeyPress(Sender: TObject; var Key: Char);
    procedure EditHoursAtHomeKeyPress(Sender: TObject; var Key: Char);
    procedure EditArrivalKeyPress(Sender: TObject; var Key: Char);
    procedure EditLeavingKeyPress(Sender: TObject; var Key: Char);
    procedure EditNameChange(Sender: TObject);
    procedure MenuOpenClick(Sender: TObject);
    procedure MenuSaveClick(Sender: TObject);
    procedure MenuSaveBackClick(Sender: TObject);
    procedure MenuPrintHoursClick(Sender: TObject);
    procedure GridReportMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MenuFillProjectNameClick(Sender: TObject);
    procedure MenuShowProjectClick(Sender: TObject);
    procedure MenuMainClick(Sender: TObject);
    procedure MenuNameClick(Sender: TObject);
    procedure MenuDateClick(Sender: TObject);
    procedure MenuReportFileClick(Sender: TObject);
    procedure MenuExitClick(Sender: TObject);
    procedure MenuInfoClick(Sender: TObject);
    procedure MenuInfoLightClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CreateReportData;
    procedure LoadReportData;
    procedure SaveReportData;
    procedure CheckProjectNames;
    procedure DisplayDayInfo(DispDay: integer; iL: integer);
    procedure DisplayDayWork(DispDay: integer; iL: integer);
    procedure DisplayDayProj(DispDay: integer; iL: integer; iP: integer);
    procedure DisplayMonth;
    procedure FillOneDay(DispDay: integer; FromLine: integer);
    procedure FillWorkReport;
    procedure RepairProjectCount(DispDay: integer);
    procedure RecalculateMonth;
    procedure RecalculateWorkedHours(DispDay: integer);
    procedure HideAllEdits;
    procedure ShowEdit(aShow: boolean; cellCol, cellRow: integer; Edit: TEdit);
    procedure ShowCombo(aShow: boolean; cellRow: integer);
  end;

var
  FormReport: TFormReport;

type
  SWeek = array[1..7] of string;
  SYear = array[1..12] of string;
  CType = array[1..7, 1..7] of TColor;

const
  YearB = 2003;
  YearE = 2099;
  PrjMax = 15;
  PauseMax = 5;
  SumMax = 30;

  ReportIniFile = 'report.ini';

  rbUnknown = 0;
  rbGlobal  = 1;
  rbWorking = 2;
  rbProject = 3;
  rbPause   = 4;
  rbPrjName = 5;

  sr640x480   = 0;
  sr800x600   = 1;
  sr1024x768  = 2;
  sr1280x1024 = 3;

  dtWorkingDay   = 1;
  dtBusinessTrip = 2;
  dtVacation     = 3;
  dtHalfVacation = 4;
  dtDayOff       = 5;
  dtSick         = 6;
  dtOvertime     = 7;

  clCoyPink = $00CC99FF;
  clDayBlue = clWhite;
  clSatBlue = $00FFFFCC;
  clSunBlue = $00FFCC99;
  clDayBuss = clMoneyGreen;
  clSatBuss = $0099FF99;
  clSunBuss = $0066CC00;
  clDayVaca = $00CCFFFF;
  clSatVaca = $0000FFFF;
  clSunVaca = $0000CCFF;
  clDaySick = $00FFCCFF;
  clSatSick = $00CC99FF;
  clSunSick = $00FF66FF;

  DayOfWeekStr: SWeek = ('Po', 'Út', 'St', 'Èt', 'Pá', 'So', 'Ne');
  MonthOfYearStr: SYear = ('Leden', 'Únor', 'Bøezen', 'Duben', 'Kvìten', 'Èerven',
                           'Èervenec', 'Srpen', 'Záøí', 'Øíjen', 'Listopad', 'Prosinec');
  TypeOfDayStr: SWeek = ('W', 'B', 'V', 'H', 'D', 'S', 'O');
  BackColor: CType = ((clDayBlue, clDayBlue, clDayBlue, clDayBlue, clDayBlue, clSatBlue, clSunBlue),  // dtWorkingDay
                      (clDayBuss, clDayBuss, clDayBuss, clDayBuss, clDayBuss, clSatBuss, clSunBuss),  // dtBusinessTrip
                      (clDayVaca, clDayVaca, clDayVaca, clDayVaca, clDayVaca, clSatVaca, clSunVaca),  // dtVacation
                      (clDayBlue, clDayBlue, clDayBlue, clDayBlue, clDayBlue, clSatBlue, clSunBlue),  // dtHalfVacation
                      (clDayBlue, clDayBlue, clDayBlue, clDayBlue, clDayBlue, clSatBlue, clSunBlue),  // dtDayOff
                      (clDaySick, clDaySick, clDaySick, clDaySick, clDaySick, clSatSick, clSunSick),  // dtSick
                      (clDayBlue, clDayBlue, clDayBlue, clDayBlue, clDayBlue, clSatBlue, clSunBlue)); // dtOvertime

type
  RProjectName = record
    ProjectNumber: string[10];
    ProjectName:   string[100];
  end;

  RProjectSummary = record
    ProjectNumber: string[10];
    ProjectHours: double;
  end;

  RProject = record
    Description: string[100];
    ProjectNumber: string[10];
    Extension: string[5];
    Hours: double;
  end;

  RPause = record
    IsWorked: boolean;
    StartTime: TTime;
    EndTime: TTime;
    Description: string[50];
  end;

  RDay = record
    Date: TDate;
    DayOfWeek: integer;
    IsHoliday: boolean;
    TypeOfDay: integer;
    TimeArrival: TTime;
    TimeLeaving: TTime;
    TimeInCompany: double;
    TimeOutOfCompany: double;
    HoursInWork: double;
    HoursAtHome: double;
    RequiredPause: double;
    ProjectCount: integer;
    PauseCount: integer;
    Projects: array[1..PrjMax] of RProject;
    Pauses: array[1..PauseMax] of RPause;
  end;

  RMonth = record
    WorkingDays: double;
    WorkedDays: double;
    WorkedHours: double;
    HomeHours: double;
    MealTickets: integer;
    DayCount: integer;
    Days: array[1..31] of RDay;
    ProjectSum: array[1..SumMax] of RProjectSummary;
  end;

var
//  ShowedResolution: integer;
  ReportFileName: string;
  DispMonth: integer;
  DispYear: integer;
  ReportName: string[50];
  ReportData: array[YearB..YearE, 1..12] of RMonth;
  ProjectName: array of RProjectName;
  RowOfEdit: integer;
  IsClick0: boolean;
  ClickRow: integer;

implementation

uses DateUtils, Types, FormPause, MessDlg, FormName, FormPrjs;

{$R *.dfm}

procedure TFormReport.FormCreate(Sender: TObject);
var
  IniFile: TIniFile;
  ShowName, ShowDate, ShowReportFile, ShowInfo, ShowInfoLight: string;
begin

  GridReport.Cells[0,  0]:='±';
  GridReport.Cells[1,  0]:='X';
  GridReport.Cells[2,  0]:='T';
  GridReport.Cells[3,  0]:='D';
  GridReport.Cells[4,  0]:='Datum';
  GridReport.Cells[5,  0]:='Popis práce';
  GridReport.Cells[6,  0]:='Projekt';
  GridReport.Cells[6,  1]:='Èíslo';
  GridReport.Cells[7,  1]:='Ext';
  GridReport.Cells[8,  1]:='Hodiny';
  GridReport.Cells[9,  0]:='Odprac.';
  GridReport.Cells[9,  1]:='hodiny';
  GridReport.Cells[10, 0]:='Hodiny';
  GridReport.Cells[10, 1]:='doma';
  GridReport.Cells[11, 0]:='Pøíchod';
  GridReport.Cells[12, 0]:='Odchod';
  GridReport.Cells[13, 0]:='Èas v';
  GridReport.Cells[13, 1]:='práci';
  GridReport.Cells[14, 0]:='Pauzy';

  ReportFileName:=ExtractFilePath(ParamStr(0))+'report.uwr';
  DispMonth:=1;
  DispYear:=YearB;
  ProjectName:=nil;

  if (FileExists(ExtractFilePath(ParamStr(0))+ReportIniFile)) then
  begin
    IniFile:=TIniFile.Create(ExtractFilePath(ParamStr(0))+ReportIniFile);
    ReportFileName:= IniFile.ReadString('Database', 'FileName', ReportFileName);
    FormReport.Width:= StrToint(IniFile.ReadString('Main', 'Width', '1017'));
    FormReport.Height:= StrToint(IniFile.ReadString('Main', 'Height', '776'));
    PanelName.Left:= StrToint(IniFile.ReadString('PanelName', 'XPos', '0'));
    PanelName.Top:= StrToint(IniFile.ReadString('PanelName', 'YPos', '0'));
    PanelDate.Left:= StrToint(IniFile.ReadString('PanelDate', 'XPos', '1'));
    PanelDate.Top:= StrToint(IniFile.ReadString('PanelDate', 'YPos', '0'));
    PanelReportFile.Left:= StrToint(IniFile.ReadString('PanelReportFile', 'XPos', '2'));
    PanelReportFile.Top:= StrToint(IniFile.ReadString('PanelReportFile', 'YPos', '0'));
    PanelInfo.Left:= StrToint(IniFile.ReadString('PanelInfo', 'XPos', '3'));
    PanelInfo.Top:= StrToint(IniFile.ReadString('PanelInfo', 'YPos', '0'));
    PanelInfoLight.Left:= StrToint(IniFile.ReadString('PanelInfoLight', 'XPos', '3'));
    PanelInfoLight.Top:= StrToint(IniFile.ReadString('PanelInfoLight', 'YPos', '0'));
    ShowName:= IniFile.ReadString('PanelName', 'Visible', 'true');
    ShowDate:= IniFile.ReadString('PanelDate', 'Visible', 'true');
    ShowReportFile:= IniFile.ReadString('PanelReportFile', 'Visible', 'true');
    ShowInfo:= IniFile.ReadString('PanelInfo', 'Visible', 'false');
    ShowInfoLight:= IniFile.ReadString('PanelInfoLight', 'Visible', 'true');
    IniFile.Destroy;
    if (not FileExists(ReportFileName)) then
      ReportFileName:=ExtractFilePath(ParamStr(0))+'report.uwr';
    if (ShowName = 'false') then
    begin
      PanelName.Visible:= false;
      MenuName.Checked:= false;
    end;
    if (ShowDate = 'false') then
    begin
      PanelDate.Visible:= false;
      MenuDate.Checked:= false;
    end;
    if (ShowReportFile = 'false') then
    begin
      PanelReportFile.Visible:= false;
      MenuReportFile.Checked:= false;
    end;
    if (ShowInfo = 'true') then
    begin
      PanelInfo.Visible:= true;
      MenuInfo.Checked:= true;
    end;
    if (ShowInfoLight = 'false') then
    begin
      PanelInfoLight.Visible:= false;
      MenuInfoLight.Checked:= false;
    end;
  end;

  LabelReportFile.Caption:= ExtractFileName(ReportFileName);
  PanelReportFile.Width:= LabelReportFile.Width + 82;
  CreateReportData;
  LoadReportData;
  FillWorkReport;

  ClickRow:=0;
  IsClick0:=False;
end;

procedure TFormReport.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  ModalRes: integer;
  IniFile: TIniFile;
  ShowName, ShowDate, ShowReportFile, ShowInfo, ShowInfoLight: string;
begin
  if (ExtractFileName(ReportFileName) = 'report.uwr') then
    ModalRes:=ShowMsgDlg('Chcete uložit Work Report?', mtConfirmation, [mbYes, mbNo, mbCancel])
  else
    ModalRes:=ShowMsgDlg(Format('Chceš uložit soubor "%s"?', [ExtractFileName(ReportFileName)]), mtConfirmation, [mbYes, mbNo, mbCancel]);
  if (ModalRes = mrCancel) then
    CanClose:=False
  else
  begin
    if (ModalRes = mrYes) then
    begin
      if (EditName.Text <> '') then
      begin
        if (ExtractFileName(ReportFileName) = 'report.uwr') then
          MenuSaveClick(nil);

        if (ExtractFileName(ReportFileName) = 'report.uwr') then
        begin
          ShowMsgDlg('Musíš zvolit jiné jméno souboru.', mtWarning, [mbOk]);
          CanClose:=False;
        end
        else
          SaveReportData;
      end
      else
      begin
        ShowMsgDlg('Jméno pracovníka v políèku "Jméno a pøíjmení" není vyplnìno.', mtWarning, [mbOk]);
        CanClose:=False;
      end;
    end;
  end;

  if (CanClose) then
  begin
    if (MenuName.Checked) then ShowName:= 'true'
    else ShowName:= 'false';
    if (MenuDate.Checked) then ShowDate:= 'true'
    else ShowDate:= 'false';
    if (MenuReportFile.Checked) then ShowReportFile:= 'true'
    else ShowReportFile:= 'false';
    if (MenuInfo.Checked) then ShowInfo:= 'true'
    else ShowInfo:= 'false';
    if (MenuInfoLight.Checked) then ShowInfoLight:= 'true'
    else ShowInfoLight:= 'false';
    IniFile:=TIniFile.Create(ExtractFilePath(ParamStr(0))+ReportIniFile);
    IniFile.WriteString('Database', 'FileName', ReportFileName);
    IniFile.WriteString('Main', 'Height', IntToStr(FormReport.Height));
    IniFile.WriteString('Main', 'Width', IntToStr(FormReport.Width));
    IniFile.WriteString('PanelName', 'Visible', ShowName);
    IniFile.WriteString('PanelName', 'XPos', IntToStr(PanelName.Left));
    IniFile.WriteString('PanelName', 'YPos', IntToStr(PanelName.Top));
    IniFile.WriteString('PanelDate', 'Visible', ShowDate);
    IniFile.WriteString('PanelDate', 'XPos', IntToStr(PanelDate.Left));
    IniFile.WriteString('PanelDate', 'YPos', IntToStr(PanelDate.Top));
    IniFile.WriteString('PanelReportFile', 'Visible', ShowReportFile);
    IniFile.WriteString('PanelReportFile', 'XPos', IntToStr(PanelReportFile.Left));
    IniFile.WriteString('PanelReportFile', 'YPos', IntToStr(PanelReportFile.Top));
    IniFile.WriteString('PanelInfo', 'Visible', ShowInfo);
    IniFile.WriteString('PanelInfo', 'XPos', IntToStr(PanelInfo.Left));
    IniFile.WriteString('PanelInfo', 'YPos', IntToStr(PanelInfo.Top));
    IniFile.WriteString('PanelInfoLight', 'Visible', ShowInfoLight);
    IniFile.WriteString('PanelInfoLight', 'XPos', IntToStr(PanelInfoLight.Left));
    IniFile.WriteString('PanelInfoLight', 'YPos', IntToStr(PanelInfoLight.Top));
    IniFile.Destroy;
  end;
end;

procedure TFormReport.CreateReportData;
var
  maxD: integer;
  cntW: integer;
  iY, iM, iD, iP: integer;

begin
  for iY:=YearB to YearE do
  begin
    for iM:=1 to 12 do
    begin
      cntW:=0;
      maxD:=DaysInAMonth(iY, iM);
      for iD:=1 to maxD do
      begin
        ReportData[iY,iM].Days[iD].Date:=EncodeDate(iY,iM,iD);
        ReportData[iY,iM].Days[iD].DayOfWeek:=DayOfTheWeek(ReportData[iY,iM].Days[iD].Date);
        ReportData[iY,iM].Days[iD].IsHoliday:=False;
        if ((iM = 1)  and (iD = 1)) or
           ((iM = 5)  and (iD = 1)) or
           ((iM = 5)  and (iD = 8)) or
           ((iM = 7)  and (iD = 5)) or
           ((iM = 7)  and (iD = 6)) or
           ((iM = 9)  and (iD = 28)) or
           ((iM = 10) and (iD = 28)) or
           ((iM = 11) and (iD = 17)) or
           ((iM = 12) and (iD = 24)) or
           ((iM = 12) and (iD = 25)) or
           ((iM = 12) and (iD = 26)) or
           ((iY = 2003) and (iM = 4) and (iD = 21)) or
           ((iY = 2004) and (iM = 4) and (iD = 12)) or
           ((iY = 2005) and (iM = 3) and (iD = 28)) or
           ((iY = 2006) and (iM = 4) and (iD = 17)) or
           ((iY = 2007) and (iM = 4) and (iD =  9)) or
           ((iY = 2008) and (iM = 3) and (iD = 24)) or
           ((iY = 2009) and (iM = 4) and (iD = 13)) or
           ((iY = 2010) and (iM = 4) and (iD =  5)) then
          ReportData[iY,iM].Days[iD].IsHoliday:=True;
        if (ReportData[iY,iM].Days[iD].DayOfWeek < 6) and (not ReportData[iY,iM].Days[iD].IsHoliday) then
        begin
          ReportData[iY,iM].Days[iD].TypeOfDay:=dtWorkingDay;
          cntW:=cntW+1;
        end
        else
          ReportData[iY,iM].Days[iD].TypeOfDay:=dtOvertime;
        ReportData[iY,iM].Days[iD].TimeArrival:=0;
        ReportData[iY,iM].Days[iD].TimeLeaving:=0;
        ReportData[iY,iM].Days[iD].TimeInCompany:=0;
        ReportData[iY,iM].Days[iD].TimeOutOfCompany:=0;
        ReportData[iY,iM].Days[iD].HoursInWork:=0;
        ReportData[iY,iM].Days[iD].HoursAtHome:=0;
        ReportData[iY,iM].Days[iD].RequiredPause:=0;
        ReportData[iY,iM].Days[iD].ProjectCount:=0;
        ReportData[iY,iM].Days[iD].PauseCount:=0;
        for iP:=1 to PrjMax do
        begin
          ReportData[iY,iM].Days[iD].Projects[iP].Description:='';
          ReportData[iY,iM].Days[iD].Projects[iP].ProjectNumber:='';
          ReportData[iY,iM].Days[iD].Projects[iP].Extension:='';
          ReportData[iY,iM].Days[iD].Projects[iP].Hours:=0;
        end;
        for iP:=1 to PauseMax do
        begin
          ReportData[iY,iM].Days[iD].Pauses[iP].IsWorked:=False;
          ReportData[iY,iM].Days[iD].Pauses[iP].StartTime:=0;
          ReportData[iY,iM].Days[iD].Pauses[iP].EndTime:=0;
          ReportData[iY,iM].Days[iD].Pauses[iP].Description:='';
        end;
      end;
      ReportData[iY,iM].WorkingDays:=cntW;
      ReportData[iY,iM].WorkedDays:=0;
      ReportData[iY,iM].WorkedHours:=0;
      ReportData[iY,iM].HomeHours:=0;
      ReportData[iY,iM].MealTickets:=0;
      ReportData[iY,iM].DayCount:=maxD;
      for iP:=1 to SumMax do
      begin
        ReportData[iY,iM].ProjectSum[iP].ProjectNumber:='';
        ReportData[iY,iM].ProjectSum[iP].ProjectHours:=0;
      end;
    end;
  end;
  ProjectName:=nil;
end;

procedure TFormReport.LoadReportData;
var
  wr: file;
  TypeOfSave: byte;
  maxD: integer;
  idxY, idxM, idxD, idxP: integer;
  FollowDate: TDate;
  IsAnyData: boolean;
  bType: byte;
  IsError: boolean;

  procedure LoadDate;
  begin
    if (not eof(wr)) then
    begin
      BlockRead(wr, FollowDate, 8);
      IsAnyData:=True;
    end
    else
      IsAnyData:=False;
  end;

  procedure ReadGlobalBlock;
  begin
    BlockRead(wr, ReportName, 51);
    BlockRead(wr, DispMonth, 4);
    BlockRead(wr, DispYear, 4);
  end;

  procedure ReadWorkingBlock;
  var
    bDate: TDate;
    iY, iM, iD: word;
  begin
    BlockRead(wr, bDate, 8);
    DecodeDate(bDate, iY, iM, iD);
    BlockRead(wr, ReportData[iY,iM].Days[iD].TypeOfDay, 4);
    BlockRead(wr, ReportData[iY,iM].Days[iD].TimeArrival, 8);
    BlockRead(wr, ReportData[iY,iM].Days[iD].TimeLeaving, 8);
    BlockRead(wr, ReportData[iY,iM].Days[iD].TimeInCompany, 8);
    BlockRead(wr, ReportData[iY,iM].Days[iD].TimeOutOfCompany, 8);
    BlockRead(wr, ReportData[iY,iM].Days[iD].HoursInWork, 8);
    BlockRead(wr, ReportData[iY,iM].Days[iD].HoursAtHome, 8);
    BlockRead(wr, ReportData[iY,iM].Days[iD].RequiredPause, 8);
    BlockRead(wr, ReportData[iY,iM].Days[iD].ProjectCount, 4);
    BlockRead(wr, ReportData[iY,iM].Days[iD].PauseCount, 4);
  end;

  procedure ReadProjectBlock;
  var
    bDate: TDate;
    iY, iM, iD: word;
    iP: integer;
  begin
    BlockRead(wr, bDate, 8);
    DecodeDate(bDate, iY, iM, iD);
    BlockRead(wr, iP, 4);
    BlockRead(wr, ReportData[iY,iM].Days[iD].Projects[iP].Description, 101);
    BlockRead(wr, ReportData[iY,iM].Days[iD].Projects[iP].ProjectNumber, 11);
    BlockRead(wr, ReportData[iY,iM].Days[iD].Projects[iP].Extension, 6);
    BlockRead(wr, ReportData[iY,iM].Days[iD].Projects[iP].Hours, 8);
  end;

  procedure ReadPauseBlock;
  var
    bDate: TDate;
    iY, iM, iD: word;
    iP: integer;
  begin
    BlockRead(wr, bDate, 8);
    DecodeDate(bDate, iY, iM, iD);
    BlockRead(wr, iP, 4);
    BlockRead(wr, ReportData[iY,iM].Days[iD].Pauses[iP].IsWorked, 1);
    BlockRead(wr, ReportData[iY,iM].Days[iD].Pauses[iP].StartTime, 8);
    BlockRead(wr, ReportData[iY,iM].Days[iD].Pauses[iP].EndTime, 8);
    BlockRead(wr, ReportData[iY,iM].Days[iD].Pauses[iP].Description, 51);
  end;

  procedure ReadProjectNameBlock;
  var
    iP,cP: integer;
  begin
    BlockRead(wr, cP, 4);
    BlockRead(wr, iP, 4);
    if (ProjectName = nil) then
      SetLength(ProjectName, cP);
    BlockRead(wr, ProjectName[iP].ProjectNumber, 11);
    BlockRead(wr, ProjectName[iP].ProjectName, 101);
  end;

begin
  ReportName:='';
  DispMonth:=1;
  DispYear:=YearB;

  if (FileExists(ReportFileName)) then
  begin
    LabelReportFile.Caption:= ExtractFileName(ReportFileName);
    PanelReportFile.Width:= LabelReportFile.Width + 82;
    AssignFile(wr, ReportFileName);
    Reset(wr,1);
    BlockRead(wr, TypeOfSave, 1);

    case (TypeOfSave) of
      1: begin
           LoadDate;
           for idxY:=YearB to YearE do
           begin
             for idxM:=1 to 12 do
             begin
               maxD:=ReportData[idxY,idxM].DayCount;
               for idxD:=1 to maxD do
               begin
                 if (IsAnyData) and (FollowDate = EncodeDate(idxY,idxM,idxD)) then
                 begin
                   BlockRead(wr, ReportData[idxY,idxM].Days[idxD].TypeOfDay, 4);
                   BlockRead(wr, ReportData[idxY,idxM].Days[idxD].TimeArrival, 8);
                   BlockRead(wr, ReportData[idxY,idxM].Days[idxD].TimeLeaving, 8);
                   BlockRead(wr, ReportData[idxY,idxM].Days[idxD].TimeInCompany, 8);
                   BlockRead(wr, ReportData[idxY,idxM].Days[idxD].TimeOutOfCompany, 8);
                   BlockRead(wr, ReportData[idxY,idxM].Days[idxD].HoursInWork, 8);
                   BlockRead(wr, ReportData[idxY,idxM].Days[idxD].HoursAtHome, 8);
                   BlockRead(wr, ReportData[idxY,idxM].Days[idxD].RequiredPause, 8);
                   BlockRead(wr, ReportData[idxY,idxM].Days[idxD].ProjectCount, 4);
                   BlockRead(wr, ReportData[idxY,idxM].Days[idxD].PauseCount, 4);
                   for idxP:=1 to ReportData[idxY,idxM].Days[idxD].ProjectCount do
                   begin
                     BlockRead(wr, ReportData[idxY,idxM].Days[idxD].Projects[idxP].Description, 101);
                     BlockRead(wr, ReportData[idxY,idxM].Days[idxD].Projects[idxp].ProjectNumber, 11);
                     BlockRead(wr, ReportData[idxY,idxM].Days[idxD].Projects[idxP].Extension, 6);
                     BlockRead(wr, ReportData[idxY,idxM].Days[idxD].Projects[idxP].Hours, 8);
                   end;
                   for idxP:=1 to ReportData[idxY,idxM].Days[idxD].PauseCount do
                   begin
                     BlockRead(wr, ReportData[idxY,idxM].Days[idxD].Pauses[idxP].IsWorked, 1);
                     BlockRead(wr, ReportData[idxY,idxM].Days[idxD].Pauses[idxP].StartTime, 8);
                     BlockRead(wr, ReportData[idxY,idxM].Days[idxD].Pauses[idxP].EndTime, 8);
                     BlockRead(wr, ReportData[idxY,idxM].Days[idxD].Pauses[idxP].Description, 51);
                   end;
                   LoadDate;
                 end;
               end;
             end;
           end;
         end;
      2: begin
           IsError:=False;
           while (not eof(wr)) and (not IsError) do
           begin
             BlockRead(wr, bType, 1);

             case (bType) of
               rbGlobal:  ReadGlobalBlock;
               rbWorking: ReadWorkingBlock;
               rbProject: ReadProjectBlock;
               rbPause:   ReadPauseBlock;
               rbPrjName: ReadProjectNameBlock;
               else IsError:=True;
             end;
           end;
         end;
    end;

    RecalculateMonth;

    CloseFile(wr);
  end;

  CheckProjectNames;

  EditName.Text:=ReportName;
  case DispMonth of
     1:ButtonMounth1.Down:=True;
     2:ButtonMounth2.Down:=True;
     3:ButtonMounth3.Down:=True;
     4:ButtonMounth4.Down:=True;
     5:ButtonMounth5.Down:=True;
     6:ButtonMounth6.Down:=True;
     7:ButtonMounth7.Down:=True;
     8:ButtonMounth8.Down:=True;
     9:ButtonMounth9.Down:=True;
    10:ButtonMounth10.Down:=True;
    11:ButtonMounth11.Down:=True;
    12:ButtonMounth12.Down:=True;
  end;
  EditYear.Value:=DispYear;
end;

procedure TFormReport.SaveReportData;
var
  wr: file;
  TypeOfSave: byte;
  TypeOfDay: integer;
  maxD: integer;
  idxY, idxM, idxD, idxP: integer;

  procedure WriteTypeOfBlock(bType: byte);
  begin
    BlockWrite(wr, bType, 1);
  end;

  procedure WriteGlobalBlock;
  begin
    WriteTypeOfBlock(rbGlobal);
    BlockWrite(wr, ReportName, 51);
    BlockWrite(wr, DispMonth, 4);
    BlockWrite(wr, DispYear, 4);
  end;

  procedure WriteWorkingBlock(iY, iM, iD: integer);
  begin
    WriteTypeOfBlock(rbWorking);
    BlockWrite(wr, ReportData[iY,iM].Days[iD].Date, 8);
    BlockWrite(wr, ReportData[iY,iM].Days[iD].TypeOfDay, 4);
    BlockWrite(wr, ReportData[iY,iM].Days[iD].TimeArrival, 8);
    BlockWrite(wr, ReportData[iY,iM].Days[iD].TimeLeaving, 8);
    BlockWrite(wr, ReportData[iY,iM].Days[iD].TimeInCompany, 8);
    BlockWrite(wr, ReportData[iY,iM].Days[iD].TimeOutOfCompany, 8);
    BlockWrite(wr, ReportData[iY,iM].Days[iD].HoursInWork, 8);
    BlockWrite(wr, ReportData[iY,iM].Days[iD].HoursAtHome, 8);
    BlockWrite(wr, ReportData[iY,iM].Days[iD].RequiredPause, 8);
    BlockWrite(wr, ReportData[iY,iM].Days[iD].ProjectCount, 4);
    BlockWrite(wr, ReportData[iY,iM].Days[iD].PauseCount, 4);
  end;

  procedure WriteProjectBlock(iY, iM, iD, iP: integer);
  begin
    WriteTypeOfBlock(rbProject);
    BlockWrite(wr, ReportData[iY,iM].Days[iD].Date, 8);
    BlockWrite(wr, iP, 4);
    BlockWrite(wr, ReportData[iY,iM].Days[iD].Projects[iP].Description, 101);
    BlockWrite(wr, ReportData[iY,iM].Days[iD].Projects[iP].ProjectNumber, 11);
    BlockWrite(wr, ReportData[iY,iM].Days[iD].Projects[iP].Extension, 6);
    BlockWrite(wr, ReportData[iY,iM].Days[iD].Projects[iP].Hours, 8);
  end;

  procedure WritePauseBlock(iY, iM, iD, iP: integer);
  begin
    WriteTypeOfBlock(rbPause);
    BlockWrite(wr, ReportData[iY,iM].Days[iD].Date, 8);
    BlockWrite(wr, iP, 4);
    BlockWrite(wr, ReportData[iY,iM].Days[iD].Pauses[iP].IsWorked, 1);
    BlockWrite(wr, ReportData[iY,iM].Days[iD].Pauses[iP].StartTime, 8);
    BlockWrite(wr, ReportData[iY,iM].Days[iD].Pauses[iP].EndTime, 8);
    BlockWrite(wr, ReportData[iY,iM].Days[iD].Pauses[iP].Description, 51);
  end;

  procedure WriteProjectNameBlock(iP, cP: integer);
  begin
    WriteTypeOfBlock(rbPrjName);
    BlockWrite(wr, cP, 4);
    BlockWrite(wr, iP, 4);
    BlockWrite(wr, ProjectName[iP].ProjectNumber, 11);
    BlockWrite(wr, ProjectName[iP].ProjectName, 101);
  end;

begin
  TypeOfSave:=2; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  AssignFile(wr, ReportFileName);
  Rewrite(wr,1);
  BlockWrite(wr, TypeOfSave, 1);
  WriteGlobalBlock;

  for idxY:=YearB to YearE do
  begin
    for idxM:=1 to 12 do
    begin
      maxD:=ReportData[idxY,idxM].DayCount;
      for idxD:=1 to maxD do
      begin
        if (ReportData[idxY,idxM].Days[idxD].DayOfWeek < 6) and (not ReportData[idxY,idxM].Days[idxD].IsHoliday) then
          TypeOfDay:=dtWorkingDay
        else
          TypeOfDay:=dtOvertime;

        if (ReportData[idxY,idxM].Days[idxD].TypeOfDay <> TypeOfDay) or
           (ReportData[idxY,idxM].Days[idxD].TimeArrival > 0) or
           (ReportData[idxY,idxM].Days[idxD].TimeLeaving > 0) or
           (ReportData[idxY,idxM].Days[idxD].HoursAtHome > 0) or
           (ReportData[idxY,idxM].Days[idxD].ProjectCount > 0) or
           (ReportData[idxY,idxM].Days[idxD].PauseCount > 0) then
        begin
          WriteWorkingBlock(idxY, idxM, idxD);
          for idxP:=1 to ReportData[idxY,idxM].Days[idxD].ProjectCount do
            WriteProjectBlock(idxY, idxM, idxD, idxP);
          for idxP:=1 to ReportData[idxY,idxM].Days[idxD].PauseCount do
            WritePauseBlock(idxY, idxM, idxD, idxP);
        end;
      end;
    end;
  end;

  if (ProjectName <> nil) then
    for idxP:=0 to High(ProjectName) do
      WriteProjectNameBlock(idxP, Length(ProjectName));

  CloseFile(wr);
end;

procedure TFormReport.CheckProjectNames;
var
  iY, iM, iD, cD, iP, cP, iPx, cPx, iP1, iP2: integer;
  IsProject: boolean;
  IsExist: array of boolean;
  IsEmpty: boolean;
  Change: RProjectName;
  IsChange: boolean;
begin
  for iY:=YearB to YearE do
  begin
    for iM:=1 to 12 do
    begin
      cD:=ReportData[iY,iM].DayCount;
      for iD:=1 to cD do
      begin
       cP:=ReportData[iY,iM].Days[iD].ProjectCount;
        for iP:=1 to cP do
        begin
          cPx:=Length(ProjectName);
          iPx:=0; IsProject:=False;
          while (iPx < cPx) and (not IsProject) do
          begin
            if (ProjectName[iPx].ProjectNumber = ReportData[iY,iM].Days[iD].Projects[iP].ProjectNumber) then
              IsProject:=True;
            iPx:=iPx+1;
          end;
          if (not IsProject) then
          begin
            SetLength(ProjectName, cPx+1);
            ProjectName[cPx].ProjectNumber:=ReportData[iY,iM].Days[iD].Projects[iP].ProjectNumber;
          end;
        end;
      end;
    end;
  end;
  SetLength(IsExist, Length(ProjectName));
  for iY:=YearB to YearE do
  begin
    for iM:=1 to 12 do
    begin
      cD:=ReportData[iY,iM].DayCount;
      for iD:=1 to cD do
      begin
       cP:=ReportData[iY,iM].Days[iD].ProjectCount;
        for iP:=1 to cP do
        begin
          cPx:=Length(ProjectName);
          iPx:=0; IsProject:=False;
          while (iPx < cPx) and (not IsProject) do
          begin
            if (ProjectName[iPx].ProjectNumber = ReportData[iY,iM].Days[iD].Projects[iP].ProjectNumber) then
            begin
              IsExist[iPx]:=True;
              IsProject:=True;
            end;
            iPx:=iPx+1;
          end;
        end;
      end;
    end;
  end;
  cP:=Length(ProjectName);
  for iP1:=0 to High(ProjectName) do
  begin
    if (not IsExist[iP1]) then
    begin
      for iP2:=iP1 to (High(ProjectName)-1) do
      begin
        ProjectName[iP2]:=ProjectName[iP2+1];
        IsExist[iP2]:=IsExist[iP2+1];
      end;
      cP:=cP-1;
    end;
  end;
  SetLength(ProjectName, cP);
  IsExist:=nil;
  IsEmpty:=False;
  for iP1:=0 to High(ProjectName) do
  begin
    if (ProjectName[iP1].ProjectNumber = '') then
    begin
      IsEmpty:=True;
      if (iP1 > 0) then
      begin
        for iP2:=iP1-1 downto 0 do
          ProjectName[iP2+1]:=ProjectName[iP2];
        ProjectName[0].ProjectNumber:='';
        ProjectName[0].ProjectName:='';
      end;
    end;
  end;
  if (not IsEmpty) then
  begin
    SetLength(ProjectName, Length(ProjectName)+1);
    for iP1:=High(ProjectName)-1 downto 0 do
      ProjectName[iP1+1]:=ProjectName[iP1];
    ProjectName[0].ProjectNumber:='';
    ProjectName[0].ProjectName:='';
  end;
  IsChange:=True;
  while (IsChange) and (High(ProjectName) > 2) do
  begin
    IsChange:=False;
    for iP1:=1 to (High(ProjectName)-1) do
    begin
      if (ProjectName[iP1].ProjectNumber < ProjectName[iP1+1].ProjectNumber) then
      begin
        Change:=ProjectName[iP1];
        ProjectName[iP1]:=ProjectName[iP1+1];
        ProjectName[iP1+1]:=Change;
        IsChange:=True;
      end;
    end;
  end;
end;

procedure TFormReport.DisplayDayInfo(DispDay: integer; iL: integer);
var
  TypeOfDay: integer;
  DayOfWeek: integer;
begin
  GridReport.Cells[0, iL]:='+';
  GridReport.Cells[1, iL]:=TypeOfDayStr[ReportData[DispYear,DispMonth].Days[DispDay].TypeOfDay];
  if (DispDay = 1) or (ReportData[DispYear,DispMonth].Days[DispDay].DayOfWeek = 1) then
    GridReport.Cells[2, iL]:=IntToStr(WeekOf(ReportData[DispYear,DispMonth].Days[DispDay].Date))
  else
    GridReport.Cells[2, iL]:='';
  GridReport.Cells[3, iL]:=DayOfWeekStr[ReportData[DispYear,DispMonth].Days[DispDay].DayOfWeek];
  GridReport.Cells[4, iL]:=DateToStr(ReportData[DispYear,DispMonth].Days[DispDay].Date);
  GridReport.Cells[15, iL]:=IntToStr(DispDay);
  GridReport.Cells[16, iL]:='1';
  TypeOfDay:=ReportData[DispYear,DispMonth].Days[DispDay].TypeOfDay;
  DayOfWeek:=ReportData[DispYear,DispMonth].Days[DispDay].DayOfWeek;
  if (ReportData[DispYear,DispMonth].Days[DispDay].IsHoliday) then DayOfWeek:=7;
  GridReport.Cells[17, iL]:=IntToStr(BackColor[TypeOfDay, DayOfWeek]);
end;

procedure TFormReport.DisplayDayWork(DispDay: integer; iL: integer);
begin
  {---}
  if (ReportData[DispYear,DispMonth].Days[DispDay].ProjectCount < 2) then
    if (ReportData[DispYear,DispMonth].Days[DispDay].Projects[1].Hours > 0) then
      GridReport.Cells[8, iL]:=Format('%3.2f', [ReportData[DispYear,DispMonth].Days[DispDay].Projects[1].Hours])
    else
      GridReport.Cells[8, iL]:='';
  {---}
  if (ReportData[DispYear,DispMonth].Days[DispDay].HoursInWork > 0) then
    GridReport.Cells[9, iL]:=Format('%3.2f', [ReportData[DispYear,DispMonth].Days[DispDay].HoursInWork])
  else
    GridReport.Cells[9, iL]:='';
  {---}
  if (ReportData[DispYear,DispMonth].Days[DispDay].HoursAtHome > 0) then
    GridReport.Cells[10, iL]:=Format('%3.2f', [ReportData[DispYear,DispMonth].Days[DispDay].HoursAtHome])
  else
    GridReport.Cells[10, iL]:='';
  {---}
  if (ReportData[DispYear,DispMonth].Days[DispDay].TimeArrival > 0) then
    if (ReportData[DispYear,DispMonth].Days[DispDay].TimeArrival < 1) then
      GridReport.Cells[11, iL]:=FormatDateTime('h:nn', ReportData[DispYear,DispMonth].Days[DispDay].TimeArrival)
    else
      GridReport.Cells[11, iL]:='00:00'
  else
    GridReport.Cells[11, iL]:='';
  {---}
  if (ReportData[DispYear,DispMonth].Days[DispDay].TimeLeaving > 0) then
    if (ReportData[DispYear,DispMonth].Days[DispDay].TimeLeaving < 1) then
      GridReport.Cells[12, iL]:=FormatDateTime('h:nn', ReportData[DispYear,DispMonth].Days[DispDay].TimeLeaving)
    else
      GridReport.Cells[12, iL]:='00:00'
  else
    GridReport.Cells[12, iL]:='';
  {---}
  if (ReportData[DispYear,DispMonth].Days[DispDay].TimeInCompany > 0) then
    GridReport.Cells[13, iL]:=FormatDateTime('h:nn', ReportData[DispYear,DispMonth].Days[DispDay].TimeInCompany)
  else
    GridReport.Cells[13, iL]:='';
  {---}
  if (ReportData[DispYear,DispMonth].Days[DispDay].TimeInCompany > 0) then
  begin
    if (ReportData[DispYear,DispMonth].Days[DispDay].RequiredPause > ReportData[DispYear,DispMonth].Days[DispDay].TimeOutOfCompany) then
      GridReport.Cells[14, iL]:='*'+FormatDateTime('h:nn', ReportData[DispYear,DispMonth].Days[DispDay].RequiredPause)
    else
      GridReport.Cells[14, iL]:=' '+FormatDateTime('h:nn', ReportData[DispYear,DispMonth].Days[DispDay].TimeOutOfCompany);
  end
  else
    GridReport.Cells[14, iL]:='';
end;

procedure TFormReport.DisplayDayProj(DispDay: integer; iL: integer; iP: integer);
var
  TypeOfDay: integer;
  DayOfWeek: integer;
begin
  if (ReportData[DispYear,DispMonth].Days[DispDay].ProjectCount > 0) then
  begin
    if (iP > 1) then
    begin
      GridReport.Cells[0, iL]:='-';
      GridReport.Cells[1, iL]:='';
      GridReport.Cells[2, iL]:='';
      GridReport.Cells[3, iL]:='';
      GridReport.Cells[4, iL]:='';
      GridReport.Cells[9, iL]:='';
      GridReport.Cells[10, iL]:='';
      GridReport.Cells[11, iL]:='';
      GridReport.Cells[12, iL]:='';
      GridReport.Cells[13, iL]:='';
      GridReport.Cells[14, iL]:='';
    end;
    GridReport.Cells[5, iL]:=ReportData[DispYear,DispMonth].Days[DispDay].Projects[iP].Description;
    GridReport.Cells[6, iL]:=ReportData[DispYear,DispMonth].Days[DispDay].Projects[iP].ProjectNumber;
    GridReport.Cells[7, iL]:=ReportData[DispYear,DispMonth].Days[DispDay].Projects[iP].Extension;
    if (ReportData[DispYear,DispMonth].Days[DispDay].Projects[iP].Hours > 0) then
      GridReport.Cells[8, iL]:=Format('%3.2f', [ReportData[DispYear,DispMonth].Days[DispDay].Projects[iP].Hours])
    else
      GridReport.Cells[8, iL]:='';
    GridReport.Cells[15, iL]:=IntToStr(DispDay);
    GridReport.Cells[16, iL]:=IntToStr(iP);
    TypeOfDay:=ReportData[DispYear,DispMonth].Days[DispDay].TypeOfDay;
    DayOfWeek:=ReportData[DispYear,DispMonth].Days[DispDay].DayOfWeek;
    if (ReportData[DispYear,DispMonth].Days[DispDay].IsHoliday) then DayOfWeek:=7;
    GridReport.Cells[17, iL]:=IntToStr(BackColor[TypeOfDay, DayOfWeek]);
  end
  else
  begin
    case (ReportData[DispYear,DispMonth].Days[DispDay].TypeOfDay) of
      dtBusinessTrip: GridReport.Cells[5, iL]:='Služební cesta';
      dtVacation:     GridReport.Cells[5, iL]:='Dovolená';
      dtDayOff:       GridReport.Cells[5, iL]:='Náhradní volno';
      dtSick:         GridReport.Cells[5, iL]:='Nemocenská';
      else            GridReport.Cells[5, iL]:='';
    end;
    GridReport.Cells[6, iL]:='';
    GridReport.Cells[7, iL]:='';
    GridReport.Cells[8, iL]:='';
  end;
end;

procedure TFormReport.DisplayMonth;
var
  Overtime: double;
  AverageHours: double;
begin
  PanelWorkingDays.Caption:=Format('%2.1f', [ReportData[DispYear,DispMonth].WorkingDays])+'  ';
  PanelWorkingHours.Caption:=Format('%2.1f', [8*ReportData[DispYear,DispMonth].WorkingDays])+'  ';
  PanelWorkedDays.Caption:=Format('%2.1f', [ReportData[DispYear,DispMonth].WorkedDays])+'  ';
  PanelWorkedHours.Caption:=Format('%3.2f', [ReportData[DispYear,DispMonth].WorkedHours])+' ';
  Overtime:=ReportData[DispYear,DispMonth].WorkedHours - 8*ReportData[DispYear,DispMonth].WorkedDays;
  PanelOvertimeHours.Caption:=Format('%3.2f', [Overtime])+' ';
  PanelOvertimeHours2.Caption:=Format('%3.2f', [Overtime])+' ';
  if (ReportData[DispYear,DispMonth].WorkedDays > 0) then
    AverageHours:=ReportData[DispYear,DispMonth].WorkedHours / ReportData[DispYear,DispMonth].WorkedDays
  else
    AverageHours:=ReportData[DispYear,DispMonth].WorkedHours;
  PanelAveDayHours.Caption:=Format('%3.2f', [AverageHours])+'  ';
  PanelMealTickets.Caption:=IntToStr(ReportData[DispYear,DispMonth].MealTickets)+'  ';
  if ((AverageHours - 8) > 0) then
    PanelAveDayOvertimeHours.Caption:=Format('%3.2f', [AverageHours - 8])+'  '
  else
    PanelAveDayOvertimeHours.Caption:='0.0  ';
  if (Overtime > 0) then
  begin
    PanelWorkedHours.Color:=clMoneyGreen;
    PanelOvertimeHours.Color:=clMoneyGreen;
    PanelOvertimeHours2.Color:=clMoneyGreen;
    PanelAveDayHours.Color:=clMoneyGreen;
    PanelAveDayOvertimeHours.Color:=clMoneyGreen;
    PanelWorkedHours.Font.Color:=clGreen;
    PanelOvertimeHours.Font.Color:=clGreen;
    PanelOvertimeHours2.Font.Color:=clGreen;
    PanelAveDayHours.Font.Color:=clGreen;
    PanelAveDayOvertimeHours.Font.Color:=clGreen;
  end
  else
    if (Overtime < 0) then
    begin
      PanelWorkedHours.Color:=clCoyPink;
      PanelOvertimeHours.Color:=clCoyPink;
      PanelOvertimeHours2.Color:=clCoyPink;
      PanelAveDayHours.Color:=clCoyPink;
      PanelAveDayOvertimeHours.Color:=clCream;
      PanelWorkedHours.Font.Color:=clRed;
      PanelOvertimeHours.Font.Color:=clRed;
      PanelOvertimeHours2.Font.Color:=clRed;
      PanelAveDayHours.Font.Color:=clRed;
      PanelAveDayOvertimeHours.Font.Color:=clWindowText;
    end
    else
    begin
      PanelWorkedHours.Color:=clCream;
      PanelOvertimeHours.Color:=clCream;
      PanelOvertimeHours2.Color:=clCream;
      PanelAveDayHours.Color:=clCream;
      PanelAveDayOvertimeHours.Color:=clCream;
      PanelWorkedHours.Font.Color:=clWindowText;
      PanelOvertimeHours.Font.Color:=clWindowText;
      PanelOvertimeHours2.Font.Color:=clWindowText;
      PanelAveDayHours.Font.Color:=clWindowText;
      PanelAveDayOvertimeHours.Font.Color:=clWindowText;
    end;
end;

procedure TFormReport.FillOneDay(DispDay: integer; FromLine: integer);
var
  iP: integer;
  iL: integer;
begin
  iL:=FromLine;
  DisplayDayInfo(DispDay, iL);
  DisplayDayWork(DispDay, iL);
  if (ReportData[DispYear,DispMonth].Days[DispDay].ProjectCount > 0) then
  begin
    for iP:=1 to ReportData[DispYear,DispMonth].Days[DispDay].ProjectCount do
    begin
      DisplayDayProj(DispDay, iL, iP);
      iL:=iL+1;
    end;
  end
  else
  begin
    DisplayDayProj(DispDay, iL, 1);
  end;
end;

procedure TFormReport.FillWorkReport;
var
  DaysPerMonth: integer;
  iD: integer;
  iL: integer;
begin
  DaysPerMonth:=DaysInAMonth(DispYear, DispMonth);
  iL:=2;
  for iD:=1 to DaysPerMonth do
  begin
    FillOneDay(iD, iL);
    if (ReportData[DispYear,DispMonth].Days[iD].ProjectCount > 1) then
      iL:=iL+ReportData[DispYear,DispMonth].Days[iD].ProjectCount
    else
      iL:=iL+1;
  end;
  GridReport.RowCount:=iL;
  DisplayMonth;
end;

procedure TFormReport.ButtonMounthClick(Sender: TObject);
begin
  GridReport.SetFocus;
  HideAllEdits;
  if (ButtonMounth1.Down)  then DispMonth:=1;
  if (ButtonMounth2.Down)  then DispMonth:=2;
  if (ButtonMounth3.Down)  then DispMonth:=3;
  if (ButtonMounth4.Down)  then DispMonth:=4;
  if (ButtonMounth5.Down)  then DispMonth:=5;
  if (ButtonMounth6.Down)  then DispMonth:=6;
  if (ButtonMounth7.Down)  then DispMonth:=7;
  if (ButtonMounth8.Down)  then DispMonth:=8;
  if (ButtonMounth9.Down)  then DispMonth:=9;
  if (ButtonMounth10.Down) then DispMonth:=10;
  if (ButtonMounth11.Down) then DispMonth:=11;
  if (ButtonMounth12.Down) then DispMonth:=12;
  RecalculateMonth;
  FillWorkReport;
end;

procedure TFormReport.EditYearChange(Sender: TObject);
begin
  DispYear:=EditYear.Value;
  FillWorkReport;
end;

procedure TFormReport.GridReportDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  fillRect: TRect;
  DispText: string;
  TextW: integer;
  TextX: integer;
  TextY: integer;
  CentX: integer;
  CentY: integer;
begin
//  GridReport.Canvas.Font.Name:='MS Sans Serif';
  GridReport.Canvas.Font.Name:='Arial';
  GridReport.Canvas.Font.Size:=9;
  if (ARow = 0) or (ARow = 1) then
  begin
    if (ACol <> 6) and (ACol <> 7) and (ACol <> 8) then
    begin
      if (ARow = 0) then
      begin
        GridReport.Canvas.Pen.Width:=1;
        GridReport.Canvas.Pen.Color:=clWhite;
        GridReport.Canvas.MoveTo(Rect.Left, Rect.Bottom);
        GridReport.Canvas.LineTo(Rect.Left, Rect.Top);
        GridReport.Canvas.LineTo(Rect.Right-1, Rect.Top);
        GridReport.Canvas.Pen.Color:=clGray;
        GridReport.Canvas.LineTo(Rect.Right-1, Rect.Bottom+1);
        fillRect.Left:=Rect.Left+1;
        fillRect.Top:=Rect.Top+1;
        fillrect.Right:=Rect.Right-1;
        fillRect.Bottom:=Rect.Bottom+1;
      end;
      if (ARow = 1) then
      begin
        GridReport.Canvas.Pen.Width:=1;
        GridReport.Canvas.Pen.Color:=clWhite;
        GridReport.Canvas.MoveTo(Rect.Left, Rect.Bottom-1);
        GridReport.Canvas.LineTo(Rect.Left, Rect.Top);
        GridReport.Canvas.MoveTo(Rect.Right-1, Rect.Top);
        GridReport.Canvas.Pen.Color:=clGray;
        GridReport.Canvas.LineTo(Rect.Right-1, Rect.Bottom-1);
        GridReport.Canvas.LineTo(Rect.Left, Rect.Bottom-1);
        fillRect.Left:=Rect.Left+1;
        fillRect.Top:=Rect.Top;
        fillrect.Right:=Rect.Right-1;
        fillRect.Bottom:=Rect.Bottom-1;
      end;
      GridReport.Canvas.Brush.Style:=bsSolid;
      GridReport.Canvas.Brush.Color:=clCoyPink;
      GridReport.Canvas.FillRect(fillRect);
      if (ACol in [0,1,2,3,4,11,12,14]) then
      begin
        DispText:=GridReport.Cells[ACol, 0];
        TextW:=GridReport.Canvas.TextWidth(DispText);
        TextX:=Rect.Left+((Rect.Right-Rect.Left-TextW) div 2);
        if (ARow = 0) then TextY:=Rect.Top+13
                      else TextY:=Rect.Top-7;
        GridReport.Canvas.TextOut(TextX, TextY, DispText);
      end;
      if (ACol = 5) then
      begin
        DispText:=GridReport.Cells[ACol, 0];
        TextX:=Rect.Left+3;
        if (ARow = 0) then TextY:=Rect.Top+13
                      else TextY:=Rect.Top-7;
        GridReport.Canvas.TextOut(TextX, TextY, DispText);
      end;
      if (ACol = 9) then
      begin
        DispText:=GridReport.Cells[ACol, ARow];
        TextW:=GridReport.Canvas.TextWidth(DispText);
        TextX:=Rect.Left+((Rect.Right-Rect.Left-TextW) div 2);
        if (ARow = 0) then TextY:=Rect.Top+6
                      else TextY:=Rect.Top+1;
        GridReport.Canvas.TextOut(TextX, TextY, DispText);
      end;
      if (ACol = 10) then
      begin
        DispText:=GridReport.Cells[ACol, ARow];
        TextW:=GridReport.Canvas.TextWidth(DispText);
        TextX:=Rect.Left+((Rect.Right-Rect.Left-TextW) div 2);
        if (ARow = 0) then TextY:=Rect.Top+6
                      else TextY:=Rect.Top+1;
        GridReport.Canvas.TextOut(TextX, TextY, DispText);
      end;
      if (ACol = 13) then
      begin
        DispText:=GridReport.Cells[ACol, ARow];
        TextW:=GridReport.Canvas.TextWidth(DispText);
        TextX:=Rect.Left+((Rect.Right-Rect.Left-TextW) div 2);
        if (ARow = 0) then TextY:=Rect.Top+6
                      else TextY:=Rect.Top+1;
        GridReport.Canvas.TextOut(TextX, TextY, DispText);
      end;
    end
    else
    begin
      if (ARow = 0) then
      begin
        GridReport.Canvas.Pen.Width:=1;
        if (ACol = 6) then
        begin
          GridReport.Canvas.Pen.Color:=clWhite;
          GridReport.Canvas.MoveTo(Rect.Left, Rect.Bottom-1);
          GridReport.Canvas.LineTo(Rect.Left, Rect.Top);
          GridReport.Canvas.LineTo(Rect.Right+1, Rect.Top);
          GridReport.Canvas.Pen.Color:=clGray;
          GridReport.Canvas.MoveTo(Rect.Right-1, Rect.Bottom-1);
          GridReport.Canvas.LineTo(Rect.Left, Rect.Bottom-1);
        end;
        if (ACol = 7) then
        begin
          GridReport.Canvas.Pen.Color:=clWhite;
          GridReport.Canvas.MoveTo(Rect.Left, Rect.Top);
          GridReport.Canvas.LineTo(Rect.Right+1, Rect.Top);
          GridReport.Canvas.Pen.Color:=clGray;
          GridReport.Canvas.MoveTo(Rect.Right-1, Rect.Bottom-1);
          GridReport.Canvas.LineTo(Rect.Left-1, Rect.Bottom-1);
        end;
        if (ACol = 8) then
        begin
          GridReport.Canvas.Pen.Color:=clWhite;
          GridReport.Canvas.MoveTo(Rect.Left, Rect.Top);
          GridReport.Canvas.LineTo(Rect.Right-1, Rect.Top);
          GridReport.Canvas.Pen.Color:=clGray;
          GridReport.Canvas.LineTo(Rect.Right-1, Rect.Bottom-1);
          GridReport.Canvas.LineTo(Rect.Left-1, Rect.Bottom-1);
        end;
        if (ARow = 0) and (ACol in [7,8]) then fillRect.Left:=Rect.Left
                                          else fillRect.Left:=Rect.Left+1;
        fillRect.Top:=Rect.Top+1;
        if (ARow = 0) and (ACol in [6,7]) then fillrect.Right:=Rect.Right+1
                                          else fillrect.Right:=Rect.Right-1;
        fillRect.Bottom:=Rect.Bottom-1;
        GridReport.Canvas.Brush.Style:=bsSolid;
        GridReport.Canvas.Brush.Color:=clCoyPink;
        GridReport.Canvas.FillRect(fillRect);
        DispText:=GridReport.Cells[6, 0];
        TextX:=Rect.Left+2;
//        if (ShowedResolution = sr800x600) then
//        begin
//          if (ACol = 6) then
//            TextX:=Rect.Left+47
//          else
//            if (ACol = 7) then
//              TextX:=Rect.Left
//            else
//              TextX:=Rect.Left-33;
//        end;
//        if (ShowedResolution > sr800x600) then
//        begin
//          if (ACol = 7) then
//            TextX:=Rect.Left+10
//          else
//            DispText:='';
//        end;
//        TextY:=Rect.Top+3;
//        GridReport.Canvas.TextOut(TextX, TextY, DispText);
      end;
      if (ARow = 1) then
      begin
        GridReport.Canvas.Pen.Width:=1;
        GridReport.Canvas.Pen.Color:=clWhite;
        GridReport.Canvas.MoveTo(Rect.Left, Rect.Bottom-1);
        GridReport.Canvas.LineTo(Rect.Left, Rect.Top);
        GridReport.Canvas.LineTo(Rect.Right-1, Rect.Top);
        GridReport.Canvas.Pen.Color:=clGray;
        GridReport.Canvas.LineTo(Rect.Right-1, Rect.Bottom-1);
        GridReport.Canvas.LineTo(Rect.Left, Rect.Bottom-1);
        fillRect.Left:=Rect.Left+1;
        fillRect.Top:=Rect.Top+1;
        fillrect.Right:=Rect.Right-1;
        fillRect.Bottom:=Rect.Bottom-1;
        GridReport.Canvas.Brush.Style:=bsSolid;
        GridReport.Canvas.Brush.Color:=clCoyPink;
        GridReport.Canvas.FillRect(fillRect);
        DispText:=GridReport.Cells[ACol, 1];
        TextW:=GridReport.Canvas.TextWidth(DispText);
        TextX:=Rect.Left+((Rect.Right-Rect.Left-TextW) div 2);
        TextY:=Rect.Top+3;
        GridReport.Canvas.TextOut(TextX, TextY, DispText);
      end;
    end;
  end;
  if (ARow > 1) then
  begin
    if (ACol = 0) then
    begin
      GridReport.Canvas.Pen.Width:=1;
      GridReport.Canvas.Pen.Color:=clWhite;
      GridReport.Canvas.MoveTo(Rect.Left, Rect.Bottom-1);
      GridReport.Canvas.LineTo(Rect.Left, Rect.Top);
      GridReport.Canvas.LineTo(Rect.Right-1, Rect.Top);
      GridReport.Canvas.Pen.Color:=clGray;
      GridReport.Canvas.LineTo(Rect.Right-1, Rect.Bottom-1);
      GridReport.Canvas.LineTo(Rect.Left, Rect.Bottom-1);
      GridReport.Canvas.Pen.Color:=clBlack;
      GridReport.Canvas.MoveTo(Rect.Right, Rect.Top);
      GridReport.Canvas.LineTo(Rect.Right, Rect.Bottom);
      GridReport.Canvas.LineTo(Rect.Left, Rect.Bottom);
      fillRect.Left:=Rect.Left+1;
      fillRect.Top:=Rect.Top+1;
      fillrect.Right:=Rect.Right-1;
      fillRect.Bottom:=Rect.Bottom-1;
      GridReport.Canvas.Brush.Style:=bsSolid;
      GridReport.Canvas.Brush.Color:=clBtnFace;
      GridReport.Canvas.FillRect(fillRect);
      if (GridReport.Cells[0, ARow] = '+') then
      begin
        CentX:=Rect.Left + ((Rect.Right-Rect.Left) div 2);
        CentY:=Rect.Top + ((Rect.Bottom-Rect.Top) div 2);
        fillRect.Left:=CentX-5;
        fillRect.Top:=CentY-1;
        fillrect.Right:=CentX+3;
        fillRect.Bottom:=CentY+1;
        GridReport.Canvas.Brush.Style:=bsSolid;
        GridReport.Canvas.Brush.Color:=clGreen;
        GridReport.Canvas.FillRect(fillRect);
        fillRect.Left:=CentX-2;
        fillRect.Top:=CentY-4;
        fillrect.Right:=CentX;
        fillRect.Bottom:=CentY+4;
        GridReport.Canvas.Brush.Style:=bsSolid;
        GridReport.Canvas.Brush.Color:=clGreen;
        GridReport.Canvas.FillRect(fillRect);
      end
      else
      begin
        CentX:=Rect.Left + ((Rect.Right-Rect.Left) div 2);
        CentY:=Rect.Top + ((Rect.Bottom-Rect.Top) div 2);
        fillRect.Left:=CentX-5;
        fillRect.Top:=CentY-1;
        fillrect.Right:=CentX+3;
        fillRect.Bottom:=CentY+1;
        GridReport.Canvas.Brush.Style:=bsSolid;
        GridReport.Canvas.Brush.Color:=clRed;
        GridReport.Canvas.FillRect(fillRect);
      end;
    end
    else
    begin
      GridReport.Canvas.Brush.Style:=bsSolid;
      GridReport.Canvas.Brush.Color:=StrToInt(GridReport.Cells[17, ARow]);
      GridReport.Canvas.FillRect(Rect);
      DispText:=GridReport.Cells[ACol, ARow];
      TextX:=Rect.Left+3;
      if (ACol in [9]) then
        GridReport.Canvas.Font.Style:=[fsBold];
      if (ACol in [4,6,7,8,9,10,11,12,13]) then
      begin
        TextW:=GridReport.Canvas.TextWidth(DispText);
        TextX:=Rect.Right-TextW-3;
      end;
      if (ACol in [1,2,3]) then
      begin
        TextW:=GridReport.Canvas.TextWidth(DispText);
        TextX:=Rect.Left+((Rect.Right-Rect.Left-TextW) div 2);
      end;
      if (ACol = 14) then
      begin
        if (DispText <> '') then
          if (DispText[1] = '*') then
            GridReport.Canvas.Font.Color:=clRed;
        DispText:=Copy(DispText, 2, Length(DispText)-1);
        TextW:=GridReport.Canvas.TextWidth(DispText);
        TextX:=Rect.Right-TextW-3;
      end;
      TextY:=Rect.Top+3;
      GridReport.Canvas.TextOut(TextX, TextY, DispText);
      GridReport.Canvas.Font.Color:=clWindowText;
      GridReport.Canvas.Font.Style:=[];
    end;
  end;
end;

procedure TFormReport.GridReportMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  iL, iC, iP: integer;
  Cleared: integer;
  DispDay: integer;
  BeforeL: integer;
begin
  if (Button = mbLeft) and (IsClick0) then
  begin
    DispDay:=StrToInt(GridReport.Cells[15, ClickRow]);
    if (GridReport.Cells[0, ClickRow] = '+') then
    begin
      if (ReportData[DispYear,DispMonth].Days[DispDay].ProjectCount < PrjMax) then
      begin
        BeforeL:=0;
        iL:=ClickRow+1;
        while (iL < GridReport.RowCount) and (BeforeL = 0) do
        begin
          if (GridReport.Cells[0, iL] = '+') then BeforeL:=iL;
          iL:=iL+1;
        end;
        if (BeforeL > 0) then
          for iL:=GridReport.RowCount-1 downto BeforeL do
            for iC:=0 to 17 do
              GridReport.Cells[iC, iL+1]:=GridReport.Cells[iC, iL];
        if (BeforeL > 0) then iL:=BeforeL
                         else iL:=GridReport.RowCount;
        GridReport.Cells[0, iL]:='-';
        for iC:=1 to 14 do
          GridReport.Cells[iC, iL]:='';
        GridReport.Cells[15, iL]:=GridReport.Cells[15, ClickRow];
        GridReport.Cells[17, iL]:=GridReport.Cells[17, ClickRow];
        GridReport.RowCount:=GridReport.RowCount+1;
        if (ReportData[DispYear,DispMonth].Days[DispDay].ProjectCount = 0) then
          ReportData[DispYear,DispMonth].Days[DispDay].ProjectCount:=2
        else
          ReportData[DispYear,DispMonth].Days[DispDay].ProjectCount:=ReportData[DispYear,DispMonth].Days[DispDay].ProjectCount+1;
        GridReport.Cells[16, iL]:=IntToStr(ReportData[DispYear,DispMonth].Days[DispDay].ProjectCount);
      end;
    end
    else
    begin
      Cleared:=StrToInt(GridReport.Cells[16, ClickRow]);
      if (Cleared < ReportData[DispYear,DispMonth].Days[DispDay].ProjectCount) then
      begin
        for iP:=Cleared to (ReportData[DispYear,DispMonth].Days[DispDay].ProjectCount-1) do
        begin
          ReportData[DispYear,DispMonth].Days[DispDay].Projects[iP].Description:=
            ReportData[DispYear,DispMonth].Days[DispDay].Projects[iP+1].Description;
          ReportData[DispYear,DispMonth].Days[DispDay].Projects[iP].ProjectNumber:=
            ReportData[DispYear,DispMonth].Days[DispDay].Projects[iP+1].ProjectNumber;
          ReportData[DispYear,DispMonth].Days[DispDay].Projects[iP].Extension:=
            ReportData[DispYear,DispMonth].Days[DispDay].Projects[iP+1].Extension;
          ReportData[DispYear,DispMonth].Days[DispDay].Projects[iP].Hours:=
            ReportData[DispYear,DispMonth].Days[DispDay].Projects[iP+1].Hours;
        end;
        iP:=ReportData[DispYear,DispMonth].Days[DispDay].ProjectCount;
        ReportData[DispYear,DispMonth].Days[DispDay].Projects[iP].Description:='';
        ReportData[DispYear,DispMonth].Days[DispDay].Projects[iP].ProjectNumber:='';
        ReportData[DispYear,DispMonth].Days[DispDay].Projects[iP].Extension:='';
        ReportData[DispYear,DispMonth].Days[DispDay].Projects[iP].Hours:=0;
      end;
      for iL:=ClickRow to GridReport.RowCount do
        for iC:=0 to 17 do
          GridReport.Cells[iC, iL]:=GridReport.Cells[iC, iL+1];
      GridReport.RowCount:=GridReport.RowCount-1;
      ReportData[DispYear,DispMonth].Days[DispDay].ProjectCount:=ReportData[DispYear,DispMonth].Days[DispDay].ProjectCount-1;
      RepairProjectCount(DispDay);
    end;
  end;
end;

procedure TFormReport.GridReportSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  DispDay: integer;
begin
  IsClick0:=False;
  HideAllEdits;
  if (ACol = 0) then
  begin
    IsClick0:=True;
    ClickRow:=ARow;
  end;
  if (ACol = 1) then
  begin
    if (StrToInt(GridReport.Cells[16, ARow]) = 1) then
      ShowCombo(True, ARow);
  end;
  if (ACol = 5) then
    ShowEdit(True, ACol, ARow, EditDescript);
  if (ACol = 6) then
    ShowEdit(True, ACol, ARow, EditProjectNumber);
  if (ACol = 7) then
    ShowEdit(True, ACol, ARow, EditProjectExt);
  if (ACol = 8) then
    ShowEdit(True, ACol, ARow, EditProjectHours);
  if (ACol = 10) then
  begin
    if (StrToInt(GridReport.Cells[16, ARow]) = 1) then
      ShowEdit(True, ACol, ARow, EditHoursAtHome);
  end;
  if (ACol = 11) then
  begin
    if (StrToInt(GridReport.Cells[16, ARow]) = 1) then
      ShowEdit(True, ACol, ARow, EditArrival);
  end;
  if (ACol = 12) then
  begin
    if (StrToInt(GridReport.Cells[16, ARow]) = 1) then
      ShowEdit(True, ACol, ARow, EditLeaving);
  end;
  if (ACol = 14) then
  begin
    if (StrToInt(GridReport.Cells[16, ARow]) = 1) then
    begin
      DispDay:=StrToInt(GridReport.Cells[15, ARow]);
      FormPauses.SetPauseForm(DispDay);
      if (FormPauses.ShowModal = mrOk) then
      begin
        RowOfEdit:=ARow;
        FormPauses.GetPauseForm;
        RecalculateWorkedHours(DispDay);
        RepairProjectCount(DispDay);
        DisplayDayWork(DispDay, RowOfEdit);
        DisplayMonth;
      end;
    end;
  end;
end;

procedure TFormReport.RepairProjectCount(DispDay: integer);
begin
  if (ReportData[DispYear,DispMonth].Days[DispDay].ProjectCount = 1) then
    if (ReportData[DispYear,DispMonth].Days[DispDay].Projects[1].Description = '') and
       (ReportData[DispYear,DispMonth].Days[DispDay].Projects[1].ProjectNumber = '') and
       (ReportData[DispYear,DispMonth].Days[DispDay].Projects[1].Extension = '') and
       (ReportData[DispYear,DispMonth].Days[DispDay].Projects[1].Hours = 0) and
       (ReportData[DispYear,DispMonth].Days[DispDay].HoursInWork = 0) and
       (ReportData[DispYear,DispMonth].Days[DispDay].HoursAtHome = 0) then
      ReportData[DispYear,DispMonth].Days[DispDay].ProjectCount:=0;
  if (ReportData[DispYear,DispMonth].Days[DispDay].ProjectCount = 0) then
    if (ReportData[DispYear,DispMonth].Days[DispDay].Projects[1].Description <> '') or
       (ReportData[DispYear,DispMonth].Days[DispDay].Projects[1].ProjectNumber <> '') or
       (ReportData[DispYear,DispMonth].Days[DispDay].Projects[1].Extension <> '') or
       (ReportData[DispYear,DispMonth].Days[DispDay].Projects[1].Hours <> 0) or
       (ReportData[DispYear,DispMonth].Days[DispDay].HoursInWork <> 0) or
       (ReportData[DispYear,DispMonth].Days[DispDay].HoursAtHome <> 0) then
      ReportData[DispYear,DispMonth].Days[DispDay].ProjectCount:=1;
end;

procedure TFormReport.RecalculateMonth;
var
  iD, iP, iPx: integer;
  IsProject: boolean;
begin
  ReportData[DispYear, DispMonth].WorkingDays:=0;
  ReportData[DispYear, DispMonth].WorkedDays:=0;
  ReportData[DispYear, DispMonth].WorkedHours:=0;
  ReportData[DispYear, DispMonth].HomeHours:=0;
  ReportData[DispYear, DispMonth].MealTickets:=0;
  for iPx:=1 to SumMax do
  begin
    ReportData[DispYear, DispMonth].ProjectSum[iPx].ProjectNumber:='';
    ReportData[DispYear, DispMonth].ProjectSum[iPx].ProjectHours:=0;
  end;
  for iD:=1 to ReportData[DispYear, DispMonth].DayCount do
  begin
    if (ReportData[DispYear, DispMonth].Days[iD].TypeOfDay = dtWorkingDay) or
       (ReportData[DispYear, DispMonth].Days[iD].TypeOfDay = dtDayOff) then
      ReportData[DispYear, DispMonth].WorkingDays:=ReportData[DispYear, DispMonth].WorkingDays+1;
    if (ReportData[DispYear, DispMonth].Days[iD].TypeOfDay = dtHalfVacation) then
      ReportData[DispYear, DispMonth].WorkingDays:=ReportData[DispYear, DispMonth].WorkingDays+0.5;

    if (ReportData[DispYear, DispMonth].Days[iD].TypeOfDay = dtWorkingDay) and
       (ReportData[DispYear, DispMonth].Days[iD].HoursInWork > 0) then
      ReportData[DispYear, DispMonth].WorkedDays:=ReportData[DispYear, DispMonth].WorkedDays+1;
    if (ReportData[DispYear, DispMonth].Days[iD].TypeOfDay = dtDayOff) then
      ReportData[DispYear, DispMonth].WorkedDays:=ReportData[DispYear, DispMonth].WorkedDays+1;
    if (ReportData[DispYear, DispMonth].Days[iD].TypeOfDay = dtHalfVacation) and
       (ReportData[DispYear, DispMonth].Days[iD].HoursInWork > 0) then
      ReportData[DispYear, DispMonth].WorkedDays:=ReportData[DispYear, DispMonth].WorkedDays+0.5;

    ReportData[DispYear, DispMonth].WorkedHours:=
      ReportData[DispYear, DispMonth].WorkedHours+ReportData[DispYear, DispMonth].Days[iD].HoursInWork;
    ReportData[DispYear, DispMonth].HomeHours:=
      ReportData[DispYear, DispMonth].HomeHours+ReportData[DispYear, DispMonth].Days[iD].HoursAtHome;

    if (ReportData[DispYear, DispMonth].Days[iD].HoursInWork > 4.95) then
      ReportData[DispYear, DispMonth].MealTickets:=ReportData[DispYear, DispMonth].MealTickets+1;

    for iP:=1 to ReportData[DispYear, DispMonth].Days[iD].ProjectCount do
    begin
      if (ReportData[DispYear, DispMonth].Days[iD].Projects[iP].ProjectNumber <> '') then
      begin
        iPx:=1; IsProject:=False;
        while (iPx <= SumMax) and (not IsProject) do
        begin
          iPx:=iPx+1;
          if (ReportData[DispYear, DispMonth].ProjectSum[iPx].ProjectNumber = '') then
            ReportData[DispYear, DispMonth].ProjectSum[iPx].ProjectNumber:=
            ReportData[DispYear, DispMonth].Days[iD].Projects[iP].ProjectNumber;

          if (ReportData[DispYear, DispMonth].ProjectSum[iPx].ProjectNumber =
              ReportData[DispYear, DispMonth].Days[iD].Projects[iP].ProjectNumber) then
            IsProject:=True;
        end;
        if (IsProject) then
        begin
          ReportData[DispYear, DispMonth].ProjectSum[iPx].ProjectHours:=
            ReportData[DispYear, DispMonth].ProjectSum[iPx].ProjectHours +
            ReportData[DispYear, DispMonth].Days[iD].Projects[iP].Hours;
        end;
      end
      else
        ReportData[DispYear, DispMonth].ProjectSum[1].ProjectHours:=
          ReportData[DispYear, DispMonth].ProjectSum[1].ProjectHours +
          ReportData[DispYear, DispMonth].Days[iD].Projects[iP].Hours;
    end;
  end;
end;

procedure TFormReport.RecalculateWorkedHours(DispDay: integer);
var
  WorkTime: TTime;
  WorkingTime: double;
  Hours, Minutes, Seconds, Milliseconds: word;
begin
  if (ReportData[DispYear,DispMonth].Days[DispDay].TimeArrival > 0) and
     (ReportData[DispYear,DispMonth].Days[DispDay].TimeLeaving > 0) then
  begin
    if (ReportData[DispYear,DispMonth].Days[DispDay].TimeLeaving < ReportData[DispYear,DispMonth].Days[DispDay].TimeArrival) then
      ReportData[DispYear,DispMonth].Days[DispDay].TimeLeaving:=ReportData[DispYear,DispMonth].Days[DispDay].TimeLeaving+1;
    ReportData[DispYear,DispMonth].Days[DispDay].TimeInCompany:=
      ReportData[DispYear,DispMonth].Days[DispDay].TimeLeaving-ReportData[DispYear,DispMonth].Days[DispDay].TimeArrival;
    ReportData[DispYear,DispMonth].Days[DispDay].RequiredPause:=0;
    if (DispYear = 2003) or ((DispYear = 2004) and (DispMonth < 3)) then
    begin
      if (ReportData[DispYear,DispMonth].Days[DispDay].TimeInCompany > EncodeTime(4, 59, 0, 0)) then
        ReportData[DispYear,DispMonth].Days[DispDay].RequiredPause:=EncodeTime(0, 30, 0, 0);
      if (ReportData[DispYear,DispMonth].Days[DispDay].TimeInCompany > EncodeTime(9, 59, 0, 0)) then
        ReportData[DispYear,DispMonth].Days[DispDay].RequiredPause:=EncodeTime(1, 0, 0, 0);
      if (ReportData[DispYear,DispMonth].Days[DispDay].TimeInCompany > EncodeTime(14, 59, 0, 0)) then
        ReportData[DispYear,DispMonth].Days[DispDay].RequiredPause:=EncodeTime(1, 30, 0, 0);
      if (ReportData[DispYear,DispMonth].Days[DispDay].TimeInCompany > EncodeTime(19, 59, 0, 0)) then
        ReportData[DispYear,DispMonth].Days[DispDay].RequiredPause:=EncodeTime(2, 0, 0, 0);
    end
    else
    begin
      if (ReportData[DispYear,DispMonth].Days[DispDay].TimeInCompany > EncodeTime(6, 0, 1, 0)) then
        ReportData[DispYear,DispMonth].Days[DispDay].RequiredPause:=EncodeTime(0, 30, 0, 0);
      if (ReportData[DispYear,DispMonth].Days[DispDay].TimeInCompany > EncodeTime(12, 0, 1, 0)) then
        ReportData[DispYear,DispMonth].Days[DispDay].RequiredPause:=EncodeTime(1, 0, 0, 0);
      if (ReportData[DispYear,DispMonth].Days[DispDay].TimeInCompany > EncodeTime(18, 0, 1, 0)) then
        ReportData[DispYear,DispMonth].Days[DispDay].RequiredPause:=EncodeTime(1, 30, 0, 0);
    end;

    if (ReportData[DispYear,DispMonth].Days[DispDay].RequiredPause > ReportData[DispYear,DispMonth].Days[DispDay].TimeOutOfCompany) then
      WorkTime:=ReportData[DispYear,DispMonth].Days[DispDay].TimeInCompany-ReportData[DispYear,DispMonth].Days[DispDay].RequiredPause
    else
      WorkTime:=ReportData[DispYear,DispMonth].Days[DispDay].TimeInCompany-ReportData[DispYear,DispMonth].Days[DispDay].TimeOutOfCompany;
    DecodeTime(WorkTime, Hours, Minutes, Seconds, Milliseconds);
    if (Minutes < 15) then
      WorkingTime:=Hours
    else
      if (Minutes < 30) then
        WorkingTime:=Hours + 0.25
      else
        if (Minutes < 45) then
          WorkingTime:=Hours + 0.5
        else
          WorkingTime:=Hours + 0.75;
    ReportData[DispYear,DispMonth].Days[DispDay].HoursInWork:=WorkingTime;
    if (ReportData[DispYear,DispMonth].Days[DispDay].ProjectCount < 2) then
      ReportData[DispYear,DispMonth].Days[DispDay].Projects[1].Hours:=ReportData[DispYear,DispMonth].Days[DispDay].HoursInWork;
  end
  else
  begin
    ReportData[DispYear,DispMonth].Days[DispDay].TimeInCompany:=0;
    ReportData[DispYear,DispMonth].Days[DispDay].RequiredPause:=0;
    ReportData[DispYear,DispMonth].Days[DispDay].HoursInWork:=0;
    if (ReportData[DispYear,DispMonth].Days[DispDay].ProjectCount < 2) then
      ReportData[DispYear,DispMonth].Days[DispDay].Projects[1].Hours:=0;
  end;
  RecalculateMonth;
end;

procedure TFormReport.HideAllEdits;
begin
  ComboDayType.Visible:=False;
  EditDescript.Visible:=False;
  EditProjectNumber.Visible:=False;
  EditProjectExt.Visible:=False;
  EditProjectHours.Visible:=False;
  EditHoursAtHome.Visible:=False;
  EditArrival.Visible:=False;
  EditLeaving.Visible:=False;
end;

procedure TFormReport.ShowEdit(aShow: boolean; cellCol, cellRow: integer; Edit: TEdit);
var
  editRow: integer;
begin
  if (cellRow >= 2) and (cellRow < GridReport.RowCount) then
  begin
    if (aShow) then
    begin
      editRow:=cellRow - GridReport.TopRow;

      Edit.Color:=StrToInt(GridReport.Cells[17, cellRow]);
      Edit.Text:=GridReport.Cells[cellCol, cellRow];
      Edit.Top:=(editRow*21) + GridReport.Top + 43;
      Edit.Visible:=True;
      Edit.BringToFront;
      Edit.SetFocus;
      Edit.SelectAll;
    end;

    RowOfEdit:=cellRow;
  end;
end;

procedure TFormReport.ShowCombo(aShow: boolean; cellRow: integer);
var
  editRow: integer;
  DispDay: integer;
begin
  if (cellRow >= 2) and (cellRow < GridReport.RowCount) then
  begin
    if (aShow) then
    begin
      editRow:=cellRow - GridReport.TopRow;

      DispDay:=StrToInt(GridReport.Cells[15, cellRow]);
      ComboDayType.ItemIndex:=ReportData[DispYear,DispMonth].Days[DispDay].TypeOfDay-1;
      ComboDayType.Top:=(editRow*21) + GridReport.Top + 43;
      ComboDayType.Visible:=True;
      ComboDayType.BringToFront;
      ComboDayType.SetFocus;
    end;

    RowOfEdit:=cellRow;
  end;
end;

procedure TFormReport.ComboDayTypeChange(Sender: TObject);
var
  DispDay: integer;
begin
  DispDay:=StrToInt(GridReport.Cells[15, RowOfEdit]);
  ReportData[DispYear,DispMonth].Days[DispDay].TypeOfDay:=ComboDayType.ItemIndex+1;
  FillOneDay(DispDay, RowOfEdit);
  RecalculateWorkedHours(DispDay);
  RepairProjectCount(DispDay);
  DisplayDayWork(DispDay, RowOfEdit);
  DisplayMonth;
  HideAllEdits;
end;

procedure TFormReport.EditDescriptExit(Sender: TObject);
var
  DispDay: integer;
  PrjNum: integer;
begin
  DispDay:=StrToInt(GridReport.Cells[15,RowOfEdit]);
  PrjNum:=StrToInt(GridReport.Cells[16,RowOfEdit]);
  ReportData[DispYear,DispMonth].Days[DispDay].Projects[PrjNum].Description:=Copy(EditDescript.Text, 1, 100);
  RepairProjectCount(DispDay);
  DisplayDayProj(DispDay, RowOfEdit, PrjNum);
  EditDescript.Visible:=False;
end;

procedure TFormReport.EditProjectNumberExit(Sender: TObject);
var
  DispDay: integer;
  PrjNum: integer;
begin
  DispDay:=StrToInt(GridReport.Cells[15,RowOfEdit]);
  PrjNum:=StrToInt(GridReport.Cells[16,RowOfEdit]);
  ReportData[DispYear,DispMonth].Days[DispDay].Projects[PrjNum].ProjectNumber:=Copy(EditProjectNumber.Text, 1, 10);
  RepairProjectCount(DispDay);
  DisplayDayProj(DispDay, RowOfEdit, PrjNum);
  EditDescript.Visible:=False;
  RecalculateMonth;
  CheckProjectNames;
end;

procedure TFormReport.EditProjectExtExit(Sender: TObject);
var
  DispDay: integer;
  PrjNum: integer;
begin
  DispDay:=StrToInt(GridReport.Cells[15,RowOfEdit]);
  PrjNum:=StrToInt(GridReport.Cells[16,RowOfEdit]);
  ReportData[DispYear,DispMonth].Days[DispDay].Projects[PrjNum].Extension:=Copy(EditProjectExt.Text, 1, 5);
  RepairProjectCount(DispDay);
  DisplayDayProj(DispDay, RowOfEdit, PrjNum);
  EditDescript.Visible:=False;
end;

procedure TFormReport.EditProjectHoursExit(Sender: TObject);
var
  value: double;
  err: integer;
  DispDay: integer;
  PrjNum: integer;
begin
  if (EditProjectHours.Text = '') then
  begin
    err:=0;
    value:=0;
  end
  else
    val(EditProjectHours.Text, value, err);
  if (err = 0) then
  begin
    DispDay:=StrToInt(GridReport.Cells[15,RowOfEdit]);
    PrjNum:=StrToInt(GridReport.Cells[16,RowOfEdit]);
    value:=trunc(4*value) / 4;
    ReportData[DispYear,DispMonth].Days[DispDay].Projects[PrjNum].Hours:=value;
    RepairProjectCount(DispDay);
    DisplayDayProj(DispDay, RowOfEdit, PrjNum);
    EditDescript.Visible:=False;
  end
  else
  begin
    beep;
    HideAllEdits;
    EditProjectHours.Visible:=True;
    EditProjectHours.SelectAll;
    EditProjectHours.SetFocus;
  end;
  RecalculateMonth;
end;

procedure TFormReport.EditHoursAtHomeExit(Sender: TObject);
var
  value: double;
  err: integer;
  DispDay: integer;
begin
  if (EditHoursAtHome.Text = '') then
  begin
    err:=0;
    value:=0;
  end
  else
    val(EditHoursAtHome.Text, value, err);
  if (err = 0) then
  begin
    DispDay:=StrToInt(GridReport.Cells[15,RowOfEdit]);
    value:=round(4*value) / 4;
    ReportData[DispYear,DispMonth].Days[DispDay].HoursAtHome:=value;
    RecalculateWorkedHours(DispDay);
    RepairProjectCount(DispDay);
    DisplayDayWork(DispDay, RowOfEdit);
    DisplayMonth;
    EditDescript.Visible:=False;
  end
  else
  begin
    beep;
    HideAllEdits;
    EditHoursAtHome.Visible:=True;
    EditHoursAtHome.SelectAll;
    EditHoursAtHome.SetFocus;
  end;
end;

procedure TFormReport.EditArrivalExit(Sender: TObject);
var
  value: TDateTime;
  err: integer;
  DispDay: integer;
  Hours, Minutes, Seconds, Milliseconds: word;
begin
  err:=0;
  if (EditArrival.Text = '') then
  begin
    err:=0;
    value:=0;
  end
  else
  begin
    if (not TryStrToTime(EditArrival.Text, value)) then
      err:=1
    else
    begin
      if (value = 0) then
        value:=1;
      if (value > 1) then
        value:=frac(value);
    end;
  end;
  if (err = 0) then
  begin
    DispDay:=StrToInt(GridReport.Cells[15,RowOfEdit]);
    if (value > 0) and (value < 1) then
    begin
      DecodeTime(value, Hours, Minutes, Seconds, Milliseconds);
      value:=EncodeTime(Hours, Minutes, 0, 0);
    end;
    ReportData[DispYear,DispMonth].Days[DispDay].TimeArrival:=value;
    RecalculateWorkedHours(DispDay);
    RepairProjectCount(DispDay);
    DisplayDayWork(DispDay, RowOfEdit);
    DisplayMonth;
    EditDescript.Visible:=False;
  end
  else
  begin
    beep;
    HideAllEdits;
    EditArrival.Visible:=True;
    EditArrival.SelectAll;
    EditArrival.SetFocus;
  end;
end;

procedure TFormReport.EditLeavingExit(Sender: TObject);
var
  value: TDateTime;
  err: integer;
  DispDay: integer;
  Hours, Minutes, Seconds, Milliseconds: word;
begin
  err:=0;
  if (EditLeaving.Text = '') then
  begin
    err:=0;
    value:=0;
  end
  else
  begin
    if (not TryStrToTime(EditLeaving.Text, value)) then
      err:=1
    else
    begin
      if (value = 0) then
        value:=1;
      if (value > 1) then
        value:=frac(value);
    end;
  end;
  if (err = 0) then
  begin
    DispDay:=StrToInt(GridReport.Cells[15,RowOfEdit]);
    if (value > 0) and (value < 1) then
    begin
      DecodeTime(value, Hours, Minutes, Seconds, Milliseconds);
      value:=EncodeTime(Hours, Minutes, 0, 0);
    end;
    ReportData[DispYear,DispMonth].Days[DispDay].TimeLeaving:=value;
    RecalculateWorkedHours(DispDay);
    RepairProjectCount(DispDay);
    DisplayDayWork(DispDay, RowOfEdit);
    DisplayMonth;
    EditDescript.Visible:=False;
  end
  else
  begin
    beep;
    HideAllEdits;
    EditLeaving.Visible:=True;
    EditLeaving.SelectAll;
    EditLeaving.SetFocus;
  end;
end;

procedure TFormReport.EditDescriptKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    HideAllEdits;
    ShowEdit(True, 6, RowOfEdit, EditProjectNumber);
  end;
end;

procedure TFormReport.EditProjectNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  begin
    HideAllEdits;
    ShowEdit(True, 7, RowOfEdit, EditProjectExt);
  end;
end;

procedure TFormReport.EditProjectExtKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  begin
    HideAllEdits;
    ShowEdit(True, 8, RowOfEdit, EditProjectHours);
  end;
end;

procedure TFormReport.EditProjectHoursKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
    HideAllEdits;
end;

procedure TFormReport.EditHoursAtHomeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
    HideAllEdits;
end;

procedure TFormReport.EditArrivalKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    HideAllEdits;
    ShowEdit(True, 12, RowOfEdit, EditLeaving);
  end;
end;

procedure TFormReport.EditLeavingKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    HideAllEdits;
end;

procedure TFormReport.EditNameChange(Sender: TObject);
begin
  FormReport.Caption:= 'Work Report - v06/2005 (' + EditName.Text + ')';
  ReportName:=EditName.Text;
end;

procedure TFormReport.MenuOpenClick(Sender: TObject);
begin
  OpenDialog.InitialDir:=ExtractFileDir(ReportFileName);
  OpenDialog.FileName:='*.uwr';

  if (OpenDialog.Execute) then
  begin
    if (ExtractFileName(ReportFileName) <> 'report.uwr') then
    begin
      if (ShowMsgDlg(Format('Chceš uložit soubor "%s"?', [ExtractFileName(ReportFileName)]), mtConfirmation, [mbYes, mbNo]) = mrYes) then
        SaveReportData;
    end;

    ReportFileName:=OpenDialog.FileName;
    LabelReportFile.Caption:= ExtractFileName(ReportFileName);
    PanelReportFile.Width:= LabelReportFile.Width + 82;
    CreateReportData;
    LoadReportData;
    FillWorkReport;
  end;
end;

procedure TFormReport.MenuSaveClick(Sender: TObject);
begin
  SaveDialog.InitialDir:=ExtractFileDir(ReportFileName);
  if (ExtractFileName(ReportFileName) = 'report.uwr') then
    SaveDialog.FileName:='WorkReport - '+ReportName+'.uwr'
  else
    SaveDialog.FileName:=ExtractFileName(ReportFileName);

  if (SaveDialog.Execute) then
  begin
    ReportFileName:=SaveDialog.FileName;
    if (Sender <> nil) then
      SaveReportData;
  end;
  LabelReportFile.Caption:= ExtractFileName(ReportFileName);
  PanelReportFile.Width:= LabelReportFile.Width + 82;
end;

procedure TFormReport.MenuSaveBackClick(Sender: TObject);
var
  BackFile: string;
begin
  SaveDialog.InitialDir:=ExtractFileDir(ReportFileName);
  if (ExtractFileName(ReportFileName) = 'report.uwr') then
    SaveDialog.FileName:='WorkReport - '+ReportName+'.uwr'
  else
    SaveDialog.FileName:=ExtractFileName(ReportFileName);

  if (SaveDialog.Execute) then
  begin
    BackFile:=ReportFileName;
    ReportFileName:=SaveDialog.FileName;

    SaveReportData;
    ReportFileName:=BackFile;
  end;
end;

procedure TFormReport.MenuFillProjectNameClick(Sender: TObject);
begin
  FormPrjName.FillFormPrjName;
  if FormPrjName.ShowModal = mrOk then
    FormPrjName.FillDataPrjName;
end;

procedure TFormReport.MenuShowProjectClick(Sender: TObject);
begin
  FormProjects.FillFormProjects;
  FormProjects.ShowModal;
end;

procedure TFormReport.MenuPrintHoursClick(Sender: TObject);
var
  ResHor: integer;
  sL, sT: integer;
  cH, cW: integer;
  iY, iM: integer;

  procedure PrintHead;
  begin
    Printer.Canvas.Font.Style:=[];
    Printer.Canvas.TextOut(sL, sT, 'Jméno:');
    Printer.Canvas.TextOut(sL, sT + 2*cH, 'Mìsíc:');
    Printer.Canvas.TextOut(sL, sT + 3*cH, 'Rok:');

    Printer.Canvas.Font.Style:=[fsBold];
    Printer.Canvas.TextOut(sL + cW, sT, ReportName);
    Printer.Canvas.TextOut(sL + cW, sT + 2*cH, MonthOfYearStr[iM]);
    Printer.Canvas.TextOut(sL + cW, sT + 3*cH, IntToStr(iY));
  end;

  procedure PrintHoursTable;
  var
    tT, tL, tW, tH, cD, cD2: integer;

    procedure TableColor;
    var
      iD, dL, dT, wD: integer;
      aRect: TRect;
      bColor: TColor;
    begin
      bColor:=Printer.Canvas.Brush.Color;
      for iD:=1 to cD do
      begin
        if (iD <= ReportData[iY,iM].DayCount) then
        begin
          if (iD > cD2) then dL:=tL + 6*tW
                        else dL:=tL;
          if (iD > cD2) then dT:=tT + (iD - cD2)*tH
                        else dT:=tT + iD*tH;

          wD:=ReportData[iY,iM].Days[iD].DayOfWeek;
          if (ReportData[iY,iM].Days[iD].IsHoliday) then wD:=7;
          aRect.Left:=dL; aRect.Top:=dT;
          aRect.Right:=dL + 6*tW;
          aRect.Bottom:=dT + tH;
          Printer.Canvas.Brush.Color:=BackColor[dtWorkingDay, wD];
          Printer.Canvas.FillRect(aRect);
        end;
      end;
      Printer.Canvas.Brush.Color:=bColor;
    end;

    procedure TableFillText;
    var
      iD, xT, xL, cT, cL, wD: integer;
      pD: double;
      bColor: TColor;
      textOut: string;
    begin
      bColor:=Printer.Canvas.Brush.Color;
      {head text}
      Printer.Canvas.Font.Style:=[fsBold];
      xT:=round((tH - Printer.Canvas.TextHeight('A')) / 2);
      xL:=round((tW - Printer.Canvas.TextWidth('Datum')) / 2);
      Printer.Canvas.TextOut(tL+0*tW+xL, tT+xT, 'Datum');
      Printer.Canvas.TextOut(tL+6*tW+xL, tT+xT, 'Datum');
      xL:=round((tW - Printer.Canvas.TextWidth('Pøíchod')) / 2);
      Printer.Canvas.TextOut(tL+1*tW+xL, tT+xT, 'Pøíchod');
      Printer.Canvas.TextOut(tL+7*tW+xL, tT+xT, 'Pøíchod');
      xL:=round((tW - Printer.Canvas.TextWidth('Odchod')) / 2);
      Printer.Canvas.TextOut(tL+2*tW+xL, tT+xT, 'Odchod');
      Printer.Canvas.TextOut(tL+8*tW+xL, tT+xT, 'Odchod');
      xL:=round((tW - Printer.Canvas.TextWidth('Hodiny')) / 2);
      Printer.Canvas.TextOut(tL+4*tW+xL, tT+xT, 'Hodiny');
      Printer.Canvas.TextOut(tL+10*tW+xL, tT+xT, 'Hodiny');
      xL:=round((tW - Printer.Canvas.TextWidth('Pauzy')) / 2);
      Printer.Canvas.TextOut(tL+3*tW+xL, tT+xT, 'Pauzy');
      Printer.Canvas.TextOut(tL+9*tW+xL, tT+xT, 'Pauzy');
      xL:=round((tW - Printer.Canvas.TextWidth('Doma')) / 2);
      Printer.Canvas.TextOut(tL+5*tW+xL, tT+xT, 'Doma');
      Printer.Canvas.TextOut(tL+11*tW+xL, tT+xT, 'Doma');

      {body text}
      Printer.Canvas.Font.Style:=[];
      xT:=round((tH - Printer.Canvas.TextHeight('A')) / 2);
      for iD:=1 to cD do
      begin
        if (iD <= ReportData[iY,iM].DayCount) then
        begin
          if (iD > cD2) then cL:=tL + 6*tW
                        else cL:=tL;
          if (iD > cD2) then cT:=tT + (iD - cD2)*tH + xT
                        else cT:=tT + iD*tH + xT;

          wD:=ReportData[iY,iM].Days[iD].DayOfWeek;
          if (ReportData[iY,iM].Days[iD].IsHoliday) then wD:=7;
          Printer.Canvas.Brush.Color:=BackColor[dtWorkingDay, wD];

          xL:=2*xT;
          Printer.Canvas.TextOut(cL+xL, cT, DayOfWeekStr[ReportData[iY,iM].Days[iD].DayOfWeek]);
          xL:=tW - Printer.Canvas.TextWidth(IntToStr(iD)) - 2*xT;
          Printer.Canvas.TextOut(cL+xL, cT, IntToStr(iD));
          cL:=cL+tW;

          if (ReportData[iY,iM].Days[iD].HoursInWork > 0) then
          begin
            if (ReportData[iY,iM].Days[iD].TimeArrival < 1) then
              textOut:=FormatDateTime('h:nn', ReportData[iY,iM].Days[iD].TimeArrival)
            else
              textOut:='00:00';
            xL:=tW - Printer.Canvas.TextWidth(textOut) - 2*xT;
            Printer.Canvas.TextOut(cL+xL, cT, textOut);
            cL:=cL+tW;
            if (ReportData[iY,iM].Days[iD].TimeLeaving < 1) then
              textOut:=FormatDateTime('h:nn', ReportData[iY,iM].Days[iD].TimeLeaving)
            else
              textOut:='00:00';
            xL:=tW - Printer.Canvas.TextWidth(textOut) - 2*xT;
            Printer.Canvas.TextOut(cL+xL, cT, textOut);
            cL:=cL+tW;
            if (ReportData[iY,iM].Days[iD].RequiredPause > ReportData[iY,iM].Days[iD].TimeOutOfCompany) then
              pD:=ReportData[iY,iM].Days[iD].RequiredPause
            else
              pD:=ReportData[iY,iM].Days[iD].TimeOutOfCompany;
            pD:=round(96*pD) / 4;
            textOut:=Format('%3.2f', [pD]);
            xL:=tW - Printer.Canvas.TextWidth(textOut) - 2*xT;
            Printer.Canvas.TextOut(cL+xL, cT, textOut);
            cL:=cL+tW;
            Printer.Canvas.Font.Style:=[fsBold];
            textOut:=Format('%3.2f', [ReportData[iY,iM].Days[iD].HoursInWork]);
            xL:=tW - Printer.Canvas.TextWidth(textOut) - 2*xT;
            Printer.Canvas.TextOut(cL+xL, cT, textOut);
            Printer.Canvas.Font.Style:=[];
            if (ReportData[iY,iM].Days[iD].HoursAtHome > 0) then
            begin
              cL:=cL+tW;
              textOut:=Format('%3.2f', [ReportData[iY,iM].Days[iD].HoursAtHome]);
              xL:=tW - Printer.Canvas.TextWidth(textOut) - 2*xT;
              Printer.Canvas.TextOut(cL+xL, cT, textOut);
            end;
          end
          else
          begin
            xL:=2*xT;
            case (ReportData[iY,iM].Days[iD].TypeOfDay) of
              dtBusinessTrip: Printer.Canvas.TextOut(cL+xL, cT, 'služební cesta');
              dtVacation:     Printer.Canvas.TextOut(cL+xL, cT, 'dovolená');
              dtDayOff:       Printer.Canvas.TextOut(cL+xL, cT, 'náhradní volno');
              dtSick:         Printer.Canvas.TextOut(cL+xL, cT, 'nemocenská');
              else
              begin
                if (ReportData[iY,iM].Days[iD].IsHoliday) then
                  Printer.Canvas.TextOut(cL+xL, cT, 'svátek');
              end;
            end;

            if (ReportData[iY,iM].Days[iD].HoursAtHome > 0) then
            begin
              cL:=cL+4*tW;
              textOut:=Format('%3.2f', [ReportData[iY,iM].Days[iD].HoursAtHome]);
              xL:=tW - Printer.Canvas.TextWidth(textOut) - 2*xT;
              Printer.Canvas.TextOut(cL+xL, cT, textOut);
            end
          end;
        end;
      end;
      Printer.Canvas.Brush.Color:=bColor;
    end;

    procedure TableDrawLines;
    var
      dL, dT, iC, iD: integer;
      pW: integer;
    begin
      pW:=round(ResHor / 630);

      {slim lines}
      Printer.Canvas.Pen.Width:=pW;
      {head lines}
      for iC:=1 to 11 do
      begin
        Printer.Canvas.MoveTo(tL + iC*tW, tT);
        Printer.Canvas.LineTo(tL + iC*tW, tT + tH);
      end;
      {body lines}
      for iD:=1 to cD do
      begin
        if (iD <= ReportData[iY,iM].DayCount) then
        begin
          if (iD > cD2) then dL:=tL + 6*tW
                        else dL:=tL;
          if (iD > cD2) then dT:=tT + (iD - cD2)*tH
                        else dT:=tT + iD*tH;
          Printer.Canvas.MoveTo(dL, dT);
          Printer.Canvas.LineTo(dL, dT + tH);
          Printer.Canvas.LineTo(dL + 6*tW, dT + tH);
          Printer.Canvas.MoveTo(dL + (tW div 2), dT);
          Printer.Canvas.LineTo(dL + (tW div 2), dT + tH);
          Printer.Canvas.MoveTo(dL + tW, dT);
          Printer.Canvas.LineTo(dL + tW, dT + tH);

          if (ReportData[iY,iM].Days[iD].HoursInWork > 0) then
          begin
            for iC:=2 to 5 do
            begin
              Printer.Canvas.MoveTo(dL + iC*tW, dT);
              Printer.Canvas.LineTo(dL + iC*tW, dT + tH);
            end;
          end
          else
          begin
            if (ReportData[iY,iM].Days[iD].HoursAtHome > 0) then
            begin
              Printer.Canvas.MoveTo(dL + 5*tW, dT);
              Printer.Canvas.LineTo(dL + 5*tW, dT + tH);
            end;
          end;
        end;
      end;

      {bold lines}
      Printer.Canvas.Pen.Width:=2*pW;
      Printer.Canvas.MoveTo(tL, tT);
      Printer.Canvas.LineTo(tL, tT + (cD2+1)*tH);
      Printer.Canvas.LineTo(tL + 12*tW, tT + (cD2+1)*tH);
      Printer.Canvas.LineTo(tL + 12*tW, tT);
      Printer.Canvas.LineTo(tL, tT);
      Printer.Canvas.MoveTo(tL + 6*tW, tT);
      Printer.Canvas.LineTo(tL + 6*tW, tT + (cD2+1)*tH);
      Printer.Canvas.MoveTo(tL, tT + tH);
      Printer.Canvas.LineTo(tL + 12*tW, tT + tH);
    end;

  begin
    tW:=cW; tH:=cH;
    tL:=sL; tT:=sT + 5*cH;
    cD:=ReportData[iY,iM].DayCount;
    if odd(ReportData[iY,iM].DayCount) then cD:=cD+1;
    cD2:=cD div 2;

    TableColor;
    TableFillText;
    TableDrawLines;
  end;

  procedure PrintTotalTable;
  var
    tT, tL, tW, tH: integer;

    procedure TableFillText;
    var
      xT, xL, iD: integer;
      gD, wD, bD, vD, sD, hD, oH: double;
      textOut: string;
    begin
      Printer.Canvas.Font.Style:=[];
      xT:=round((tH - Printer.Canvas.TextHeight('A')) / 2);
      xL:=2*xT;
      Printer.Canvas.TextOut(tL+xL, tT+0*tH+xT, 'Poèet pracovních dnù');
      Printer.Canvas.TextOut(tL+xL, tT+1*tH+xT, 'Celkový poèet odpracovaných dnù');
      Printer.Canvas.TextOut(tL+xL, tT+2*tH+xT, 'Z toho poèet dnù na služebních cestách');
      Printer.Canvas.TextOut(tL+xL, tT+3*tH+xT, 'Celkový poèet dnù na dovolené');
      Printer.Canvas.TextOut(tL+xL, tT+4*tH+xT, 'Celkový poèet dnù na nemocenské');
      Printer.Canvas.TextOut(tL+xL, tT+5*tH+xT, 'Poèet svátkù');
      Printer.Canvas.TextOut(tL+xL, tT+6*tH+xT, 'Poèet stravenek za odpracované dny');
      Printer.Canvas.TextOut(tL+xL, tT+8*tH+xT, 'Celkový poèet odpracovaných hodin');
      Printer.Canvas.TextOut(tL+xL, tT+9*tH+xT, 'Z toho pøesèasových hodin');
      Printer.Canvas.TextOut(tL+xL, tT+10*tH+xT, 'Poèet odpracovaných hodin doma');

      gD:=0; wD:=ReportData[iY, iM].WorkedDays; bD:=0; vD:=0; sD:=0; hD:=0;
      for iD:=1 to ReportData[iY, iM].DayCount do
      begin
        if (ReportData[iY, iM].Days[iD].TypeOfDay = dtBusinessTrip) and
           (ReportData[iY, iM].Days[iD].DayOfWeek < 6) and
           (not ReportData[iY, iM].Days[iD].IsHoliday) then
        begin
          wD:=wD+1;
          bD:=bD+1;
        end;

        if (ReportData[iY, iM].Days[iD].DayOfWeek < 6) and
           (not ReportData[iY, iM].Days[iD].IsHoliday) then
          gD:=gD+1;

        if (ReportData[iY, iM].Days[iD].TypeOfDay = dtVacation) and
           (ReportData[iY, iM].Days[iD].DayOfWeek < 6) and
           (not ReportData[iY, iM].Days[iD].IsHoliday) then
          vD:=vD+1;
        if (ReportData[iY, iM].Days[iD].TypeOfDay = dtHalfVacation) and
           (ReportData[iY, iM].Days[iD].DayOfWeek < 6) and
           (not ReportData[iY, iM].Days[iD].IsHoliday) then
          vD:=vD+0.5;

        if (ReportData[iY, iM].Days[iD].TypeOfDay = dtSick) then
          sD:=sD+1;

        if (ReportData[iY, iM].Days[iD].DayOfWeek < 6) and
           (ReportData[iY, iM].Days[iD].IsHoliday) then
          hD:=hD+1;
      end;
      oH:=ReportData[iY,iM].WorkedHours - 8*ReportData[iY,iM].WorkedDays;

      textOut:=Format('%2.1f', [gD]);
      xL:=tW - Printer.Canvas.TextWidth(textOut) - 2*xT;
      Printer.Canvas.TextOut(tL+5*tW+xL, tT+0*tH+xT, textOut);
      textOut:=Format('%2.1f', [wD]);
      xL:=tW - Printer.Canvas.TextWidth(textOut) - 2*xT;
      Printer.Canvas.TextOut(tL+5*tW+xL, tT+1*tH+xT, textOut);
      textOut:=Format('%2.1f', [bD]);
      xL:=tW - Printer.Canvas.TextWidth(textOut) - 2*xT;
      Printer.Canvas.TextOut(tL+5*tW+xL, tT+2*tH+xT, textOut);
      textOut:=Format('%2.1f', [vD]);
      xL:=tW - Printer.Canvas.TextWidth(textOut) - 2*xT;
      Printer.Canvas.TextOut(tL+5*tW+xL, tT+3*tH+xT, textOut);
      textOut:=Format('%2.1f', [sD]);
      xL:=tW - Printer.Canvas.TextWidth(textOut) - 2*xT;
      Printer.Canvas.TextOut(tL+5*tW+xL, tT+4*tH+xT, textOut);
      textOut:=Format('%2.1f', [hD]);
      xL:=tW - Printer.Canvas.TextWidth(textOut) - 2*xT;
      Printer.Canvas.TextOut(tL+5*tW+xL, tT+5*tH+xT, textOut);
      textOut:=Format('%d', [ReportData[iY, iM].MealTickets]);
      xL:=tW - Printer.Canvas.TextWidth(textOut) - 2*xT;
      Printer.Canvas.TextOut(tL+5*tW+xL, tT+6*tH+xT, textOut);
      textOut:=Format('%3.2f', [ReportData[iY, iM].WorkedHours]);
      xL:=tW - Printer.Canvas.TextWidth(textOut) - 2*xT;
      Printer.Canvas.TextOut(tL+5*tW+xL, tT+8*tH+xT, textOut);
      textOut:=Format('%3.2f', [oH]);
      xL:=tW - Printer.Canvas.TextWidth(textOut) - 2*xT;
      Printer.Canvas.TextOut(tL+5*tW+xL, tT+9*tH+xT, textOut);
      textOut:=Format('%3.2f', [ReportData[iY, iM].HomeHours]);
      xL:=tW - Printer.Canvas.TextWidth(textOut) - 2*xT;
      Printer.Canvas.TextOut(tL+5*tW+xL, tT+10*tH+xT, textOut);
    end;

    procedure TableDrawLines;
    var
      iL: integer;
      pW: integer;
    begin
      pW:=round(ResHor / 630);

      {slim lines}
      Printer.Canvas.Pen.Width:=pW;
      for iL:=1 to 11 do
      begin
        Printer.Canvas.MoveTo(tL, tT + iL*tH);
        Printer.Canvas.LineTo(tL + 6*tW, tT + iL*tH);
        if (iL <> 8) then
        begin
          Printer.Canvas.MoveTo(tL + 5*tW, tT + (iL-1)*tH);
          Printer.Canvas.LineTo(tL + 5*tW, tT + iL*tH);
        end;
      end;

      {bold lines}
      Printer.Canvas.Pen.Width:=2*pW;
      Printer.Canvas.MoveTo(tL, tT);
      Printer.Canvas.LineTo(tL, tT + 11*tH);
      Printer.Canvas.LineTo(tL + 6*tW, tT + 11*tH);
      Printer.Canvas.LineTo(tL + 6*tW, tT);
      Printer.Canvas.LineTo(tL, tT);
    end;

  begin
    tW:=cW; tH:=cH;
    tL:=sL; tT:=sT + (7+(ReportData[iY,iM].DayCount+1) div 2)*cH;

    TableFillText;
    TableDrawLines;
  end;

  procedure PrintProjectTable;
  var
    tT, tL, tW, tH, cP: integer;

    procedure ProjectHead;
    begin
      Printer.Canvas.Font.Style:=[];
      Printer.Canvas.TextOut(tL, tT-2*tH, 'Pøehled odpracovaných hodin na projektech v tomto mìsíci');
    end;

    procedure TableFillText;
    var
      iP, iPx, xL, xT: integer;
      IsFind: boolean;
      textOut: string;
    begin
      iP:=SumMax; cP:=0;
      xT:=round((tH - Printer.Canvas.TextHeight('A')) / 2);
      while (iP > 0) do
      begin
        if (ReportData[DispYear, DispMonth].ProjectSum[iP].ProjectHours > 0) or (iP = 1) then
        begin
          if (cP = 0) then
            cP:=iP;

          textOut:=ReportData[DispYear, DispMonth].ProjectSum[iP].ProjectNumber;
          xL:=2*xT;
          Printer.Canvas.TextOut(tL+0*tW+xL, tT+(cP-iP)*tH+xT, textOut);
          textOut:=Format('%3.2f', [ReportData[DispYear, DispMonth].ProjectSum[iP].ProjectHours]);
          xL:=tW - Printer.Canvas.TextWidth(textOut) - 2*xT;
          Printer.Canvas.TextOut(tL+11*tW+xL, tT+(cP-iP)*tH+xT, textOut);

          if (iP > 1) then
          begin
            iPx:=High(ProjectName); IsFind:=False;
            while (iPx > 0) and (not IsFind) do
            begin
              if (ReportData[DispYear, DispMonth].ProjectSum[iP].ProjectNumber = ProjectName[iPx].ProjectNumber) then
              begin
                if (ProjectName[iPx].ProjectName <> '') then
                  textOut:=ProjectName[iPx].ProjectName
                else
                  textOut:='Beze jména';
                IsFind:=True;
              end;
              iPx:=iPx-1;
            end;
            if (not IsFind) then
          end
          else
            textOut:='Nezaøazené projekty';
          xL:=2*xT;
          Printer.Canvas.TextOut(tL+2*tW+xL, tT+(cP-iP)*tH+xT, textOut);
        end;
        iP:=iP-1;
      end;
    end;

    procedure TableDrawLines;
    var
      iL: integer;
      pW: integer;
    begin
      pW:=round(ResHor / 630);

      {slim lines}
      Printer.Canvas.Pen.Width:=pW;
      for iL:=1 to cP do
      begin
        Printer.Canvas.MoveTo(tL, tT + iL*tH);
        Printer.Canvas.LineTo(tL + 12*tW, tT + iL*tH);
        Printer.Canvas.MoveTo(tL + 2*tW, tT + (iL-1)*tH);
        Printer.Canvas.LineTo(tL + 2*tW, tT + iL*tH);
        Printer.Canvas.MoveTo(tL + 11*tW, tT + (iL-1)*tH);
        Printer.Canvas.LineTo(tL + 11*tW, tT + iL*tH);
      end;

      {bold lines}
      Printer.Canvas.Pen.Width:=2*pW;
      Printer.Canvas.MoveTo(tL, tT);
      Printer.Canvas.LineTo(tL, tT + cP*tH);
      Printer.Canvas.LineTo(tL + 12*tW, tT + cP*tH);
      Printer.Canvas.LineTo(tL + 12*tW, tT);
      Printer.Canvas.LineTo(tL, tT);
    end;

  begin
    tW:=cW; tH:=cH;
    tL:=sL; tT:=sT + (21+(ReportData[iY,iM].DayCount+1) div 2)*cH;

    ProjectHead;
    TableFillText;
    TableDrawLines;
  end;

begin
  if (PrintDialog.Execute) then
  begin
    try
      Printer.Title:='Work report';
      Printer.Copies:=PrintDialog.copies;
      Printer.Canvas.Font.Size:=10;

      iM:=DispMonth;
      iY:=DispYear;
      ResHor:=GetDeviceCaps(printer.Handle,HorzRes);
      sL:=round(1.2*(ResHor / 14));
      sT:=round(1.5*sL);
      cW:=round((ResHor - 2*sL) / 12);
      cH:=round(cW / 3);

      Printer.BeginDoc;
      PrintHead;
      PrintHoursTable;
      PrintTotalTable;
      PrintProjectTable;
    finally
      if Printer.Printing then
        Printer.EndDoc;
    end;
  end;
end;

procedure TFormReport.MenuMainClick(Sender: TObject);
begin
  HideAllEdits;
end;

procedure TFormReport.MenuNameClick(Sender: TObject);
begin
  if (MenuName.Checked) then
  begin
    MenuName.Checked:= false;
    PanelName.Visible:= false;
  end
  else begin
    MenuName.Checked:= true;
    PanelName.Visible:= true;
  end;
end;

procedure TFormReport.MenuDateClick(Sender: TObject);
begin
  if (MenuDate.Checked) then
  begin
    MenuDate.Checked:= false;
    PanelDate.Visible:= false;
  end
  else begin
    MenuDate.Checked:= true;
    PanelDate.Visible:= true;
  end;
end;

procedure TFormReport.MenuReportFileClick(Sender: TObject);
begin
  if (MenuReportFile.Checked) then
  begin
    MenuReportFile.Checked:= false;
    PanelReportFile.Visible:= false;
  end
  else begin
    MenuReportFile.Checked:= true;
    PanelReportFile.Visible:= true;
  end;
end;

procedure TFormReport.MenuExitClick(Sender: TObject);
var
  bool: boolean;
begin
  FormCloseQuery(Sender, bool);
end;

procedure TFormReport.MenuInfoClick(Sender: TObject);
begin
  if (MenuInfo.Checked) then
  begin
    MenuInfo.Checked:= false;
    PanelInfo.Visible:= false;
  end
  else begin
    MenuInfo.Checked:= true;
    PanelInfo.Visible:= true;
  end;
end;

procedure TFormReport.MenuInfoLightClick(Sender: TObject);
begin
  if (MenuInfoLight.Checked) then
  begin
    MenuInfoLight.Checked:= false;
    PanelInfoLight.Visible:= false;
  end
  else begin
    MenuInfoLight.Checked:= true;
    PanelInfoLight.Visible:= true;
  end;

end;

procedure TFormReport.FormResize(Sender: TObject);
begin
  if (FormReport.Width<702) then FormReport.Width:= 702;
  EditLeaving.Left:= FormReport.Width - 175;
  EditArrival.Left:= FormReport.Width - 224;
  EditHoursAtHome.Left:= FormReport.Width - 273;
  EditProjectHours.Left:= FormReport.Width - 390;
  EditProjectExt.Left:= FormReport.Width - 458;
  EditProjectNumber.Left:= FormReport.Width - 532;
  EditDescript.Width:= FormReport.Width - 699;
  GridReport.ColWidths[5]:= FormReport.Width - 701;
end;

initialization
  DecimalSeparator:='.';
end.
