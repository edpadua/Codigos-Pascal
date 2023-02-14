program LinhasAereas;

uses crt;

const Max=4;

type
     Cadastro=record
           CodigoDaReserva:integer;
           NomeDoPassageiro: string [40];
           Telefone: string[20];
           Status: string[2];
     end;

     Lista=record
                Nelem:integer;
                Dados:array[1..Max] of Cadastro;
           end;

     Sentido=(direita,esquerda);

var Sair: boolean;
    L: Lista;




procedure Definir ( var L:Lista );
begin
     L.Nelem:=0;
end;


procedure Apagar ( var L:Lista );
begin
     L.Nelem:=0;
end;

function Lista_Vazia ( var L: Lista ):boolean;
begin
     Lista_Vazia:=(L.Nelem=0);
end;

function Lista_Cheia ( var L: Lista ):boolean;
begin
     Lista_Cheia:=(L.Nelem>=Max);
end;


function Fim ( var L: Lista ):integer;
begin
     Fim:=L.Nelem+1;
end;



procedure Deslocamento ( var L:lista; p: integer; sentido: sentido );
var Indice: integer;
begin
     if sentido=direita then
        for Indice:=L.Nelem downto p do
            L.Dados[ Indice+1 ]:=L.Dados[ Indice ]
     else
        for Indice:=p to L.Nelem-1 do
            L.Dados[ Indice ]:=L.Dados [ Indice+1 ];
end;



function Busca_Binaria( var L:lista; Info: Cadastro ):integer;
var Inicio, Final, meio: integer;
begin
     Busca_Binaria:=fim(L);
     Inicio:=1;
     Final:=L.nelem;
     while Inicio<=Final do
     begin
          meio:=( Inicio+Final )div 2;
          if L.Dados[Meio].CodigoDaReserva=Info.CodigoDaReserva then
          begin
               Busca_Binaria:=meio;
               Inicio:=Final+1;
          end
          else
              if L.Dados[Meio].CodigoDaReserva<Info.CodigoDaReserva then
                 Inicio:=Meio+1
              else
                 Final:=Meio-1;

     end;

end;



function Inserir ( var Info: Cadastro; var L: Lista; p: integer ):boolean;
begin
     if Lista_Cheia ( L ) then
        Inserir:=false
     else
     begin
        if ( p<1 ) or ( p>Max ) then
           Inserir:=false
        else
           if(Busca_Binaria( L, Info )<>fim(L) ) then
             inserir:=false
           else
           begin
              Deslocamento ( L,p,direita);
              L.Dados[p]:=Info;
              L.Nelem:=L.Nelem+1;
              Inserir:=true;
           end;
     end;
end;


function Inserir_Ord ( Var L:Lista; Info:Cadastro ):boolean;
var i:integer;
var acabou: boolean;
begin
    i:=1;
    acabou:=false;
    if Lista_Vazia(L) then
       acabou:=true
    else
        if L.Dados[ i ].CodigoDaReserva>Info.CodigoDaReserva then
             acabou:=true
        else
        begin
             i:=i+1;
             acabou:=(i >L.nelem);
        end;
             Inserir_Ord:=Inserir(Info,L,i);
end;

function Remover( var L:lista; p:integer ):boolean;
var achou:boolean;
begin   if (p>=Fim(L)) or ( p<1 ) then
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




function LocalizarStatus ( Status:string; var L: Lista ):boolean;
var acabou:boolean;
    i:integer;
begin
     LocalizarStatus:=false;
     i:=1;
     acabou:=(i>L.Nelem);
     while not acabou do
     begin
          if L.Dados[i].Status=Status then
          begin
             LocalizarStatus:=true;
             writeln('Codigo da Reserva: ',L.Dados[i].CodigoDaReserva);
             writeln('Nome do Passageiro: ',L.Dados[i].NomeDoPassageiro);
             writeln('Telefone: ',L.Dados[i].Telefone);
             writeln('Status: ',L.Dados[i].Status);
             writeln;
          end
          else
          begin
             acabou:=(i>L.Nelem);
          end;
          i:=i+1;
     end;
end;


procedure InterfaceStatus ( L:Lista );
var status :string[2];
    op:integer;
    Escolha:boolean;
begin
     clrscr;
     Escolha:=false;
     if not Lista_Vazia ( L ) then
     begin
        while ( Escolha=false ) do
        begin
             writeln('Informe o status a ser listado');
             writeln('EB - Embarque realizado com bagagem');
             writeln('ES - Embarque realizado sem bagagem');
             writeln('CN - Check-in n∆o realizado');
             readln(op);
             case op of
                  1:begin
                         status:='EB';
                         Escolha:=true;
                  end;
                  2:begin
                         status:='ES';
                         Escolha:=true;
                  end;
                  3:begin
                         status:='CN';
                         Escolha:=true;
                  end;
             else
                 writeln('Opcao invalida');
             end;
             clrscr;
             end;
             if ( Escolha= true ) then
             begin
                  if not( LocalizarStatus( Status, L ) ) then
                     writeln('N∆o h† passageiros em situaá∆o ',status)
             end;
         end
         else
             writeln('Lista Vazia');
     readkey;
end;

procedure Imprimir( var L:Lista );
var indice:integer;
begin
   clrscr;
   if ( Lista_Vazia(L) ) then
      writeln('Lista vazia')
   else
      for indice:=1 to L.nelem do
      begin
          writeln('Codigo da Reserva: ',L.Dados[indice].CodigoDaReserva);
          writeln('Nome do Passageiro: ',L.Dados[indice].NomeDoPassageiro);
          writeln('Telefone: ',L.Dados[indice].Telefone);
          writeln('Status: ',L.Dados[indice].Status);
          writeln;
      end;
   readkey;
end;


procedure Inter_InserirOrd( var L:Lista );
var situacao,status:boolean;
    Dados: Cadastro;
    op:integer;
begin
    clrscr;
    status:=false;
    writeln('Entre com o Codigo de reserva: ');
    readln(Dados.CodigoDaReserva);
    writeln('Entre com o nome do passageiro: ');
    readln(Dados.NomeDoPassageiro);
    writeln('Entre com o telefone: ');
    readln(Dados.Telefone);
    writeln('Informe o status do passageiro: ');
    writeln;
    writeln('1:EB- Embarque realizado com bagagem');
    writeln('2:ES- Embarque realizado sem bagagem');
    writeln('3:CN- Check-in n∆o realizado');
    readln(op);
    while ( status=false ) do
    case op of
      1:begin
          Dados.status:='EB';
          status:=true;
        end;
      2:begin
          Dados.status:='ES';
          status:=true;
        end;
      3:begin
          Dados.status:='CN';
          status:=true;
        end;
        else
          writeln('Opá∆o inv†lida, repita');
    end;
    situacao:=Inserir_Ord ( L, Dados );
    if situacao then
        writeln('Inserá∆o ocorreu com sucesso')
     else
        writeln('Inserá∆o sem sucesso');
    readkey;
end;

procedure Inter_Remover( var L:lista );
var status:boolean;
    Indice:integer;
    Info:Cadastro;
begin
     clrscr;
     Writeln('Entre com o codigo da reserva');
     readln(Info.CodigoDaReserva);
     indice:=Busca_Binaria( L, Info);
     status:=Remover( L,Indice );
     if status then
        writeln('Remoá∆o ocorreu com sucesso')
     else
     begin
        writeln('Remoá∆o n∆o efetuada, ou a lista est† vazia ou ');
        writeln('O elemento procurado n∆o existe');
     end;
     readkey;
end;


procedure Inter_Buscar( L:lista );
var Indice:integer;
    Dados: Cadastro;
begin
     clrscr;
     writeln('Entre com o codigo da reserva do passageiro a ser procurado');
     readln(Dados.CodigoDaReserva);
     Indice:=Busca_Binaria( L, Dados);
     if Indice<>fim(L)
     then
     begin
          writeln('Codigo da Reserva: ',L.Dados[indice].CodigoDaReserva);
          writeln('Nome do Passageiro: ',L.Dados[indice].NomeDoPassageiro);
          writeln('Telefone: ',L.Dados[indice].Telefone);
          writeln('Status: ',L.Dados[indice].Status);
          writeln;
     end
     else
     begin
        writeln('O item n∆o foi encontrado');
     end;
     readkey;
end;




procedure Selecao(var L:lista; var Sair:boolean );
var op:integer;
begin
   op:=0;
   readln(op);
   case op of
               1:begin
                      writeln('Inicializar o cadastro');
                 end;
               2:begin
                      writeln('Buscar o registro de uma reserva');
                      Inter_Buscar( L );
                 end;
               3:begin
                      writeln('Inserir uma nova reserva');
                      Inter_InserirOrd( L );
                 end;
               4:begin
                      writeln('Remover uma reserva');
                      Inter_Remover( L);
                 end;
               5:begin
                      writeln('Listar todas as reservas');
                      Imprimir(  L );
                 end;
               6:begin
                      writeln('Listar todas as reservas com certo status');
                      InterfaceStatus ( L );
                 end;
               7:begin
                      writeln('sair do programa');
                      sair:=true;
                      readkey;
                 end;
          else
              writeln('Opcao invalida');
          end;
          readkey;
          clrscr;

end;

procedure menu;
begin
     clrscr;
     writeln;
     writeln('Escolha a operaá∆o');
     writeln('--------------------------');
     writeln('1:Inicializar o cadastro');
     writeln;
     writeln('2:Buscar o registro de uma reserva');
     writeln;
     writeln('3:Inserir uma nova reserva');
     writeln;
     writeln('4:Remover uma reserva');
     writeln;
     writeln('5:Listar todas as reservas');
     writeln;
     writeln('6:Listar reservas com determinado status');
     writeln;
     writeln('7:Sair do programa');
end;


begin
   Sair:=false;
     Definir ( L );
     while sair=false do
     begin
          menu;
          selecao( L,Sair );
     end;
     readkey;
end.

