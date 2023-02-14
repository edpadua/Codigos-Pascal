program mensagem;
uses crt;
var y:integer;
begin
     clrscr;
       for y:=5 to 20 do
       begin
            gotoxy(4,y);
            writeln('Vocà n∆o conhece o poder do lado sombrio !!!');
       end;
readkey;
end.