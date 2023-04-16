package codigo;
import static codigo.Tokens.*;

//definicion de clases y tipos por medio de expresiones regulares y string para retorno del lexema
%%
%class Lexer
%type Tokens
Letras=[a-zA-Z_]+
Digitos=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    public String lexeme;
%}
%%
//definicion de palabras reservadas, clases y caracteres a excluir
Algoritmo | Cadena | Caracter | Como | Con Paso	| De Otro Modo | Definir | Dimension | Entero |
Entonces | Escribir | Falso | FinAlgoritmo | FinFuncion | FinMientras | FinPara | FinSegun | FinSi |  
FinSubProceso | Funcion | Hacer | Hasta | Hasta Que | Leer | Logico | Mientras | Para | Por Referencia |
Por Valor | Real | Segun | Si | Sin Saltar | SiNo | SubProceso | Verdadero {lexeme=yytext(); return Reservadas;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"INICIO" {/*Ignore*/}
"=" {lexeme=yytext(); return opIgual;}
"+" {lexeme=yytext(); return opSuma;}
"-" {lexeme=yytext(); return opResta;}
"*" {lexeme=yytext(); return opMultiplicacion;}
"/" {lexeme=yytext(); return opDivision;}
"." { lexeme=yytext(); return signoPuntuacion; }
"," {lexeme=yytext(); return signoPuntuacion; }
"[" {lexeme=yytext(); return signoAgrupacion;}
"]" {lexeme=yytext(); return signoAgrupacion;}
"(" {lexeme=yytext(); return signoAgrupacion; }
")" {lexeme=yytext(); return signoAgrupacion; }
"{" {lexeme=yytext(); return signoAgrupacion;}
"}" {lexeme=yytext(); return signoAgrupacion; }
{Letras}({Letras}|{Digitos})* {lexeme=yytext(); return Identificador;}
("(-"{Digitos}+")")|{Digitos}+ {lexeme=yytext(); return Numero;}
 . {lexeme=yytext(); return ERROR;}
