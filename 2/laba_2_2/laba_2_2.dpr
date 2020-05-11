program laba_2_2;

{$APPTYPE CONSOLE}

uses
    SysUtils;

const
    MinNumber = 0;
    MaxNumber = 256;

procedure GetBinaryCode(var Number: Byte);
var
    i: Byte;
    MyArray: array [1..8] of Byte;
begin
    i := 1;
    while (i < 9) do
    begin
        MyArray[i] := ((Number) mod (2));
        Number := (Number) div (2);
        inc(i);
    end;
    for i := 8 downto 1 do
        Write(MyArray[i]);
end;

function CheckNumber(const Max, Min: SmallInt): Byte;
var
    Num: SmallInt;
    IsCorrect: Boolean;
begin
    IsCorrect := false;
    repeat
        try
            Read(Num);
            if (Num > Min) and (Num < Max) then
                IsCorrect := true
            else
                WriteLn('Enter number from interval 1..255:');
        except
            WriteLn('Check entered data. Enter number from interval 1..255:');
        end;
    until IsCorrect;
    CheckNumber := Num;
end;

Procedure Main();
var
   Number: Byte;
begin
    WriteLn('This program transforms natural number P into binary code.', #10, 'Enter P 1..255:');
    Number := CheckNumber(MaxNumber, MinNumber);
    GetBinaryCode(Number);
    ReadLn;
end;

begin
    Main();
end.



