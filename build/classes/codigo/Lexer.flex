
package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens

//MACROS
Letra = [a-zA-Z]
Digito = [0-9]
Espacio = [ ,\t,\r,\n]+
AlfaNumerico = ({Letra}+|{Letra}+{Digito}+)+
Entero = {Digito}+
Real = {Digito}+ "." {Digito}+
Comillas = [\"\']

%{
    public String lexeme;
%}
%%

{Espacio} {/*Ignore*/}
"//".* {/*Ignore*/}

// Definición de palabras reservadas
// Condiciones
"si" {lexeme=yytext(); return Si;}
"sino" {lexeme=yytext(); return Sino;}
"fin_si" {lexeme=yytext(); return Fin_Si;}
"segun" {lexeme=yytext(); return Segun;}
"caso" {lexeme=yytext(); return Caso;}
"defecto" {lexeme=yytext(); return Defecto;}
"fin_segun" {lexeme=yytext(); return Fin_Segun;}
"mientras" {lexeme=yytext(); return Mientras;}
"fin_mientras" {lexeme=yytext(); return Fin_Mientras;}
"repetir" {lexeme=yytext(); return Repetir;}
"hasta" {lexeme=yytext(); return Hasta;}
"hasta_que" {lexeme=yytext(); return Hasta_Que;}
"para" {lexeme=yytext(); return Para;}
"fin_para" {lexeme=yytext(); return Fin_Para;}
"hacer" {lexeme=yytext(); return Hacer;}
"con_paso" {lexeme=yytext(); return Con_Paso;}

// Tipos de datos
(entero | real | texto | caracter | logico) {lexeme=yytext(); return T_Dato;}

// Funciones
"leer" {lexeme=yytext(); return Leer;}
"escribir" {lexeme=yytext(); return Escribir;}
"funcion" {lexeme=yytext(); return Funcion;}
"fin_funcion" {lexeme=yytext(); return Fin_Funcion;}
"procedimiento" {lexeme=yytext(); return Procedimiento;}
"fin_procedimiento" {lexeme=yytext(); return Fin_Procedimiento;}

/* Marcador de inicio de algoritmo */
( "algoritmo" ) {lexeme=yytext(); return Algoritmo;}

/* Marcador de inicio de algoritmo */
( "finAlgoritmo" ) {lexeme=yytext(); return Fin_Algoritmo;}

/* Operador Suma */
( "+" ) {lexeme=yytext(); return Suma;}

/* Operador Resta */
( "-" ) {lexeme=yytext(); return Resta;}

/* Operador Multiplicacion */
( "*" ) {lexeme=yytext(); return Multiplicacion;}

/* Operador Division */
( "/" ) {lexeme=yytext(); return Division;}

/* Operadores logicos */
( "&" | "|" | "!" | "y" | "no" | "o") {lexeme=yytext(); return Op_Logico;}

/*Operadores Comparacion */
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {lexeme = yytext(); return Op_Comparacion;}

( "=" ) {lexeme=yytext(); return Op_Asignacion;}

/* Punto y coma */
( ";" ) {lexeme=yytext(); return P_Coma;}
( "." ) {lexeme=yytext(); return Punto;}
(",")  {lexeme=yytext(); return Coma;}
( ":" ) {lexeme=yytext(); return Puntos;}
/*Operadores Booleanos*/
(verdadero | falso) {lexeme = yytext(); return Op_Booleano;}

/* Parentesis de apertura */
( "(" ) {lexeme=yytext(); return Parentesis_a;}

/* Parentesis de cierre */
( ")" ) {lexeme=yytext(); return Parentesis_c;}

/* Llave de apertura */
( "{" ) {lexeme=yytext(); return Llave_a;}

/* Llave de cierre */
( "}" ) {lexeme=yytext(); return Llave_c;}

/* Corchete de apertura */
( "[" ) {lexeme = yytext(); return Corchete_a;}

/* Corchete de cierre */
( "]" ) {lexeme = yytext(); return Corchete_c;}

"entonces" {lexeme=yytext(); return Entonces;}

{Comillas} {lexeme=yytext(); return Comillas;}
{AlfaNumerico} {lexeme=yytext(); return Identificador;}
{Entero}|{Real} {lexeme=yytext(); return Numero;}
({Comillas}{AlfaNumerico}{Comillas}) {lexeme=yytext(); return Cadena;}

 . {return ERROR;}
