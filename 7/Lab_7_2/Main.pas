unit Main;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Grids, Vcl.StdCtrls;

type
    TIlya = class(TForm)
    SG: TStringGrid;
        MainMenu: TMainMenu;
    OpenFile: TOpenDialog;
        PopupMenu: TPopupMenu;
        FileMenu: TMenuItem;
        Open: TMenuItem;
        N: TMenuItem;
        Exit: TMenuItem;
        Help: TMenuItem;
        AboutTheProgram: TMenuItem;
        AboutTheDeveloper: TMenuItem;
        TransformBtn: TButton;
        SetSizeBtn: TButton;
        SetSizeLbl: TLabel;
        SizeEdit: TEdit;
        procedure AboutTheProgramClick(Sender: TObject);
        procedure AboutTheDeveloperClick(Sender: TObject);
        procedure OpenClick(Sender: TObject);
        procedure ExitClick(Sender: TObject);
        procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
        procedure SGKeyPress(Sender: TObject; var Key: Char);
        procedure FormCreate(Sender: TObject);
        procedure TransformBtnClick(Sender: TObject);
        procedure SizeEditChange(Sender: TObject);
        procedure SizeEditKeyPress(Sender: TObject; var Key: Char);
        procedure SetSizeBtnClick(Sender: TObject);
  end;

var
    Ilya: TIlya;

implementation

{$R *.dfm}

uses List;

procedure TIlya.AboutTheDeveloperClick(Sender: TObject);
begin
    MessageDlg('This program is developed by Ilya Androsov' + #13#10 + 'BSUIR 2019', mtInformation, [mbOk], 0);
end;

procedure TIlya.AboutTheProgramClick(Sender: TObject);
begin
    MessageDlg('This program converts an adjacency matrix to an incidence list.', mtInformation, [mbOk], 0);
end;

procedure TIlya.TransformBtnClick(Sender: TObject);
var
    i, j, k: ShortInt;
    IsEmpty: Boolean;
begin
    IsEmpty := false;
    for j := 1 to SG.RowCount - 1 do
        for i := 1 to SG.ColCount - 1 do
            if (SG.Cells[i, j] = '') then
            begin
                IsEmpty := true;
                SG.Cells[i, j] := '0';
            end;
    if IsEmpty then
        MessageDlg('Empty cells were filled with zeros.', mtConfirmation, [mbOk], 0);
    for j := 1 to SG.RowCount do
    begin
        k := 1;
        for i := 1 to SG.ColCount do
            if (SG.Cells[i, j] = '1') then
            begin
                ListForm.ListSG.Cells[k, j - 1] := '->';
                ListForm.ListSG.Cells[k + 1, j - 1] := IntToStr(i);
                Inc(k, 2);
            end;
        ListForm.ListSG.Cells[k, j - 1] := '->';
        ListForm.ListSG.Cells[k + 1, j - 1] := 'nil';
    end;
    ListForm.ShowModal;
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

procedure TIlya.FormCreate(Sender: TObject);
var
    i: ShortInt;
begin
    for i := 1 to 9 do
    begin
        SG.Cells[0, i] := IntToStr(i);
        SG.Cells[i, 0] := IntToStr(i);
    end;
    SG.FixedCols := 1;
    SG.FixedRows := 1;
end;

procedure TIlya.OpenClick(Sender: TObject);
var
    InputFile: TextFile;
    i, j, Temp: ShortInt;
    IsCorrect: Boolean;
begin
    if OpenFile.Execute then
    begin
        SizeEdit.Text := '';
        try
            AssignFile(InputFile, OpenFile.FileName);
            Reset(InputFile);
            if EoF(InputFile) then
            begin
                MessageDlg('This file is empty. Try again.', mtError, [mbRetry], 0);
                CloseFile(InputFile);
            end
            else
            begin
                repeat
                    Read(InputFile, Temp);
                    if (Temp <> 0) and (Temp <> 1) then
                        IsCorrect := false
                until EoF(InputFile) or not(IsCorrect);
                if IsCorrect then
                begin
                    Reset(InputFile);
                    i := 0;
                    repeat
                        Read(InputFile, j);
                        Inc(i);
                    until EoLn(InputFile);
                    SizeEdit.Text := IntToStr(i);
                    SetSizeBtn.Click;
                    Reset(InputFile);
                    for j := 1 to SG.RowCount - 1 do
                        for i := 1 to SG.ColCount - 1 do
                        begin
                            Read(InputFile, Temp);
                            SG.Cells[i, j] := IntToStr(Temp);
                        end;
                    TransformBtn.Click;
                    CloseFile(InputFile);
                end
                else
                begin
                    MessageDlg('Check entered data. Try again.', mtError, [mbRetry], 0);
                    CloseFile(InputFile);
                end;
            end;
        except
            MessageDlg('Check entered data. Try again.', mtError, [mbRetry], 0);
            CloseFile(InputFile);
        end;
    end;
end;

procedure TIlya.SetSizeBtnClick(Sender: TObject);
begin
    SG.ColCount := StrToInt(SizeEdit.Text) + 1;
    SG.RowCount := SG.ColCount;
    ListForm.ListSG.ColCount := StrToInt(SizeEdit.Text) * 2 + 3;
    ListForm.ListSG.RowCount := StrToInt(SizeEdit.Text);
    ListForm.ClientHeight := 33 * ListForm.ListSG.RowCount;
    ListForm.ClientWidth := 33 * ListForm.ListSG.ColCount;
    SetSizeBtn.Enabled := false;
    SG.Enabled := true;
    TransformBtn.Enabled := true;
end;

procedure TIlya.SGKeyPress(Sender: TObject; var Key: Char);
begin
    if (Length(SG.Cells[SG.Col, SG.Row]) = 1) and (Key <> #8) then
        Key := #0;
    if (Key <> '0') and (Key <> '1') and (Key <> #8) then
        Key := #0;
end;

procedure TIlya.SizeEditChange(Sender: TObject);
var
    i, j: ShortInt;
begin
    TransformBtn.Enabled := false;
    SG.Enabled := false;
    for j := 1 to SG.RowCount - 1 do
        for i := 1 to SG.ColCount - 1 do
            SG.Cells[i, j] := '';
    if Length(SizeEdit.Text) = 1 then
        SetSizeBtn.Enabled := true
    else
        SetSizeBtn.Enabled := false;
end;

procedure TIlya.SizeEditKeyPress(Sender: TObject; var Key: Char);
var
    Numerals: set of char;
begin
    Numerals := ['2'..'9', #8];
    if not (Key in Numerals) then
        Key := #0;
    if (Length(SizeEdit.Text) = 1) and (Key <> #8) then
        Key := #0;
end;
end.
