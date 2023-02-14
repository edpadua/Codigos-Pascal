program  dinamica;
uses crt;


type tipochave=integer;


     apont=^lista;

     lista=record
                 chave: tipochave;
                 prox:apont;
           end;



var Primeiro,Ultimo: apont;
    sair: boolean;


procedure CriarLista(var Primeiro:apont );
begin
     Primeiro:=nil;
end;


procedure InserirPrimeiro ( var Primeiro:apont; var Ultimo:apont; Dado:TipoChave );
begin
     new( Primeiro );
     Primeiro^.chave:=Dado;
     Primeiro^.prox:=nil;
     Ultimo:=Primeiro;
end;

procedure Inserir ( var Primeiro:apont; var Ultimo:apont ; Dado:TipoChave );
var p: apont;
begin
     if Primeiro=nil then
        InserirPrimeiro( Primeiro,Ultimo,Dado)
     else
     begin
        new( p );
        p^.chave:=Dado;
        Ultimo^.prox:=p;
        Ultimo:=p;
        Ultimo^.prox:=nil;
     end;

end;

function Conta( Primeiro:apont; Ultimo:apont ):integer;
var p:apont;
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

procedure InteConta( Primeiro:apont; Ultimo:apont );
begin
    clrscr;
    writeln('O n£mero de elementos Ç: ',Conta(Primeiro,Ultimo));
    readkey;
end;

procedure Inter_Insere( var Primeiro:apont; var Ultimo:apont );
var Dado: tipochave;
begin
     clrscr;
     writeln('Digite o elemento a ser inserido');
     readln(Dado);
     Inserir( Primeiro,Ultimo,Dado );
end;


function Busca( Primeiro:apont; Dado:tipochave):integer;
var p:apont;
    count,posicao: integer;
    fim: boolean;
begin
    fim:=false;
    count:=1;
    posicao:=0;
    p:=primeiro;
    while ( fim=false ) do
    begin
         if Dado=p^.chave then
         begin
            fim:=true;
            posicao:=count;
         end
         else
            p:=p^.prox;
            count:=count+1;
            if p=nil then
               fim:=true;
    end;
    Busca:=posicao;
end;


procedure InterBusca ( Primeiro:apont );
var Dado:tipochave;
    posicao:integer;
begin
     clrscr;
     writeln('Digite o dado a ser localizado');
     readln(Dado);
     posicao:=Busca( Primeiro,Dado);
     if (posicao=0) then
        writeln('Valor n∆o encontrado')
     else
        writeln('O valor foi encontrado na posicao ',posicao);
     readkey;
end;


procedure Inserirprimeira( var Primeiro: apont; var Ultimo: apont; Dado:tipochave);
var p:apont;
begin
    new(p);
    p^:=Primeiro^;
    Primeiro^.chave:=Dado;
    Primeiro^.prox:=p;

end;

procedure Inserir2 ( var Primeiro: apont; var Ultimo: apont; Dado:tipochave; posicao:integer );
var p,aux:apont;
    count:integer;
begin
    count:=1;
    p:=Primeiro;
    if posicao=1 then
       Inserirprimeira( Primeiro, Ultimo, Dado )
    else
    begin
         while (count<>posicao-1) do
         begin
              p:=p^.prox;
              count:=count+1;
         end;
         new(aux);
         aux^.chave:=dado;
         aux^.prox:=p^.prox;
         p^.prox:=aux;
    end;
end;

procedure inter_Insere2( var Primeiro:apont; var Ultimo:apont );
var Dado: tipochave;
    posicao: integer;
begin
     clrscr;
     writeln('Digite o elemento a ser inserido');
     readln(Dado);
     writeln('Digite a posicao a onde inserir');
     readln(posicao);
     Inserir2( Primeiro, Ultimo, Dado, posicao);
end;


procedure removerprim( var primeiro:apont );
var p:apont;
begin
    p:=primeiro^.prox;
    primeiro:=p;
end;



function remover( var Primeiro:apont; var Ultimo:apont; var Dado:tipochave ):boolean;
var p,aux1,aux2:apont;
    fim,achou:boolean;
    count:integer;
begin
    fim:=false;
    achou:=false;
    p:=primeiro;
    count:=0;
    while ( fim=false ) do
    begin
         if (p^.chave=Dado) then
         begin
            fim:=true;
            achou:=true;
         end
         else
         begin
            aux2:=p;
            p:=p^.prox;
         end;
         if p=nil then
         begin
            fim:=true;
            achou:=false;
         end;
         count:=count+1
    end;
         if achou=true then
         begin
            if count<>1 then
               if (p=Ultimo) then
               begin
                   aux2^.prox:=nil;
                   Ultimo:=aux2;
               end
               else
                   aux2^.prox:=p^.prox
            else
               removerprim( primeiro );
         end;

    remover:=achou;

end;


procedure inter_remover( var Primeiro:apont; var Ultimo:apont );
var Dado: tipochave;
    posicao: integer;
begin
     clrscr;
     writeln('Digite o elemento a ser removido');
     readln(Dado);
     if (remover( Primeiro, Ultimo, Dado )) then
        writeln('Remoá∆o bem sucedida')
     else
        writeln('Elemento n∆o encontrado');
     readkey;
end;


procedure Imprimir( var L:apont );
var p:apont;
begin
     clrscr;
     p:=L;
     while ( p<>nil ) do
     begin
          writeln(p^.chave);
          p:=p^.prox;
     end;
     readkey;
end;



procedure selecao( var Primeiro:apont;Var Ultimo:apont; var sair: boolean );
var op:integer;
begin
   op:=0;
   readln(op);
   case op of
               1:writeln('Destruir a lista');
               2:Inter_Insere( Primeiro,Ultimo);
               3:InteConta( Primeiro, Ultimo );
               4:InterBusca ( Primeiro );
               5:Imprimir( Primeiro );
               6:inter_Insere2( Primeiro, Ultimo);
               7:inter_remover( Primeiro, Ultimo );
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
     CriarLista ( Primeiro );
     sair:=false;
     while sair=false do
     begin
          menu;
          selecao( Primeiro,Ultimo, sair );
     end;
     readkey;
end.