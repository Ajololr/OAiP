program Lab_1_1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Lab1_1},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Metropolis UI Dark');
  Application.CreateForm(TLab1_1, Lab1_1);
  Application.Run;
end.
