program maior;
uses crt;

const Max=5;

type v=array[1..max] of integer;
     vet=record
           chave:v;
           nele:integer;
         end;

    sentido=(esquerda,direita);

var vetor:vet;
    op:integer;
    sair:boolean;

procedure criar( var vetor:vet);
var indice: integer;
begin
    for indice:=1 to Max do
    begin
         vetor.chave[indice]:=0;
    end;
    vetor.nele:=0;
end;

function fim ( var vetor:vet ):integer;
begin
     fim:=vetor.nele+1;
end;

function cheio( var vetor:vet):boolean;
begin
     if (vetor.nele=max) then
        cheio:=true
     else
        cheio:=false;
end;

function vazio( var vetor:vet):boolean;
begin
     if vetor.nele=0 then
        vazio:=true
     else
        vazio:=false;
end;

procedure ler_vetor( var vetor: vet );
var indice:integer;
begin
     for indice:=1 to 4 do
         readln(vetor.chave[indice]);
end;


procedure imprimir_vetor( var vetor: vet );
var indice:integer;
begin
     for indice:=1 to vetor.nele do
         writeln(vetor.chave[indice]);
end;

function menor( var vetor: vet ):integer;
var indice1,indice2,inicio,me:integer;
begin
     me:=vetor.chave[1];
     for inicio:=1 to max-1 do
     begin
               for indice1:=inicio to max do
               begin
                    if ( me>vetor.chave[indice1] ) then
                         me:=vetor.chave[indice1];
               end;
     end;
     menor:=me;
end;

function maiorv( var vetor: vet ):integer;
var indice1,indice2,inicio,ma:integer;
begin
     ma:=vetor.chave[1];
     for inicio:=1 to vetor.nele-1 do
     begin
               for indice1:=inicio to vetor.nele do
               begin
                    if ( ma<vetor.chave[indice1] ) then
                         ma:=vetor.chave[indice1];
               end;
     end;
     maiorv:=ma;
end;

procedure ordena( var vetor: vet );
var inicio,indice1,indice2,me,aux1:integer;
begin

     for inicio:=1 to vetor.nele-1 do
     begin
        me:=vetor.chave[inicio];
        for indice1:=inicio+1  to vetor.nele do
        begin
             if vetor.chave[indice1]<me then
             begin
                 me:=vetor.chave[indice1];
                 aux1:=indice1;
             end;
        end;
        vetor.chave[aux1]:=vetor.chave[inicio];
        vetor.chave[inicio]:=me;
     end;

end;

procedure ordena2( var vetor: vet);
var indice1,me,aux,inicio:integer;
begin
     for inicio:=1 to vetor.nele-1 do
     begin
         me:=vetor.chave[inicio];
         for indice1:=inicio+1 to vetor.nele do
         begin
              if (me>vetor.chave[indice1]) then
              begin
                   me:=vetor.chave[indice1];
                   aux:=indice1;
              end;
         end;
         vetor.chave[aux]:=vetor.chave[inicio];
         vetor.chave[inicio]:=me;
     end;
end;

procedure deslocamento( var vetor: vet; posicao: integer; sentido: sentido);
var indice:integer;
begin
     if sentido=esquerda then
        for indice:=posicao to vetor.nele-1 do
              vetor.chave[indice]:=vetor.chave[indice+1]
     else
        for indice:=vetor.nele+1 downto posicao do
              vetor.chave[indice]:=vetor.chave[indice-1];

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
         if(vetor.chave[indice]>ele) then
         begin
              fim:=true;
              pos:=indice;
              achou:=true;
         end;
         if indice=vetor.nele then
            fim:=true;
         indice:=indice+1;
     end;
     busca:=pos;

end;

function busca2( var vetor: vet; ele: integer; var achou: boolean ):integer;
var pos,indice:integer;
    fim:boolean;
begin
     fim:=false;
     achou:=false;
     indice:=1;
     while not fim do
     begin
         if(vetor.chave[indice]=ele) then
         begin
              fim:=true;
              pos:=indice;
              achou:=true;
         end;
         if indice=vetor.nele then
            fim:=true;
         indice:=indice+1;
     end;
     busca2:=pos;

end;

function Busca_binaria( var vetor:vet; valor:integer ):integer;
var inicio,final,meio:integer;
begin
     inicio:=1;
     final:=vetor.nele;
     if ( vazio( vetor ) ) then
         Busca_binaria:=fim(vetor)
     else
         while inicio<=final do
         begin
              meio:=(inicio+final)div 2;
              if vetor.chave[meio]=valor then
              begin
                  inicio:=vetor.nele+1;
                  Busca_binaria:=meio;
              end
              else
                  if valor>vetor.chave[meio] then
                     inicio:=meio+1
                  else
                     final:=meio-1;
         end;

end;


procedure interf_busca( var vetor:vet);
var valor,posicao:integer;
    achou:boolean;
begin
     if not (vazio(vetor)) then
     begin
        writeln('Entre com o a valor a ser pesquisado');
        readln(valor);
        posicao:=Busca_binaria( vetor, valor );
        if (posicao<>fim(vetor)) then
           writeln('O valor foi encontrado na posiá∆o ',posicao)
        else
           writeln('O valor n∆o foi encontrado');
     end
     else
         writeln('A lista esta vazia');
end;



procedure insere_ord( var vetor :vet);
var valor,posicao:integer;
    achou:boolean;
begin
     if not (cheio(vetor)) then
     begin
          writeln('Digite o valor a ser inserido');
          readln(valor);
          if (vazio(vetor)) then
               vetor.chave[1]:=valor
          else
          begin
               posicao:=busca(vetor,valor,achou);
               if achou then
               begin
                    writeln(posicao);
                    deslocamento(vetor,posicao,direita);
                    vetor.chave[posicao]:=valor;
               end
               else
                    vetor.chave[vetor.nele+1]:=valor;
          end;
          vetor.nele:=vetor.nele+1;
     end
     else
         writeln('Vetor Cheio');
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
         if(vetor.chave[indice]>ele) then
         begin
              fim:=true;
              pos:=indice;
         end;
         if indice=vetor.nele then
            fim:=true;
         indice:=indice+1;
     end;
     writeln('A posiá∆o Ç ',pos);
end;

procedure remover( var vetor: vet);
var valor,posicao:integer;
    achou:boolean;
begin
     writeln('Que valor deseja remover');
     readln(valor);
     posicao:=busca2(vetor,valor,achou);
     if achou then
     begin
        writeln(posicao);
        deslocamento(vetor,posicao,esquerda);
        vetor.nele:=vetor.nele-1
     end
     else
        writeln('Valor n∆o encontrado');
end;

procedure menu;
begin
     clrscr;
     writeln;
     writeln('Escolha a operaá∆o');
     writeln('--------------------------');
     writeln('1:Destruir a lista');
     writeln;
     writeln('2:Inserir ordenadamente');
     writeln;
     writeln('3:Remover um item da lista');
     writeln;
     writeln('4:Buscar um dado na lista');
     writeln;
     writeln('5:Imprimir toda lista');
     writeln;
     writeln('6:Verificar se est† cheia');
     writeln;
     writeln('7:Verificar se a lista est† vazia');
     writeln;
     writeln('8:Deslocar a lista');
     writeln;
     writeln('9:Inserir dado em posiá∆o especifica');
     writeln;
     writeln('10:Busca de um elemento');
     writeln;
     writeln('11:Ordenar lista');
     writeln;
     writeln('12:Sair do programa');
end;

procedure selecao(var vetor: vet;var op:integer;var sair:boolean);
begin
   readln(op);
   case op of
               1:writeln('Destruir a lista');
               2:begin
                      clrscr;
                      writeln('Inserir dados ordenadamente lista');
                      insere_ord(vetor);
                      readkey;
                 end;
               3:begin
                      clrscr;
                      writeln('Remover um item da lista');
                      Remover(vetor);
                      readkey;
                 end;
               4:begin
                      writeln('Buscar um dado na lista');
                      interf_busca(vetor);
                      readkey;
                 end;
               5:begin
                      clrscr;
                      writeln('Imprimir toda lista');
                      Imprimir_vetor(vetor);
                      readkey;
                 end;
               6:begin
                      clrscr;
                      writeln('Verificar se esta cheia');
                      writeln(cheio(vetor));
                      readkey;
                 end;
               7:begin
                      clrscr;
                      writeln('Verificar se esta vazia');
                      writeln(vazio(vetor));
                      readkey;
                 end;
               8:begin
                      clrscr;
                      writeln('Deslocar a lista');
                     { writeln('Deslocar a partir de qual posicao');
                      readln(posicao1);
                      deslocar(cadastro,posicao1,'direita'); }
                      readkey;
                 end;
               9:begin
                      clrscr;
                      writeln('Inserir em posiá∆o especifica');
                    {  writeln('Inserir em qual posicao ?');
                      readln(posicao1);
                      inserirposicao(vetor,posicao1);}
                      readkey;
                  end;
               10:begin
                      clrscr;
                      writeln('Busca');
                    {  InterfaceBusca(vetor);}
                      readkey;
                 end;
               11:begin
                      writeln('Ordenar lista');
                      ordena2(vetor);
                      readkey;
                 end;
               12:begin
                      writeln('sair do programa');
                      sair:=true;
                      readkey;
                 end;
          else
              writeln('Opcao invalida');
          end;
          clrscr;
end;

begin
     criar(vetor);
     while not (sair) do
     begin
       menu;
       selecao(vetor,op,sair);
     end;
     readkey;

end
.