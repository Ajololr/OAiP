program Laba_5_2;



uses
  Vcl.Forms,
  Graf in 'Graf.pas' {Lab_5_2},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Metropolis UI Dark');
  Application.CreateForm(TLab_5_2, Lab_5_2);
  Application.Run;
end.
