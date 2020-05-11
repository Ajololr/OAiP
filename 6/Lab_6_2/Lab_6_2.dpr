program Lab_6_2;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {Ilya},
  BinaryTree in 'BinaryTree.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TIlya, Ilya);
  Application.Run;
end.
