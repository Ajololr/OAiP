unit List;

interface

uses
      Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
      Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.Menus;

type
    TListForm = class(TForm)
        ListSG: TStringGrid;
        PopupMenu: TPopupMenu;
        MainMenu: TMainMenu;
    SaveFile: TSaveDialog;
        FileMenu: TMenuItem;
        Save1: TMenuItem;
        N: TMenuItem;
        Exit: TMenuItem;
        procedure FormCreate(Sender: TObject);
        procedure ExitClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Save1Click(Sender: TObject);
    end;

var
    ListForm: TListForm;

implementation

{$R *.dfm}

procedure TListForm.ExitClick(Sender: TObject);
begin
    Close;
end;

procedure TListForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
    i, j: ShortInt;
begin
    for j := 0 to ListSG.RowCount - 1 do
        for i := 1 to ListSG.ColCount - 1 do
            ListSG.Cells[i, j] := '';
end;

procedure TListForm.FormCreate(Sender: TObject);
var
    i: ShortInt;
begin
    for i := 1 to 9 do
        ListSG.Cells[0, i - 1] := IntToStr(i);
    ListSG.FixedCols := 1;
end;

procedure TListForm.Save1Click(Sender: TObject);
var
    OutputFile: TextFile;
    MyFile: String;
    ButtonSelected , i, j: byte;
begin
    if SaveFile.Execute then
    begin
        MyFile := SaveFile.FileName;
        if FileExists(MyFile) then
        begin
            ButtonSelected := MessageDlg('Do you want to rewrite the file?', mtConfirmation, [mbYes,mbNo], 0);
            AssignFile(OutputFile, MyFile);
            if ButtonSelected = MrYes then
                Rewrite(OutputFile)
            else
            begin
                Append(outputFile);
                WriteLn(OutputFile);
            end;
            for j := 0 to ListSG.RowCount - 1 do
            begin
                for i := 1 to ListSG.ColCount - 1 do
                    Write(OutputFile, ListSG.Cells[i, j]);
                WriteLn(OutputFile);
            end;
            CloseFile(OutputFile);
        end;
    end;
end;

end.
