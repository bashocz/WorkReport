program WorkReport;

uses
  Forms,
  FormMain in 'FormMain.pas' {FormReport},
  FormPause in 'FormPause.pas' {FormPauses},
  MessDlg in 'MessDlg.pas' {MessageForm},
  FormName in 'FormName.pas' {FormPrjName},
  FormPrjs in 'FormPrjs.pas' {FormProjects};

{$R *.res}


begin
  Application.Initialize;
  Application.CreateForm(TFormReport, FormReport);
  Application.CreateForm(TFormPauses, FormPauses);
  Application.CreateForm(TFormPrjName, FormPrjName);
  Application.CreateForm(TFormProjects, FormProjects);
  Application.Run;
end.
