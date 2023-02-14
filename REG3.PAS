program salariow;
uses crt;
const max = 4;
type

     Entrada = Record
	Pal_Ing : String [15];
	Pals_por : String [60];
     End;
     Dicionario = Record
	Entradas : Array [1..MAX] of Entrada;
	Ult : Integer;
     End;

     arquivo = file of dicionario;



var tabela, tabela2: dicionario;

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

procedure InserirDadosNoarquivo ( var dic : dicionario );
var dados : arquivo;
    indice : integer;
begin
     assign ( dados, 'dados.bin' );
     rewrite ( dados );
     for indice := 1 to max do
     begin
          write ( dados, dic );
     end;
     close ( dados );
end;

procedure AbreArquivoCliente ( var dic : dicionario );
var dados : arquivo;
    indice : integer;
begin
     assign ( dados, 'dados.bin' );
     reset ( dados );
     indice := 1;
     while not EOF ( dados ) do
     begin
          read ( dados, dic );
          indice := indice+1;
     end;
     dic.ult := indice-1;
     close ( dados );
end;


procedure ImprimirDados( var dic: dicionario );
var indice: integer;
begin
          writeln(' tamanho = ', dic.ult );
     for indice := 1 to max do
     begin
          writeln ('Palavra em Ingles :');
          writeln( dic.entradas[ indice ].Pal_Ing );
          writeln ('Traduá∆o em portugues :');
          writeln( dic.entradas[ indice ].Pals_por );
          writeln;
     end;
end;

procedure ImprimirArquivo ( var dic : dicionario );
var dados : arquivo;
    indice : integer;
begin
     assign ( dados, 'dados.bin' );
     reset ( dados );
     indice := 1;
     while not EOF ( dados ) do
     begin
          read ( dados, dic );
          writeln ('Palavra em Ingles :');
          writeln( dic.entradas[ indice ].Pal_Ing );
          writeln ('Traduá∆o em portugues :');
          writeln( dic.entradas[ indice ].Pals_por );
          writeln;
          indice := indice+1;
     end;
     close ( dados );
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
   {  LerDados ( tabela ); }
   {  InserirDadosNoArquivo ( tabela );    }
     Interface1 ( 'Impress∆o de seus dados' );
     AbreArquivoCliente ( tabela );
     ImprimirDados ( tabela );
     readkey;
end.
