program dinamico;
uses crt;

type
     tipochave=integer;

     pont=^Lista;

     Lista=record
                 chave:tipochave;
                 prox:pont;
           end;

var Primeiro, Ultimo:pont;
    sair:boolean;

procedure criar ( var  L:pont );
begin
     L:=nil;
end;


procedure InserirPrim( var Primeiro: pont; var Ultimo: pont; Dado:tipochave );
begin
    new(Primeiro);
    Primeiro^.chave:=Dado;
    Primeiro^.prox:=nil;
    Ultimo:=Primeiro;
end;

procedure Inserir( var Primeiro:pont; var Ultimo: pont; Dado:tipochave );
var p:pont;
begin
   if Primeiro=nil then
      InserirPrim( Primeiro, Ultimo, Dado )
   else
   begin
      new(p);
      p^.chave:=Dado;
      ultimo^.prox:=p;
      ultimo:=p;
      ultimo^.prox:=nil;
   end;
end;

procedure Inter_Insere( var Primeiro: pont; var Ultimo: pont );
var Dado:tipochave;
begin
     clrscr;
     writeln('Digite o elemento a ser inserido');
     readln(Dado);
     Inserir( Primeiro, Ultimo, Dado );
end;

procedure Imprimir( var Primeiro:pont );
var p:pont;
begin
     clrscr;
     p:=Primeiro;
     while ( p<>nil ) do
     begin
          writeln(p^.chave);
          p:=p^.prox;
     end;
     readkey;
end;

function Busca( Primeiro:pont; Dado: tipochave ):integer;
var p:pont;
    fim,achou:boolean;
    posicao,count:integer;
begin
     p:=Primeiro;
     fim:=false;
     achou:=false;
     count:=1;
     posicao:=0;
     while not fim do
     begin
          if p^.chave=Dado then
          begin
              achou:=true;
              fim:=true;
              posicao:=count;
          end
          else
          begin
              p:=p^.prox;
              count:=count+1;
          end;
          if p=nil then
          begin
               fim:=true;
               achou:=false;
          end;

     end;
     busca:=posicao;
end;

procedure InterBusca ( Primeiro:pont );
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
end;

procedure InserirInicio( var Primeiro:pont; Dado:tipochave );
var p:pont;
begin
     new(p);
     p^:=primeiro^;
     primeiro^.chave:=Dado;
     primeiro^.prox:=p;
end;



procedure Inserir2 ( var Primeiro:pont; var Ultimo:pont; Dado:tipochave; posicao:integer);
var p,aux:pont;
    count:integer;
begin
     count:=1;
     p:=Primeiro;
     new(aux);
     if posicao=1 then
        InserirInicio( Primeiro,Dado )
     else
     begin
        while ( count<>posicao-1 ) do
        begin
             p:=p^.prox;
             count:=count+1;
        end;
           aux^.chave:=Dado;
           aux^.prox:=p^.prox;
           p^.prox:=aux;
     end;
end;


procedure inter_insere2( var Primeiro:pont; var Ultimo:pont );
var Dado:tipochave;
    posicao: integer;
begin
     writeln('Digite o valor a ser inserido');
     readln(Dado);
     writeln('Digite a posicao onde inserir');
     readln(posicao);
     Inserir2 ( Primeiro, Ultimo, Dado, posicao );
end;


function Conta (var Primeiro:pont ):integer;
var p:pont;
    count:integer;
begin
     count:=0;
     p:=primeiro;
     while ( p<>nil ) do
     begin
          count:=count+1;
          p:=p^.prox;
     end;
     Conta:=count;
end;

procedure InterConta( var Primeiro:pont );
begin
     clrscr;
     writeln('O n£mero de elementos Ç :',Conta(Primeiro));
     readkey;
end;


procedure RemoverPrim( var Primeiro:pont );
var p:pont;
begin
    p:=Primeiro^.prox;
    primeiro:=p;
end;


function Remover( var Primeiro:pont; var Ultimo:pont; Dado:tipochave ):boolean;
var p,aux:pont;
    fim,achou:boolean;
begin
    achou:=false;
    if Dado=primeiro^.chave then
    begin
       RemoverPrim(Primeiro);
       achou:=true;
    end
    else
    begin
        p:=primeiro;
        while ( fim=false ) do
        begin
            aux:=p;
            p:=p^.prox;
            if p^.chave=Dado then
            begin
               fim:=true;
               achou:=true;
            end;
            if p=nil then
               fim:=true;
        end;
        if achou=true then
           aux^.prox:=p^.prox;
           if p^.prox=nil then
           begin
              aux^.prox:=nil;
              ultimo:=aux;
           end;
    end;
    remover:=achou;
end;


procedure Inter_remover(var Primeiro:pont; var Ultimo:pont );
var Dado:tipochave;
begin
     clrscr;
     writeln('Digite o elemento a ser removido');
     readln(Dado);
     if Remover( Primeiro, Ultimo, Dado ) then
        writeln('Item removido')
     else
        writeln('Item n∆o encontrado');
     readkey;
end;

procedure selecao( var Primeiro:pont;Var Ultimo:pont; var sair: boolean );
var op:integer;
begin
   op:=0;
   readln(op);
   case op of
               1:writeln('Destruir a lista');
               2:Inter_Insere( Primeiro, Ultimo );
               3:InterConta( Primeiro );
               4:InterBusca ( Primeiro );
               5:Imprimir( Primeiro );
               6:Inter_Insere2( Primeiro, Ultimo);
               7:Inter_remover( Primeiro, Ultimo );
               8:begin
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
     writeln('8:Sair do programa');
end;



begin
     Criar ( Primeiro );
     sair:=false;
     while sair=false do
     begin
          menu;
          selecao( Primeiro,Ultimo, sair );
     end;
     readkey;
end.