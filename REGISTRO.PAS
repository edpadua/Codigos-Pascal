program salariow;
uses crt;
const max = 4;
type
     endereco = record
               numero : integer;
               rua : string[15];
     end;

     funcionario = record
                 nome: string;
                 salario: real;
                 ende: endereco;
                 end;
     Entrada = Record
	Pal_Ing : String [15];
	Pals_por : String [60];
     End;
     Dicionario = Record
	Entradas : Array [1..MAX] of Entrada;
	Ult : Integer;
     End;

     vetor= array [ 1..max ] of funcionario;

var tabela: dicionario;

procedure LerDados ( var dic: dicionario);
var indice: integer;
begin
     for indice := 1 to max do
     begin
          writeln ('Palavra em Ingles :');
          readln( dic.entradas[ indice ].Pal_Ing );
          writeln ('Traduá∆o em portugues :');
          readln( dic.entradas[ indice ].Pals_por );
          clrscr;
     end;
end;


procedure ImprimirDados( var dic: dicionario );
var indice: integer;
begin
     for indice := 1 to max do
     begin
          writeln ('Palavra em Ingles :');
          writeln( dic.entradas[ indice ].Pal_Ing );
          writeln ('Traduá∆o em portugues :');
          writeln( dic.entradas[ indice ].Pals_por );
          writeln;
     end;
end;

procedure Interface1 ( mensagem: string );
begin
     writeln('------------------------------');
     writeln('  ',mensagem,'  ');
     writeln('------------------------------');
end;


begin
     clrscr;
     Interface1 (' Entre com seus dados ');
     LerDados ( tabela );
     Interface1 ( 'Impress∆o de seus dados' );
     ImprimirDados ( tabela );
     readkey;
end.
