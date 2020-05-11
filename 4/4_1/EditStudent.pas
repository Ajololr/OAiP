unit EditStudent;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin, Vcl.DBCtrls, Vcl.Grids;

type
    TEditStd = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    CancelBtn: TButton;
    SubmitBtn: TButton;
    GC: TEdit;
    JN: TEdit;
    SaI: TEdit;
    Month: TEdit;
    Day: TEdit;
    Year: TEdit;
    Female: TCheckBox;
    Male: TCheckBox;
    procedure SubmitBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure OnChange(Sender: TObject);
    end;

var
  EditStd: TEditStd;

implementation

{$R *.dfm}

uses Students;

procedure TEditStd.CancelBtnClick(Sender: TObject);
begin
    with StartMenu as TStartMenu do
    begin
        GC.Clear;
        JN.Clear;
        SaI.Clear;
        Day.Clear;
        Month.Clear;
        Year.Clear;
        Female.Checked := false;
        Male.Checked := false;
    end;
    EditStd.Close;
end;

procedure TEditStd.OnChange(Sender: TObject);
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

procedure TEditStd.SubmitBtnClick(Sender: TObject);
var i: Byte;
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
        GC.Clear;
        JN.Clear;
        SaI.Clear;
        Day.Clear;
        Month.Clear;
        Year.Clear;
        Female.Checked := false;
        Male.Checked := false;
    end;
    with StartMenu as TStartMenu do
        with StudentsList as TStringGrid do
        begin
            Cells[0, Row] := DB[Row - 1].GroupCode;
            Cells[1, Row] := DB[Row - 1].JornalNumber;
            Cells[2, Row] := DB[Row - 1].Surname;
            Cells[3, Row] := DB[Row - 1].DateOfBirth;
            Cells[4, Row] := DB[Row - 1].Gender;
        end;
    EditStd.Close;
end;

end.
