program laba_3_2;

{$APPTYPE CONSOLE}

uses
    SysUtils;

const
     ThatSet = ['+', '-', '*', '/','.',',',':',';','!','?','0'..'9'];
     MaxJ: Byte = 255;

type
    TMySet = set of Char;

procedure GetMySetConsole(MyString: String);
var
    MySet: TMySet;
    i, j: Byte;
begin
    MySet := [];
    for i := 1 to Length(MyString) do
        if (MyString[i] in ThatSet) then
        begin
            MySet := MySet + [MyString[i]];
            Write('The element ', MyString[i], ' was added to the set: ');
            for j := 0 to MaxJ do
                if chr(j) in MySet then
                    Write(chr(j));
            WriteLn;
        end;
    if MySet = [] then
        WriteLn('There are no such signs in that sequence.')
    else
        WriteLn('The needed set was found.');
end;

function GetYesNoChoice(): Char;
var
    Answer: Char;
    IsCorrect: Boolean;
begin
    IsCorrect := false;
    repeat
        ReadLn(Answer);
        Answer := UpCase(Answer);
        if (Answer = 'Y') or (Answer = 'N') then
            IsCorrect := true
        else
            WriteLn('Incorrect input. Enter Y(Yes) or N(No):');
    until IsCorrect;
    GetYesNoChoice := Answer;
end;

procedure GetFile(var Myfile: TextFile);
var
    IsCorrect: Boolean;
    NameOfFile: String;
begin
    WriteLn('Enter file name(Name.txt):');
    IsCorrect := false;
    repeat
        ReadLn(NameOfFile);
        if (not FileExists(NameOfFile)) then
            WriteLn('File does not exist. Try again: ')
        else
        begin
            try
                AssignFile(MyFile, NameOfFile);
                reset(MyFile);
                if SeekEof(MyFile) then
                begin
                    WriteLn('File is empty. Try again: ');
                    CloseFile(MyFile);
                end
                else
                    IsCorrect := true;
            except
                WriteLn('Access is not alowed. Try Again: ');
            end;
        end;
    until IsCorrect;
end;

procedure GetOutPutFile(var NewFile: TextFile);
var
    IsCorrect: Boolean;
begin
    IsCorrect := false;
    repeat
        GetFile(NewFile);
        WriteLn('Would you like to rewrite the file? Press Y(Yes) or N(No):');
        try
            if GetYesNoChoice = 'Y' then
                Rewrite(NewFile)
            else
            begin
                Append(NewFile);
                WriteLn(NewFile);
            end;
            IsCorrect := true;
        except
            Write('This file can not be edited. Try again. ');
        end;
    until IsCorrect;
end;

procedure GetMySetFile(MyString: String);
var
    NewFile: TextFile;
    MySet: TMySet;
    i, j: Byte;
begin
    GetOutputFile(NewFile);
    MySet := [];
    for i := 1 to Length(MyString) do
        if (MyString[i] in ThatSet) then
        begin
            MySet := MySet + [MyString[i]];
            Write(NewFile, 'The element ', MyString[i], ' was added to the set: ');
            for j:= 0 to MaxJ do
                if chr(j) in MySet then
                    Write(NewFile, chr(j));
            WriteLn(NewFile);
        end;
    if MySet = [] then
        WriteLn(NewFile, 'There are no such signs in that sequence.')
    else
        WriteLn(NewFile, 'The needed set was found.');
    CloseFile(NewFile);
end;

function CheckString(MyString: String): Boolean;
var
    IsCorrect: Boolean;
    i: Integer;
begin
    IsCorrect := false;
    if not(MyString = '') and not(MyString = ' ') then
    begin
        i := 0;
        repeat
            inc(i);
            if not(MyString[i] = ' ') then
                IsCorrect := true;
        until IsCorrect or (i = Length(MyString));
    end;
    if not IsCorrect then
        WriteLn('The sequence must not be empty. Try Again.');
    CheckString := IsCorrect;
end;

function GetMyStringConsole(): String;
var
    MyString: String;
begin
    repeat
        Write('Enter the sequence:');
        ReadLn(MyString);
    until CheckString(MyString);
    GetMyStringConsole := MyString;
end;

function GetMyStringFile(var MyFile: TextFile): String;
var
    MyString: String;
begin
    repeat
        GetFile(MyFile);
        ReadLn(MyFile, MyString);
        if not(Eof(MyFile)) then
            WriteLn('There sould be only one sequence. Try again. ');
    until Eof(MyFile);
    WriteLn('The sequence is: ', MyString);
    GetMyStringFile := MyString;
end;

procedure Main();
var
    MyString: String;
    MyFile: TextFile;
begin
    WriteLn('This program makes up a set which elements are occurring in the sequence in a row of arithmetic operations, punctuation signs and numbers.', #10, 'Would you like to open the file or work in console? Press Y(Yes) or N(No):');
    if GetYesNoChoice() = 'Y' then
        MyString := GetMyStringFile(MyFile)
    else
        MyString := GetMyStringConsole();
    WriteLn('Would you like to write down the answer to file? Press Y(Yes) or N(No):');
    if GetYesNoChoice = 'Y' then
        GetMySetFile(MyString)
    else
        GetMySetConsole(MyString);
    WriteLn('Press "Enter" to exit the console.');
    ReadLn;
end;

begin
    Main();
end.
