program Lab_1_3;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Lab1_3},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Metropolis UI Dark');
  Application.CreateForm(TLab1_3, Lab1_3);
  Application.Run;
end.
