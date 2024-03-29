unit menus;

interface
uses crt;

procedure MenuAnimado;
procedure Menu1;
procedure MenuPrincipal;
procedure Escolha;
procedure invalidacao;
procedure intsoma;
procedure intsub;
procedure intmult;
procedure intdiv;
procedure saida;
function soma(var a: real; var b: real):real;
function subtracao(var a: real; var b: real):real;
function multiplicacao(var a: real; var b: real):real;
function divi(var a: real; var b: real):real;

implementation

procedure MenuAnimado;
var indice:integer;
begin
     for indice:=1 to 60 do
     begin
        clrscr;
        gotoxy(10,indice);
        writeln('///////////////0///////////////');
        gotoxy(10,indice+2);
        writeln('Calc Tosca vers�o 1.0 pr� Beta');
        gotoxy(10,indice+4);
        writeln('//////////////////////////////');
        gotoxy(10,indice+6);
        writeln('N�o se preocupe com o simples');
        gotoxy(10,indice+8);
        writeln('visual, na pr�xima vers�o ser�');
        gotoxy(10,indice+10);
        writeln('melhor, eu acho.');
        gotoxy(10,indice+12);
        writeln;
        gotoxy(10,indice+14);
        writeln('pressione qualquer tecla para iniciar o programa');
     end;
end;

procedure Menu1;
begin
        clrscr;
        writeln('//////////////////////////////');
        writeln('Calc Tosca vers�o 1.0 pr� Beta');
        writeln('//////////////////////////////');
        writeln('N�o se preocupe com o simples');
        writeln('visual, na pr�xima vers�o ser�');
        writeln('melhor.');
        writeln;
        writeln('pressione qualquer tecla para iniciar o programa');
end;

procedure MenuPrincipal;
begin
     clrscr;
     writeln('//////////////////');
     writeln('Selecione a op��o');
     writeln('//////////////////');
     writeln('1 : Soma');
     writeln('2 : Subtra��o');
     writeln('3 : Multiplica��o');
     writeln('4 : Divis�o');
     writeln('5 : Sair do programa ');
end;

procedure saida;
begin
clrscr;
gotoxy(25,10);
writeln('////////////////////////');
gotoxy(25,12);
writeln('Este � o fim para n�s');
gotoxy(25,14);
writeln('////////////////////////');
readkey;
halt;
end;

procedure Escolha;
var opcao:integer;
begin
     writeln;
     write(': ');
     readln(opcao);
     case opcao of
          1:intsoma;
          2:intsub;
          3:intmult;
          4:intdiv;
          5:saida;
     else
          invalidacao;
end;
end;

procedure invalidacao;
begin
     writeln('!!!!!!!!!!!!!!!!!!!!!');
     writeln('Esta op��o � invalida');
     writeln('!!!!!!!!!!!!!!!!!!!!!');
end;

procedure intsoma;
var a,b,c:real;
begin
     writeln('Digite o primeiro valor');
     writeln;
     readln(a);
     writeln('Digite o segundo valor');
     writeln;
     readln(b);
     c:=soma(a,b);
     writeln;
     writeln('O valor da soma � : ',c:2:2);
end;

function soma(var a: real; var b: real):real;
begin
     soma:=a+b;
end;

procedure intsub;
var a,b,c:real;
begin
     writeln('Digite o primeiro valor');
     writeln;
     readln(a);
     writeln('Digite o segundo valor');
     writeln;
     readln(b);
     c:=subtracao(a,b);
     writeln;
     writeln('O valor da subtra��o � : ',c:2:2);

end;

function subtracao(var a: real; var b: real):real;
begin
     subtracao:=a-b;
end;

procedure intmult;
var a,b,c:real;
begin
     writeln('Digite o primeiro valor');
     writeln;
     readln(a);
     writeln('Digite o segundo valor');
     writeln;
     readln(b);
     c:=multiplicacao(a,b);
     writeln('O valor da multiplica��o � : ',c:2:2);
end;

function multiplicacao(var a: real; var b: real):real;
begin
     multiplicacao:=a*b;
end;

procedure intdiv;
var a,b,c: real;
begin
     writeln('Digite o divisor');
     writeln;
     readln(a);
     writeln('Digite o denominador (que n�o seja zero)');
     writeln;
     readln(b);
     if b<>0 then
     begin
        c:=divi(a,b);
        writeln('O valor da divis�o � : ',c:2:2);
     end
     else
        writeln('!!!!!!!!!!!!!!!!!!!!!!!!');
        writeln('N�o h� divis�o por zero');
        writeln('!!!!!!!!!!!!!!!!!!!!!!!!');

end;

function divi(var a: real; var b: real):real;
begin
     divi:=a/b;
end;

end.