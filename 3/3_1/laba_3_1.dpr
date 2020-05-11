program laba_3_1;

{$APPTYPE CONSOLE}

uses
    SysUtils;

function GetYesNoChoice(): Char;
var
    Answer: Char;
    IsCorrect: Boolean;
begin
    repeat
        ReadLn(Answer);
        Answer := UpCase(Answer);
        if (Answer = 'Y') or (Answer = 'N') then
            IsCorrect := true
        else
        begin
            IsCorrect := false;
            WriteLn('Incorrect input. Enter Y(Yes) or N(No):');
        end;
    until IsCorrect;
    GetYesNoChoice := Answer;
end;

procedure GetOutputToFile(Common—haracters, MyUniqueString, ThatUniqueString: String);
var
    IsCorrect: Boolean;
    NewFile: TextFile;
    NameOfFile: String;
begin
    WriteLn('Enter the name of file Name.txt:');
    IsCorrect := false;
    repeat
        ReadLn(NameOfFile);
        if (not FileExists(NameOfFile)) then
            WriteLn('File does not exist. Try again:')
        else
        begin
            Assign(NewFile, NameOfFile);
            writeln('Would you like to rewrite the file? Press Y(Yes) or N(No):');
            if GetYesNoChoice = 'Y' then
                try
                    Rewrite(NewFile);
                    WriteLn(NewFile, 'Common characters: ', Common—haracters);
                    WriteLn(NewFile, 'Unique characters of first string: ', MyUniqueString);
                    WriteLn(NewFile, 'Unique characters of second string:', ThatUniqueString);
                    IsCorrect := true;
                except
                    WriteLn('Access is not allowed. Try again:');
                end
            else
                try
                    Append(NewFile);
                    WriteLn(NewFile, 'Common characters: ', Common—haracters);
                    WriteLn(NewFile, 'Unique characters of first string: ', MyUniqueString);
                    WriteLn(NewFile, 'Unique characters of second string:', ThatUniqueString);
                    IsCorrect := true;
                except
                    WriteLn('Access is not allowed. Try again:');
                end;
        end;
    until IsCorrect;
    Close(NewFile);
end;

procedure CompareStrings(MyString, ThatString: String; var Common—haracters, MyUniqueString, ThatUniqueString: String);
var
    i, j, k: ShortInt;
begin
    j := 1;
    k := 1;
    for i := 1 to Length(MyString) do
        if (pos(MyString[i], ThatString) <> 0) and (pos(MyString[i], Common—haracters) = 0) then
        begin
            Insert(MyString[i], Common—haracters,j);
            Inc(j);
        end
        else
            if (pos(MyString[i], MyUniqueString) = 0) and (pos(MyString[i], Common—haracters) = 0) then
            begin
                Insert(MyString[i], MyUniqueString, k);
                Inc(k)
            end;
    j := 1;
    for i := 1 to Length(ThatString) do
        if (pos(ThatString[i], Common—haracters) = 0) and (pos(ThatString[i], ThatUniqueString) = 0) then
        begin
            Insert(ThatString[i], ThatUniqueString, j);
            Inc(j);
        end;
end;

function CheckFile(var MyFile: TextFile): Boolean;
var
    IsCorrect: Boolean;
begin
    IsCorrect := false;
    if Eof(MyFile) then
        IsCorrect := true
    else
        Write('There sould be only two strings. Try again. ');
    CheckFile := IsCorrect;
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
            WriteLn('File does not exist. Try again:')
        else
        begin
            AssignFile(MyFile, NameOfFile);
            reset(MyFile);
            if SeekEof(MyFile) then
                WriteLn('File is empty. Try again:')
            else
                IsCorrect := true;
        end;
    until IsCorrect;
end;

procedure Main();
var
    IsCorrect: Boolean;
    MyString, ThatString, Common—haracters, MyUniqueString, ThatUniqueString : String;
    MyFile : TextFile;
begin
    WriteLn('This program finds characters occurring in both strings, finds characters found only in the first string, only in the second string.', #10, 'Would you like to open the file or work in console? Press Y(Yes) or N(No):');
    if GetYesNoChoice() = 'Y' then
    begin
        repeat
            GetFile(MyFile);
            ReadLn(MyFile, MyString);
            if not(Eof(MyFile)) then
            begin
                Read(MyFile, ThatString);
                IsCorrect := CheckFile(MyFile);
            end
            else
                Write('There sould be two strings. Try again. ');
        until IsCorrect;
        WriteLn('The first string: ', MyString, #10, 'The second string: ', ThatString);
    end
    else
    begin
        Write('Enter the first string:');
        ReadLn(MyString);
        Write('Enter the second string:');
        ReadLn(ThatString);
    end;
    CompareStrings(MyString, ThatString, Common—haracters, MyUniqueString, ThatUniqueString);
    WriteLn('Would you like to write down the answer to file? Press Y(Yes) or N(No):');
    if GetYesNoChoice = 'Y' then
        GetOutputToFile(Common—haracters, MyUniqueString, ThatUniqueString);
    WriteLn('Common characters: ', Common—haracters, #10, 'Unique characters of the first string: ', MyUniqueString, #10, 'Unique characters of the second string: ', ThatUniqueString, #10, 'Press "Enter" to exit the console.');
    ReadLn;
end;

begin
    Main();
end.
