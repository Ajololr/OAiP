program laba_1_2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
    Answer, N, I: Integer;
    IsCorrect: Boolean;

begin
    Writeln('This program raises the number 2 to the power of N. Enter N [1;31]:');
    IsCorrect := false;
    repeat
        try
            Readln(N);
            if (N > 0) and (N < 32) then
                IsCorrect := true
            else
                Writeln('Enter number from interval [1;31]:');
        except
            Writeln('Check entered data (enter number from interval [1;31]):');
        end;
    until IsCorrect;
    Answer := 1;
    for I := 1 to N do
        Answer := Answer * 2;
    Writeln(Answer);
    Readln;
end.
