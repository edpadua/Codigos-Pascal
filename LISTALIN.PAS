unit Listalin;



interface

uses crt;

const Max=4;


type Sentido=(direita,esquerda);

type TipoElemen=record
                      chave: integer;
                      nome: string ;
                end;

type posicao=0..Max+1;


type Lista= record
                  Nelem : posicao;
                  A : array [ 1..Max ]  of TipoElemen;
            end;

var L: Lista;
    sair: boolean;


function Fim ( var L: Lista ):integer;

function Lista_Vazia ( var L: Lista ):boolean;

function Lista_Cheia ( var L: Lista ):boolean;

procedure Definir ( var L:Lista );

procedure Apagar ( var L:Lista );

procedure Deslocamento ( var L:lista; p: posicao; sentido: sentido );

function Inserir ( var Dados: TipoElemen; var L: Lista; p: posicao ):boolean;

function Inserir_Ord ( Var L:Lista; Dados:TipoElemen ):boolean;

function Localizar ( var Dados: TipoElemen; var L: Lista ):posicao;

function Busca_Binaria( var L:lista; Dados: TipoElemen ):posicao;

function Remover( var L:lista; p:posicao ):boolean;

function Prox ( p: posicao; L:Lista ):posicao;

function Ant ( p: posicao; L:Lista ):posicao;

function Primeiro ( L:lista ):posicao;

procedure Imprimir( var L:Lista );

procedure Inter_Inserir( var L:Lista );

procedure Inter_InserirOrd( var L:Lista );

procedure Inter_Remover( var L:lista );

procedure Inter_Buscar;

procedure selecao( var L:Lista; var sair: boolean );

procedure menu;

implementation


function Fim ( var L: Lista ):integer;
begin
     Fim:=L.Nelem+1;
end;


function Lista_Vazia ( var L: Lista ):boolean;
begin
     Lista_Vazia:=(L.Nelem=0);
end;


function Lista_Cheia ( var L: Lista ):boolean;
begin
     Lista_Cheia:=(L.Nelem>=Max);
end;

procedure Definir ( var L:Lista );
begin
     L.Nelem:=0;
end;


procedure Apagar ( var L:Lista );
begin
     L.Nelem:=0;
end;

procedure Deslocamento ( var L:lista; p: posicao; sentido: sentido );
var Indice: posicao;
begin
     if sentido=direita then
        for Indice:=L.Nelem downto p do
            L.A[ Indice+1 ]:=L.A[ Indice ]
     else
        for Indice:=p to L.Nelem-1 do
            L.A[ Indice ]:=L.A [ Indice+1 ];
end;


function Inserir ( var Dados: TipoElemen; var L: Lista; p: posicao ):boolean;
begin
     if Lista_Cheia ( L ) then
        Inserir:=false
     else
     begin
        if ( p<1 ) or ( p>Max ) then
           Inserir:=false
        else
        begin
           Deslocamento ( L,p,direita);
           L.A[p]:=Dados;
           L.Nelem:=L.Nelem+1;
           Inserir:=true;
        end;
     end;
end;

function Inserir_Ord ( Var L:Lista; Dados:TipoElemen ):boolean;
var i:posicao;
var acabou: boolean;
begin
    i:=1;
    acabou:=false;
    if Lista_Vazia(L) then
       acabou:=true
    else
    while not acabou do
          if L.A[ i ].chave>Dados.chave then
             acabou:=true
          else
          begin
             i:=i+1;
             acabou:=(i >L.nelem);
          end;
    Inserir_Ord:=Inserir(Dados,L,i);
end;




function Localizar ( var Dados: TipoElemen; var L: Lista ):posicao;
var acabou:boolean;
    i:posicao;
begin
     Localizar:=Fim(L);
     i:=1;
     acabou:=(i>L.Nelem);
     while not acabou do
     begin
          if L.A[i].chave=Dados.chave then
          begin
             Acabou:=true;
             Localizar:=i;
          end
          else
          begin
             i:=i+1;
             acabou:=(i>L.Nelem);
          end;
     end;
end;




function Busca_Binaria( var L:lista; Dados: TipoElemen ):posicao;
var Inicio, Final, meio: posicao;
begin
     Busca_Binaria:=fim(L);
     Inicio:=1;
     Final:=L.nelem;
     while Inicio<=Final do
     begin
          meio:=( Inicio+Final )div 2;
          if L.A[Meio].chave=Dados.chave then
          begin
               Busca_Binaria:=meio;
               Inicio:=Final+1;
          end
          else
              if L.A[Meio].chave<dados.chave then
                 Inicio:=Meio+1
              else
                 Final:=Meio-1;

     end;

end;


function Remover( var L:lista; p:posicao ):boolean;
var achou:boolean;
begin
     if (p>=Fim(L)) or ( p<1 ) then
        Remover:=false
     else
     begin
          if Lista_Vazia( L ) then
             Remover:=False
          else
          begin
               Deslocamento ( L,p,esquerda);
               L.nelem:=L.nelem-1;
               Remover:=true;
          end;
     end;
end;


function Prox ( p: posicao; L:Lista ):posicao;
begin
     if p=L.nelem then
        Prox:=fim(L)
     else
        Prox:=Prox(p,L)+1;
end;

function Ant ( p: posicao; L:Lista ):posicao;
begin
     if p=1 then
        Ant:=0
     else
        Ant:=Ant(p,L)-1;
end;


function Primeiro ( L:lista ):posicao;
begin
     if L.nelem=0 then
        primeiro:=0
     else
        primeiro:=1;
end;


procedure Imprimir( var L:Lista );
var indice:posicao;
begin
   clrscr;
   if ( Lista_Vazia(L) ) then
      writeln('Lista vazia')
   else
      for indice:=1 to L.nelem do
      begin
          writeln(L.A[indice].chave);
          writeln(L.A[indice].nome);
      end;
   readkey;
end;

procedure Inter_Inserir( var L:Lista );
var status:boolean;
    Dados:TipoElemen;
    Indice:posicao;
begin
     clrscr;
     Indice:=Prox ( L.nelem, L );
     writeln('Entre com o nome');
     readln(Dados.nome);
     Dados.chave:=Indice;
     status:=Inserir ( Dados,L , Indice );
     if status then
        writeln('Inserá∆o ocorreu com sucesso')
     else
        writeln('Lista Cheia, inserá∆o sem sucesso');
     readkey;
end;

procedure Inter_InserirOrd( var L:Lista );
var status:boolean;
    Dados: TipoElemen;
begin
    clrscr;
    Writeln('Entre com a chave');
    readln(Dados.chave);
    Writeln('Entre com o nome');
    readln(Dados.nome);
    status:=Inserir_Ord ( L, Dados );
    if status then
        writeln('Inserá∆o ocorreu com sucesso')
     else
        writeln('Lista Cheia, inserá∆o sem sucesso');
    readkey;
end;


procedure Inter_Remover( var L:lista );
var status:boolean;
    Indice:posicao;
begin
     clrscr;
     Writeln('Entre com a posiá∆o do item a ser removido');
     readln(Indice);
     status:=Remover( L,Indice );
     if status then
        writeln('Remoá∆o ocorreu com sucesso')
     else
     begin
        writeln('Remoá∆o n∆o efetuada, ou a lista est† vazia ou ');
        writeln('a posiá∆o procurada n∆o existe');
     end;
     readkey;
end;


procedure Inter_Buscar;
var Indice:posicao;
    Dados: TipoElemen;
begin
     clrscr;
     writeln('Digite o valor da chave a ser procurada');
     readln(Dados.chave);
     Indice:=Busca_Binaria( L, Dados);
     if Indice<>fim(L)
     then
        writeln('O item foi encontrado na posiá∆o ',Indice)
     else
     begin
        writeln('O item n∆o foi encontrado');
     end;
     readkey;
end;






procedure selecao( var L:Lista; var sair: boolean );
var op:integer;
begin
   op:=0;
   readln(op);
   case op of
               1:begin
                 writeln('Destruir a lista');
                 Apagar( L );
                 end;
               2:Inter_InserirOrd( L );
               3:Inter_Remover( L );
               4:Inter_Buscar;
               5:Imprimir( L );
               6:begin
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
     writeln('2:Inserir ordenadamente');
     writeln;
     writeln('3:Remover um item da lista');
     writeln;
     writeln('4:Buscar um dado na lista');
     writeln;
     writeln('5:Imprimir toda lista');
     writeln;
     writeln('6:Sair do programa');
end;

end.

