/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

/**
 Indique qué imprimen los siguientes programas. Responda: 
¿Qué efecto tiene la asignación utilizada con objetos? La asignacion en objetos aigna dirreciones de memoria, no estado
¿Qué se puede concluir acerca de la comparación con == y != utilizada con objetos? comparan con las direcciones
¿Qué retorna el mensaje equals cuando se le envía a un String? Retorna true o falsa, compara estado interno.
 */
public class Pr1_parte2_ej3 {
    public static void main(String[] args) {
        //A
        String saludo1=new String("hola");
        String saludo2=new String("hola");
        System.out.println(saludo1 == saludo2);//Imprime FALSE. Compara direcciones de memoria, no estado interno del objeto
        System.out.println(saludo1 != saludo2);//Imprime TRUE. Compara direcciones de memoria, no estado interno del objeto
        System.out.println(saludo1.equals(saludo2));//Imprime TRUE. Compara estado interno de los objetos
       
        //B
        Persona p1; 
        Persona p2;
        p1 = new Persona();
        p1.setNombre("Pablo Sotile");
        p1.setDNI(11200413);
        p1.setEdad(40);
        p2 = new Persona();
        p2.setNombre("Julio Toledo");
        p2.setDNI(22433516);
        p2.setEdad(51);
       
        p1 = p2; //p1 ahora apunta a la misma dir que p2
        p1.setEdad( p1.getEdad() + 1 );//modifica la edad de los dos objetos, ahora es 52
        
        System.out.println(p2.toString());
        //Imprime “Mi nombre es Julio Toledo, mi DNI es 22433516 y tengo 52 años”
        System.out.println(p1.toString());
        //Imprime “Mi nombre es Julio Toledo, mi DNI es 22433516 y tengo 52 años”
        System.out.println( (p1 == p2) );//Imprime TRUE, hace la comparacion, le da TRUE y despues imprime
        
    } 
}

