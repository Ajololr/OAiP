unit Lab_3_1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls;

type
  TIlya = class(TForm)
    EnterData: TLabel;
    FirstStr: TEdit;
    SecondStr: TEdit;
    Find: TButton;
    FirstUniqueStr: TLabel;
    SecondUniqueStr: TLabel;
    CommonStr: TLabel;
    PopupMenu: TPopupMenu;
    SaveFile: TSaveDialog;
    OpenFile: TOpenDialog;
    MainMenu: TMainMenu;
    File1: TMenuItem;
    Help: TMenuItem;
    Open: TMenuItem;
    Save: TMenuItem;
    N1: TMenuItem;
    Exit: TMenuItem;
    Abouttheprogram: TMenuItem;
    Aboutthedeveloper: TMenuItem;
    procedure FirstStrKeyPress(Sender: TObject; var Key: Char);
    procedure SecondStrKeyPress(Sender: TObject; var Key: Char);
    procedure FindClick(Sender: TObject);
    procedure AbouttheprogramClick(Sender: TObject);
    procedure AboutthedeveloperClick(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure OpenClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure SecondStrChange(Sender: TObject);
    procedure FirstStrChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
    Ilya: TIlya;

implementation

{$R *.dfm}

procedure TIlya.AboutthedeveloperClick(Sender: TObject);
begin
    MessageDlg('This program is developed by Ilya Androsov' + #13 + 'BSUIR 2018', mtInformation, [mbOk], 0);
end;

procedure TIlya.AbouttheprogramClick(Sender: TObject);
begin
    MessageDlg('This program finds characters occurring in both strings,' + #13 + 'finds characters found only in the first string, only in the second string.', mtInformation, [mbOk], 0);
end;

procedure TIlya.ExitClick(Sender: TObject);
begin
    Close;
end;

procedure CompareStrings(MyString, ThatString: String; var Common—haracters, MyUniqueString, ThatUniqueString: String);
var
    i, j, k: ShortInt;
begin
    j := 1;
    k := 1;
    for i := 1 to Length(MyString) do
        if (pos(MyString[i], ThatString) <> 0) and (pos(MyString[i], Common—haracters)
            = 0) then
        begin
            Insert(MyString[i], Common—haracters,j);
            Inc(j);
        end
        else
            if (pos(MyString[i], MyUniqueString) = 0) and (pos(MyString[i],
                Common—haracters) = 0) then
            begin
                Insert(MyString[i], MyUniqueString, k);
                Inc(k)
            end;
    j := 1;
    for i := 1 to Length(ThatString) do
        if (pos(ThatString[i], Common—haracters) = 0) and (pos(ThatString[i],
            ThatUniqueString) = 0) then
        begin
            Insert(ThatString[i], ThatUniqueString, j);
            Inc(j);
        end;
end;

procedure TIlya.FindClick(Sender: TObject);
var
    MyString, ThatString, Common—haracters, MyUniqueString, ThatUniqueString: String;
begin
    Save.Enabled := true;
    MyString := FirstStr.Text;
    ThatString := SecondStr.Text;
    CompareStrings(MyString, ThatString, Common—haracters, MyUniqueString, ThatUniqueString);
    if (Common—haracters = '') then
        CommonStr.Caption := 'There are no common characters.'
    else
        CommonStr.Caption := 'Common characters: ' + #13 +  Common—haracters;
    if (MyUniqueString = '') then
        FirstUniqueStr.Caption := 'There are no unique characters in the first string.'
    else
        FirstUniqueStr.Caption := 'Unique characters of the first string: ' + #13 +  MyUniqueString;
    if (ThatUniqueString = '') then
        SecondUniqueStr.Caption := 'There are no unique characters in the second string.'
    else
        SecondUniqueStr.Caption := 'Unique characters of the second string: ' + #13 +  ThatUniqueString;
end;

procedure TIlya.FirstStrChange(Sender: TObject);
begin
    if (Length(FirstStr.Text) <> 0) and (Length(SecondStr.Text) <> 0) then
        Find.Enabled := true
    else
        Find.Enabled := false;
end;

procedure TIlya.FirstStrKeyPress(Sender: TObject; var Key: Char);
begin
    Save.Enabled := false;
    CommonStr.Caption := '';
    FirstUniqueStr.Caption := '';
    SecondUniqueStr.Caption := '';
    if (Key = #3) or (Key = #22) or (Key = #24) then
        Key := #0;
    if (Length(FirstStr.Text) > 25) and (Key <> #8) then
        Key := #0;
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
    InputFile: TextFile;
    Temp: String;
begin
    CommonStr.Caption := '';
    FirstUniqueStr.Caption := '';
    SecondUniqueStr.Caption := '';
    if OpenFile.Execute then
    begin
        try
            AssignFile(InputFile, OpenFile.FileName);
            Reset(InputFile);
            if SeekEof(InputFile) then
            begin
                MessageDlg('This file is empty. Try again.', mtError, [mbRetry], 0);
                CloseFile(InputFile);
            end
            else
            begin
                ReadLn(InputFile, Temp);
                FirstStr.Text := Temp;
                ReadLn(InputFile, Temp);
                SecondStr.Text := Temp;
                FindClick(Sender);
                CloseFile(inputFile);
            end;
        except
            MessageDlg('Check entered data. Try again.', mtError, [mbRetry], 0);
            CloseFile(inputFile);
        end;
    end;
end;

function CheckFileName(MyFile: String): String;
var
   i: Byte;
   IsCorrect: Boolean;
begin
   IsCorrect := false;
   i := 1;
   while  not IsCorrect and (i <= Length(MyFile)) do
   begin
      if MyFile[i] = '.' then
         IsCorrect := true;
      Inc(i);
   end;
   if not IsCorrect then
      MyFile := MyFile + '.txt';
   CheckFileName := MyFile;
end;

procedure TIlya.SaveClick(Sender: TObject);
var
    OutputFile: TextFile;
    MyFile: string;
    ButtonSelected, i: byte;
begin
    if SaveFile.Execute then
    begin
        MyFile := SaveFile.FileName;
        MyFile := CheckFileName(MyFile);
        if FileExists(MyFile) then
        begin
            AssignFile(OutputFile, MyFile);
            ButtonSelected := MessageDlg('Do you want to rewrite the file?', mtConfirmation, [mbYes,mbNo], 0);
            if ButtonSelected = mrYes then
                Rewrite(OutputFile)
            else
            begin
                Append(OutputFile);
                WriteLn(OutputFile);
            end;
            WriteLn(OutputFile, CommonStr.Caption);
            WriteLn(OutputFile, FirstUniqueStr.Caption);
            Write(OutputFile, SecondUniqueStr.Caption);
            CloseFile(OutputFile);
        end;
    end;
end;

procedure TIlya.SecondStrChange(Sender: TObject);
begin
    if (Length(FirstStr.Text) <> 0) and (Length(SecondStr.Text) <> 0) then
        Find.Enabled := true
    else
        Find.Enabled := false;
end;

procedure TIlya.SecondStrKeyPress(Sender: TObject; var Key: Char);
begin
    Save.Enabled := false;
    CommonStr.Caption := '';
    FirstUniqueStr.Caption := '';
    SecondUniqueStr.Caption := '';
    if (Key = #3) or (Key = #22) or (Key = #24) then
        Key := #0;
    if (Length(SecondStr.Text) > 25) and (Key <> #8) then
        Key := #0;
end;

end.
