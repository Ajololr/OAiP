program Lab_7_1;

uses
  Vcl.Forms,
  Main in 'Main.pas' {MainForm},
  Graph in 'Graph.pas' {GraphForm},
  VertexQueue in 'VertexQueue.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TGraphForm, GraphForm);
  Application.Run;
end.
