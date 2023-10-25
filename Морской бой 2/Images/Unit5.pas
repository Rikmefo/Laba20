unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg;

type
  TForm5 = class(TForm)
    pnl1: TPanel;
    image16: TImage;
    image11: TImage;
    image12: TImage;
    image13: TImage;
    image14: TImage;
    image15: TImage;
    button2: TButton;
    button3: TButton;
    Label1: TLabel;
    procedure image16Click(Sender: TObject);
    procedure image11Click(Sender: TObject);
    procedure image12Click(Sender: TObject);
    procedure button2Click(Sender: TObject);
    procedure button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;


implementation

uses Unit3;
           var
             k1,k2,k3:integer;
{$R *.dfm}

procedure TForm5.image16Click(Sender: TObject);
begin
   k1:=1;
   k2:=0;
   k3:=0;
   image13.Visible:=True;
   image14.Visible:=false;
   image15.Visible:=false;
end;

procedure TForm5.image11Click(Sender: TObject);
begin
k1:=0;
   k2:=1;
   k3:=0;
   image13.Visible:=false;
   image14.Visible:=True;
   image15.Visible:=false;
end;

procedure TForm5.image12Click(Sender: TObject);
begin
k1:=0;
   k2:=0;
   k3:=1;
   image13.Visible:=false;
   image14.Visible:=false;
   image15.Visible:=True;
end;

procedure TForm5.button2Click(Sender: TObject);
begin
               if k1=1 then
               begin
               form3.image110.visible:=True;
               form3.image130.visible:=False;
               form3.image131.visible:=False;
               end;
                if k2=1 then
               begin
               form3.image110.visible:=False;
               form3.image130.visible:=True;
               form3.image131.visible:=False;
               end;
                if k3=1 then
               begin
               form3.image110.visible:=False;
               form3.image130.visible:=False;
               form3.image131.visible:=True;
               end;

end;

procedure TForm5.button3Click(Sender: TObject);
begin
form5.Hide;
end;

end.
