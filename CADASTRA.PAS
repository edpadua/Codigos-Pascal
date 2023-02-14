program Cadastrar;
uses crt,listalin;

var L: Lista;
    sair: boolean;

begin
     Definir ( L );
     sair:=false;
     while sair=false do
     begin
          menu;
          selecao( L, sair );
     end;
     readkey;
end.