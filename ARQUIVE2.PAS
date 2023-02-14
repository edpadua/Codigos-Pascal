program arquive;
uses crt;

const max = 3;

type tabela = record nome : string[20];
                     idade : integer;
              end;
     arquivo = file of tabela;

Dicionario = Record
	Entradas : Array [1..MAX] of tabela;
	Ult : Integer;
End;

var dados : arquivo;
    UmaPessoa : tabela ;
    reg: dicionario;

procedure InserirDados ( var Registro : tabela );
var dados : arquivo;
    indice : integer;
begin
     assign ( dados, 'dados.bin' );
     rewrite ( dados );
     for indice := 1 to max do
     begin
          writeln ('Digite o Nome');
          readln ( registro.nome );
          writeln ('Digite a Idade');
          readln ( registro.idade );
          write ( dados, registro );
     end;
     close ( dados );
end;

procedure LerDados ( var Registro : tabela );
var dados : arquivo;
begin
     assign ( dados, 'dados.bin' );
     reset ( dados );
     while not EOF ( dados ) do
     begin
          read ( dados, Registro );
          writeln ( 'Nome: ' ,registro.nome );
          writeln ( 'Idade: ',registro.idade );
     end;
     close ( dados );
end;

procedure PassaDados ( var dic : dicionario );
var dados : arquivo;
    indice : integer;
begin
     assign ( dados, 'dados.bin' );
     reset ( dados );
     indice := 1;
     while not EOF ( dados ) do
     begin
          read ( dados, dic.entradas[ indice ] );
          indice := indice+1;
     end;
     close ( dados );
end;

procedure Imprime ( var dic : dicionario );
var   indice : integer;
begin
     for indice := 1 to max do
     begin
          writeln( dic.entradas[ indice ] );
     end;
end;


begin
     clrscr;
     writeln ('Insira os dados no arquivo');
     InserirDados (UmaPessoa);
     writeln ('Leia os dados do arquivo');
     LerDados(UmaPessoa);
     readkey;
end.