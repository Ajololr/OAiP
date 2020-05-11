program laba_1_3;

{$APPTYPE CONSOLE}

uses
    SysUtils;

var
    Count, X: Integer;
    Y: Real;
    IsCorrect: Boolean;

begin
    WriteLn('This program calculates the square root of X. Enter X [0;2147483647]:');
    IsCorrect := false;
    repeat
        try
            ReadLn(X);
            if (X > -1) and (X < 2147483648) then
                IsCorrect := true
            else
                WriteLn('Enter number from interval [0;2147483647]:');
        except
            WriteLn('Check entered data (enter number from interval [0;2147483647]):');
        end;
    until IsCorrect;
    Y := 1;
    Count := 0;
    while abs((X + sqr(Y)) / (2 * Y) - Y) > 0.00001 do
    begin
        Y := (X + sqr(Y)) / (2 * Y);
        Inc(Count);
    end;
    WriteLn(Y:0:5, #10+ 'Number of iterations: ',Count);
    ReadLn;
end.

