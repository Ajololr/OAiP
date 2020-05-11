program Lab_4_2;

uses
  Vcl.Forms,
  Lab4_2 in 'Lab4_2.pas' {Ilya},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Metropolis UI Dark');
  Application.CreateForm(TIlya, Ilya);
  Application.Run;
end.
