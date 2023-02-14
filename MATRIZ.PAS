program tempo;
uses crt,dos;
type mat= array[1..3,1..3] of real;
var a:mat;
    d:real;
procedure lematriz(var mat1:mat);
var i,j,x,y:integer;
begin
     x:=20;
     y:=10;
     for i:=1 to 3 do
     begin
          for j:=1 to 3 do
          begin
          gotoxy(x,y);
          read(mat1[i,j]);
          x:=x+4;
          end;
     x:=20;
     y:=y+2;
     end;
end;
procedure imprime_matriz(var mat1:mat);
var i,j,x,y:integer;
begin
     x:=20;
     y:=20;
     for i:=1 to 3 do
     begin
          for j:=1 to 3 do
          begin
          gotoxy(x,y);
          writeln(mat1[i,j]:1:0);
          x:=x+4;
          end;
          x:=20;
          y:=y+2;
     end;
end;
function determinante(mat1:mat):real;
var dp1,dp2:real;
begin
dp1:=(mat1[1,1]*mat1[2,2]*mat1[3,3]+mat1[1,2]*mat1[2,3]*mat1[3,1]+mat1[1,3]*mat1[2,1]*mat1[3,2]);
dp2:=(mat1[3,1]*mat1[2,2]*mat1[1,3]+mat1[3,2]*mat1[2,3]*mat1[1,1]+mat1[3,3]*mat1[2,1]*mat1[1,2]);
determinante:=dp1-dp2;
end;

begin
clrscr;
writeln('Digite os valores da Matriz');
lematriz(a);
writeln('a matriz ‚');
writeln;
textcolor(6);
imprime_matriz(a);
writeln('A determinante da matriz ‚: ',determinante(a):1:0);
readkey;
end.