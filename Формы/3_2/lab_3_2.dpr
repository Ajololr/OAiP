program lab_3_2;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Ilya},
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
