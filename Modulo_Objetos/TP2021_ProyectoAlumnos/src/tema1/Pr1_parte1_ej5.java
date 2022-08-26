/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

/**
 *
 * Un edificio de oficinas está conformado por 8 pisos y 4 oficinas por piso. Realice un programa que permita informar la cantidad 
 * de personas que concurrieron a cada oficina de cada piso. Para esto, simule la llegada de personas al edificio de la siguiente 
 * manera: a cada persona se le pide el nro. de piso y nro. de oficina a la cual quiere concurrir. La llegada de personas finaliza 
 * al indicar un nro. de piso 9. Al finalizar la llegada de personas, informe lo pedido. 
 */
import PaqueteLectura.Lector;
public class Pr1_parte1_ej5 {
    public static void main (String[]args){
        int pisos=8,oficinas=4;
        int edificio[][]=new int[pisos][oficinas];
        int CORTE=9;
        int nroPiso,nroOficina;
        
        //inicializar edificio
        for(int i=0;i<pisos;i++)
            for(int j=0;j<oficinas;j++)
                edificio[i][j]=0;
 
        System.out.println("Ingrese nro de piso del 0 al 7");
        nroPiso=Lector.leerInt();
        while(nroPiso!=CORTE){//lectura de personas
            System.out.println("Ingrese nro de oficina del 0 a 3");
            nroOficina=Lector.leerInt();
            edificio[nroPiso][nroOficina]++;  
            System.out.println("Ingrese nro de piso");
            nroPiso=Lector.leerInt();
        }
        
        for(int i=0;i<pisos;i++)//informar edificio
            for(int j=0;j<oficinas;j++)
                System.out.println("Piso "+i+" Oficina "+j+", PERSONAS: "+edificio[i][j]);
    }
}
