unit Graph;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls;

type
    TGraphForm = class(TForm)
        PopupMenu: TPopupMenu;
        MainMenu: TMainMenu;
        FileMenu: TMenuItem;
        Save: TMenuItem;
        N: TMenuItem;
        Exit: TMenuItem;
        SaveFile: TSaveDialog;
        SearchBtn: TButton;
        ResultLbl: TLabel;
        ValueEdit: TEdit;
        procedure FormPaint(Sender: TObject);
        procedure SearchBtnClick(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure ExitClick(Sender: TObject);
        procedure SaveClick(Sender: TObject);
        procedure ValueEditChange(Sender: TObject);
        procedure ValueEditKeyPress(Sender: TObject; var Key: Char);
  end;

var
    GraphForm: TGraphForm;
    VertexArray: array of Boolean;
    Angle: Real;

implementation

{$R *.dfm}

uses Main, VertexQueue;

procedure TGraphForm.ExitClick(Sender: TObject);
begin
    Close;
end;

procedure TGraphForm.FormPaint(Sender: TObject);
var
    i, j: ShortInt;
begin
    Angle := 2 * Pi / (MainForm.SG.ColCount - 1);
    Canvas.Pen.Color := RGB(0, 0, 0);
    for i := 1 to MainForm.SG.ColCount - 1 do
        for j := 1 to MainForm.SG.ColCount - 1 do
            if MainForm.SG.Cells[j, i] = '1' then
            begin
                Canvas.MoveTo(Trunc(Cos(Angle * i) * 120 + 175), Trunc(Sin(Angle * i) * 120 + 168));
                Canvas.LineTo(Trunc(Cos(Angle * j) * 120 + 175), Trunc(Sin(Angle * j) * 120 + 168));
            end;
    for i := 1 to MainForm.SG.ColCount - 1 do
    begin
        Canvas.Brush.Color := RGB(Random(256), Random(256), Random(256));
        Canvas.Ellipse(Trunc(Cos(Angle * i) * 120 + 200), Trunc(Sin(Angle * i) * 120 + 200), Trunc(Cos(Angle * i) * 120 + 160), Trunc(Sin(Angle * i) * 120 + 160));
        Canvas.Font.Size := 14;
        Canvas.TextOut (Trunc(Cos(Angle * i) * 120 + 175), Trunc(Sin(Angle * i) * 120 + 168), IntToStr(i));
    end;
end;

procedure TGraphForm.FormShow(Sender: TObject);
var
    i: ShortInt;
begin
    ValueEdit.Text := '';
    ValueEdit.Enabled := true;
    Save.Enabled := false;
    ResultLbl.Caption := '';
    SearchBtn.Enabled := false;
    SetLength(VertexArray, MainForm.SG.ColCount - 1);
    for i := 0 to High(VertexArray) do
        VertexArray[i] := false;
end;

procedure TGraphForm.SaveClick(Sender: TObject);
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
            Write(OutputFile, ResultLbl.Caption);
            CloseFile(OutputFile);
        end;
    end;
end;

procedure TGraphForm.SearchBtnClick(Sender: TObject);
var
    MyQueue: TMyQueue;
    Item, i, j: ShortInt;
begin
    ValueEdit.Enabled := false;
    Save.Enabled := true;
    SearchBtn.Enabled := false;
    ResultLbl.Caption := 'The path is: ';
    MyQueue := TMyQueue.Create;
    MyQueue.Enqueue(StrToInt(ValueEdit.Text));
    VertexArray[StrToInt(ValueEdit.Text) - 1] := true;
    Repeat
        i := MyQueue.Dequeue;
        ResultLbl.Caption := ResultLbl.Caption + IntToStr(i) + ' ';
        Canvas.Brush.Color := RGB(255, 255, 255);
        Canvas.Ellipse(Trunc(Cos(Angle * i) * 120 + 200), Trunc(Sin(Angle * i) * 120 + 200), Trunc(Cos(Angle * i) * 120 + 160), Trunc(Sin(Angle * i) * 120 + 160));
        Canvas.Font.Size := 14;
        Canvas.TextOut (Trunc(Cos(Angle * i) * 120 + 175), Trunc(Sin(Angle * i) * 120 + 168), IntToStr(i));
        for j := 1 to MainForm.SG.ColCount do
            if (MainForm.SG.Cells[j, i] = '1') and (not(VertexArray[j - 1])) then
            begin
                MyQueue.Enqueue(j);
                VertexArray[j - 1] := true;
            end;
        sleep(500);
    Until MyQueue.IsEmpty;
    MyQueue.Destroy;
end;

procedure TGraphForm.ValueEditChange(Sender: TObject);
var
    i, j: ShortInt;
begin
    SearchBtn.Enabled := false;
    Save.Enabled := false;
    ResultLbl.Caption := '';
    if Length(ValueEdit.Text) = 1 then
        SearchBtn.Enabled := true
    else
        SearchBtn.Enabled := false;
end;

procedure TGraphForm.ValueEditKeyPress(Sender: TObject; var Key: Char);
var
    Numerals: set of char;
    i: ShortInt;
begin
    Numerals := [#8];
    for i := 1 to MainForm.SG.ColCount - 1 do
        Include(Numerals, AnsiChar(i + 48));
    if not (Key in Numerals) then
        Key := #0;
    if (Length(ValueEdit.Text) = 1) and (Key <> #8) then
        Key := #0;
end;

end.
