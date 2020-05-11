unit ManageStudent;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin, Vcl.DBCtrls, Vcl.Grids;

type
    TManage = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    CancelBtn: TButton;
    SubmitBtn: TButton;
    Label6: TLabel;
    GC: TEdit;
    JN: TEdit;
    SaI: TEdit;
    Month: TEdit;
    Day: TEdit;
    Year: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Female: TCheckBox;
    Male: TCheckBox;
    procedure CancelBtnClick(Sender: TObject);
    procedure SubmitBtnClick(Sender: TObject);
    procedure GCKeyPress(Sender: TObject; var Key: Char);
    procedure OnChange(Sender: TObject);
    procedure JNKeyPress(Sender: TObject; var Key: Char);
    procedure SaIKeyPress(Sender: TObject; var Key: Char);
    procedure DayKeyPress(Sender: TObject; var Key: Char);
    procedure DayKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MonthKeyPress(Sender: TObject; var Key: Char);
    procedure MonthKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure YearKeyPress(Sender: TObject; var Key: Char);
    procedure YearKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FemaleClick(Sender: TObject);
    procedure MaleClick(Sender: TObject);
    procedure AddStudent(Sender: TObject);
    procedure EditStudent(Sender: TObject);
    procedure JNKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    end;

var
    Manage: TManage;

implementation

{$R *.dfm}

uses Students;

procedure TManage.CancelBtnClick(Sender: TObject);
begin
    GC.Clear;
    JN.Clear;
    SaI.Clear;
    Day.Clear;
    Month.Clear;
    Year.Clear;
    Female.Checked := false;
    Male.Checked := false;
    Close;
end;

procedure TManage.OnChange(Sender: TObject);
begin
    if (Length(GC.Text) > 0)
    and (Length(JN.Text) > 0)
    and (Length(SaI.Text) > 0)
    and (Length(Day.Text) = 2)
    and (Length(Month.Text) = 2)
    and (Length(Year.Text) = 4)
    and ((Male.Checked) or (Female.Checked))
    then
        SubmitBtn.Enabled := true
    else
        SubmitBtn.Enabled := false;
end;

procedure TManage.FemaleClick(Sender: TObject);
begin
    Male.Checked := false;
end;

procedure TManage.MaleClick(Sender: TObject);
begin
    Female.Checked := false;
end;

procedure TManage.DayKeyPress(Sender: TObject; var Key: Char);
var
    Numerals: set of Char;
begin
    Numerals := ['0'..'9', #8];
    with Day as TEdit do
    begin
        if not(Key in Numerals) then
            Key := #0;
        if (Length(Text) = 2) and (Key <> #8)then
            Key := #0;
    end;
end;

procedure TManage.DayKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    with Day as Tedit do
    begin
        if (Length(Text) = 2) and ((StrToInt(Text) > 31) or (StrToInt(Text) = 0)) then
            Text := '';
    end;
end;

procedure TManage.GCKeyPress(Sender: TObject; var Key: Char);
var
    Numerals: set of Char;
begin
    Numerals := ['0'..'9', #8];
    with GC as TEdit do
    begin
        if not(Key in Numerals) then
            Key := #0;
        if (Length(Text) = 6) and (Key <> #8)then
            Key := #0
    end;
end;

procedure TManage.JNKeyPress(Sender: TObject; var Key: Char);
var
    Numerals: set of Char;
begin
    Numerals := ['0'..'9', #8];
    with JN as TEdit do
    begin
        if not(Key in Numerals) then
            Key := #0;
        if (Length(Text) = 2) and (Key <> #8) then
            Key := #0;
        if (Length(Text) = 0) and (Key = '0') then
            Key := #0;
    end;
end;

procedure TManage.JNKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    with JN as Tedit do
        if (Text = '0') then
            Text := '';
end;

procedure TManage.MonthKeyPress(Sender: TObject; var Key: Char);
var
    Numerals: set of Char;
begin
    Numerals := ['0'..'9', #8];
    with Month as TEdit do
    begin
        if not(Key in Numerals) then
            Key := #0;
        if (Length(Text) = 2) and (Key <> #8)then
            Key := #0;
    end;
end;

procedure TManage.MonthKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    with Month as Tedit do
    begin
        if (Length(Text) = 2) and ((StrToInt(Text) > 12) or (StrToInt(Text) = 0)) then
            Text := '';
    end;
end;

procedure TManage.SaIKeyPress(Sender: TObject; var Key: Char);
var
    Letters: set of Char;
begin
    Letters := ['A'..'z', '.', '-', ' ', #8];
    with SaI as TEdit do
    begin
        if not(Key in Letters) then
            Key := #0;
        if (Length(Text) = 20) and (Key <> #8) then
            Key := #0
    end;
end;

procedure TManage.EditStudent(Sender: TObject);
begin
    with StartMenu as TStartMenu do
    begin
        DB[StudentsList.Row - 1].GroupCode := GC.Text;
        DB[StudentsList.Row - 1].JornalNumber := JN.Text;
        DB[StudentsList.Row - 1].Surname := SaI.Text;
        DB[StudentsList.Row - 1].DateOfBirth := Day.Text + '.' + Month.Text + '.' + Year.Text;
        if Female.Checked then
            DB[StudentsList.Row - 1].Gender := 'Female'
        else
            DB[StudentsList.Row - 1].Gender := 'Male';
        with StudentsList as TStringGrid do
        begin
            Cells[0, Row] := DB[Row - 1].GroupCode;
            Cells[1, Row] := DB[Row - 1].JornalNumber;
            Cells[2, Row] := DB[Row - 1].Surname;
            Cells[3, Row] := DB[Row - 1].DateOfBirth;
            Cells[4, Row] := DB[Row - 1].Gender;
        end;
    end;
end;

procedure TManage.AddStudent(Sender: TObject);
begin
    with StartMenu as TStartMenu do
    begin
        SetLength(DB, Length(DB) + 1);
        DB[High(DB)].GroupCode := GC.Text;
        DB[High(DB)].JornalNumber := JN.Text;
        DB[High(DB)].Surname := SaI.Text;
        DB[High(DB)].DateOfBirth := Day.Text + '.' + Month.Text + '.' + Year.Text;
        if Female.Checked then
            DB[High(DB)].Gender := 'Female'
        else
            DB[High(DB)].Gender := 'Male';
        with StudentsList as TStringGrid do
        begin
            RowCount := RowCount + 1;
            Cells[0, Length(DB)] := DB[High(DB)].GroupCode;
            Cells[1, Length(DB)] := DB[High(DB)].JornalNumber;
            Cells[2, Length(DB)] := DB[High(DB)].Surname;
            Cells[3, Length(DB)] := DB[High(DB)].DateOfBirth;
            Cells[4, Length(DB)] := DB[High(DB)].Gender;
        end;
    end;
    StartMenu.Save.Enabled := true;
end;

procedure TManage.SubmitBtnClick(Sender: TObject);
begin
    if Caption = 'Add student' then
        AddStudent(Sender)
    else
        EditStudent(Sender);
    GC.Clear;
    JN.Clear;
    SaI.Clear;
    Day.Clear;
    Month.Clear;
    Year.Clear;
    Female.Checked := false;
    Male.Checked := false;
    with StartMenu as TStartMenu do
    begin
        Save.Enabled := true;
        EditBtn.Enabled := true;
        DeleteBtn.Enabled := true;
        if (StudentsList.RowCount > 2) then
            SortBtn.Enabled := true
        else
            SortBtn.Enabled := false;
    end;
    Close;
end;

procedure TManage.YearKeyPress(Sender: TObject; var Key: Char);
var
    Numerals: set of Char;
begin
    Numerals := ['0'..'9', #8];
    with Year as TEdit do
    begin
        if not(Key in Numerals) then
            Key := #0;
        if (Length(Text) = 4) and (Key <> #8)then
            Key := #0;
    end;
end;

procedure TManage.YearKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    with Year as Tedit do
        if (Length(Text) = 4) and ((StrToInt(Text) > 2013) or (StrToInt(Text) < 1919)) then
            Text := '';
end;

end.
