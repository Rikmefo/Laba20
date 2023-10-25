unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Movements, CellGameBoard, CellBanks, StdCtrls, jpeg,
  ExtCtrls,shellapi;

type
  TForm1 = class(TForm)
    button2: TButton;
    mm1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    image: TImage;
    button3: TButton;
    N4: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure button2Click(Sender: TObject);
    procedure button3Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit3, Unit4;

{$R *.dfm}

procedure TForm1.N1Click(Sender: TObject);
begin
Form2.Show;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
Form1.Hide;
Form3.show;
end;

procedure TForm1.button2Click(Sender: TObject);
var x,y:integer;
begin
 form1.Hide;
form3.show;
end;
procedure TForm1.button3Click(Sender: TObject);
begin
form4.Close;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
Form4.Close;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
ShellExecute(0,PChar('open'),PChar('Справка.chm'),nil,nil,SW_SHOW);
end;

end.
