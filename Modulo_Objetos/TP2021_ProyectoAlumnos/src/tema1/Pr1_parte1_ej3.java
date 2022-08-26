/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

/**
 * Escriba un programa que lea las alturas de los 15 jugadores de un equipo de 
 * básquet y las almacene en un vector. Luego informe: 
 * - la altura promedio
 * - la cantidad de jugadores con altura por encima del promedio
 * NOTA: Dispone de un esqueleto para este programa en Ej03Jugadores.java
*/

import PaqueteLectura.Lector;
public class Pr1_parte1_ej3 {
    //para constantes final int DIMF=15
    public static void main(String[] args) {
        int DIMF=15;
        double alturasJug[] = new double[DIMF];   
        
        double suma=0,promedio; 
        int cantPromedio=0;
        
        int i;
        
        for(i=0;i<DIMF;i++){     
            System.out.println("Ingrese altura del jugador ");
            alturasJug[i]=Lector.leerDouble();
        }
        
        for(i=0;i<DIMF;i++)
            suma=suma + alturasJug[i];
        
        promedio=suma/DIMF; 
        System.out.println("Altura promedio "+ promedio);
        
        for(i=0;i<DIMF;i++)
            if(alturasJug[i]>promedio)
                cantPromedio++;
        System.out.println("Jugadores con altura por encima del promedio: "+cantPromedio);
        
    }
    
}
