program cadass;
uses crt;

type pessoa=record nome,endereco: string;
                     idade: integer;
                     cheio: boolean;
              end;
     cadastro=array [1..5] of pessoa;

var vetor:cadastro;

procedure inserirdados(var vetor:cadastro);
var Indice1,Indice2:integer;
begin
    for Indice1:=1 to 5 do
        begin
             if vetor[Indice1].cheio=false then
             Indice2:=indice1;
        end;

    for Indice1:=Indice2 to 5 do
        begin
              writeln('Digite o nome');
              readln(vetor[Indice1].nome);
              writeln('Digite o endere‡o');
              readln(vetor[Indice1].endereco);
              writeln('Digite a idade');
              readln(vetor[Indice1].idade);
              vetor[Indice1].cheio:=true;
        end;
end;


begin
clrscr;
writeln('Entre com os dados do cadastro');
inserirdados(vetor);
readkey;
end.