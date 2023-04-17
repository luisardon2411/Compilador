/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Enum.java to edit this template
 */
package codigo;

/**
 *
 * @author luise.ardon
 */
//se enumeran TODOS los tokens que seran utilizados
public enum Tokens {
    // Generacion de tokens con sus respectivos mensajes
    opY {
        public String mensaje(String lexeme){
            return "Operador Y: " + lexeme + "\n";
        }
    },
    opO {
        public String mensaje(String lexeme){
            return "Operador O: " + lexeme + "\n";
        }
    },
    opNo {
        public String mensaje(String lexeme){
            return "Operador No: " + lexeme + "\n";
        }
    },
    si {
        public String mensaje(String lexeme){
            return "Condicion Si: " + lexeme + "\n";
        }
    },
    sino {
        public String mensaje(String lexeme){
            return "Condicion Sino: " + lexeme + "\n";
        }
    },
    fin_si {
        public String mensaje(String lexeme){
            return "Condicion fin_si: " + lexeme + "\n";
        }
    },
    segun {
        public String mensaje(String lexeme){
            return "Condicion segun: " + lexeme + "\n";
        }
    },
    caso {
        public String mensaje(String lexeme){
            return "Condicion caso: " + lexeme + "\n";
        }
    },
    defecto {
        public String mensaje(String lexeme){
            return "Condicion defecto: " + lexeme + "\n";
        }
    },
    fin_segun {
        public String mensaje(String lexeme){
            return "Condicion fin_segun: " + lexeme + "\n";
        }
    },
    mientras {
        public String mensaje(String lexeme){
            return "Condicion mientras: " + lexeme + "\n";
        }
    },
    fin_mientras {
        public String mensaje(String lexeme){
            return "Condicioin fin_mientras: " + lexeme + "\n";
        }
    },
    repetir {
        public String mensaje(String lexeme){
            return "Condicion repetir: " + lexeme + "\n";
        }
    },
    hasta_que {
        public String mensaje(String lexeme){
            return "Condicion hasta_que: " + lexeme + "\n";
        }
    },
    para {
        public String mensaje(String lexeme){
            return "Condicion para: " + lexeme + "\n";
        }
    },
    fin_para {
        public String mensaje(String lexeme){
            return "Condicion fin_para: " + lexeme + "\n";
        }
    },
    entero {
        public String mensaje(String lexeme){
            return "Tipo de dato: " + lexeme + "\n" ;
        }
    },
    real {
        public String mensaje(String lexeme){
            return "Tipo de dato: " + lexeme + "\n";
        }
    },
    texto {
        public String mensaje(String lexeme){
            return "Tipo de dato: " + lexeme + "\n";
        }
    },
    caracter {
        public String mensaje(String lexeme) {
            return "Tipo de dato: " + lexeme + "\n";
        }
    },
    logico {
        public String mensaje(String lexeme) {
            return "Tipo de dato: " + lexeme + "\n";
        }
    },
    leer {
        public String mensaje(String lexeme){
            return "Funcion de: " + lexeme + "\n";
        }
    },
    escribir {
        public String mensaje(String lexeme){
            return "Funcion de salida: " + lexeme + "\n";
        }
    },
    funcion {
        public String mensaje(String lexeme){
            return "Inicio de Funcion: " + lexeme + "\n";
        }
    },
    fin_funcion {
        public String mensaje(String lexeme){
            return "final de funcion: " + lexeme + "\n";
        }
    },
    procedimiento{
        public String mensaje(String lexeme ){
            return "Inicio de procedimiento: " + lexeme + "\n";
        }
    },
    fin_procedimiento {
        public String mensaje(String lexeme){
            return "final de procedimiento: " + lexeme + "\n";
        }
    },
    identificador {
        public String mensaje(String lexeme){
            return "Identificador: " + lexeme + "\n";
        }
    },
    identificador_arreglo{
        public String mensaje(String lexeme){
            return "identificador de arreglo: "+lexeme+ "\n";
        }
    },
    numero {
        public String mensaje(String lexeme){
            return "Numero: " + lexeme + "\n";
        }
    },
    signo {
        public String mensaje(String lexeme){
            return "Signo: " + lexeme + "\n";
        }
    },
    delimitador {
        public String mensaje(String lexeme){
            return "Signo delimitador: " + lexeme + "\n";
        }
    },
    agrupacion{
        public String mensaje(String lexeme) {
            return "Signo de agrupacion: " + lexeme + "\n";
        }
    },
    error {
        public String mensaje(String lexeme){
            return "Simbolo no definido\n";
        }
    };
    public abstract String mensaje(String lexeme);
}
