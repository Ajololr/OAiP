program Lab_5_1;



uses
  System.StartUpCopy,
  FMX.Forms,
  Clock in 'Clock.pas' {Ilya};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TIlya, Ilya);
  Application.Run;
end.
