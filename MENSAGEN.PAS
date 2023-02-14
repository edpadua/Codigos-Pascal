unit mensagen;
interface

function mensagem(var num:integer):string;



implementation

function mensagem(var num:integer):string;
begin
     case num of
          0:mensagem:='Zero';
          1:mensagem:='Um';
          2:mensagem:='Dois';
          3:mensagem:='Trˆs';
          4:mensagem:='Quatro';
          5:mensagem:='Cinco';
          6:mensagem:='Seis';
          7:mensagem:='Sete';
          8:mensagem:='Oito';
          9:mensagem:='Nove';
          10:mensagem:='Dez';
     else
          mensagem:='Inv lido';
     end;

end;

end.