package codigo;

import static codigo.Tokens.*;

%%
%class Lexer
%type Tokens

%{
    public String lexeme;
%}

// Definición de caracteres y expresiones regulares
Letra=[a-zA-Z_áéíóúñÁÉÍÓÚÑ]
Digito=[0-9]
Signo=[+\-*/%=]
Delimitador=[.,;]
Agrupacion=[()\[\]\{\}]
Espacio=[ \t\n\r]
Identificador={Letra}({Letra}|{Digito})*


// Definición de palabras reservadas
%%

// Operadores
"y"  {lexeme=yytext(); return opY;}
"o"  {lexeme=yytext(); return opO;}
"no" {lexeme=yytext(); return opNo;}

// Condiciones
"si"       {lexeme=yytext(); return si;}
"sino"     {lexeme=yytext(); return sino;}
"fin_si"   {lexeme=yytext(); return fin_si;}
"segun"    {lexeme=yytext(); return segun;}
"caso"     {lexeme=yytext(); return caso;}
"defecto"  {lexeme=yytext(); return defecto;}
"fin_segun" {lexeme=yytext(); return fin_segun;}
"mientras" {lexeme=yytext(); return mientras;}
"fin_mientras" {lexeme=yytext(); return fin_mientras;}
"repetir"  {lexeme=yytext(); return repetir;}
"hasta_que" {lexeme=yytext(); return hasta_que;}
"para"     {lexeme=yytext(); return para;}
"fin_para" {lexeme=yytext(); return fin_para;}

// Tipos de datos
"entero"   {lexeme=yytext(); return entero;}
"real"     {lexeme=yytext(); return real;}
"texto"    {lexeme=yytext(); return texto;}
"caracter" {lexeme=yytext(); return caracter;}
"logico"   {lexeme=yytext(); return logico;}

// Funciones
"leer"     {lexeme=yytext(); return leer;}
"escribir" {lexeme=yytext(); return escribir;}
"funcion"  {lexeme=yytext(); return funcion;}
"fin_funcion" {lexeme=yytext(); return fin_funcion;}
"procedimiento" {lexeme=yytext(); return procedimiento;}
"fin_procedimiento" {lexeme=yytext(); return fin_procedimiento;}


// Identificador para arreglos
((entero|real|texto|caracter){Letra}({Letra}|{Digito})* ) | ({Letra}({Letra}|{Digito})*\[[0-9]+\]) {lexeme=yytext(); return identificador_arreglo;}
// Identificadores y números
{Identificador} {lexeme=yytext(); return identificador;}
{Digito}+(\.{Digito}+)?      {lexeme=yytext(); return numero;}

// Signos y delimitadores
{Signo}   {lexeme=yytext(); return signo;}
{Delimitador}  {lexeme=yytext(); return delimitador;}
{Agrupacion}   {lexeme=yytext(); return agrupacion;}
{Espacio}+     {/* Ignorar espacios en blanco */}

. {lexeme=yytext(); return error;}

