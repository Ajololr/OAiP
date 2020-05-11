unit Unit1;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls;

type
    TLab1_2 = class(TForm)
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
    Power: TEdit;
    PopupMenu: TPopupMenu;
    procedure AboutprogramClick(Sender: TObject);
    procedure AboutthedeveloperClick(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure PowerChange(Sender: TObject);
    procedure CalculateClick(Sender: TObject);
    procedure OpenClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PowerKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Lab1_2: TLab1_2;

implementation

{$R *.dfm}

procedure TLab1_2.AboutprogramClick(Sender: TObject);
begin
    MessageDlg('This program raises number 2 to the power of N.' + #13 + ' N should be in range 1..30', mtInformation, [mbOk], 0);
end;

procedure TLab1_2.AboutthedeveloperClick(Sender: TObject);
begin
    MessageDlg('This program is developed by Ilya Androsov' + #13 + 'BSUIR 2018', mtInformation, [mbOk], 0);
end;

procedure TLab1_2.PowerChange(Sender: TObject);
begin
    Save.Enabled := false;
    Result.Caption := '';
    if (Length(Power.Text) > 0) then
    begin
       Calculate.Enabled := true;
       if (StrToInt(Power.Text) > 30) then
       begin
           ShowMessage('Error. The number, you have entered, is to high.');
           Calculate.Enabled := false;
           Power.Clear;
       end;
    end
    else
       Calculate.Enabled := false;
end;

procedure TLab1_2.PowerKeyPress(Sender: TObject; var Key: Char);
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
        if (Length(Text) = 2) and (Key <> #8) then
            Key := #0;
        if (Text = '0') and (Key <> #8) then
            Key := #0;
    end;
end;

procedure TLab1_2.CalculateClick(Sender: TObject);
var
    Number, Answer, i: Integer;
begin
    Number := strtoint(Power.Text);
    Answer := 1;
    for i := 1 to Number do
        Answer := Answer * 2;
    Result.Caption := IntToStr(Answer);
    Save.Enabled := true;
end;

procedure TLab1_2.ExitClick(Sender: TObject);
var
   ButtonSelected: Byte;
begin
    Close;
end;

procedure TLab1_2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
    ButtonSelected: Byte;
begin
    ButtonSelected := MessageDlg('Are you sure you want to exit?', mtConfirmation, [mbYes,mbNo], 0);
    if ButtonSelected <> mrYes then
        CanClose := False;
end;

procedure TLab1_2.OpenClick(Sender: TObject);
var
   inputFile: TextFile;
   temp: double;
begin
   Power.Clear;
   Result.Caption := '';
   if OpenFile.Execute then
   begin
      try
         AssignFile(inputFile, OpenFile.FileName);
         Reset(inputFile);
         if SeekEof(inputFile) then
         begin
            MessageDlg('This file is empty. Try again.', mtError, [mbRetry], 0);
            Power.Clear;
            CloseFile(inputFile);
         end
         else
         begin
            readln(inputFile, temp);
            Power.Text := FloatToStr(temp);
            CalculateClick(Sender);
            CloseFile(inputFile);
         end;
      except
         MessageDlg('Check entered data. Try again.', mtError, [mbRetry], 0);
         Power.Clear;
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

procedure TLab1_2.SaveClick(Sender: TObject);
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
