/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

/**
 Escriba un programa principal que instancie un jugador y un entrenador con datos 
leídos desde teclado. Pruebe el correcto funcionamiento de cada método implementado. 

 */
import PaqueteLectura.Lector;
public class pr3_ej2 {
    public static void main(String[]args){
        Entrenador entrenador;
        Jugador jugador;
        String nombre;
        double sueldo;
        int campeonatos,goles,partidos;
        //Entrenador
        System.out.println(">>Nombre entrenador");
        nombre=Lector.leerString();
        System.out.println(">>Sueldo Basico");
        sueldo=Lector.leerDouble();
        System.out.println(">>Campeonatos Ganados");
        campeonatos=Lector.leerInt();
        entrenador=new Entrenador(nombre,sueldo,campeonatos);
        //Jugador
        System.out.println(">>Nombre jugador");
        nombre=Lector.leerString();
        System.out.println(">>Sueldo Basico");
        sueldo=Lector.leerDouble();
        System.out.println(">>Goles anotados");
        goles=Lector.leerInt();
        System.out.println(">>Partidos Jugados");
        partidos=Lector.leerInt();
        jugador=new Jugador(nombre,sueldo,partidos,goles);
        //IMPRESION
        System.out.println("JUGADOR "+jugador.toString());
        System.out.println("ENTRENADOR "+entrenador.toString());

    }    
}
