unit Unit1;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls;

type
    TLab1_3 = class(TForm)
    MainMenu: TMainMenu;
    Fi1: TMenuItem;
    Open: TMenuItem;
    Save: TMenuItem;
    Help1: TMenuItem;
    Aboutprogram: TMenuItem;
    Aboutthedeveloper: TMenuItem;
    Calculate: TButton;
    Label1: TLabel;
    Result: TLabel;
    OpenFile: TOpenDialog;
    SaveFile: TSaveDialog;
    Nothing: TMenuItem;
    Exit: TMenuItem;
    Number: TEdit;
    PopupMenu: TPopupMenu;
    procedure AboutprogramClick(Sender: TObject);
    procedure AboutthedeveloperClick(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure NumberChange(Sender: TObject);
    procedure CalculateClick(Sender: TObject);
    procedure OpenClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure NumberKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Lab1_3: TLab1_3;

implementation

{$R *.dfm}

procedure TLab1_3.AboutprogramClick(Sender: TObject);
begin
    MessageDlg('This program calculates the square root of X.' + #13 + ' X should be in range 0..2147483647', mtInformation, [mbOk], 0);
end;

procedure TLab1_3.AboutthedeveloperClick(Sender: TObject);
begin
    MessageDlg('This program is developed by Ilya Androsov' + #13 + 'BSUIR 2018', mtInformation, [mbOk], 0);
end;

procedure TLab1_3.NumberChange(Sender: TObject);
var
    Temp: Integer;
begin
    Save.Enabled := false;
    Result.Caption := '';
    if (Length(Number.Text) > 0) then
    try
        Temp := StrToInt(Number.Text);
        Calculate.Enabled := true;
    except
        ShowMessage('Error. The number, you have entered, is to high.');
        Number.Clear;
        Calculate.Enabled := false;
    end
    else
       Calculate.Enabled := false;
end;

procedure TLab1_3.NumberKeyPress(Sender: TObject; var Key: Char);
var
    Numerals: set of char;
    I, DotPos: Byte;
    IsFind: Boolean;
begin
    Numerals := ['0'..'9', #8];
    with Sender as TEdit do
    begin
        if (Key = #13) and (Calculate.Enabled) then
            CalculateClick(Sender);
        if not (Key in Numerals) then
            Key := #0;
        if (Length(Text) = 10) and (Key <> #8) then
            Key := #0;
        if (Text = '0') and (Key <> #8) then
            Key := #0;
    end;
end;

procedure TLab1_3.CalculateClick(Sender: TObject);
var
    Num, Y, i: Real;
begin
    Num := StrToInt(Number.Text);
    Y := 1;
    while abs((Num + sqr(Y)) / (2 * Y) - Y) > 0.00001 do
        Y := (Num + sqr(Y)) / (2 * Y);
    Result.Caption := FloatToStr(Y);
    Save.Enabled := true;
end;

procedure TLab1_3.ExitClick(Sender: TObject);
var
   ButtonSelected: Byte;
begin
    Close;
end;

procedure TLab1_3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
    ButtonSelected: Byte;
begin
    ButtonSelected := MessageDlg('Are you sure you want to exit?', mtConfirmation, [mbYes,mbNo], 0);
    if ButtonSelected <> mrYes then
        CanClose := False;
end;

procedure TLab1_3.OpenClick(Sender: TObject);
var
   inputFile: TextFile;
   temp: double;
begin
   Number.Clear;
   Result.Caption := '';
   if OpenFile.Execute then
   begin
      try
         AssignFile(inputFile, OpenFile.FileName);
         Reset(inputFile);
         if SeekEof(inputFile) then
         begin
            MessageDlg('This file is empty. Try again.', mtError, [mbRetry], 0);
            Number.Clear;
            CloseFile(inputFile);
         end
         else
         begin
            readln(inputFile, temp);
            Number.Text := FloatToStr(temp);
            CalculateClick(Sender);
            CloseFile(inputFile);
         end;
      except
         MessageDlg('Check entered data. Try again.', mtError, [mbRetry], 0);
         Number.Clear;
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

procedure TLab1_3.SaveClick(Sender: TObject);
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

end.


