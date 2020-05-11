program laba_1_1;

{$APPTYPE CONSOLE}

uses
    SysUtils;

var
    Age: Byte;
    IsCorrect: Boolean;
begin
    Writeln('Enter your age:');
    repeat
        try
            IsCorrect := true;
            Readln(Age);
            if (Age < 1) or (Age > 150) then
            begin
                IsCorrect := false;
                Writeln('Enter your real age (from 1 to 150):');
            end;
        except
            IsCorrect := false;
            Writeln('Check entered data (enter numbers from 1 to 150).');
        end
    until IsCorrect;
    if (Age > 17) then
        Writeln('You are allowed to vote.')
    else
    begin
        Age := 18 - Age;
        Writeln('You will be allowed to vote in ', Age, ' years.');
    end;
    Readln;
end.





