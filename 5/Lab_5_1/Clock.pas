unit Clock;

interface

uses
    System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.Ani, FMX.Menus, FMX.Controls.Presentation, FMX.StdCtrls, DateUtils, MMSystem, Vcl.Dialogs;

type
    TIlya = class(TForm)
        SecondsLine: TLine;
        SecondsAnimation: TFloatAnimation;
        PopupMenu: TPopupMenu;
        Circle: TCircle;
        MinutesLine: TLine;
        HoursLine: TLine;
        MinutesAnimation: TFloatAnimation;
        HoursAnimation: TFloatAnimation;
        Image: TImage;
        Timer: TTimer;
        MainMenu: TMainMenu;
        Help: TMenuItem;
        AboutTheProgram: TMenuItem;
        AboutTheDeveloper: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure AboutTheProgramClick(Sender: TObject);
    procedure AboutTheDeveloperClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    end;

var
    Ilya: TIlya;

implementation

{$R *.fmx}

procedure TIlya.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
    ButtonSelected: Byte;
begin
    ButtonSelected := MessageDlg('Are you sure you want to exit?', mtConfirmation, [mbYes,mbNo], 0);
    if ButtonSelected <> mrYes then
        CanClose := False;
end;

procedure TIlya.FormCreate(Sender: TObject);
begin
    SecondsAnimation.StartValue := SecondOf(Now) * 6;
    SecondsAnimation.StopValue := SecondOf(Now) * 6 + 360;
    MinutesAnimation.StartValue := MinuteOf(Now) * 6;
    MinutesAnimation.StopValue := MinuteOf(Now) * 6 + 360;
    HoursAnimation.StartValue := HourOf(Now) * 30 + MinuteOf(Now) / 60 * 30 ;
    HoursAnimation.StopValue := HourOf(Now) * 30 + 360;
end;

procedure TIlya.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
    if ((Key = 13) and (SecondsAnimation.Pause))  then
    begin
        SecondsAnimation.Pause := false;
        MinutesAnimation.Pause := false;
        HoursAnimation.Pause := false;
        Timer.Enabled := true;
    end
    else
        if ((Key = 13) and not(SecondsAnimation.Pause)) then
        begin
            SecondsAnimation.Pause := true;
            MinutesAnimation.Pause := true;
            HoursAnimation.Pause := true;
            Timer.Enabled := false;
        end;
end;

procedure TIlya.AboutTheDeveloperClick(Sender: TObject);
begin
    MessageDlg('This program is developed by Ilya Androsov' + #13#10 + 'BSUIR 2019', mtConfirmation, [mbOk], 0);
end;

procedure TIlya.AboutTheProgramClick(Sender: TObject);
begin
    MessageDlg('This program is a clock.' + #13#10 + 'Button ''Enter'' pauses the clock.', mtConfirmation, [mbOk], 0);
end;

procedure TIlya.TimerTimer(Sender: TObject);
begin
    PlaySound(PChar('D:\Projects\2 ÒÂÏ\À‡·˚ Œ¿Ëœ\5\Lab_5_1\02612.wav'), 0, SND_ASYNC);
end;

end.
