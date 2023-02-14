program Agenda;
uses crt;

const TAMANHO_MAXIMO=6;

type  VetorAgenda=array[1..TAMANHO_MAXIMO] of String;
      TipoDeslocamento=(DESLOCAMENTO_ESQUERDA, DESLOCAMENTO_DIREITA);

var   VetorNome,VetorEndereco,VetorTelefone:VetorAgenda;
      Orientacao: TipoDeslocamento;
      ElementoRepetido, VetorCheio: boolean;
      nome,endereco,telefone:string;
      n,posicao:integer;
      t:char;

Function PesquisaElemento (Nomes : VetorAgenda; QuantidadeNomes : Integer;
Procurado : String;
Var PosicaoEncontrada : Integer) : Boolean;

Var
Meio, {Meio do escopo de pesquisa }
Inicio, { Öndice de in¡cio da pesquisa }
Fim : Integer; { Öndice de fim da pesquisa }


Begin
Inicio := 1;
Fim := QuantidadeNomes;
PesquisaElemento := False;

{ Enquanto o escopo da pesquisa for v lido }

While Inicio <= fim Do
Begin
{ Calcula o elemento de base da pesquisa, que servir  para decidir
qual metade ser  descartada do vetor }
Meio := (Inicio + Fim) Div 2;

{ Opa, ser  que achamos o elemento procurado? }
If Nomes [Meio] = Procurado Then
Begin
{ Indica onde achou o elemento }
PesquisaElemento := True;

{ Manipula a sa¡da do loop }
Inicio := Fim + 1;
End
Else
{ Verifica qual metade do vetor ser  ignorada }
If Procurado < Nomes [Meio] Then
Fim := Meio - 1
Else
Inicio := Meio + 1;
end;
{Sempre depois da pesquisa, o meio indicar  onde o dado est  ou deveria estar}
PosicaoEncontrada := Meio;
writeln('meio',meio);
End;

procedure imprimir(var VetorNome:VetorAgenda);
var i:integer;
begin
     for i:=1 to n  do
     writeln(VetorNome[i]);
end;

procedure ZeraVetores(var VetorNome,VetorEndereco,VetorTelefone:VetorAgenda);
var i:integer;
begin
     for i:=1 to TAMANHO_MAXIMO  do
     begin
          VetorNome[i]:='0';
          VetorEndereco[i]:='0';
          VetorTelefone[i]:='0';
     end;
end;


{ Libera a posi‡Æo determinda pelo procedimento de pesquisa para a inser‡Æo correta dos dados }
procedure deslocamento( var vetor:VetorAgenda;posicao,NumeroDeElementos:integer;Sentido:TipoDeslocamento );
var indice:integer;{Controla a posi‡Æo do vetor recebido }
begin


     { Encaminha o deslocamento para direita }
     if sentido=DESLOCAMENTO_DIREITA then
        for indice:=TAMANHO_MAXIMO downto posicao+1 do
            Vetor[indice]:=Vetor[indice-1];

     { Encaminha o deslocamento para esquerda }
     if sentido=DESLOCAMENTO_ESQUERDA then
        for indice:=posicao to NumeroDeElementos do
            vetor[indice]:=vetor[indice+1];
end;


procedure InserirDados(Chave,Endereco,Telefone:string;
                       var VetorNome,VetorEndereco,VetorTelefone:VetorAgenda;
                       var NumeroDeElementos,posicao: integer;
                       var ElementoRepetido, VetorCheio: boolean);
begin

     { verifica as condi‡äes para inserir novas informa‡äes na agenda }
     ElementoRepetido:=PesquisaElemento (VetorNome,NumeroDeElementos,Chave,Posicao);
     if (ElementoRepetido=false) and (NumeroDeElementos<TAMANHO_MAXIMO) then
     begin
         writeln('posicao',posicao);
         { Prepara os vetores e insere os dados na posi‡Æo correta }
         VetorCheio:=false;
         Deslocamento(VetorNome,Posicao,NumeroDeElementos,DESLOCAMENTO_DIREITA);
         VetorNome[posicao]:=chave;
         Deslocamento(VetorEndereco,Posicao,NumeroDeElementos,DESLOCAMENTO_DIREITA);
         VetorEndereco[posicao]:=endereco;
         Deslocamento(VetorTelefone,Posicao,NumeroDeElementos,DESLOCAMENTO_DIREITA);
         VetorTelefone[posicao]:=Telefone;
         NumeroDeElementos:=NumeroDeElementos+1;
     end
     else

         { Informa as condi‡äes do vetor }
         if NumeroDeElementos=TAMANHO_MAXIMO then
            VetorCheio:=true
         else
            VetorCheio:=false;
end;


begin
clrscr;
ZeraVetores(VetorNome,VetorEndereco,VetorTelefone);
n:=0;
t:='s';
while t<>'n' do begin
      writeln('Digite o Nome');
      readln(nome);
      writeln('Digite o Endereco');
      readln(endereco);
      writeln('Digite o Telefone');
      readln(telefone);
      InserirDados(Nome,Endereco,Telefone,VetorNome,VetorEndereco,VetorTelefone
             ,n,posicao,ElementoRepetido,VetorCheio);
      imprimir(VetorNome);
      t:=readkey;
end;
end.
