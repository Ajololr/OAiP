unit Unit1;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids;

type
    TArray = array of Integer;
    TIlya = class(TForm)
    MainMenu: TMainMenu;
    Fi1: TMenuItem;
    Open: TMenuItem;
    Save: TMenuItem;
    Help1: TMenuItem;
    Aboutprogram: TMenuItem;
    Aboutthedeveloper: TMenuItem;
    Calculate: TButton;
    Result: TLabel;
    OpenFile: TOpenDialog;
    SaveFile: TSaveDialog;
    Nothing: TMenuItem;
    Exit: TMenuItem;
    Size: TEdit;
    PopupMenu: TPopupMenu;
    EnterSize: TLabel;
    SG: TStringGrid;
    SetSize: TButton;
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
    procedure XEditChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ilya: TIlya;

implementation

{$R *.dfm}

function Calc(MyArray: TArray): string;
var
    sum, N, Temp, i: Integer;
    answer: string;
    iscorrect: boolean;
begin
    iscorrect := true;
    Answer := 'The given numerical sequence is increasing.';
    for i := 0 to High(MyArray) - 1 do
        if IsCorrect then
            if MyArray[i] >= MyArray[i + 1] then
            begin
                IsCorrect := false;
                Answer := 'The given numerical sequence is not increasing.';
            end;
    Calc := answer;
end;

procedure TIlya.AboutprogramClick(Sender: TObject);
begin
    MessageDlg('This program checks whether the given sequence A1, A2, ..., AN is increasing.' + #13 + 'N should be in range 2..10, A1..AN should be in range -99..999', mtInformation, [mbOk], 0);
end;

procedure TIlya.AboutthedeveloperClick(Sender: TObject);
begin
    MessageDlg('This program is developed by Ilya Androsov' + #13 + 'BSUIR 2018', mtInformation, [mbOk], 0);
end;

procedure TIlya.SizeEditChange(Sender: TObject);
var
    i: Byte;
begin
    for i := 0 to 10 do
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
    Result.Caption := Calc(Grid);
end;

procedure TIlya.XEditChange(Sender: TObject);
begin
   with Sender as TEdit do
    begin
        Result.Caption := '';
        if ((Length(Text) > 0) and (Length(Size.Text) = 1)) then
           Calculate.Enabled := true;
        if (Length(Text) = 0) then
            Calculate.Enabled := false
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
   for i := 0 to 10 do
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
         if ButtonSelected = mrYes then
         begin
            AssignFile(outputFile, MyFile);
            Rewrite(outputFile);
            writeln(outputFile, result.Caption);
            CloseFile(outputFile);
         end
         else
            SaveClick(Sender);
      end
      else
      begin
         AssignFile(outputFile, MyFile);
         Rewrite(outputFile);
         WriteLn(outputFile, result.Caption);
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
