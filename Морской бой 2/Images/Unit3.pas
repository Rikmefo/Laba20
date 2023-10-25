unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CellGameBoard, StdCtrls, CellBanks, ExtCtrls, jpeg, Buttons,
  Menus, MPlayer,shellapi;

type
  TForm3 = class(TForm)
    board1: TCellGameBoard;
    btmpclbnk1: TBitmapCellBank;
    board2: TCellGameBoard;
    button5: TButton;
    tmr1: TTimer;
    button7: TButton;
    button6: TButton;
    radiogroup3: TRadioGroup;
    button3: TButton;
    pnl1: TPanel;
    image: TImage;
    image11: TImage;
    image12: TImage;
    image13: TImage;
    image14: TImage;
    image15: TImage;
    image16: TImage;
    image17: TImage;
    image18: TImage;
    image19: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    image110: TImage;
    pnl2: TPanel;
    button9: TButton;
    button8: TButton;
    button4: TButton;
    button2: TButton;
    image112: TImage;
    image113: TImage;
    image114: TImage;
    image115: TImage;
    image111: TImage;
    image116: TImage;
    image117: TImage;
    image118: TImage;
    image119: TImage;
    image120: TImage;
    image121: TImage;
    image122: TImage;
    image123: TImage;
    image124: TImage;
    image125: TImage;
    image126: TImage;
    image127: TImage;
    image128: TImage;
    image129: TImage;
    mm1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    mp1: TMediaPlayer;
    radiogroup2: TRadioGroup;
    N4: TMenuItem;
    image130: TImage;
    image131: TImage;
    N5: TMenuItem;

    procedure button3Click(Sender: TObject);
    
    procedure board1CellMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; Col, Row, X, Y: Integer);
    procedure FormCreate(Sender: TObject);
{    procedure radiogroup2Click(Sender: TObject);   }
    procedure button2Click(Sender: TObject);
    procedure button4Click(Sender: TObject);
    procedure button5Click(Sender: TObject);
    procedure board2CellMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; Col, Row, X, Y: Integer);
    procedure button6Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure button7Click(Sender: TObject);
    procedure button8Click(Sender: TObject);
    procedure button9Click(Sender: TObject);
  
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    

  private
    { Private declarations }
  public
    { Public declarations }
  end;
            type TPole = array[1..10,1..10] of Integer;
var Pole: TPole;
var
  Form3: TForm3;
  z,y,q,w,o,b,e,p,t,ok,ox,oy,kx,ky,zz,ww,zzz,www,aaa,bbb,stat,k1,k2,k3,k4,kkk:integer;

implementation

uses Unit1, Unit4, Unit2, Unit5;

{$R *.dfm}
         procedure TForm3.board2CellMouseDown(Sender: TObject; Button: TMouseButton;     //Выстрел игрока
  Shift: TShiftState; Col, Row, X, Y: Integer);
  const d: array[1..8,1..2] of Integer =
      ((0,1),(1,0),(0,-1),(-1,0),(1,1),(-1,1),(1,-1),(-1,-1));
var i,ii,iii,iiii,iiiii: Integer;
    dx, dy: Integer;
begin
x:=0;
y:=0;
          repeat
             repeat
               if  (Board2.layers[0][col,row].State=3) or(Board2.layers[0][col,row].State=4) or (Board2.layers[0][col,row].State=5)then  //если игрок выстрелил уже по помеченному полю, то ход не завершается
                                              begin
                                             b:=1;
                                             t:=1;
                                             end;
               z:=1;
    if  Board2.layers[0][col,row].State=0                          //если мимо, то ставит точку и заканчивает ход
    then  begin Board2.layers[0][col,row].State:=3   ;
  case radiogroup2.itemindex of
                                0:kkk:=0;
                                1:kkk:=1;

                                end;

                                if kkk=1 then
                             begin
                                mp1.FileName:=('sounds/shot.mp3');
mp1.Open ;
mp1.Play;
end;



                                             b:=1  ;  end;
                                             until z=1;

    if  Board2.layers[0][col,row].State=2 then // Наносит ранение кораблю
    Board2.layers[0][col,row].State:=4;
    if ( Board2.layers[0][col,row].State=4)then
    begin
      case radiogroup2.itemindex of
                                0:kkk:=0;
                                1:kkk:=1;

                                end;
                             if kkk=1 then
                             begin
                                mp1.FileName:=('sounds/shot.mp3') ;
mp1.Open ;
mp1.Play;
end;
    b:=1  ;
      t:=1;
    aaa:=0;
    stat:=0;


     for i := 1 to 8 do           
    begin
      dx := col + d[i,1];
      dy := row + d[i,2];
      if  (dx >= 0) and (dx < 10) and (dy >= 0) and (dy < 10) and (Board2.layers[0][dx,dy].state=2) then
      begin
      aaa:=aaa+1;
               break
      end;
      end;
        for i := 1 to 8 do
    begin
      dx := col + d[i,1];
      dy := row + d[i,2];
        if  (dx >= 0) and (dx < 10) and (dy >= 0) and (dy < 10) and (Board2.layers[0][dx,dy].state=4) then
        begin

        x:=dx;
        y:=dy;
        //2 ячейка
          for ii := 1 to 8 do
    begin
      dx := x + d[ii,1];
      dy := y + d[ii,2];
      if  (dx >= 0) and (dx < 10) and (dy >= 0) and (dy < 10) and (Board2.layers[0][dx,dy].state=2) then
      begin
      aaa:=aaa+1;
        break
      end   ;
        end;
        for ii := 1 to 8 do
    begin
      dx := x + d[ii,1];
      dy := y + d[ii,2];
        if  (dx >= 0) and (dx < 10) and (dy >= 0) and (dy < 10) and (Board2.layers[0][dx,dy].state=4) then
        begin
            x:=dx;
        y:=dy;
        //3 ячейка
            for iii := 1 to 8 do
    begin
      dx := x + d[iii,1];
      dy := y + d[iii,2];
      if  (dx >= 0) and (dx < 10) and (dy >= 0) and (dy < 10) and (Board2.layers[0][dx,dy].state=2) then
      begin
      aaa:=aaa+1;

            break
           end;
      end;
     end;
     end;

                                            end;
                                   end;
                                    if aaa=0 then                //если корабль взорван, то окружает его точками и закрашивает крестиками

     begin


        ///
        dx :=0;
    dy := 0;
  if  (Board2.layers[0][col,row].state=4) then
  begin
         Board2.layers[0][col,row].state:=5 ;           //ставит крестик
         stat:=stat+1;
    for i := 1 to 8 do
    begin
      dx := col + d[i,1];
      dy := row + d[i,2];
      if  (dx >= 0) and (dx < 10) and (dy >= 0) and (dy < 10) and (Board2.layers[0][dx,dy].state=0) then        //ставит точки
         Board2.layers[0][dx,dy].state:=3;
         end;
            for ii := 1 to 8 do
    begin
      dx := col + d[ii,1];
      dy := row + d[ii,2];
      if  (dx >= 0) and (dx < 10) and (dy >= 0) and (dy < 10) and (Board2.layers[0][dx,dy].state=4) then
                                    begin

                                    x:=dx;
        y:=dy        ;
        Board2.layers[0][x,y].state:=5 ;
         stat:=stat+1;
        for i := 1 to 8 do
        begin
           dx := x + d[i,1];
      dy := y + d[i,2];
      if  (dx >= 0) and (dx < 10) and (dy >= 0) and (dy < 10) and (Board2.layers[0][dx,dy].state=0) then
         Board2.layers[0][dx,dy].state:=3;
         end;
                 for iii := 1 to 8 do
    begin
      dx := x + d[iii,1];
      dy := y + d[iii,2];
      if  (dx >= 0) and (dx < 10) and (dy >= 0) and (dy < 10) and (Board2.layers[0][dx,dy].state=4) then
                                    begin

                                    x:=dx;
        y:=dy        ;
        Board2.layers[0][x,y].state:=5 ;
         stat:=stat+1;
        for i := 1 to 8 do
        begin
           dx := x + d[i,1];
      dy := y + d[i,2];
      if  (dx >= 0) and (dx < 10) and (dy >= 0) and (dy < 10) and (Board2.layers[0][dx,dy].state=0) then
         Board2.layers[0][dx,dy].state:=3;
         end;
         for iiii := 1 to 8 do
    begin
      dx := x + d[iiii,1];
      dy := y + d[iiii,2];
      if  (dx >= 0) and (dx < 10) and (dy >= 0) and (dy < 10) and (Board2.layers[0][dx,dy].state=4) then
                                    begin

                                    x:=dx;
        y:=dy        ;
        Board2.layers[0][x,y].state:=5 ;
         stat:=stat+1;
        for i := 1 to 8 do
        begin
           dx := x + d[i,1];
      dy := y + d[i,2];
      if  (dx >= 0) and (dx < 10) and (dy >= 0) and (dy < 10) and (Board2.layers[0][dx,dy].state=0) then
         Board2.layers[0][dx,dy].state:=3;
         end;
          for iiiii := 1 to 8 do
    begin
      dx := x + d[iiii,1];
      dy := y + d[iiii,2];
      if  (dx >= 0) and (dx < 10) and (dy >= 0) and (dy < 10) and (Board2.layers[0][dx,dy].state=4) then
                                    begin

                                    x:=dx;
        y:=dy        ;
        Board2.layers[0][x,y].state:=5 ;
         stat:=stat+1;
          end;
                      end;
                      end;
                      end;
                      end;
                      end;
                      end;
                      end;
                      end;
                      end;
                      if stat=4 then       //подсчитывает сколько кораблей осталось у противника
                      k4:=k4-1;
                      if stat=3 then
                      k3:=k3-1;
                      if stat=2 then
                      k2:=k2-1;
                      if stat=1 then
                      k1:=k1-1;
                      Label5.caption:=IntToStr(k4);
                      Label4.caption:=IntToStr(k3);
                      Label3.caption:=IntToStr(k2);
                      Label2.caption:=IntToStr(k1);
                      end;
                                              until b=1;

        p:=0;


                           for X:=0 to Board2.ColCnt-1 do       //проверяет взорваны ли все корабли противника, если да, то игрок победил

     for Y:=0 to Board2.RowCnt-1 do
     if Board2.layers[0][X,Y].State=2 then p:=p+1   ;

     if p=0 then
     begin

     ShowMessage('Вы победили')  ;
     button6.Enabled:=false;
     board2.Enabled:=False;

     end;


                                b:=0;
                                z:=0;
                                board2.enabled:=false;
        e:=1;
end;

function Freedom (x, y: Integer; board1: TCellGameBoard): Boolean;
const d: array[1..8,1..2] of Integer =
      ((0,1),(1,0),(0,-1),(-1,0),(1,1),(-1,1),(1,-1),(-1,-1));
var i: Integer;
    dx, dy: Integer;
begin
  if (x >= 0) and (x < 10) and (y >= 0) and (y < 10) and (Board1.layers[0][X,Y].state=0) then
  begin
    for i := 1 to 8 do
    begin
      dx := x + d[i,1];
      dy := y + d[i,2];
      if (dx >= 0) and (dx < 10) and (dy >= 0) and (dy < 10) and (Board1.layers[0][dx,dy].state > 0) then
      begin
        Result := False;
        Exit;
      end; {if}
    end; {for}
    Result := True;
  end else Result := False;
end;
procedure Ships (var board1: TCellGameBoard);
var N, M, i: Integer;
    x, y, kx, ky: Integer;
    B: Boolean;
begin
  randomize();
  for N := 3 downto 0 do
    for M := 0 to 3 - N do
    repeat
      x := Random (10);
      y := Random (9);
      kx := Random (2);
      if kx = 0 then ky := 1
                else ky := 0;
      B := True;
      for i := 0 to N do
        if not Freedom (x + kx * i, y + ky * i, board1) then B := False;
      if B then
        for i := 0 to N do
          Board1.layers[0][x+kx*i,y+ky*i].state := 1;
    until B;


end;


          procedure Ships1 (var board2: TCellGameBoard);
var N, M, i: Integer;
    x, y, kx, ky: Integer;
    B: Boolean;
begin
  randomize();
  for N := 3 downto 0 do
    for M := 0 to 3 - N do
    repeat
      x := Random (10);
      y := Random (9);
      kx := Random (2);
      if kx = 0 then ky := 1
                else ky := 0;
      B := True;
      for i := 0 to N do
        if not Freedom (x + kx * i, y + ky * i, board2) then B := False;
      if B then
        for i := 0 to N do
          Board2.layers[0][x+kx*i,y+ky*i].state := 2;
    until B;


end;
procedure TForm3.button3Click(Sender: TObject);
var X, Y: Integer;
begin
  Randomize;
  for X := 0 to Board1.ColCnt-1 do
    for Y := 0 to Board1.ColCnt-1 do
      Board1.layers[0][X,Y].State:=0;
ships(board1);
button2.Enabled:=False;
button4.Enabled:=False;
button8.Enabled:=False;
button9.Enabled:=False;
end;
procedure TForm3.board1CellMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; Col, Row, X, Y: Integer);
  var B,A: Boolean ;
  kx,ky,i:integer;
begin
button2.Enabled:=True;
button4.Enabled:=True;
button8.Enabled:=True;
button9.Enabled:=True;
  if o=1 then begin
  if z<4 then
                       begin

                             if  not Freedom (col,row, board1) then b:=False;
                             if b then  Board1.layers[0][col,row].State:=1;
                             if b then z:=z+1;
                             if not b then ShowMessage('Неправильное местоположение');

                          end else ShowMessage('Уже имеется 4 однопалубых корабля') ;
                          end;
                          o:=0;

                        case radiogroup3.itemindex of
                                0:kx:=1;
                                1:ky:=1 ;
                                end;


                                if q=1 then
                                begin
                                  if w<3 then
                                  begin

                                  a:= True;
                                  if kx = 0 then ky := 1
                else ky := 0;
      for i := 0 to 1 do
        if not Freedom (col+kx*i  {kx * 1}, row +ky*i {ky * 1}, board1) then a := False;

              if a then w:=w+1;
              if a then begin
              for i := 0 to 1 do
                 Board1.layers[0][col+ kx * i,row + ky * i].State:=1 ;
                 end;
                  if not a then ShowMessage('Неправильное местоположение');


                end else ShowMessage('Уже имеется 3 Двухпалубныйх корабля');
                end;
                q:=0;
                if zz=1 then
                                begin
                                  if ww<2 then
                                  begin

                                  a:= True;
                                  if kx = 0 then ky := 1
                else ky := 0;
      for i := 0 to 2 do
        if not Freedom (col+kx*i  {kx * 1}, row +ky*i {ky * 1}, board1) then a := False;

              if a then ww:=ww+1;
              if a then begin
              for i := 0 to 2 do
                 Board1.layers[0][col+ kx * i,row + ky * i].State:=1 ;
                 end;
                  if not a then ShowMessage('Неправильное местоположение');


                end else ShowMessage('Уже имеется 2 трёхпалубника корабля');
                end;
                zz:=0;
                 if zzz=1 then
                                begin
                                  if www<1 then
                                  begin

                                  a:= True;
                                  if kx = 0 then ky := 1
                else ky := 0;
      for i := 0 to 3 do
        if not Freedom (col+kx*i  {kx * 1}, row +ky*i {ky * 1}, board1) then a := False;

              if a then www:=www+1;
              if a then begin
              for i := 0 to 3 do
                 Board1.layers[0][col+ kx * i,row + ky * i].State:=1 ;
                 end;
                  if not a then ShowMessage('Неправильное местоположение');


                end else ShowMessage('Уже имеется четырёхпалубный корабль');
                end;
                zzz:=0;
              o:=0;
              q:=0;
            board1.enabled:=false;

            kx:=0;
                                ky:=0;
end;



procedure TForm3.FormCreate(Sender: TObject);
var x,y:Integer;
begin
k4:=1;
k3:=2;
k2:=3;
k1:=4;
z:=0;
w:=0;
q:=0;
o:=0 ;
p:=0;
kx:=0;
  ky:=0;
  zz:=0;
ww:=0;
zzz:=0;
www:=0;

         for X:=0 to Board1.ColCnt-1 do
     for Y:=0 to Board1.RowCnt-1 do
Board1.layers[0][X,Y].State:=0           ;
   board1.enabled:=false ;
   board2.enabled:=false ;
end;

procedure TForm3.button2Click(Sender: TObject);
begin
    board1.Enabled:=True;
    o:=1;
    button2.Enabled:=False;
button4.Enabled:=False;
button8.Enabled:=False;
button9.Enabled:=False;
end;

procedure TForm3.button4Click(Sender: TObject);
begin
board1.Enabled:=True;
q:=1 ;
button2.Enabled:=False;
button4.Enabled:=False;
button8.Enabled:=False;
button9.Enabled:=False;
end;

procedure TForm3.button5Click(Sender: TObject);
var X, Y: Integer;
b:Boolean;
begin
  p:=0;
for X:=0 to Board1.ColCnt-1 do
     for Y:=0 to Board1.RowCnt-1 do
     if Board1.layers[0][X,Y].State=1 then p:=p+1   ;

  if  p=20 then
  begin

  radiogroup2.Visible:=True;

  pnl2.visible:=false;
  radiogroup3.visible:=false;
   button2.visible:=false;
  button4.visible:=false;
  button8.visible:=false;
  button9.visible:=false;
  pnl1.visible:=true;
  button3.Visible:=false;
  button7.Visible:=false;
  button5.Visible:=false;
  button6.Visible:=true;
  Randomize;
           button3.Enabled:=False;
  for X := 0 to Board1.ColCnt-1 do
    for Y := 0 to Board1.ColCnt-1 do
      Board2.layers[0][X,Y].State:=0;
      z:=0;
ships1(board2);

board2.Enabled:=True;
      end
      else ShowMessage('Корабли не расставлены');

end;



procedure TForm3.button6Click(Sender: TObject);
const d: array[1..8,1..2] of Integer =
      ((0,1),(1,0),(0,-1),(-1,0),(1,1),(-1,1),(1,-1),(-1,-1));
var i,ii,iii,iiii,iiiii: Integer;
    dx, dy,x,y,xx,yy: Integer;

begin
case radiogroup2.itemindex of
                                0:kkk:=0;
                                1:kkk:=1;

                                end;
                             if kkk=1 then
                             begin
                                mp1.FileName:=('sounds/shot.mp3');
mp1.Open;
mp1.Play;
end;

         repeat
         x := Random (10);
      y := Random (9);

             repeat
               z:=1;

    if  Board1.layers[0][X,Y].State=0
    then
    begin
     Board1.layers[0][X,Y].State:=3  ;
      b:=1;
      end;
    until z=1 ;
    if  Board1.layers[0][X,Y].State=1
    then  begin Board1.layers[0][X,Y].State:=4;
    if  Board1.layers[0][X,Y].State=4 then
    begin
      aaa:=0;
            p:=0;
    z:=0;
         for i := 1 to 8 do
    begin
      dx := x + d[i,1];
      dy := y + d[i,2];
      if  (dx >= 0) and (dx < 10) and (dy >= 0) and (dy < 10) and (Board1.layers[0][dx,dy].state=1) then
      begin
      aaa:=aaa+1;
               break
      end;
      end;
        for i := 1 to 8 do
    begin
      dx := x + d[i,1];
      dy := y + d[i,2];
        if  (dx >= 0) and (dx < 10) and (dy >= 0) and (dy < 10) and (Board1.layers[0][dx,dy].state=4) then
        begin

        xx:=dx;
        yy:=dy;
        //2 ячейка
          for ii := 1 to 8 do
    begin
      dx := xx + d[ii,1];
      dy := yy + d[ii,2];
      if  (dx >= 0) and (dx < 10) and (dy >= 0) and (dy < 10) and (Board1.layers[0][dx,dy].state=1) then
      begin
      aaa:=aaa+1;
        break
      end   ;
        end;
        for ii := 1 to 8 do
    begin
      dx := xx + d[ii,1];
      dy := yy + d[ii,2];
        if  (dx >= 0) and (dx < 10) and (dy >= 0) and (dy < 10) and (Board1.layers[0][dx,dy].state=4) then
        begin
            xx:=dx;
        yy:=dy;
        //3 ячейка
            for iii := 1 to 8 do
    begin
      dx := xx+ d[iii,1];
      dy := yy + d[iii,2];
      if  (dx >= 0) and (dx < 10) and (dy >= 0) and (dy < 10) and (Board1.layers[0][dx,dy].state=1) then
      begin
      aaa:=aaa+1;

            break
           end;
      end;
     end;
     end;

                                            end;
                                   end;
                                    if aaa=0 then
     begin


        ///
        dx :=0;
    dy := 0;
  if  (Board1.layers[0][x,y].state=4) then
  begin
         Board1.layers[0][x,y].state:=5 ;
         stat:=stat+1;
    for i := 1 to 8 do
    begin
      dx := x + d[i,1];
      dy := y + d[i,2];
      if  (dx >= 0) and (dx < 10) and (dy >= 0) and (dy < 10) and (Board1.layers[0][dx,dy].state=0) then
         Board1.layers[0][dx,dy].state:=3;
         end;
            for ii := 1 to 8 do
    begin
      dx := x + d[ii,1];
      dy := y + d[ii,2];
      if  (dx >= 0) and (dx < 10) and (dy >= 0) and (dy < 10) and (Board1.layers[0][dx,dy].state=4) then
                                    begin

                                    x:=dx;
        y:=dy        ;
        Board1.layers[0][x,y].state:=5 ;
         stat:=stat+1;
        for i := 1 to 8 do
        begin
           dx := x + d[i,1];
      dy := y + d[i,2];
      if  (dx >= 0) and (dx < 10) and (dy >= 0) and (dy < 10) and (Board1.layers[0][dx,dy].state=0) then
         Board1.layers[0][dx,dy].state:=3;
         end;
                 for iii := 1 to 8 do
    begin
      dx := x + d[iii,1];
      dy := y + d[iii,2];
      if  (dx >= 0) and (dx < 10) and (dy >= 0) and (dy < 10) and (Board1.layers[0][dx,dy].state=4) then
                                    begin

                                    x:=dx;
        y:=dy        ;
        Board1.layers[0][x,y].state:=5 ;
         stat:=stat+1;
        for i := 1 to 8 do
        begin
           dx := x + d[i,1];
      dy := y + d[i,2];
      if  (dx >= 0) and (dx < 10) and (dy >= 0) and (dy < 10) and (Board1.layers[0][dx,dy].state=0) then
         Board1.layers[0][dx,dy].state:=3;
         end;
         for iiii := 1 to 8 do
    begin
      dx := x + d[iiii,1];
      dy := y + d[iiii,2];
      if  (dx >= 0) and (dx < 10) and (dy >= 0) and (dy < 10) and (Board1.layers[0][dx,dy].state=4) then
                                    begin

                                    x:=dx;
        y:=dy        ;
        Board1.layers[0][x,y].state:=5 ;
         stat:=stat+1;
        for i := 1 to 8 do
        begin
           dx := x + d[i,1];
      dy := y + d[i,2];
      if  (dx >= 0) and (dx < 10) and (dy >= 0) and (dy < 10) and (Board1.layers[0][dx,dy].state=0) then
         Board1.layers[0][dx,dy].state:=3;
         end;
                      end;
                      end;
                      end;
                      end;
                      end;
                      end;
                      end;
                      end;


     end;

                                           end;

        until b=1;

        p:=0;
         for X:=0 to Board1.ColCnt-1 do
        for Y:=0 to Board1.RowCnt-1 do
     if Board1.layers[0][X,Y].State=1 then p:=p+1   ;

     if p=0 then begin
     ShowMessage('Вы проиграли')  ;
     button6.Enabled:=false;
     board2.Enabled:=False;

     end;



        b:=0;
        z:=0;
        board2.enabled:=true;
end;



procedure TForm3.tmr1Timer(Sender: TObject);
begin
if t=1 then board2.Enabled:=True;
t:=0;
end;

procedure TForm3.button7Click(Sender: TObject);
var x,y:Integer;
begin
  button2.Enabled:=true;
  button4.Enabled:=true;
  button8.Enabled:=true;
  button9.Enabled:=true;
for X:=0 to Board1.ColCnt-1 do
     for Y:=0 to Board1.RowCnt-1 do
Board1.layers[0][X,Y].State:=0 ;
o:=0;
q:=0;
z:=0;
w:=0;
zz:=0;
ww:=0;
zzz:=0;
www:=0;
end;

procedure TForm3.button8Click(Sender: TObject);
begin
board1.Enabled:=True;
zz:=1;
button2.Enabled:=False;
button4.Enabled:=False;
button8.Enabled:=False;
button9.Enabled:=False;
end;

procedure TForm3.button9Click(Sender: TObject);
begin
board1.Enabled:=True;
zzz:=1;
button2.Enabled:=False;
button4.Enabled:=False;
button8.Enabled:=False;
button9.Enabled:=False;
end;
procedure TForm3.N1Click(Sender: TObject);
var x,y:Integer;
begin
  radiogroup2.Visible:=false;
  pnl2.visible:=true;
  radiogroup3.visible:=true;
   button2.visible:=true;
  button4.visible:=true;
  button8.visible:=true;
  button9.visible:=true;
  pnl1.visible:=false;
  button3.Visible:=true;
  button7.Visible:=true;
  button5.Visible:=true;
  button6.Visible:=false;
  Randomize;
           button3.Enabled:=true;
 button2.Enabled:=true;
  button4.Enabled:=true;
  button8.Enabled:=true;
  button9.Enabled:=true;
for X:=0 to Board1.ColCnt-1 do
     for Y:=0 to Board1.RowCnt-1 do
     begin
Board1.layers[0][X,Y].State:=0 ;
Board2.layers[0][X,Y].State:=0 ;
end;
o:=0;
q:=0;
z:=0;
w:=0;
zz:=0;
ww:=0;
zzz:=0;
www:=0;
k4:=1;
k3:=2;
k2:=3;
k1:=4;
z:=0;
w:=0;
q:=0;
o:=0 ;
p:=0;
kx:=0;
  ky:=0;
  zz:=0;
ww:=0;
zzz:=0;
www:=0;

         for X:=0 to Board1.ColCnt-1 do
     for Y:=0 to Board1.RowCnt-1 do
Board1.layers[0][X,Y].State:=0           ;
   board1.enabled:=false ;
   board2.enabled:=false ;
   Label5.caption:=IntToStr(k4);
                      Label4.caption:=IntToStr(k3);
                      Label3.caption:=IntToStr(k2);
                      Label2.caption:=IntToStr(k1);
end;

procedure TForm3.N3Click(Sender: TObject);
begin
Form4.close;
end;

procedure TForm3.N2Click(Sender: TObject);
begin
form2.show;
end;

procedure TForm3.N4Click(Sender: TObject);
begin
form5.show;
end;

procedure TForm3.N5Click(Sender: TObject);
var t:textfile;
begin
ShellExecute(0,PChar('open'),PChar('Справка.chm'),nil,nil,SW_SHOW);
end;

end.
