program maior;
uses crt;

const Max=5;

type vet=array[1..max] of integer;

var vetor:vet;

procedure ler_vetor( var vetor: vet );
var indice:integer;
begin
     for indice:=1 to 4 do
         readln(vetor[indice]);
end;


procedure imprimir_vetor( var vetor: vet );
var indice:integer;
begin
     for indice:=1 to max do
         writeln(vetor[indice]);
end;

function menor( var vetor: vet ):integer;
var indice1,indice2,inicio,me:integer;
begin
     me:=vetor[1];
     for inicio:=1 to max-1 do
     begin
               for indice1:=inicio to max do
               begin
                    if ( me>vetor[indice1] ) then
                         me:=vetor[indice1];
               end;
     end;
     menor:=me;
end;

function maiorv( var vetor: vet ):integer;
var indice1,indice2,inicio,ma:integer;
begin
     ma:=vetor[1];
     for inicio:=1 to max-1 do
     begin
               for indice1:=inicio to max do
               begin
                    if ( ma<vetor[indice1] ) then
                         ma:=vetor[indice1];
               end;
     end;
     maiorv:=ma;
end;

procedure ordena( var vetor: vet );
var inicio,indice1,indice2,me,aux1:integer;
begin

     for inicio:=1 to max-1 do
     begin
        me:=vetor[inicio];
        for indice1:=inicio+1  to max do
        begin
             if vetor[indice1]<me then
             begin
                 me:=vetor[indice1];
                 aux1:=indice1;
             end;
        end;
        vetor[aux1]:=vetor[inicio];
        vetor[inicio]:=me;
     end;

end;

procedure ordena2( var vetor: vet);
var indice1,me,aux,inicio:integer;
begin


     for inicio:=1 to max-1 do
     begin
         me:=vetor[inicio];
         for indice1:=inicio+1 to max do
         begin
              if (me>vetor[indice1]) then
              begin
                   me:=vetor[indice1];
                   aux:=indice1;
              end;
         end;
         vetor[aux]:=vetor[inicio];
         vetor[inicio]:=me;
     end;
end;

procedure deslocamento( var vetor: vet; posicao: integer);
var indice:integer;
begin
     for indice:=max downto posicao do
     begin
          vetor[indice]:=vetor[indice-1];
     end;
end;


function busca( var vetor: vet; ele: integer; var achou: boolean ):integer;
var pos,indice:integer;
    fim:boolean;
begin
     fim:=false;
     achou:=false;
     indice:=1;
     while not fim do
     begin
         if(vetor[indice]>ele) then
         begin
              fim:=true;
              pos:=indice;
              achou:=true;
         end;
         if indice=max then
            fim:=true;
         indice:=indice+1;
     end;
     busca:=pos;

end;


procedure insere_ord( var vetor :vet);
var valor,posicao:integer;
    achou:boolean;
begin
     writeln('Digite o valor a ser inserido');
     readln(valor);
     posicao:=busca(vetor,valor,achou);
     if achou then
     begin
          deslocamento(vetor,posicao);
          vetor[posicao]:=valor;
     end;
end;
procedure maiorlista( var vetor: vet);
var ele,pos,indice:integer;
    fim:boolean;
begin
     fim:=false;
     writeln('Digite elemento');
     readln(ele);
     indice:=1;
     while not fim do
     begin
         if(vetor[indice]>ele) then
         begin
              fim:=true;
              pos:=indice;
         end;
         if indice=max then
            fim:=true;
         indice:=indice+1;
     end;
     writeln('A posiá∆o Ç ',pos);
end;


begin
     clrscr;
     writeln('Leitura do vetor');
    { ler_vetor(vetor);}
     vetor[1]:=4;
     insere_ord(vetor);
     insere_ord(vetor);
     insere_ord(vetor);
     insere_ord(vetor);
     writeln('Impress∆o do vetor');
   {  imprimir_vetor(vetor); }
     writeln;
   (*  writeln('O menor valor Ç: ', menor(vetor));
     writeln('O maior valor Ç: ', maiorv(vetor));
     ordena2(vetor);
     deslocamento(vetor);*)
     imprimir_vetor(vetor);
     writeln;
    (* maiorlista(vetor);*)
     readkey;

end
.