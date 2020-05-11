unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TGrafic = class(TForm)
    Image1: TImage;
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Grafic: TGrafic;

implementation

{$R *.dfm}

procedure TGrafic.FormPaint(Sender: TObject);
const
   x1 = -10;
   x2 = 10;
   mash = 50;
var
   x0, y0, i, j, Numb: integer;
   x, y: real;
begin
   //Numb := StrToInt(Num.Text);
   with Image1 do
   begin
      x0 := width div 2;
      y0 := height div 2;
      with Canvas do
      begin
         Pen.Color := clBlack;
         Pen.Width := 1;
         MoveTo(0,y0);
         Lineto(Width, y0);
         MoveTo(x0,0);
         LineTo(x0,Height);
         Pen.Width := 10;
         for i := 1 to Numb do

         Pixels[100,100] := clBlack;
         Pen.Color := clRed;
         Pen.Width := 2;

         x := x1;
         y := sin(x);
         MoveTo(x0 + Trunc(x*mash),y0- Trunc(y*mash));
         while x < x2 do
         begin
            x := x + 0.01;
            y := sin(x);
            LineTo(x0 + Trunc(x*mash),y0 - Trunc(y * mash));
         end;
      end;
   end;
end;

end.
