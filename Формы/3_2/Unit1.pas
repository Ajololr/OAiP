unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls;

const
    ThatSet = ['+', '-', '*', '/','.',',',':',';','!','?','0'..'9'];

type
    TMySet = set of Char;
    TIlya = class(TForm)
    EnterData: TLabel;
    FirstStr: TEdit;
    Result: TLabel;
    SaveFile: TSaveDialog;
    OpenFile: TOpenDialog;
    PopupMenu: TPopupMenu;
    MainMenu: TMainMenu;
    Find: TButton;
    File1: TMenuItem;
    Help1: TMenuItem;
    Open: TMenuItem;
    Save: TMenuItem;
    N1: TMenuItem;
    Exit: TMenuItem;
    Abouttheprogram: TMenuItem;
    Aboutthedeveloper: TMenuItem;
    procedure FindClick(Sender: TObject);
    procedure AbouttheprogramClick(Sender: TObject);
    procedure AboutthedeveloperClick(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure OpenClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure FirstStrChange(Sender: TObject);
    procedure FirstStrKeyPress(Sender: TObject; var Key: Char);
    procedure GetMySet(Sender: TObject; MyString: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ilya: TIlya;

implementation

{$R *.dfm}

procedure TIlya.FirstStrKeyPress(Sender: TObject; var Key: Char);
begin
    Save.Enabled := false;
    Result.Caption := '';
    if (Key = #3) or (Key = #22) or (Key = #24) then
        Key := #0;
    if (Length(FirstStr.Text) > 24) and (Key <> #8) then
        Key := #0;
    if (Length(FirstStr.Text) <> 0) and (Key = #13) then
        FindClick(Sender);
end;

procedure TIlya.FirstStrChange(Sender: TObject);
begin
    if (Length(FirstStr.Text) <> 0) then
        Find.Enabled := true
    else
        Find.Enabled := false;
end;

procedure TIlya.AboutthedeveloperClick(Sender: TObject);
begin
    MessageDlg('This program is developed by Ilya Androsov' + #13 + 'BSUIR 2018', mtInformation, [mbOk], 0);
end;

procedure TIlya.AbouttheprogramClick(Sender: TObject);
begin
    MessageDlg('This program makes up a set which elements are occurring in the sequence ' + #13 + 'in a row of arithmetic operations, punctuation signs and numbers.', mtInformation, [mbOk], 0);
end;

procedure TIlya.ExitClick(Sender: TObject);
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

procedure TIlya.GetMySet(Sender: TObject; MyString: String);
var
    MySet: TMySet;
    i, j: Byte;
begin
    MySet := [];
    for i := 1 to Length(MyString) do
        if (MyString[i] in ThatSet) then
            MySet := MySet + [MyString[i]];
    if MySet = [] then
        Result.Caption := 'There are no such signs.'
    else
    begin
        Result.Caption := 'The needed set was found:' + #13;
        for j := 0 to 255 do
            if chr(j) in MySet then
                Result.Caption := Result.Caption + (chr(j));
    end;
end;


procedure TIlya.FindClick(Sender: TObject);
var
    MyString, ThatString, Common—haracters, MyUniqueString, ThatUniqueString: String;
begin
    Save.Enabled := true;
    MyString := FirstStr.Text;
    GetMySet(Sender, MyString);
end;

procedure TIlya.OpenClick(Sender: TObject);
var
    InputFile: TextFile;
    Temp: String;
begin
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
            Write(OutputFile, Result.Caption);
            CloseFile(OutputFile);
        end;
    end;
end;

end.
