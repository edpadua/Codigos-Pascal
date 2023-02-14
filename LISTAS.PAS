program listas;
uses crt;

const
     InicioArranjo = 1;
     MaxTam =4;

type
    TipoItem=record
             chave:integer;
             end;
    posicao=0..maxtam+1;

    TipoLista=record
             Item :array[1..MaxTam] of TipoItem;
             Nelemen: integer;
             end;

var  Cadastro: tipolista;
     opcao,posicao1:integer;
     sair:boolean;



procedure CriaLista( var lista: tipolista );
var indice:integer;
begin
    for indice:=1 to MaxTam do
    begin
         lista.item[indice].chave:=0;
    end;
    lista.Nelemen:=0;
end;


procedure ImprimeLista( var lista: tipolista );
var indice: integer;
begin
     indice:=1;
     while (indice<=lista.nelemen) do
     begin
         if lista.item[indice].chave<>0 then
         begin
           writeln(lista.item[indice].chave);
         end;
     indice:=indice+1;
     end;
end;


function ListaCheia(var cadastro: tipolista):boolean;
begin
     ListaCheia:=(cadastro.nelemen=MaxTam);
end;



function ListaVazia(var cadastro: tipolista):boolean;
begin
     ListaVazia:=(cadastro.nelemen=0);
end;

procedure vercheia( var cadastro: tipolista);
var cheia:boolean;
begin
     cheia:=ListaCheia(cadastro);
     if cheia=true then
        writeln('Lista est† cheia')
     else
        writeln('Lista n∆o est† cheia');
end;

procedure vervazia( var cadastro: tipolista);
var vazia:boolean;
begin
     vazia:=ListaVazia(cadastro);
     if vazia=true then
        writeln('Lista est† vazia')
     else
        writeln('Lista n∆o est† vazia');
end;

procedure Inserir( var lista: tipoLista);
var cheia:boolean;
    indice:integer;
begin
     cheia:=ListaCheia(cadastro);
     if cheia=false then
     begin
           readln(lista.item[cadastro.nelemen+1].chave);
           cadastro.nelemen:=cadastro.nelemen+1;
     end
     else
         writeln('Lista cheia');
end;

function busca( lista:tipolista; chave :integer; var vazia: boolean; var achou: boolean):integer;
var indice,pos:integer;
begin
     pos:=0;
     if vazia=false then
     begin
          for indice:=1 to lista.nelemen do
              if chave=lista.item[indice].chave then
              begin
                 pos:=indice;
                 achou:=true;
              end;
          busca:=pos;
     end;
end;

function busca1( lista:tipolista; chave :integer; var vazia: boolean; var achou: boolean):integer;
var indice,pos,max:integer;
begin
     pos:=0;
     max:=lista.nelemen;
     if vazia=false then
     begin
     indice:=1;
          while (indice<=lista.nelemen) do
          begin
              if lista.item[indice].chave=chave then
              begin
                   achou:=true;
                   pos:=indice;
              end;
          indice:=indice+1;
          end;

          busca1:=pos;
     end;
end;


procedure InterfaceBusca( lista: tipolista );
var chave,pos: integer;
    vazia,achou:boolean;
begin
     vazia:=ListaVazia(lista);
     achou:=false;

     if vazia=true then
        writeln('Lista Vazia')
     else
     begin
         writeln('Digite a chave a ser buscada');
         readln(chave);
         pos:=busca1(lista,chave,vazia,achou);
         if achou=true then
            writeln('O item foi encontrado na posiá∆o ',pos)
         else
            writeln('O item n∆o foi encontrado');
     end;
end;

procedure deslocar(var cadastro: tipolista; posicao: integer; sentido:string);
var aux1,indice:integer;
    cheia,vazia:boolean;
begin
    if sentido='direita' then
    begin
         cheia:=listaCheia(cadastro);
         if cheia=false then
         begin
              for indice:=cadastro.nelemen+1 downto posicao+1 do
              begin
                   cadastro.item[indice].chave:=cadastro.item[indice-1].chave;
              end;
              cadastro.nelemen:=cadastro.nelemen+1;
         end
         else
             writeln('Lista cheia');
    end
    else
    begin
        vazia:=listaVazia(cadastro);
        if Vazia=false then
        begin
             for indice:=posicao to cadastro.nelemen do
             begin
                  cadastro.item[indice].chave:=cadastro.item[indice+1].chave;
             end;
             cadastro.nelemen:=cadastro.nelemen-1;
        end;

    end;
end;

procedure InserirPosicao( var lista: tipoLista;posicao: integer);
var cheia:boolean;
    indice:integer;
begin
     cheia:=ListaCheia(cadastro);
     if (cheia=false) {or (lista.item[posicao].chave<>0)} then
     begin
           deslocar(lista,posicao,'direita');
           writeln('Digite o valor a ser inserido');
           readln(lista.item[posicao].chave);
           cadastro.nelemen:=cadastro.nelemen+1;
     end
     else
         writeln('Lista Vazia');
end;


procedure ordenar( var lista: tipolista );
var me,aux,indice,inicio:integer;
begin

     for inicio:=1 to cadastro.nelemen-1 do
     begin
          me:=cadastro.item[inicio].chave;
          for indice:=2 to cadastro.nelemen do
          begin
               if(me>cadastro.item[indice].chave) then
               begin
                    me:=cadastro.item[indice].chave;
                    aux:=indice;
               end;
          end;
          cadastro.item[aux].chave:=cadastro.item[inicio].chave;
          cadastro.item[inicio].chave:=me;
     end;
end;

procedure RemoverItem( var lista: tipolista );
var cheia,vazia,achou:boolean;
    chave,pos:integer;
begin
     vazia:=listaVazia(cadastro);
     if vazia=false then
     begin
           writeln('Digite o valor a ser removido');
           readln(chave);
           pos:=busca1( lista,chave,vazia,achou);
           deslocar(lista,pos,'esquerda');
           cadastro.item[(cadastro.nelemen)+1].chave:=0;
     end
     else
         writeln('Lista Vazia');
end;


begin
     clrscr;
     crialista(Cadastro);
     sair:=false;
     while( sair=false) do
     begin
          writeln('Escolha a operaá∆o');
          writeln('1:Destruir a lista');
          writeln('2:Inserir dados na lista');
          writeln('3:Remover um item da lista');
          writeln('4:Buscar um dado na lista');
          writeln('5:Imprimir toda lista');
          writeln('6:Verificar se est† cheia');
          writeln('7:Verificar se a lista est† vazia');
          writeln('8:Deslocar a lista');
          writeln('9:Inserir dado em posiá∆o especifica');
          writeln('10:Busca de um elemento');
          writeln('11:Ordenar lista');
          writeln('12:Sair do programa');
          readln(opcao);


          case opcao of
               1:writeln('Destruir a lista');
               2:begin
                      clrscr;
                      writeln('Inserir dados na lista');
                      inserir(cadastro);
                      readkey;
                 end;
               3:begin
                      clrscr;
                      writeln('Remover um item da lista');
                      RemoverItem(Cadastro);
                      readkey;
                 end;
               4:writeln('Buscar um dado na lista');
               5:begin
                      clrscr;
                      writeln('Imprimir toda lista');
                      ImprimeLista(Cadastro);
                      readkey;
                 end;
               6:begin
                      clrscr;
                      writeln('Verificar se esta cheia');
                      vercheia( cadastro );
                      readkey;
                 end;
               7:begin
                      clrscr;
                      writeln('Verificar se esta vazia');
                      vervazia( cadastro );
                      readkey;
                 end;
               8:begin
                      clrscr;
                      writeln('Deslocar a lista');
                      writeln('Deslocar a partir de qual posicao');
                      readln(posicao1);
                      deslocar(cadastro,posicao1,'direita');
                      readkey;
                 end;
               9:begin
                      clrscr;
                      writeln('Inserir em posiá∆o especifica');
                      writeln('Inserir em qual posicao ?');
                      readln(posicao1);
                      inserirposicao(cadastro,posicao1);
                      readkey;
                  end;
               10:begin
                      clrscr;
                      writeln('Busca');
                      InterfaceBusca(cadastro);
                      readkey;
                 end;
               11:begin
                      writeln('Ordenar lista');
                      ordenar(cadastro);
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
     readkey;
end.