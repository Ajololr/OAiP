unit Main;

interface

uses
    System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
    FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Menus, FMX.Edit, Queue, FMX.Ani, VCL.Dialogs;

type
    TIlya = class(TForm)
        PopupMenu: TPopupMenu;
        MainMenu: TMainMenu;
        DequeueBtn: TButton;
        TheMachine: TImage;
        EnqueueBtn: TButton;
        InputLuggage: TImage;
        OutputLuggage: TImage;
        LuggageEdit: TEdit;
        StartBtn: TButton;
        InputLuggageAnimation: TFloatAnimation;
        EnqueueLbl: TLabel;
        OutputLuggageAnimation: TFloatAnimation;
        OutputLbl: TLabel;
        About: TMenuItem;
        ShowTheQueue: TMenuItem;
        AboutTheDeveloper: TMenuItem;
        AboutTheProgram: TMenuItem;
        procedure StartBtnClick(Sender: TObject);
        procedure EnqueueBtnClick(Sender: TObject);
        procedure DequeueBtnClick(Sender: TObject);
        procedure LuggageEditKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure InputLuggageAnimationFinish(Sender: TObject);
    procedure ShowTheQueueClick(Sender: TObject);
    procedure AboutTheDeveloperClick(Sender: TObject);
    procedure AboutTheProgramClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    Ilya: TIlya;
    LuggageQueue: TMyQueue;
    Count: ShortInt = 0;

implementation

{$R *.fmx}

procedure TIlya.AboutTheDeveloperClick(Sender: TObject);
begin
    MessageDlg('This program is developed by Ilya Androsov' + #13#10 + 'BSUIR 2019', mtConfirmation, [mbOk], 0);
end;

procedure TIlya.AboutTheProgramClick(Sender: TObject);
begin
    MessageDlg('This program is a clock.' + #13#10 + 'Button ''Enter'' pauses the clock.', mtConfirmation, [mbOk], 0);
end;

procedure TIlya.DequeueBtnClick(Sender: TObject);
begin
    OutputLuggageAnimation.Enabled := false;
    OutputLuggage.Position.X := 352;
    OutputLuggage.Position.Y := 79;
    OutputLbl.Text := LuggageQueue.Dequeue;
    OutputLuggage.Visible := true;
    OutputLuggageAnimation.Enabled := true;
    Dec(Count);
    if Count = 0 then
    begin
        DequeueBtn.Enabled := false;
        ShowTheQueue.Enabled := false;
    end;
end;

procedure TIlya.EnqueueBtnClick(Sender: TObject);
begin
    LuggageQueue.Enqueue(LuggageEdit.Text);
    EnqueueLbl.Text := LuggageEdit.Text;
    LuggageEdit.Text := '';
    InputLuggageAnimation.Enabled := true;
    EnqueueBtn.Enabled := false;
    LuggageEdit.Enabled := false;
    Inc(Count);
    DequeueBtn.Enabled := true;
    ShowTheQueue.Enabled := true;
end;

procedure TIlya.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
    ButtonSelected: Byte;
begin
    ButtonSelected := MessageDlg('Are you sure you want to exit?', mtConfirmation, [mbYes,mbNo], 0);
    if ButtonSelected <> mrYes then
        CanClose := False;
end;

procedure TIlya.InputLuggageAnimationFinish(Sender: TObject);
begin
    InputLuggage.Position.X := 32;
    InputLuggage.Position.Y := 79;
    LuggageEdit.Enabled := true;
    InputLuggageAnimation.Enabled := false;
    EnqueueLbl.Text := '';
end;

procedure TIlya.LuggageEditKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
    if Length(LuggageEdit.Text) > 0 then
        EnqueueBtn.Enabled := true
    else
        EnqueueBtn.Enabled := false;
    OutputLuggage.Visible := false;
end;

procedure TIlya.ShowTheQueueClick(Sender: TObject);
var
    Temp, Text: String;
    i: Byte;
begin
    Text := '';
    for i := 1 to Count do
    begin
        Temp := LuggageQueue.Dequeue;
        Text := Text + IntToStr(i) + '. ' + Temp + #13#10;
        LuggageQueue.Enqueue(Temp);
    end;
    MessageDlg(Text, mtConfirmation, [mbOk], 0);
end;

procedure TIlya.StartBtnClick(Sender: TObject);
begin
    LuggageQueue := TMyQueue.Create;
    LuggageEdit.Enabled := true;
    StartBtn.Enabled := false;
end;

end.
