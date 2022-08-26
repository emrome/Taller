/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

/**
 Se realizará un casting para un programa de TV. El casting durará a lo sumo 5
días y en cada día se entrevistarán a 8 personas en distinto turno.
 
a) Simular el proceso de inscripción de personas al casting. A cada persona
se le pide nombre, DNI y edad y se la debe asignar en un día y turno de la
siguiente manera: las personas primero completan el primer día en turnos
sucesivos, luego el segundo día y así siguiendo. La inscripción finaliza al
llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos de casting.

Una vez finalizada la inscripción: 
b) Informar para cada día y turno el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona y pensar en la estructura de datos a utilizar. 
 */
import  PaqueteLectura.Lector;
public class Pr1_parte2_ej4 {
    public static void main (String[]args){
        String CORTE="ZZZ";
        int DIAS=2,TURNOS=3;
        Persona mCasting[][]=new Persona[DIAS][TURNOS];
        int dimDias=0,dimTurnos=0; //dimTurnos es la cantidad de turnos del ultimo dia y dimDias tiene la cantidad de dias 
        
        String nombre;
        int DNI,edad,i,j;
        
        //INCISO A
        System.out.println("-Nombre: ");
        nombre=Lector.leerString();
        while(dimDias<DIAS && !nombre.equals(CORTE)){
            dimTurnos=0;
            while(dimTurnos<TURNOS && !nombre.equals(CORTE)){
                
                System.out.println("-DNI: ");
                DNI=Lector.leerInt();
                System.out.println("-Edad: ");
                edad=Lector.leerInt();
                //termino de lectura
                
                mCasting[dimDias][dimTurnos]=new Persona(nombre,DNI,edad);
                dimTurnos++;
                //nueva lectura
                System.out.println("-Nombre: ");
                nombre=Lector.leerString(); 
            } 
            dimDias++;
        }
        //Inciso B: Informar para cada día y turno el nombre de la persona a entrevistar.
        for(i=0;i<(dimDias-1);i++)//informa hasta el ult dia sin incluirlo
            for(j=0;j<TURNOS;j++)
                System.out.println("Dia "+(i+1)+" Turno "+(j+1)+" Persona a entrevistar :"+mCasting[i][j].getNombre());
                
        //impresión del ultimo dia
        for(j=0;j<dimTurnos;j++)
            System.out.println("Dia "+(i+1)+" Turno "+(j+1)+" Persona a entrevistar :"+mCasting[i][j].getNombre());
        
        
        /*HECHO DE OTRO FORMA
        String CORTE="ZZZ";
        int DIAS=2,TURNOS=3;
        Persona mCasting[][]=new Persona[DIAS][TURNOS];
        int i=0,j,dia,turno;
        
        String nombre;
        int DNI,edad,
        
        System.out.println("-Nombre: ");
        nombre=Lector.leerString();
        while((!nombre.equals(CORTE))&&(i<(DIAS*TURNOS))){
            dia=i/TURNOS
            turno=i%TURNOS;
            System.out.println("-DNI: ");
            DNI=Lector.leerInt();
            System.out.println("-Edad: ");
            edad=Lector.leerInt();
            //termino de lectura
            
            mCasting[dia][turno]=new Persona(nombre,DNI,edad);
            i++;
            //nueva lectura
            System.out.println("-Nombre: ");
                nombre=Lector.leerString(); 
        }
        //impresion
        for(j=0;j<i;j++){
            dia=j/TURNOS;
            turno=j%TURNOS;
            System.out.println("Dia "+(i+1)+" Turno "+(j+1)+" Persona a entrevistar :"+mCasting[dia][turno].getNombre());
        }
        */
            
    }
}
