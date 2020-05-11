program Lab_7_2;

uses
  Vcl.Forms,
  Main in 'Main.pas' {Ilya},
  List in 'List.pas' {ListForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TIlya, Ilya);
  Application.CreateForm(TListForm, ListForm);
  Application.Run;
end.
