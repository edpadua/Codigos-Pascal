program grafico;
uses graph,crt;
var controlador,modo,erro:integer;
begin
controlador:=detect;
initgraph(controlador,modo,'c:\PROGRA~1\TP\bgi');
setbkcolor(15);
setcolor(23);
rectangle(600,325,100,200);
setcolor(7);
circle(121,200,50);
setcolor(12);
fillellipse(120,11,43,43);
setcolor(25);
settextstyle(4,0,6);
outtextxy(150,234,'Iniciando o Doors ');
readkey;
closegraph;
clrscr;
textbackground(2);
textcolor(4);
writeln('Esse o mais novo sistema operacional Doors');
gotoxy(23,180);
writeln('Nem Windows nem Dos');
writeln('e sim Doors');
textbackground(7);
writeln('O que tem de ruim no Windows com o que tem de pior no Dos');
readkey;
end.
