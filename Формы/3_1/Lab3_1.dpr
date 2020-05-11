program Lab3_1;

uses
  Vcl.Forms,
  Lab_3_1 in 'Lab_3_1.pas' {Ilya},
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
