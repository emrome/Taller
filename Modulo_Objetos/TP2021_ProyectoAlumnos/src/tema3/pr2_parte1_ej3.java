/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
A- Definir una clase para representar entrenadores de un club de fútbol. Un entrenador 
se caracteriza por su nombre, sueldo básico y la cantidad de campeonatos ganados.
▪ Defina métodos para obtener/modificar el valor de cada atributo.
▪ Defina el método calcularSueldoACobrar que calcula y devuelve el sueldo a cobrar por 
el entrenador. El sueldo se compone del sueldo básico, al cual se le adiciona un plus por 
campeonatos ganados (5000$ si ha ganado entre 1 y 4 campeonatos; $30.000 si ha 
ganado entre 5 y 10 campeonatos; 50.000$ si ha ganado más de 10 campeonatos).

* B- Realizar un programa principal que instancie un entrenador, cargándole datos leídos 
desde teclado. Pruebe el correcto funcionamiento de cada método implementado.
* 
pr2-parte2-ej2:Realice un programa que instancie un entrenador mediante el constructor que recibe 
los datos necesarios (nombre, sueldo básico, cantidad de campeonatos ganados).
 */
import PaqueteLectura.Lector;
public class pr2_parte1_ej3 {
    public static void main(String[]args){
        Entrenador entrenador;
        
        //Carga
        entrenador=new Entrenador();
        System.out.println("Ingrese nombre");
        entrenador.setNombre(Lector.leerString());
        System.out.println("Ingrese sueldo basico");
        entrenador.setSueldoBasico(Lector.leerDouble());
        System.out.println("Ingrese campeonatos ganados");
        entrenador.setCampeonatosGanados(Lector.leerInt());
        
        //carga con constructor no nulo
        String nombre;
        double sueldoBasico;
        int campeonatos;
        
        System.out.println("Ingrese nombre");
        nombre=Lector.leerString();
        System.out.println("Ingrese sueldo basico");
        sueldoBasico=Lector.leerDouble();
        System.out.println("Ingrese campeonatos ganados");
        campeonatos=Lector.leerInt();
        entrenador=new Entrenador(nombre,sueldoBasico,campeonatos);
        
        //informar
        System.out.println(">>Entrenador: "+entrenador.getNombre());
        System.out.println(">>Sueldo Basico: $"+entrenador.getSueldoBasico());
        System.out.println(">>Campeonatos Ganados: "+entrenador.getCampeonatosGanados());
        
        System.out.println("<<Sueldo a cobrar: $"+entrenador.calcularSueldoACobrar());
    }
}
