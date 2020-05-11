program laba_2_1;

{$APPTYPE CONSOLE}

uses
    SysUtils;

const
    MinA = -2147483648;
    MaxA = 2147483647;
    MinLength = 2;
    MaxLength = 20;

var
    n, i, MaxI: Byte;
    IsCorrect: Boolean;
    MyArray: array of Integer;
    Answer: String;

begin
    WriteLn('This program checks whether the given sequence a1, a2, ..., an is increasing.', #10+ 'Enter n ', MinLength, '..', MaxLength, ':');
    IsCorrect := false;
    repeat
        try
            Read(n);
            if (n >= MinLength) and (n <= MaxLength) then
                IsCorrect := true
            else
                WriteLn('Enter number from interval ', MinLength, '..', MaxLength, ':');
        except
            WriteLn('Check entered data (enter number from interval ', MinLength, '..', MaxLength, ':');
        end;
    until IsCorrect;
    SetLength(MyArray, n);
    MaxI := n - 1;
    for i := 0 to MaxI do
    begin
        IsCorrect := false;
        WriteLn('Enter ', i + 1, ' element of the sequence ', MinA, '..', MaxA, ':');
        repeat
            try
                Read(MyArray[i]);
                if (MyArray[i] >= MinA) and (MyArray[i] <= MaxA) then
                    IsCorrect := true
                else
                    WriteLn('Enter number from interval ', MinA, '..', MaxA, ':');
            except
                WriteLn('Check entered data (enter number from interval ', MinA, '..', MaxA, ':');
            end;
        until IsCorrect;
    end;
    Answer := 'The given numerical sequence is increasing.';
    MaxI := MaxI - 1;
    for i := 0 to MaxI do
        if IsCorrect then
            if MyArray[i] >= MyArray[i + 1] then
            begin
                IsCorrect := false;
                Answer := 'The given numerical sequence is not increasing.';
            end;
    WriteLn(Answer);
    ReadLn;
end.
