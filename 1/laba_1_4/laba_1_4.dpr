program laba_1_4;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
    N, X, i, Sum, Temp: Integer;
    MyArray: array of Integer;
    IsCorrect: Boolean;

begin
    WriteLn('This program calculates A1*x + A2*x^2 + A3*x^3...AN*x^N using the Horner Scheme.', #10+ 'Enter N [2;8]:');
    IsCorrect := false;
    repeat
        try
            ReadLn(N);
            if (N > 1) and (N < 9) then
                IsCorrect := true
            else
                WriteLn('Enter number from interval [2;8]:');
        except
            WriteLn('Check entered data (enter number from interval [2;8]):');
        end;
    until IsCorrect;
    SetLength(MyArray, N);
    Temp := Length(MyArray) - 1;
    IsCorrect := false;
    for i := 0 to Temp do
    begin
        Writeln ('Enter ', i + 1, ' element of the sequence [1;8]:');
        repeat
            try
                ReadLn(MyArray[i]);
                if (MyArray[i] > 0) and (MyArray[i] < 9) then
                    IsCorrect := true
                else
                    WriteLn('Enter number from interval [1;8]:');
            except
                WriteLn('Check entered data (enter number from interval [1;8]):');
            end;
        until IsCorrect;
    end;
    WriteLn('Enter X [1;8]:');
    IsCorrect := false;
    repeat
        try
            ReadLn(X);
            if (X > 0) and (X < 9) then
                IsCorrect := true
            else
                WriteLn('Enter number from interval [1;8]:');
        except
            WriteLn('Check entered data (enter number from interval [1;8]):');
        end;
    until IsCorrect;
    Sum := (MyArray[N - 1] * X + MyArray[N - 2]) * X;
    Temp := Length(MyArray) - 3;
    for i := Temp downto 0 do
        Sum := (Sum + MyArray[i]) * X;
    WriteLn(Sum);
    ReadLn;
end.
