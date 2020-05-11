unit Unit1;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls;

type
    TLab1_1 = class(TForm)
    MainMenu: TMainMenu;
    Fi1: TMenuItem;
    Open: TMenuItem;
    Save: TMenuItem;
    Help1: TMenuItem;
    Aboutprogram: TMenuItem;
    Aboutthedeveloper: TMenuItem;
    Check: TButton;
    Label1: TLabel;
    Result: TLabel;
    OpenFile: TOpenDialog;
    SaveFile: TSaveDialog;
    Nothing: TMenuItem;
    Exit: TMenuItem;
    Age: TEdit;
    PopupMenu: TPopupMenu;
    procedure AboutprogramClick(Sender: TObject);
    procedure AboutthedeveloperClick(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure AgeChange(Sender: TObject);
    procedure CheckClick(Sender: TObject);
    procedure OpenClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure AgeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Lab1_1: TLab1_1;

implementation

{$R *.dfm}

procedure TLab1_1.AboutprogramClick(Sender: TObject);
begin
    MessageDlg('This program determines whether you can vote or not based on your age.', mtInformation, [mbOk], 0);
end;

procedure TLab1_1.AboutthedeveloperClick(Sender: TObject);
begin
    MessageDlg('This program is developed by Ilya Androsov' + #13 + 'BSUIR 2018', mtInformation, [mbOk], 0);
end;

procedure TLab1_1.AgeChange(Sender: TObject);
begin
    with sender as TEdit do
    begin
        if ((Length(Text)<> 0) and (Text[1] = '0')) then
            Text := '';
        Save.Enabled := false;
        Result.Caption := '';
        if (Length(Text) > 0) then
           Check.Enabled := true
        else
           Check.Enabled := false;
    end;
end;

procedure TLab1_1.AgeKeyPress(Sender: TObject; var Key: Char);
var
    Numerals: set of char;
    I, DotPos: Byte;
    IsFind: Boolean;
begin
    Numerals := ['0'..'9', #8];
    with Sender as TEdit do
    begin
        if (Key = #13) and (Check.Enabled) then
            CheckClick(Sender);
        if not (Key in Numerals) then
            Key := #0;
        if (Length(Text) = 3) and (Key <> #8) then
            Key := #0;
        if (Length(Text) = 0) and (Key = '0') then
            Key := #0;
    end;
end;

procedure TLab1_1.CheckClick(Sender: TObject);
var
    Number, MissingAge: Integer;
begin
    Number := strtoint(Age.Text);
    if (Number > 17) then
        if (Number < 150) then
            Result.Caption := 'You are allowed to vote.'
        else
            Result.Caption := 'You can''t physically vote.'
    else
    begin
       MissingAge := 18 - Number;
       Result.Caption := 'You will be allowed to vote' + #13 + 'in ' + IntToStr(MissingAge) + ' years.';
    end;
    Save.Enabled := true;
end;

procedure TLab1_1.ExitClick(Sender: TObject);
var
   ButtonSelected: Byte;
begin
    Close;
end;

procedure TLab1_1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
    ButtonSelected: Byte;
begin
    ButtonSelected := MessageDlg('Are you sure you want to exit?', mtConfirmation, [mbYes,mbNo], 0);
    if ButtonSelected <> mrYes then
        CanClose := False;
end;

procedure TLab1_1.OpenClick(Sender: TObject);
var
   inputFile: TextFile;
   temp: double;
begin
   Age.Clear;
   Result.Caption := '';
   if OpenFile.Execute then
   begin
      try
         AssignFile(inputFile, OpenFile.FileName);
         Reset(inputFile);
         if SeekEof(inputFile) then
         begin
            MessageDlg('This file is empty. Try again.', mtError, [mbRetry], 0);
            Age.Clear;
            CloseFile(inputFile);
         end
         else
         begin
            readln(inputFile, temp);
            Age.Text := FloatToStr(temp);
            checkClick(Sender);
            CloseFile(inputFile);
         end;
      except
         MessageDlg('Check entered data. Try again.', mtError, [mbRetry], 0);
         Age.Clear;
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

procedure TLab1_1.SaveClick(Sender: TObject);
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
