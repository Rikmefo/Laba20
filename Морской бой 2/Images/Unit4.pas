unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, ComCtrls;

type
  TForm4 = class(TForm)
    tmr1: TTimer;
    image: TImage;
    pb1: TProgressBar;
    tmr2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure tmr2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm4.FormCreate(Sender: TObject);
begin
           Pb1.Position:=0;
end;

procedure TForm4.tmr1Timer(Sender: TObject);
begin

Form4.Hide;
form1.show;
tmr1.Enabled:=False;
end;





procedure TForm4.tmr2Timer(Sender: TObject);
begin

Pb1.Position:=Pb1.Position+20;
if Pb1.Position=100 then

end;

procedure T

