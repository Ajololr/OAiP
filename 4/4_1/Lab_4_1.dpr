program Lab_4_1;

uses
  Vcl.Forms,
  Students in 'Students.pas' {StartMenu},
  Vcl.Themes,
  Vcl.Styles,
  ManageStudent in 'ManageStudent.pas' {Manage};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Metropolis UI Black');
  Application.CreateForm(TStartMenu, StartMenu);
  Application.CreateForm(TManage, Manage);
  Application.Run;
end.
