/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

/**
Se dispone de una clase Persona (ya implementada en la carpeta tema2). Un objeto persona puede crearse sin valores 
iniciales o enviando en el mensaje de creación el nombre, DNI y edad (en ese orden). Un objeto persona responde 
a los siguientes mensajes: 
-getNombre() retorna el nombre (String) de la persona
-getDNI() retorna el dni (int) de la persona
-getEdad() retorna la edad (int) de la persona
-setNombre(X) modifica el nombre de la persona al “String” pasado por parámetro (X)
-setDNI(X) modifica el DNI de la persona al “int” pasado por parámetro (X)
-setEdad(X) modifica la edad de la persona al “int” pasado por parámetro (X)
-toString() retorna un String que representa al objeto. Ej: “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años” 
 Realice un programa que cree un objeto persona con datos leídos desde teclado. Luego muestre en consola 
la representación de ese objeto en formato String. 

Piense y responda: ¿Qué datos conforman el estado del objeto persona? ¿Cómo se implementan dichos datos? 
¿Qué ocurre cuando se le envía un mensaje al objeto?
 RTA: Los datos que conforman el estado de Persona son un string y dos int, se implementan mediante la creacion 
 del objeto pasando los datos como parametros o bien cuando se utilizan los metodos de set propios de persona. 
 Cuando se le envia una mensaje al objeto este puede modificar su estado o bien enviar datos
 */
import PaqueteLectura.Lector;
public class Pr1_parte2_ej1 {
    public static void main (String[]args){
      
        Persona personita;
        System.out.println("-Nombre: ");
        String nombre=Lector.leerString();
        System.out.println("-DNI: ");
        int DNI=Lector.leerInt();
        System.out.println("-Edad: ");
        int edad=Lector.leerInt();
        personita=new Persona(nombre,DNI,edad);
        System.out.println(personita.toString());
   /*
        Persona personita=new Persona();
        System.out.println("-Nombre: ");
        personita.setNombre(Lector.leerString());
        System.out.println("-DNI: ");
        personita.setDNI(Lector.leerInt());
        System.out.println("-Edad: ");
        personita.setEdad(Lector.leerInt());
        System.out.println(personita.toString());
    */
    }
}
