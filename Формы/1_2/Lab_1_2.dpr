program Lab_1_2;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Lab1_2},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Metropolis UI Dark');
  Application.CreateForm(TLab1_2, Lab1_2);
  Application.Run;
end.
