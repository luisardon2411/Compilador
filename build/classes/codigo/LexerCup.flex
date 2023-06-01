package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char

//MACROS
Letra = [a-zA-Z]
Digito = [0-9]
Espacio = [ ,\t,\r,\n]+
AlfaNumerico = ({Letra}+|{Letra}+{Digito}+)+
Entero = {Digito}+
Real = {Digito}+ "." {Digito}+
Comillas = [\"\']
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

{Espacio} {/*Ignore*/}
"//".* {/*Ignore*/}

// Condiciones
"si" {return new Symbol(sym.Si, yychar, yyline, yytext());}

"sino" {return new Symbol(sym.Sino, yychar, yyline, yytext());}

"fin_si" {return new Symbol(sym.Fin_Si, yychar, yyline, yytext());}

"segun" {return new Symbol(sym.Segun, yychar, yyline, yytext());}

"caso" {return new Symbol(sym.Caso, yychar, yyline, yytext());}

"defecto" {return new Symbol(sym.Defecto, yychar, yyline, yytext());}

"fin_segun" {return new Symbol(sym.Fin_Segun, yychar, yyline, yytext());}

"mientras" {return new Symbol(sym.Mientras, yychar, yyline, yytext());}

"fin_mientras" {return new Symbol(sym.Fin_Mientras, yychar, yyline, yytext());}

"repetir" {return new Symbol(sym.Repetir, yychar, yyline, yytext());}

"hasta" {return new Symbol(sym.Hasta, yychar, yyline, yytext());}

"hasta_que" {return new Symbol(sym.Hasta_Que, yychar, yyline, yytext());}

"para" {return new Symbol(sym.Para, yychar, yyline, yytext());}

"fin_para" {return new Symbol(sym.Fin_Para, yychar, yyline, yytext());}

"hacer" {return new Symbol(sym.Hacer, yychar, yyline, yytext());}

"con_paso" {return new Symbol(sym.Con_Paso, yychar, yyline, yytext());}

// Tipos de datos
(entero | real | texto | caracter | logico) {return new Symbol(sym.T_Dato, yychar, yyline, yytext());}

// Funciones
"leer" {return new Symbol(sym.Leer, yychar, yyline, yytext());}

"escribir" {return new Symbol(sym.Escribir, yychar, yyline, yytext());}

"funcion" {return new Symbol(sym.Funcion, yychar, yyline, yytext());}

"fin_funcion" {return new Symbol(sym.Fin_Funcion, yychar, yyline, yytext());}

"procedimiento" {return new Symbol(sym.Procedimiento, yychar, yyline, yytext());}

"fin_procedimiento" {return new Symbol(sym.Fin_Procedimiento, yychar, yyline, yytext());}

/* Marcador de inicio de algoritmo */
( "algoritmo" ) {return new Symbol(sym.Algoritmo, yychar, yyline, yytext());}

/* Marcador de inicio de algoritmo */
( "finAlgoritmo" ) {return new Symbol(sym.Fin_Algoritmo, yychar, yyline, yytext());}

/* Operador Suma */
( "+" ) {return new Symbol(sym.Suma, yychar, yyline, yytext());}

/* Operador Resta */
( "-" ) {return new Symbol(sym.Resta, yychar, yyline, yytext());}

/* Operador Multiplicacion */
( "*" ) {return new Symbol(sym.Multiplicacion, yychar, yyline, yytext());}

/* Operador Division */
( "/" ) {return new Symbol(sym.Division, yychar, yyline, yytext());}

/* Operadores logicos */
( "&" | "|" | "!" | "y" | "no" | "o") {return new Symbol(sym.Op_Logico, yychar, yyline, yytext());}

/*Operadores Comparacion */
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {return new Symbol(sym.Op_Comparacion, yychar, yyline, yytext());}

( "=" ) {return new Symbol(sym.Op_Asignacion, yychar, yyline, yytext());}

/* Punto y coma */
( ";" ) {return new Symbol(sym.P_Coma, yychar, yyline, yytext());}
( "." ) {return new Symbol(sym.Punto, yychar, yyline, yytext());}
(",") {return new Symbol(sym.Coma, yychar, yyline, yytext());}
( ":" ) {return new Symbol(sym.Puntos, yychar, yyline, yytext());}
/*Operadores Booleanos*/
(verdadero | falso) {return new Symbol(sym.Op_Booleano, yychar, yyline, yytext());}

/* Parentesis de apertura */
( "(" ) {return new Symbol(sym.Parentesis_a, yychar, yyline, yytext());}

/* Parentesis de cierre */
( ")" ) {return new Symbol(sym.Parentesis_c, yychar, yyline, yytext());}

/* Llave de apertura */
( "{" ) {return new Symbol(sym.Llave_a, yychar, yyline, yytext());}

/* Llave de cierre */
( "}" ) {return new Symbol(sym.Llave_c, yychar, yyline, yytext());}

/* Corchete de apertura */
( "[" ) {return new Symbol(sym.Corchete_a, yychar, yyline, yytext());}

/* Corchete de cierre */
( "]" ) {return new Symbol(sym.Corchete_c, yychar, yyline, yytext());}

"entonces" {return new Symbol(sym.Entonces, yychar, yyline, yytext());}

{Comillas} {return new Symbol(sym.Comillas, yychar, yyline, yytext());}

{AlfaNumerico} {return new Symbol(sym.Identificador, yychar, yyline, yytext());}

{Entero}|{Real} {return new Symbol(sym.Numero, yychar, yyline, yytext());}

({Comillas}{AlfaNumerico}{Comillas}) {return new Symbol(sym.Cadena, yychar, yyline, yytext());}

/* Error de analisis */
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}
