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
    OpenFile: TOpenDialog;
    SaveFile: TSaveDialog;
    Nothing: TMenuItem;
    Exit: TMenuItem;
    SizeA: TEdit;
    PopupMenu: TPopupMenu;
    EnterSize: TLabel;
    SGA: TStringGrid;
    SetSizeA: TButton;
    Label1: TLabel;
    SizeB: TEdit;
    SGB: TStringGrid;
    SetSizeB: TButton;
    SGC: TStringGrid;
    procedure AboutprogramClick(Sender: TObject);
    procedure AboutthedeveloperClick(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure SizeAEditChange(Sender: TObject);
    procedure SizeBEditChange(Sender: TObject);
    procedure CalculateClick(Sender: TObject);
    procedure OpenClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure SetSizeBClick(Sender: TObject);
    procedure SetSizeAClick(Sender: TObject);
    procedure SGAKeyPress(Sender: TObject; var Key: Char);
    procedure SGBKeyPress(Sender: TObject; var Key: Char);
    procedure GetArrayC(ArrayA, ArrayB: TArray; Sender:TObject);
    procedure SGAKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SGBKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
    Ilya: TIlya;

implementation

{$R *.dfm}

procedure TIlya.GetArrayC(ArrayA, ArrayB: TArray; Sender:TObject);
var
    i, j, Size: Integer;
    MyArray: TArray;
    ArrayCSet: Set of Byte;
begin
    ArrayCSet := [];
    j := 0;
    for i := 0 to High(ArrayA) do
        if not(ArrayA[i] in ArrayCSet) then
            ArrayCSet := ArrayCSet + [ArrayA[i]];
    for i := 0 to High(ArrayB) do
        if not(ArrayB[i] in ArrayCSet) then
            ArrayCSet := ArrayCSet + [ArrayB[i]];
    for i := -99 to 999 do
        if i in ArrayCSet then
        begin
            inc(j);
            SetLength(MyArray, j);
            MyArray[j - 1] := i;
        end;
    SGC.ColCount := Length(MyArray);
    for i := 0 to High(MyArray) do
        SGC.Cells[i, 0] := inttostr(MyArray[i]);
end;

procedure TIlya.AboutprogramClick(Sender: TObject);
begin
    MessageDlg('This program merges two arrays A and B' + #13 + 'into one ordered array C without repetitions.' + #13 + 'Sizes of arrays A and B should be in range 2..8' + #13 + 'Numbers of arrays should be in range 0..255.', mtInformation, [mbOk], 0);
end;

procedure TIlya.AboutthedeveloperClick(Sender: TObject);
begin
    MessageDlg('This program is developed by Ilya Androsov' + #13 + 'BSUIR 2018', mtInformation, [mbOk], 0);
end;

procedure TIlya.SizeAEditChange(Sender: TObject);
var
  i: Byte;
begin
    for i := 0 to 7 do
        SGA.Cells[i, 0] := '';
    for i := 0 to 15 do
        SGC.Cells[i, 0] := '';
    save.Enabled := false;
    SGA.Enabled := False;
    SetSizeA.Enabled := false;
    Calculate.Enabled := false;
    with Sender as TEdit do
    begin
        if (Length(Text) > 0) then
        begin
            SetSizeA.Enabled := true;
            if (StrToInt(SizeA.text) > 10) then
            begin
                MessageDlg('Error. The number you have entered is to high.', mtError, [mbRetry], 0);
                clear;
            end;
            if (sizeA.Text = '0') then
                clear;
        end;
    end;
end;

procedure TIlya.SizeBEditChange(Sender: TObject);
var
    i: Byte;
begin
    for i := 0 to 7 do
        SGB.Cells[i, 0] := '';
    for i := 0 to 15 do
        SGC.Cells[i, 0] := '';
    save.Enabled := false;
    SGB.Enabled := False;
    SetSizeB.Enabled := false;
    Calculate.Enabled := false;
    with Sender as TEdit do
    begin
        if (Length(Text) > 0) then
        begin
            SetSizeB.Enabled := true;
            if (StrToInt(SizeB.text) > 10) then
            begin
                MessageDlg('Error. The number you have entered is to high.', mtError, [mbRetry], 0);
                clear;
            end;
            if (sizeB.Text = '0') then
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
    Numerals := ['2'..'8', #8];
    with Sender as TEdit do
    begin
        if not (Key in Numerals) then
            Key := #0;
    end;
end;

procedure TIlya.CalculateClick(Sender: TObject);
const
    EmptyEr = 'Empty cells were filled with zeros.';
var
    Number, MissingAge: Integer;
    Grid, Grid2: TArray;
    I, Siz: Integer;
    Empty, Empt: Boolean;
begin
    Empty := False;
    Save.Enabled := True;
    Siz := StrToInt(SizeA.Text);
    SetLength(Grid, Siz);
    for I := 0 to Siz - 1 do
    begin
        if (SGA.Cells[I,0] = '') then
        begin
            Empty := true;
            SGA.Cells[I, 0] := '0';
        end;
        Grid[I] := strtoint(SGA.Cells[I, 0]);
    end;
    Empt := False;
    Save.Enabled := True;
    Siz := StrToInt(SizeB.Text);
    SetLength(Grid2, Siz);
    for I := 0 to Siz - 1 do
    begin
        if (SGB.Cells[I,0] = '') then
        begin
            Empt := true;
            SGB.Cells[I, 0] := '0';
        end;
        Grid2[I] := strtoint(SGB.Cells[I, 0]);
    end;
    if Empt or Empty then
        MessageDlg(EmptyEr, mtConfirmation, [mbOk], 0);
    GetArrayC(Grid, Grid2, Sender);
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
   SizeA.Clear;
   SizeB.Clear;
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
            SizeA.Text := IntToStr(temp);
            SetSizeAClick(Sender);
            I := 0;
            repeat
                read(inputFile, temp);
                SGA.Cells[I, 0] := IntToStr(temp);
                Inc(I);
            until EoLn(inputFile);
            read(inputFile, temp);
            SizeB.Text := IntToStr(temp);
            SetSizeBClick(Sender);
            I := 0;
            repeat
                read(inputFile, temp);
                SGB.Cells[I, 0] := IntToStr(temp);
                Inc(I);
            until EoLn(inputFile);
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
   ButtonSelected, i: byte;
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
            for I := 0 to 17 do
                write(outputFile, SGC.Cells[i, 0]);
            CloseFile(outputFile);
         end
         else
            SaveClick(Sender);
      end
      else
      begin
         AssignFile(outputFile, MyFile);
         Rewrite(outputFile);
         for I := 0 to 17 do
                write(outputFile, SGC.Cells[i, 0]);
         CloseFile(outputFile);
      end;
   end;
end;

procedure TIlya.SetSizeBClick(Sender: TObject);
begin
    SGB.Enabled := true;
    if ((SGA.Enabled) and (SGB.Enabled)) then
        Calculate.Enabled := true;
    SGB.ColCount := StrToInt(SizeB.Text);
end;

procedure TIlya.SetSizeAClick(Sender: TObject);
begin
    SGA.Enabled := true;
    if ((SGA.Enabled) and (SGB.Enabled)) then
        Calculate.Enabled := true;
    SGA.ColCount := StrToInt(SizeA.Text);
end;

procedure TIlya.SGAKeyPress(Sender: TObject; var Key: Char);
var
    Numerals: set of char;
    i: Byte;
begin
    for i := 0 to 15 do
        SGC.Cells[i, 0] := '';
    Save.Enabled := false;
    Numerals := ['0'..'9', #8];
    if not (Key in Numerals) then
        Key := #0;
    if (SGA.Cells[SGA.Col, SGA.Row] = '0') and (Key <> #8) then
        Key := #0;
    if (Length(SGA.Cells[SGA.Col, SGA.Row]) > 2) and (Key <> #8) then
        Key := #0;
end;

procedure TIlya.SGAKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    with Sender as TStringGrid do
        begin
            if (SGA.Cells[SGA.Col, SGA.Row] <> '') then
            begin
                if (StrToInt(SGA.Cells[SGA.Col, SGA.Row]) > 255) then
                begin
                    MessageDlg('Error. The number you have entered is to high.', mtError, [mbRetry], 0);
                    SGA.Cells[SGA.Col, SGA.Row] := '';
                end;
            end;
        end;
end;

procedure TIlya.SGBKeyPress(Sender: TObject; var Key: Char);
var
    Numerals: set of char;
    i: Byte;
begin
    for i := 0 to 15 do
        SGC.Cells[i, 0] := '';
    Save.Enabled := false;
    Numerals := ['0'..'9', #8];
    if not (Key in Numerals) then
        Key := #0;
    if (SGA.Cells[SGA.Col, SGA.Row] = '0') and (Key <> #8) then
        Key := #0;
    if (Length(SGA.Cells[SGA.Col, SGA.Row]) > 2) and (Key <> #8) then
        Key := #0;
end;

procedure TIlya.SGBKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    with Sender as TStringGrid do
        begin
            if (SGB.Cells[SGB.Col, SGB.Row] <> '') then
            begin
                if (StrToInt(SGB.Cells[SGB.Col, SGB.Row]) > 255) then
                begin
                    MessageDlg('Error. The number you have entered is to high.', mtError, [mbRetry], 0);
                    SGB.Cells[SGB.Col, SGB.Row] := '';
                end;
            end;
        end;
end;

end.
