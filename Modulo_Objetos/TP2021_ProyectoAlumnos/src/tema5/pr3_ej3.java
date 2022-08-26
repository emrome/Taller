/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

/**
B- Genere un programa que instancie una persona y un trabajador con datos leídos de 
teclado y muestre la representación de cada uno en consola. 
 */
import PaqueteLectura.Lector;
public class pr3_ej3 {
    public static void main(String[]args){
        Persona persona;
        Trabajador trabajador;
        String nombre,trabajo;
        int DNI,edad;
        //persona
        System.out.println(">>NOMBRE");
        nombre=Lector.leerString();
        System.out.println(">>DNI");
        DNI=Lector.leerInt();
        System.out.println(">>EDAD");
        edad=Lector.leerInt();
        persona=new Persona(nombre,DNI,edad);
        //trabajador
        System.out.println(">>NOMBRE");
        nombre=Lector.leerString();
        System.out.println(">>DNI");
        DNI=Lector.leerInt();
        System.out.println(">>EDAD");
        edad=Lector.leerInt();
        System.out.println(">>TRABAJO");
        trabajo=Lector.leerString();
        trabajador=new Trabajador(nombre,DNI,edad,trabajo);
        
        System.out.println(persona.toString());
        System.out.println(trabajador.toString());
    }
}
