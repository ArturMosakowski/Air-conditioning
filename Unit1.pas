unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    TrackBar1: TTrackBar;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    TrackBar2: TTrackBar;
    Image2: TImage;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Image3: TImage;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    TrackBar3: TTrackBar;
    TrackBar4: TTrackBar;
    Image4: TImage;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    TrackBar5: TTrackBar;
    Image5: TImage;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Button2: TButton;
    Timer1: TTimer;
    Button1: TButton;
    Label16: TLabel;
    Shape6: TShape;
    Shape7: TShape;
    Button3: TButton;
    Label17: TLabel;
    Shape8: TShape;
    procedure FormCreate(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure TrackBar4Change(Sender: TObject);
    procedure TrackBar5Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  TZbior = record
    Nazwa  : String;
    Punkty : Array[0..3] of Integer;
  end;

var
  Form1        : TForm1;
  i, j         : Integer;
  t_autobus    : Integer;
  t_powietrza  : Integer;
  t_oczekiwana : Integer;
  pasazerowie  : Integer;
  moc_klimy    : Integer;
  roznica      : Integer;
  Zbior        : Array[0..14] of TZbior;
  R, P, T, Z   : Integer;
implementation

{$R *.dfm}
procedure UstawZbiory();
begin
  Zbior[0].Nazwa:='A1';
  Zbior[0].Punkty[0]:=0;
  Zbior[0].Punkty[1]:=4;
  Zbior[0].Punkty[2]:=8;
  Zbior[0].Punkty[3]:=12;

  Zbior[1].Nazwa:='A2';
  Zbior[1].Punkty[0]:=8;
  Zbior[1].Punkty[1]:=12;
  Zbior[1].Punkty[2]:=18;
  Zbior[1].Punkty[3]:=22;

  Zbior[2].Nazwa:='A3';
  Zbior[2].Punkty[0]:=18;
  Zbior[2].Punkty[1]:=22;
  Zbior[2].Punkty[2]:=28;
  Zbior[2].Punkty[3]:=32;

  Zbior[3].Nazwa:='A4';
  Zbior[3].Punkty[0]:=28;
  Zbior[3].Punkty[1]:=32;
  Zbior[3].Punkty[2]:=38;
  Zbior[3].Punkty[3]:=42;

  Zbior[4].Nazwa:='A5';
  Zbior[4].Punkty[0]:=38;
  Zbior[4].Punkty[1]:=42;
  Zbior[4].Punkty[2]:=46;
  Zbior[4].Punkty[3]:=50;

  Zbior[5].Nazwa:='B1';
  Zbior[5].Punkty[0]:=0;
  Zbior[5].Punkty[1]:=4;
  Zbior[5].Punkty[2]:=8;
  Zbior[5].Punkty[3]:=12;

  Zbior[6].Nazwa:='B2';
  Zbior[6].Punkty[0]:=8;
  Zbior[6].Punkty[1]:=12;
  Zbior[6].Punkty[2]:=18;
  Zbior[6].Punkty[3]:=22;

  Zbior[7].Nazwa:='B3';
  Zbior[7].Punkty[0]:=18;
  Zbior[7].Punkty[1]:=22;
  Zbior[7].Punkty[2]:=28;
  Zbior[7].Punkty[3]:=32;

  Zbior[8].Nazwa:='B4';
  Zbior[8].Punkty[0]:=28;
  Zbior[8].Punkty[1]:=32;
  Zbior[8].Punkty[2]:=38;
  Zbior[8].Punkty[3]:=42;

  Zbior[9].Nazwa:='B5';
  Zbior[9].Punkty[0]:=38;
  Zbior[9].Punkty[1]:=42;
  Zbior[9].Punkty[2]:=46;
  Zbior[9].Punkty[3]:=50;

  Zbior[10].Nazwa:='C1';
  Zbior[10].Punkty[0]:=0;
  Zbior[10].Punkty[1]:=1;
  Zbior[10].Punkty[2]:=2;
  Zbior[10].Punkty[3]:=3;

  Zbior[11].Nazwa:='C2';
  Zbior[11].Punkty[0]:=4;
  Zbior[11].Punkty[1]:=6;
  Zbior[11].Punkty[2]:=8;
  Zbior[11].Punkty[3]:=10;

  Zbior[12].Nazwa:='C3';
  Zbior[12].Punkty[0]:=11;
  Zbior[12].Punkty[1]:=13;
  Zbior[12].Punkty[2]:=15;
  Zbior[12].Punkty[3]:=16;

  Zbior[13].Nazwa:='C4';
  Zbior[13].Punkty[0]:=17;
  Zbior[13].Punkty[1]:=19;
  Zbior[13].Punkty[2]:=21;
  Zbior[13].Punkty[3]:=24;

  Zbior[14].Nazwa:='C5';
  Zbior[14].Punkty[0]:=24;
  Zbior[14].Punkty[1]:=24;
  Zbior[14].Punkty[2]:=24;
  Zbior[14].Punkty[3]:=50;
end;

procedure Smile(X,Y:Integer);
begin
  Form1.Image5.Canvas.Pixels[X+2,Y]:=clBlack;  Form1.Image5.Canvas.Pixels[X+3,Y]:=clBlack;
  Form1.Image5.Canvas.Pixels[X+4,Y]:=clBlack;  Form1.Image5.Canvas.Pixels[X+5,Y]:=clBlack;

  Form1.Image5.Canvas.Pixels[X+1,Y+1]:=clBlack;  Form1.Image5.Canvas.Pixels[X+6,Y+1]:=clBlack;

  Form1.Image5.Canvas.Pixels[X,Y+2]:=clBlack;  Form1.Image5.Canvas.Pixels[X+2,Y+2]:=clBlack;
  Form1.Image5.Canvas.Pixels[X+5,Y+2]:=clBlack;  Form1.Image5.Canvas.Pixels[X+7,Y+2]:=clBlack;

  Form1.Image5.Canvas.Pixels[X,Y+3]:=clBlack;  Form1.Image5.Canvas.Pixels[X+7,Y+3]:=clBlack;

  Form1.Image5.Canvas.Pixels[X,Y+4]:=clBlack;  Form1.Image5.Canvas.Pixels[X+2,Y+4]:=clBlack;
  Form1.Image5.Canvas.Pixels[X+5,Y+4]:=clBlack;  Form1.Image5.Canvas.Pixels[X+7,Y+4]:=clBlack;

  Form1.Image5.Canvas.Pixels[X,Y+5]:=clBlack;  Form1.Image5.Canvas.Pixels[X+3,Y+5]:=clBlack;
  Form1.Image5.Canvas.Pixels[X+4,Y+5]:=clBlack;  Form1.Image5.Canvas.Pixels[X+7,Y+5]:=clBlack;

  Form1.Image5.Canvas.Pixels[X+1,Y+6]:=clBlack;  Form1.Image5.Canvas.Pixels[X+6,Y+6]:=clBlack;

  Form1.Image5.Canvas.Pixels[X+2,Y+7]:=clBlack;  Form1.Image5.Canvas.Pixels[X+3,Y+7]:=clBlack;
  Form1.Image5.Canvas.Pixels[X+4,Y+7]:=clBlack;  Form1.Image5.Canvas.Pixels[X+5,Y+7]:=clBlack;

  Form1.Image5.Canvas.Pixels[X+2,Y+1]:=clYellow;  Form1.Image5.Canvas.Pixels[X+3,Y+1]:=clYellow;
  Form1.Image5.Canvas.Pixels[X+4,Y+1]:=clYellow;  Form1.Image5.Canvas.Pixels[X+5,Y+1]:=clYellow;

  Form1.Image5.Canvas.Pixels[X+1,Y+2]:=clYellow;  Form1.Image5.Canvas.Pixels[X+3,Y+2]:=clYellow;
  Form1.Image5.Canvas.Pixels[X+4,Y+2]:=clYellow;  Form1.Image5.Canvas.Pixels[X+6,Y+2]:=clYellow;

  Form1.Image5.Canvas.Pixels[X+1,Y+3]:=clYellow;  Form1.Image5.Canvas.Pixels[X+2,Y+3]:=clYellow;
  Form1.Image5.Canvas.Pixels[X+3,Y+3]:=clYellow;  Form1.Image5.Canvas.Pixels[X+4,Y+3]:=clYellow;
  Form1.Image5.Canvas.Pixels[X+5,Y+3]:=clYellow;  Form1.Image5.Canvas.Pixels[X+6,Y+3]:=clYellow;

  Form1.Image5.Canvas.Pixels[X+1,Y+4]:=clYellow;  Form1.Image5.Canvas.Pixels[X+3,Y+4]:=clYellow;
  Form1.Image5.Canvas.Pixels[X+4,Y+4]:=clYellow;  Form1.Image5.Canvas.Pixels[X+6,Y+4]:=clYellow;

  Form1.Image5.Canvas.Pixels[X+1,Y+5]:=clYellow;  Form1.Image5.Canvas.Pixels[X+2,Y+5]:=clYellow;
  Form1.Image5.Canvas.Pixels[X+5,Y+5]:=clYellow;  Form1.Image5.Canvas.Pixels[X+6,Y+5]:=clYellow;

  Form1.Image5.Canvas.Pixels[X+2,Y+6]:=clYellow;  Form1.Image5.Canvas.Pixels[X+3,Y+6]:=clYellow;
  Form1.Image5.Canvas.Pixels[X+4,Y+6]:=clYellow;  Form1.Image5.Canvas.Pixels[X+5,Y+6]:=clYellow;

end;

procedure RysujSkale(ktora : Byte);
var
  y, i, j : Integer;
  tmp, tmp2 : Integer;
begin

  if ktora=1 then
  begin
    y:=((Form1.TrackBar1.Position*4)*-1-200)*-1;
    if y<200 then
    begin
      tmp:= Form1.TrackBar1.Position*-1;
      tmp2:=200;
      for i:=0 to tmp do
      begin
        if (tmp2<200) and (tmp2>135) then
          Form1.Image1.Canvas.Pen.Color:=clLime;
        if (tmp2<135)and (tmp2>70) then
          Form1.Image1.Canvas.Pen.Color:=clYellow;
        if tmp2<70 then
          Form1.Image1.Canvas.Pen.Color:=clRed;
        Form1.Image1.Canvas.Rectangle(3,tmp2+4,17,tmp2+2);
        tmp2:=tmp2-4;
      end;
      Form1.Image1.Canvas.Brush.Color:=clGray;
      Form1.Image1.Canvas.Pen.Color:=clGray;
      Form1.Image1.Canvas.Rectangle(3,2,17,y+2);
    end;
  end;

  if ktora=2 then
  begin
    y:=((Form1.TrackBar2.Position*4)*-1-200)*-1;
    if y<200 then
    begin
      tmp:= Form1.TrackBar2.Position*-1;
      tmp2:=200;
      for i:=0 to tmp do
      begin
        if (tmp2<200) and (tmp2>135) then
          Form1.Image2.Canvas.Pen.Color:=clLime;
        if (tmp2<135)and (tmp2>70) then
          Form1.Image2.Canvas.Pen.Color:=clYellow;
        if tmp2<70 then
          Form1.Image2.Canvas.Pen.Color:=clRed;
        Form1.Image2.Canvas.Rectangle(3,tmp2+4,17,tmp2+2);
        tmp2:=tmp2-4;
      end;
      Form1.Image2.Canvas.Brush.Color:=clGray;
      Form1.Image2.Canvas.Pen.Color:=clGray;
      Form1.Image2.Canvas.Rectangle(3,2,17,y+2);
    end;
  end;

  if ktora=3 then
  begin
    y:=Form1.TrackBar3.Position*-1;
      if (y=0) then
      begin
        Form1.Image3.Canvas.Pen.Color:=clGray;
        Form1.Image3.Canvas.Brush.Color:=clGray;
        Form1.Image3.Canvas.Rectangle(3,3,17,199);
      end;
      if (y=1) then
      begin
        Form1.Image3.Canvas.Pen.Color:=clLime;
        Form1.Image3.Canvas.Brush.Color:=clLime;
        Form1.Image3.Canvas.Rectangle(3,160,17,199);
        Form1.Image3.Canvas.Pen.Color:=clGray;
        Form1.Image3.Canvas.Brush.Color:=clGray;
        Form1.Image3.Canvas.Rectangle(3,3,17,159);
      end;
      if (y=2) then
      begin
        Form1.Image3.Canvas.Pen.Color:=clLime;
        Form1.Image3.Canvas.Brush.Color:=clLime;
        Form1.Image3.Canvas.Rectangle(3,120,17,159);
        Form1.Image3.Canvas.Rectangle(3,160,17,199);
        Form1.Image3.Canvas.Pen.Color:=clGray;
        Form1.Image3.Canvas.Brush.Color:=clGray;
        Form1.Image3.Canvas.Rectangle(3,3,17,119);
      end;
      if (y=3) then
      begin
        Form1.Image3.Canvas.Pen.Color:=clYellow;
        Form1.Image3.Canvas.Brush.Color:=clYellow;
        Form1.Image3.Canvas.Rectangle(3,80,17,119);
        Form1.Image3.Canvas.Pen.Color:=clLime;
        Form1.Image3.Canvas.Brush.Color:=clLime;
        Form1.Image3.Canvas.Rectangle(3,120,17,159);
        Form1.Image3.Canvas.Rectangle(3,160,17,199);
        Form1.Image3.Canvas.Pen.Color:=clGray;
        Form1.Image3.Canvas.Brush.Color:=clGray;
        Form1.Image3.Canvas.Rectangle(3,3,17,79);
      end;
      if (y=4) then
      begin
        Form1.Image3.Canvas.Pen.Color:=clYellow;
        Form1.Image3.Canvas.Brush.Color:=clYellow;
        Form1.Image3.Canvas.Rectangle(3,41,17,79);
        Form1.Image3.Canvas.Rectangle(3,80,17,119);
        Form1.Image3.Canvas.Pen.Color:=clLime;
        Form1.Image3.Canvas.Brush.Color:=clLime;
        Form1.Image3.Canvas.Rectangle(3,120,17,159);
        Form1.Image3.Canvas.Rectangle(3,160,17,199);
        Form1.Image3.Canvas.Pen.Color:=clGray;
        Form1.Image3.Canvas.Brush.Color:=clGray;
        Form1.Image3.Canvas.Rectangle(3,3,17,40);
      end;
      if (y=5) then
      begin
        Form1.Image3.Canvas.Pen.Color:=clRed;
        Form1.Image3.Canvas.Brush.Color:=clRed;
        Form1.Image3.Canvas.Rectangle(3,40,17,3);
        Form1.Image3.Canvas.Pen.Color:=clYellow;
        Form1.Image3.Canvas.Brush.Color:=clYellow;
        Form1.Image3.Canvas.Rectangle(3,41,17,79);
        Form1.Image3.Canvas.Rectangle(3,80,17,119);
        Form1.Image3.Canvas.Pen.Color:=clLime;
        Form1.Image3.Canvas.Brush.Color:=clLime;
        Form1.Image3.Canvas.Rectangle(3,120,17,159);
        Form1.Image3.Canvas.Rectangle(3,160,17,199);
      end;
  end;
  if ktora=4 then
  begin
    y:=((Form1.TrackBar4.Position*4)*-1-200)*-1;
    if y<200 then
    begin
      tmp:= Form1.TrackBar4.Position*-1;
      tmp2:=200;
      for i:=0 to tmp do
      begin
        if (tmp2<200) and (tmp2>135) then
          Form1.Image4.Canvas.Pen.Color:=clLime;
        if (tmp2<135)and (tmp2>70) then
          Form1.Image4.Canvas.Pen.Color:=clYellow;
        if tmp2<70 then
          Form1.Image4.Canvas.Pen.Color:=clRed;
        Form1.Image4.Canvas.Rectangle(3,tmp2+4,17,tmp2+2);
        tmp2:=tmp2-4;
      end;
      Form1.Image4.Canvas.Brush.Color:=clGray;
      Form1.Image4.Canvas.Pen.Color:=clGray;
      Form1.Image4.Canvas.Rectangle(3,2,17,y+2);
    end;
  end;
  if ktora=5 then
  begin
    y:=((Form1.TrackBar5.Position*4)*-1-200)*-1;
    if (y<201) and (y>100) then
    begin
      tmp:= Form1.TrackBar5.Position*-1;
      tmp2:=200;
      for i:=0 to tmp do
      begin
        Smile(1,tmp2-8);
        tmp2:=tmp2-8;
      end;
      Form1.Image5.Canvas.Brush.Color:=clGray;
      Form1.Image5.Canvas.Pen.Color:=clGray;
      Form1.Image5.Canvas.Rectangle(1,1,10,(y div 4) *8-200-8);
    end;
    if (y<108) and (y>0) then
    begin
      tmp2:=200;
      for j:=0 to 25 do
      begin
        Smile(1,tmp2-8);
        tmp2:=tmp2-8;
      end;
      tmp:= Form1.TrackBar5.Position*-1;
      tmp2:=200;
      for i:=0 to tmp do
      begin
        Smile(11,tmp2-8);
        tmp2:=tmp2-8;
      end;
      Form1.Image5.Canvas.Brush.Color:=clGray;
      Form1.Image5.Canvas.Pen.Color:=clGray;
      Form1.Image5.Canvas.Rectangle(11,1,19,(y div 4) *8-8);
      Form1.Image5.Canvas.Pen.Color:=clBlack;
      Form1.Image5.Canvas.MoveTo(0,0);
      Form1.Image5.Canvas.LineTo(20,0);
    end;
  end;
end;

procedure Fuzyfikacja();
begin
{----------  Rozmywanie r�nicy temperatur  ----------------}
  roznica:=t_oczekiwana-t_autobus;
  if (roznica>=0) and (roznica<=4) then
    R:=1;
  if (roznica>4) and (roznica<=10) then
    R:=2;
  if (roznica>10) and (roznica<=16) then
    R:=3;
  if (roznica>16) and (roznica<=24) then
    R:=4;
  if (roznica>25) and (roznica<=50) then
    R:=5;
  if (roznica<0) and (roznica>=-4) then
    R:=-1;
  if (roznica<-4) and (roznica>=-10) then
    R:=-2;
  if (roznica<-10) and (roznica>=-16) then
    R:=-3;
  if (roznica<-16) and (roznica>=-24) then
    R:=-4;
  if (roznica<-24) and (roznica>=-50) then
    R:=-5;
{-----------  Rozmywanie ilosci osob  ------------}
  if (pasazerowie>=0) and (pasazerowie<=10) then
    P:=1;
  if (pasazerowie>10) and (pasazerowie<=20) then
    P:=2;
  if (pasazerowie>20) and (pasazerowie<=30) then
    P:=3;
  if (pasazerowie>30) and (pasazerowie<=40) then
    P:=4;
  if (pasazerowie>40) and (pasazerowie<=50) then
    P:=5;
{------------  Rozmywanie temperatury na zewnatrza  -----------------}
  if (t_powietrza>=0) and (t_powietrza<=10) then
    T:=1;
  if (t_powietrza>10) and (t_powietrza<=20) then
    T:=2;
  if (t_powietrza>20) and (t_powietrza<=30) then
    T:=3;
  if (t_powietrza>30) and (t_powietrza<=40) then
    T:=4;
  if (t_powietrza>40) and (t_powietrza<=50) then
    T:=5;
end;

procedure Wnioskowanie();
begin
  if (R=1) and (P=1) then
  begin
    moc_klimy:=1;
    Z:=1;
  end;
  if (R=1) and (P=2) then
  begin
    moc_klimy:=1;
    Z:=1;
  end;
  if (R=1) and (P=3) then
  begin
    moc_klimy:=1;
    Z:=1;
  end;
  if (R=1) and (P=4) then
  begin
    moc_klimy:=1;
    Z:=1;
  end;
  if (R=1) and (P=5) then
  begin
    moc_klimy:=1;
    Z:=1;
  end;

  if (R=2) and (P=1) then
  begin
    moc_klimy:=2;
    Z:=3;
  end;
  if (R=2) and (P=2) then
  begin
    moc_klimy:=2;
    Z:=3;
  end;
  if (R=2) and (P=3) then
  begin
    moc_klimy:=2;
    Z:=2;
  end;
  if (R=2) and (P=4) then
  begin
    moc_klimy:=2;
    Z:=2;
  end;
  if (R=2) and (P=5) then
  begin
    moc_klimy:=2;
    Z:=2;
  end;

  if (R=3) and (P=1) then
  begin
    moc_klimy:=3;
    Z:=4;
  end;
  if (R=3) and (P=2) then
  begin
    moc_klimy:=3;
    Z:=4;
  end;
  if (R=3) and (P=3) then
  begin
    moc_klimy:=3;
    Z:=3;
  end;
  if (R=3) and (P=4) then
  begin
    moc_klimy:=3;
    Z:=3;
  end;
  if (R=3) and (P=5) then
  begin
    moc_klimy:=3;
    Z:=3;
  end;

  if (R=4) and (P=1) then
  begin
    moc_klimy:=4;
    Z:=5;
  end;
  if (R=4) and (P=2) then
  begin
    moc_klimy:=4;
    Z:=5;
  end;
  if (R=4) and (P=3) then
  begin
    moc_klimy:=4;
    Z:=4;
  end;
  if (R=4) and (P=4) then
  begin
    moc_klimy:=4;
    Z:=4;
  end;
  if (R=4) and (P=5) then
  begin
    moc_klimy:=4;
    Z:=4;
  end;

  if (R=5) and (P=1) then
  begin
    moc_klimy:=5;
    Z:=6;
  end;
  if (R=5) and (P=2) then
  begin
    moc_klimy:=5;
    Z:=5;
  end;
  if (R=5) and (P=3) then
  begin
    moc_klimy:=5;
    Z:=5;
  end;
  if (R=5) and (P=4) then
  begin
    moc_klimy:=5;
    Z:=5;
  end;
  if (R=5) and (P=5) then
  begin
    moc_klimy:=5;
    Z:=5;
  end;
{------------------------------------------------------------}

  if (R=-1) and (P=1) then
  begin
    moc_klimy:=1;
    Z:=-1;
  end;
  if (R=-1) and (P=2) then
  begin
    moc_klimy:=1;
    Z:=-1;
  end;
  if (R=-1) and (P=3) then
  begin
    moc_klimy:=1;
    Z:=-1;
  end;
  if (R=-1) and (P=4) then
  begin
    moc_klimy:=1;
    Z:=-1;
  end;
  if (R=-1) and (P=5) then
  begin
    moc_klimy:=1;
    Z:=-1;
  end;

  if (R=-2) and (P=1) then
  begin
    moc_klimy:=2;
    Z:=-3;
  end;
  if (R=-2) and (P=2) then
  begin
    moc_klimy:=2;
    Z:=-3;
  end;
  if (R=-2) and (P=3) then
  begin
    moc_klimy:=2;
    Z:=-2;
  end;
  if (R=-2) and (P=4) then
  begin
    moc_klimy:=2;
    Z:=-2;
  end;
  if (R=-2) and (P=5) then
  begin
    moc_klimy:=2;
    Z:=-2;
  end;

  if (R=-3) and (P=1) then
  begin
    moc_klimy:=3;
    Z:=-4;
  end;
  if (R=-3) and (P=2) then
  begin
    moc_klimy:=3;
    Z:=-4;
  end;
  if (R=-3) and (P=3) then
  begin
    moc_klimy:=3;
    Z:=-3;
  end;
  if (R=-3) and (P=4) then
  begin
    moc_klimy:=3;
    Z:=-3;
  end;
  if (R=-3) and (P=5) then
  begin
    moc_klimy:=3;
    Z:=-3;
  end;

  if (R=-4) and (P=1) then
  begin
    moc_klimy:=4;
    Z:=-5;
  end;
  if (R=-4) and (P=2) then
  begin
    moc_klimy:=4;
    Z:=-5;
  end;
  if (R=-4) and (P=3) then
  begin
    moc_klimy:=4;
    Z:=-4;
  end;
  if (R=-4) and (P=4) then
  begin
    moc_klimy:=4;
    Z:=-4;
  end;
  if (R=-4) and (P=5) then
  begin
    moc_klimy:=4;
    Z:=-4;
  end;

  if (R=-5) and (P=1) then
  begin
    moc_klimy:=5;
    Z:=-6;
  end;
  if (R=-5) and (P=2) then
  begin
    moc_klimy:=5;
    Z:=-5;
  end;
  if (R=-5) and (P=3) then
  begin
    moc_klimy:=5;
    Z:=-5;
  end;
  if (R=-5) and (P=4) then
  begin
    moc_klimy:=5;
    Z:=-5;
  end;
  if (R=-5) and (P=5) then
  begin
    moc_klimy:=5;
    Z:=-5;
  end;
{------------------------------------------------------------}

  if (moc_klimy=1) and (T=1) then Z:=Z+1;
  if (moc_klimy=1) and (T=2) then Z:=Z+1;
  if (moc_klimy=1) and (T=3) then Z:=Z;
  if (moc_klimy=1) and (T=4) then Z:=Z;
  if (moc_klimy=1) and (T=5) then Z:=Z;

  if (moc_klimy=2) and (T=1) then Z:=Z+1;
  if (moc_klimy=2) and (T=2) then Z:=Z+1;
  if (moc_klimy=2) and (T=3) then Z:=Z;
  if (moc_klimy=2) and (T=4) then Z:=Z;
  if (moc_klimy=2) and (T=5) then Z:=Z;

  if (moc_klimy=3) and (T=1) then Z:=Z+2;
  if (moc_klimy=3) and (T=2) then Z:=Z+2;
  if (moc_klimy=3) and (T=3) then Z:=Z+1;
  if (moc_klimy=3) and (T=4) then Z:=Z;
  if (moc_klimy=3) and (T=5) then Z:=Z;

  if (moc_klimy=4) and (T=1) then Z:=Z+2;
  if (moc_klimy=4) and (T=2) then Z:=Z+2;
  if (moc_klimy=4) and (T=3) then Z:=Z+2;
  if (moc_klimy=4) and (T=4) then Z:=Z+1;
  if (moc_klimy=4) and (T=5) then Z:=Z;

  if (moc_klimy=5) and (T=1) then Z:=Z+2;
  if (moc_klimy=5) and (T=2) then Z:=Z+2;
  if (moc_klimy=5) and (T=3) then Z:=Z+2;
  if (moc_klimy=5) and (T=4) then Z:=Z+1;
  if (moc_klimy=5) and (T=5) then Z:=Z;
{------------------------------------------------------------}

end;

procedure Defuzyfikacja();
begin
  if (roznica=0)or(roznica=-1)or(roznica=1) then
  begin
    moc_klimy:=0;
    Form1.TrackBar3.Position:=0;
  end;
  t_autobus:=t_autobus+Z;

  Form1.TrackBar1.Position:=t_oczekiwana*-1;
  Form1.TrackBar2.Position:=t_autobus*-1;
  if moc_klimy=0 then
  begin
    Form1.Shape6.Brush.Color:=clSilver;
    Form1.Label16.Font.Color:=clBlack;
    Form1.Label16.Caption:='STOP';
  end;
  if Z>0 then
  begin
    Form1.TrackBar3.Position:=moc_klimy*-1;
    Form1.Shape6.Brush.Color:=clRed;
    Form1.Label16.Font.Color:=clWhite;
    Form1.Label16.Caption:='GRZEJE';
  end;
  if Z<0 then
  begin
    Form1.TrackBar3.Position:=moc_klimy*-1;
    Form1.Shape6.Brush.Color:=clBlue;
    Form1.Label16.Font.Color:=clWhite;
    Form1.Label16.Caption:='CH�ODZI';
  end;
  Form1.TrackBar4.Position:=t_powietrza*-1;
  Form1.TrackBar5.Position:=pasazerowie*-1;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.Image1.Canvas.Brush.Color:=clGray;
  Form1.Image2.Canvas.Brush.Color:=clGray;
  Form1.Image3.Canvas.Brush.Color:=clGray;
  Form1.Image4.Canvas.Brush.Color:=clGray;
  Form1.Image5.Canvas.Brush.Color:=clGray;
  Image1.Canvas.Rectangle(0,0,20,202);
  Image2.Canvas.Rectangle(0,0,20,202);
  Image3.Canvas.Rectangle(0,0,20,202);
  Image4.Canvas.Rectangle(0,0,20,202);
  Image5.Canvas.Rectangle(0,0,20,202);
  Form1.Label2.Caption:='0 C';
  Form1.Label4.Caption:='0 C';
  Form1.Label10.Caption:='0 C';
  Form1.Label7.Caption:='0';
  Form1.Label13.Caption:='0';
  Form1.Label16.Caption:='';
  Form1.Label17.Font.Color:=clSilver;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  RysujSkale(1);
  Form1.Label2.Caption:=IntToStr(Form1.TrackBar1.Position*-1)+' C';
end;

procedure TForm1.TrackBar2Change(Sender: TObject);
begin
  RysujSkale(2);
  Form1.Label4.Caption:=IntToStr(Form1.TrackBar2.Position*-1)+' C';
end;


procedure TForm1.TrackBar3Change(Sender: TObject);
begin
  RysujSkale(3);
  Form1.Label7.Caption:=IntToStr(Form1.TrackBar3.Position*-1)
end;

procedure TForm1.TrackBar4Change(Sender: TObject);
begin
  RysujSkale(4);
  Form1.Label10.Caption:=IntToStr(Form1.TrackBar4.Position*-1)+' C';
end;

procedure TForm1.TrackBar5Change(Sender: TObject);
begin
  RysujSkale(5);
  if Form1.TrackBar5.Position=-50 then
    Form1.Label13.Caption:='50';
  if Form1.TrackBar5.Position>-50 then
  Form1.Label13.Caption:=IntToStr(Form1.TrackBar5.Position*-1+1);
end;

procedure tmp();
begin
  Form1.TrackBar4.Position:=Random(40)*-1;
  Form1.TrackBar5.Position:=Random(36)*-1;
  Form1.TrackBar2.Position:=0;
  Form1.TrackBar3.Position:=0;
  Form1.Timer1.Enabled:=True;
  j:=1;
  Form1.Button1.Enabled:=True;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Form1.TrackBar4.Position:=Random(40)*-1;
  Form1.TrackBar5.Position:=Random(36)*-1;
  Form1.TrackBar2.Position:=0;
  Form1.TrackBar3.Position:=0;
  Form1.Timer1.Enabled:=True;
  j:=1;
  Form1.Button1.Enabled:=True;
  Form1.Button2.Caption:='RESTART';
  tmp();
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form1.Timer1.Enabled:=False;
  Form1.Button2.Caption:='START';
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  tmp, tmp2 : Integer;
begin
  if j=10 then
  begin
    Form1.Label17.Font.Color:=clRed;
    tmp:=Random(21)-10;
    tmp2:=Random(11)-5;
    if (Form1.TrackBar4.Position+(tmp2*-1)<0) and (Form1.TrackBar4.Position+(tmp2*-1)>-50) then
      Form1.TrackBar4.Position:=Form1.TrackBar4.Position+(tmp2*-1);

    if (Form1.TrackBar5.Position+(tmp*-1)<0) and (Form1.TrackBar5.Position+(tmp*-1)>-50) then
      Form1.TrackBar5.Position:=Form1.TrackBar5.Position+(tmp*-1);
    Form1.TrackBar2.Position:=Form1.TrackBar2.Position+4;
    j:=1;
  end;
  if j=2 then Form1.Label17.Font.Color:=clSilver;

  t_oczekiwana:=Form1.TrackBar1.Position*-1;
  t_autobus:=Form1.TrackBar2.Position*-1;
  moc_klimy:=Form1.TrackBar3.Position*-1;
  t_powietrza:=Form1.TrackBar4.Position*-1;
  pasazerowie:=Form1.TrackBar5.Position*-1;

  Fuzyfikacja();
  Wnioskowanie();
  Defuzyfikacja();
  
  inc(j);

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Close();
end;

end.
