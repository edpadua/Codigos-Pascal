program pesquisa;
uses crt;
const max=7;
type vet=array[1..max] of longint;
var conjunto:vet;
    decisao:char;
    dado,achou:integer;

procedure le_vetor(var v1:vet);
var indice:integer;
begin
     for indice:=1 to max do
     readln(v1[indice]);
end;

procedure imprime_vetor(var v1:vet);
var indice:integer;
begin
     writeln;
     for indice:=1 to max do
     writeln(v1[indice]);
end;

procedure banner(mensagem:string);
begin
     writeln('////////////////////////////////////////////////////////////////////');
     writeln('           ',mensagem,'               ');
     writeln('////////////////////////////////////////////////////////////////////');
end;
function busca(v1:vet;dado:integer):integer;
var indice,meio,posicao:integer;
    aux:longint;
begin
     meio:=max div 2;
     if dado=v1[meio] then
         posicao:=meio
     else
     begin
         indice:=meio;
         if dado<v1[meio] then
         begin
            indice:=indice-1;
            while indice>=1 do
            begin
                 if dado=v1[indice] then
                 begin
                    posicao:=indice;
                    indice:=0;
                 end
                 else
                 begin
                    posicao:=0;
                    indice:=indice-1;
                 end;
            end;
         end
         else
         begin
            indice:=indice+1;
            while indice<=max do
            begin
                 if dado=v1[indice] then
                 begin
                    posicao:=indice;
                    indice:=max+1;
                 end
                 else
                 begin
                    indice:=indice+1;
                    posicao:=0;
                 end;
            end;
         end;
     end;
     busca:=posicao;
end;

procedure ordena(var v1:vet);
var i,j,aux:integer;
begin
    for j:=1 to max do
        for i:=1 to max do
        begin
             if (v1[i]>v1[i+1]) and (i+1<=max) then
             begin
                  aux:=v1[i+1];
                  v1[i+1]:=v1[i];
                  v1[i]:=aux;
             end;
        end;
end;

begin
          decisao:='s';
          while decisao='s' do
          begin
               clrscr;
               banner('Esse programa faz uma busca ordenada');
               writeln('Digite o conjunto de n£meros');
               le_vetor(conjunto);
               writeln('Digite o dado a ser localizado');
               readln(dado);
               ordena(conjunto);
               writeln('O vetor ordenado Ç');
               imprime_vetor(conjunto);
               writeln;
               achou:=busca(conjunto,dado);
               if achou<>0 then
               writeln('O valor foi encontrado na posiá∆o ',achou)
               else
                   writeln('O valor n∆o foi encontrado');
               writeln;
               writeln('Deseja prosseguir? s/n');
               decisao:=readkey;
         end;
         banner('     Fim do programa');
         readkey;

end.
