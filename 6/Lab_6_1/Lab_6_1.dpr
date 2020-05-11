program Lab_6_1;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {Ilya},
  Queue in 'Queue.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TIlya, Ilya);
  Application.Run;
end.
