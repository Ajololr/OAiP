unit lab3_3;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls,Vcl.Grids;

type
    TArray = array of Integer;
    TIlya = class(TForm)
    EnterSize: TLabel;
    Calculate: TButton;
    Size: TEdit;
    SG: TStringGrid;
    SetSize: TButton;
    MainMenu: TMainMenu;
    Fi1: TMenuItem;
    Open: TMenuItem;
    Save: TMenuItem;
    Nothing: TMenuItem;
    Exit: TMenuItem;
    Help1: TMenuItem;
    Aboutprogram: TMenuItem;
    Aboutthedeveloper: TMenuItem;
    OpenFile: TOpenDialog;
    SaveFile: TSaveDialog;
    PopupMenu: TPopupMenu;
    Result: TLabel;
    procedure AboutprogramClick(Sender: TObject);
    procedure AboutthedeveloperClick(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure SizeEditChange(Sender: TObject);
    procedure CalculateClick(Sender: TObject);
    procedure OpenClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure SetSizeClick(Sender: TObject);
    procedure SetFRow(Sender: TObject);
    procedure SGKeyPress(Sender: TObject; var Key: Char);
private
    { Private declarations }
public
    { Public declarations }
end;

var
    Ilya: TIlya;

implementation

{$R *.dfm}

function OrderArray(MyArray: TArray): TArray;
var
    ThatArray: TArray;
    i, j, Left, Right, Size, Temp: ShortInt;
begin
    Size := High(MyArray);
    Left := Size;
    Right := Size;
    SetLength(ThatArray, Size * 2 + 1);
    ThatArray[Size] := MyArray[0];
    for i := 1 to Size do
    begin
        Temp := MyArray[i];
        if Temp >= MyArray[0] then
        begin
            Inc(Right);
            j := Right;
            while Temp < ThatArray[j - 1] do
            begin
                ThatArray[j] := ThatArray[j-1];
                Dec(j);
            end;
            ThatArray[j] := Temp;
        end
        else
        begin
            Dec(Left);
            j := Left;
            while Temp > ThatArray[j + 1] do
            begin
                ThatArray[j] := ThatArray[j + 1];
                Inc(j);
            end;
        end;
        ThatArray[j] := Temp;
    end;
    for j := 0 to Size do
        MyArray[j] := ThatArray[j + Left];
    OrderArray := MyArray;
end;

function IsIncreasing(MyArray: TArray): boolean;
var
    Sum, N, Temp, i: Integer;
    IsCorrect: Boolean;
begin
    IsCorrect := true;
    for i := 0 to High(MyArray) - 1 do
        if IsCorrect then
            if MyArray[i] >= MyArray[i + 1] then
                IsCorrect := false;
    IsIncreasing := IsCorrect;
end;

procedure TIlya.AboutprogramClick(Sender: TObject);
begin
    MessageDlg('This program sorts a sequence of numbers using double-path inserts.' + #13 + 'Size should be in range 2..10, numbers should be in range -99..999', mtInformation, [mbOk], 0);
end;

procedure TIlya.AboutthedeveloperClick(Sender: TObject);
begin
    MessageDlg('This program is developed by Ilya Androsov' + #13 + 'BSUIR 2018', mtInformation, [mbOk], 0);
end;

procedure TIlya.SizeEditChange(Sender: TObject);
var
    i: Byte;
begin
    for i := 0 to 9 do
        SG.Cells[i, 1] := '';
    save.Enabled := false;
    SG.Enabled := False;
    SetSize.Enabled := false;
    Calculate.Enabled := false;
    with Sender as TEdit do
    begin
        Result.Caption := '';
        if (Length(Text) > 0) then
        begin
            SetSize.Enabled := true;
            if (StrToInt(Size.text) > 10) then
            begin
                MessageDlg('Error. The number you have entered is to high.', mtError, [mbRetry], 0);
                clear;
            end;
            if (size.Text = '0') then
                clear;
        end;
    end;
end;

procedure TIlya.KeyPress(Sender: TObject; var Key: Char);
var
    Numerals: set of char;
    I, DotPos: Byte;
    IsFind: Boolean;
begin
    Numerals := ['0'..'9', #8];
    with Sender as TEdit do
    begin
        if not (Key in Numerals) then
            Key := #0;
        if (Length(Text) = 2) and (Key <> #8) then
            Key := #0;
        if (Length(Text) = 0) and (Key = '0') then
            Key := #0;
    end;
end;

procedure TIlya.CalculateClick(Sender: TObject);
const
    EmptyEr = 'Empty cells were filled with zeros.';
var
    Number, MissingAge: Integer;
    Grid: TArray;
    I, Siz: Integer;
    Empty: Boolean;
begin
    Empty := False;
    Save.Enabled := True;
    Siz := StrToInt(Size.Text);
    SetLength(Grid, Siz);
    for I := 0 to Siz - 1 do
    begin
        if (SG.Cells[I,1] = '') then
        begin
            Empty := true;
            SG.Cells[I, 1] := '0';
        end;
        Grid[I] := StrToInt(SG.Cells[I, 1]);
    end;
    if Empty then
        MessageDlg(EmptyEr, mtConfirmation, [mbOk], 0);
    If IsIncreasing(Grid) then
        Result.Caption := 'The given numerical sequence is already odered.'
    else
    begin
        Grid := OrderArray(Grid);
        Result.Caption := 'The given numerical sequence was odered:' + #13#10;
        for I := 0 to Siz - 1 do
            Result.Caption := Result.Caption + IntToStr(Grid[I]) + ' ';
    end;
end;

procedure TIlya.ExitClick(Sender: TObject);
var
    ButtonSelected: Byte;
begin
    Close;
end;

procedure TIlya.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
    ButtonSelected: Byte;
begin
    ButtonSelected := MessageDlg('Are you sure you want to exit?', mtConfirmation, [mbYes,mbNo], 0);
    if ButtonSelected <> mrYes then
        CanClose := False;
end;

procedure TIlya.OpenClick(Sender: TObject);
var
    inputFile: TextFile;
    temp, I: integer;
begin
    for i := 0 to 9 do
        SG.Cells[i, 1] := '';
    Size.Clear;
    Result.Caption := '';
    if OpenFile.Execute then
    begin
        try
            AssignFile(inputFile, OpenFile.FileName);
            Reset(inputFile);
            if SeekEof(inputFile) then
            begin
                MessageDlg('This file is empty. Try again.', mtError, [mbRetry], 0);
                CloseFile(inputFile);
            end
            else
            begin
                readln(inputFile, temp);
                Size.Text := IntToStr(temp);
                SetSizeClick(Sender);
                I := 0;
                repeat
                    read(inputFile, temp);
                    SG.Cells[I, 1] := IntToStr(temp);
                    Inc(I);
                until EoF(inputFile);
                CalculateClick(Sender);
                CloseFile(inputFile);
            end;
        except
            MessageDlg('Check entered data. Try again.', mtError, [mbRetry], 0);
            CloseFile(inputFile);
        end;
    end;
end;

function CheckFileName(MyFile: string): string;
var
    i: byte;
    isCorrect: boolean;
begin
    isCorrect := false;
    i := 1;
    while  not isCorrect and (i <= length(MyFile)) do
    begin
        if MyFile[i] = '.' then
            isCorrect := true;
        inc(i);
    end;
    if not isCorrect then
        MyFile := MyFile + '.txt';
    CheckFileName := MyFile;
end;

procedure TIlya.SaveClick(Sender: TObject);
var
    outputFile: TextFile;
    MyFile: string;
    ButtonSelected: byte;
begin
    if SaveFile.Execute then
    begin
        myFile := SaveFile.FileName;
        MyFile := CheckFileName(MyFile);
        if FileExists(MyFile) then
        begin
            ButtonSelected := MessageDlg('Do you want to rewrite the file?', mtConfirmation, [mbYes,mbNo], 0);
            AssignFile(outputFile, MyFile);
            if ButtonSelected = mrYes then
            begin
                Rewrite(outputFile);
                Write(outputFile, result.Caption);
                CloseFile(outputFile);
            end
            else
            begin
                Append(outputFile);
                WriteLn(OutputFile);
                Write(OutputFile, Result.Caption);
            end;
            CloseFile(outputFile);
        end;
    end;
end;

procedure TIlya.SetFRow(Sender: TObject);
var
    I: Integer;
begin
    for I := 0 to SG.ColCount - 1  do
    begin
        SG.Cells[I, 0] := 'A' + IntToStr(I + 1);
    end;
end;

procedure TIlya.SetSizeClick(Sender: TObject);
begin
    Calculate.Enabled := true;
    SG.Enabled := true;
    SG.ColCount := StrToInt(Size.Text);
    SetFRow(Sender);
end;

procedure TIlya.SGKeyPress(Sender: TObject; var Key: Char);
var
    Numerals: set of char;
begin
    Save.Enabled := false;
    Result.Caption := '';
    Numerals := ['0'..'9', #8, #45];
    if not (Key in Numerals) then
        Key := #0;
    if (SG.Cells[SG.Col, SG.Row] = '0') and (Key <> #8) then
        Key := #0;
    if (SG.Cells[SG.Col, SG.Row] = '-') and (Key = '0') then
        Key := #0;
    if (SG.Cells[SG.Col, SG.Row] = '-') and (Key = #45) then
        Key := #0;
    if (Length(SG.Cells[SG.Col, SG.Row]) > 0) and (Key = #45) then
        Key := #0;
    if (Length(SG.Cells[SG.Col, SG.Row]) > 2) and (Key <> #8) then
        Key := #0;
end;

end.
