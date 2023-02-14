program listdin;

uses crt;


type pont=^lista;

     tipochave= integer;

     lista= record
                  chave:tipochave;
                  prox:pont;
            end;


var L:pont;
    sair:boolean;


procedure CriarLista( var L:pont );
begin
     L:=nil;
end;

procedure DestruirLista( var L:pont );
begin
     dispose( L );
end;

function InserePrimeiro( var L:pont; Dado:tipochave ):boolean;
var p:pont;
begin
     if L=nil then
     begin
        new( p );
        p^.chave:=Dado;
        p^.prox:=nil;
        L:=p;
        InserePrimeiro:=true;
     end
     else
        InserePrimeiro:=false;
end;


procedure InsereInicio( var L:pont; Dado:tipochave );
var p:pont;
begin
    new(p);
    p^.chave:=Dado;
    p^.prox:=L;
    L:=p;
end;

function PrimeiroE( L:pont ):tipochave;
begin
     PrimeiroE:=L^.chave;
end;

function UltimoE( L:pont ):tipochave;
var p:pont;
begin

          p:=L;
          while ( p^.prox<>nil ) do
                p:=p^.prox;
          UltimoE:=p^.chave;
end;


function Conta( L:pont ):integer;
var p:pont;
    count:integer;
begin
    count:=0;
    if L=nil then
       Conta:=count
    else
    begin
    p:=l;
    count:=1;
         while ( p^.prox<>nil ) do
         begin
              p:=p^.prox;
              count:=count+1;
         end;
         Conta:=count;
    end;
end;


procedure InsereDepois( var p:pont; Dado:tipochave );
var aux:pont;
begin
    new( aux );
    aux^.chave:=Dado;
    aux^.prox:=p^.prox;
    p^.prox:=aux;
end;



procedure InsereUltimo ( var pa:pont; Dado:tipochave );
var p:pont;
begin
     new( p );
     p^.chave:=Dado;
     p^.prox:=nil;
     pa^.prox:=p;
end;


procedure InserePilha( var L:pont; Dado:tipochave );
var p:pont;
begin
    if L=nil then
       InsereInicio( L, Dado )
    else
    begin
       p:=L;
       while ( p^.prox<>nil ) do
             p:=p^.prox;
       InsereUltimo ( p, Dado);
    end;
end;


procedure InsereIes( var L:pont; Dado:tipochave; posicao:integer );
var pa,p:pont;
    count:integer;
    fim:boolean;
begin
     if (posicao=1) or ( L=nil ) then
        InsereInicio( L, Dado )
     else
     begin
        p:=L;
        pa:=nil;
        count:=0;
        fim:=false;
        while ( fim=false ) do
        begin
             pa:=p;
             p:=p^.prox;
             count:=count+1;
             if count=posicao-1 then
                fim:=true;
        end;
        if pa^.prox=nil then
           InsereUltimo ( pa, Dado)
        else
           InsereDepois( pa , Dado );
     end;

end;


function InsereOrd( var L:pont; Dado:tipochave ):boolean;
var p,pa:pont;
    fim:boolean;
begin
    InsereOrd:=true;
    if L=nil then
       InserePrimeiro(  L, Dado )
    else
    begin
         if Dado<L^.chave then
            InsereInicio( L, Dado )
         else
         begin
              fim:=false;
              p:=L;
              pa:=nil;
              if Dado=L^.chave then
              begin
                 fim:=true;
                 InsereOrd:=false;
              end;
              while ( fim=false ) do
              begin
                   if ( Dado<=p^.prox^.chave )  or ( p^.prox=nil ) then
                        fim:=true;
                   pa:=p;
                   p:=p^.prox;
              end;
              if pa^.prox=nil then
                  InsereUltimo ( pa, Dado)
              else
                  if Dado=p^.chave then
                     InsereOrd:=false
                  else
                     InsereDepois( pa , Dado );

         end;
    end;
end;


procedure RemoverFinal( var p:pont );
begin
     p^.prox:=nil;
end;



procedure RemoverInicio( var L:pont );
var p:pont;
begin
    p:=L^.prox;
    L:=p;
end;


procedure RemoverPosicao( var p:pont; var pa:pont );
begin
    pa^.prox:=p^.prox;
end;


function Remover2( var L:pont; var Dado:tipochave ):boolean;
var p,pa:pont;
    fim, ultimo:boolean;
begin
    ultimo:=false;
    fim:=false;
    if L=nil then
       Remover2:=false
    else
    begin
         if L^.chave=Dado then
         begin
              RemoverInicio( L );
              Remover2:=true;
         end
         else
         begin
              p:=L;
              pa:=nil;
              while ( fim=false ) do
              begin
                   pa:=p;
                   p:=p^.prox;
                   if p^.chave=Dado then
                        fim:=true;
                   if p^.prox=nil then
                   begin
                        fim:=true;
                        ultimo:=true;
                   end;
              end;
              if not ultimo then
              begin
                RemoverPosicao( p, pa );
                Remover2:=true;
              end
              else
              begin
                RemoverFinal( pa );
                Remover2:=true;
              end;
         end;
    end;

end;



function Remover( var L:pont; var Dado:tipochave ):boolean;
var p,pa,ant,aux:pont;
    fim,ultimo:boolean;
begin
     fim:=false;
     ultimo:=false;
     if L=nil then
        Remover:=false
     else
     begin
        if L^.chave=Dado then
           RemoverInicio( L )
        else
            ant:=nil;
            pa:=nil;
            p:=L;
            while ( fim=false ) do
            begin
                 if (Dado=p^.chave)  then
                    fim:=true;
                 if p^.prox=nil then
                 begin
                    fim:=true;
                    ultimo:=true;
                 end;
                 ant:=pa;
                 pa:=p;
                 p:=p^.prox;
            end;
            if Ultimo=true then
                 if Dado=pa^.prox^.chave then
                      RemoverFinal( ant )
                 else
                      Remover:=false
            else
                RemoverPosicao( p,ant );
     end;
end;



procedure ImprimirLista( L:pont );
var p:pont;
begin
    p:=L;
    clrscr;
    while ( p<>nil ) do
    begin
         writeln(p^.chave);
         p:=p^.prox;
   end;
   readkey;
end;


procedure Inter_Insere( var L: pont );
var Dado:tipochave;
begin
     clrscr;
     writeln('Digite o elemento a ser inserido');
     readln(Dado);
     InserePilha( L, Dado );
end;



procedure InterOrd( var L: pont );
var Dado:tipochave;
    possivel:boolean;
begin
     possivel:=false;
     clrscr;
     writeln('Digite o elemento a ser inserido');
     readln(Dado);
possivel:=InsereOrd( L, Dado );
     if ( possivel ) then
        writeln('Inserá∆o efetuada com sucesso')
     else
        writeln('Inserá∆o n∆o efetuada');
     readkey;
end;


{procedure InterBusca ( Primeiro:pont );
var Dado:tipochave;
    posicao: integer;
begin
     clrscr;
     writeln('Digite o elemento a ser procurado');
     readln(Dado);
     posicao:=Busca( Primeiro, Dado );
     if posicao=0 then
        writeln('Elemento n∆o encontrado')
     else
        writeln('Elemento est† na posiá∆o: ',posicao);
     readkey;
end;}


procedure InterConta( var L:pont );
begin
     clrscr;
     writeln('O n£mero de elementos Ç :',Conta( L ));
     readkey;
end;

procedure inter_insere2( var L:pont );
var Dado:tipochave;
    posicao: integer;
begin
     writeln('Digite o valor a ser inserido');
     readln(Dado);
     writeln('Digite a posicao onde inserir');
     readln(posicao);
     InsereIes( L, Dado, posicao );
end;



procedure Inter_remover(var L:pont );
var Dado:tipochave;
begin
     clrscr;
     writeln('Digite o elemento a ser removido');
     readln(Dado);
     if Remover2( L , Dado ) then
        writeln('Item removido')
     else
        writeln('Item n∆o encontrado');
     readkey;
end;


procedure selecao( var L:pont; var sair: boolean );
var op:integer;
begin
   op:=0;
   readln(op);
   case op of
               1:writeln('Destruir a lista');
               2:Inter_Insere( L );
               3:InterConta( L );
               4:begin end;{InterBusca ( Primeiro );}
               5:ImprimirLista( L );
               6:Inter_Insere2( L );
               7:Inter_remover( L );
               8:InterOrd( L );
               9:begin
                      writeln('sair do programa');
                      sair:=true;
                      readkey;
                 end;
          else
              writeln('Opcao invalida');
          end;
          clrscr;
end;


procedure menu;
begin
     clrscr;
     writeln;
     writeln('Escolha a operaá∆o');
     writeln('--------------------------');
     writeln('1:Destruir a lista');
     writeln;
     writeln('2:Inserir');
     writeln;
     writeln('3:Ver o n£mero de elementos da lista');
     writeln;
     writeln('4:Buscar um dado na lista');
     writeln;
     writeln('5:Imprimir toda lista');
     writeln;
     writeln('6:Inserir em posicao determinada');
     writeln;
     writeln('7:Remover elemento');
     writeln;
     writeln('8:Inserir ordenado');
     writeln;
     writeln('9:Sair do programa');
end;



begin
     {Criar ( Primeiro );}
     sair:=false;
     while sair=false do
     begin
          menu;
          selecao( L, sair );
     end;
     readkey;
end.