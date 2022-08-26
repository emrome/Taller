/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

/*
  Escriba un programa que defina una matriz de enteros de tamaño 10x10. 
  Inicialice la matriz con números aleatorios entre 0 y 200. 
  Luego realice las siguientes operaciones: 
  - Mostrar el contenido de la matriz en consola. 
  - Calcular e informar la suma de todos los elementos almacenados entre las filas 2 y 9 y las columnas 0 y 3
  - Generar un vector de 10 posiciones donde cada posición i contiene la suma de los elementos de la columna i de la matriz.
  - Lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna) 
  en caso contrario imprima “No se encontró el elemento”.
 */
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class Pr1_parte1_ej4 {
  
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int DIMF=10,DIMC=10;
        int matriz [][]= new int[DIMF][DIMC];
        int vector[]=new int[DIMF];
        int suma1=0;
        int i,j,sumaColumnaI,valor;
        int posF,posC;
        boolean esta;
        
        for (i=0;i<DIMF;i++)
            for(j=0;j<DIMC;j++)
                matriz[i][j]=GeneradorAleatorio.generarInt(15); 
        
        //- Mostrar el contenido de la matriz en consola.
        for (i=0;i<DIMF;i++)
            for(j=0;j<DIMC;j++)
                System.out.println("Pos "+i+","+j+" "+matriz[i][j]);
        
        
        
        
        //calcula  suma de todos los elementos almacenados entre las filas 2 y 9 y las columnas 0 y 3
        for(i=2;i<=9;i++)
            for(j=0;j<=3;j++)
                suma1=suma1+matriz[i][j];
        System.out.println("Suma de los elementos almacenados entre las filas 2 y 9 y las columnas 0 y 3: "+suma1);
        
        //Generar un vector de 10 posiciones donde cada posición i contiene la suma de los elementos de la columna i de la matriz.
        
        //inicializar vector acumulador
        for (i=0;i<DIMF;i++)
           for(j=0;j<DIMC;j++)
               vector[i]=0;
        
        for (i=0;i<DIMF;i++)
            for(j=0;j<DIMC;j++)
                vector[i]=vector[i]+matriz[i][j];

        System.out.println("VECTOR");
        for(i=0;i<DIMF;i++)
            System.out.println("Pos "+i+": "+vector[i]);
        
        //Lea un valor entero e indique si se encuentra o no en la matriz.
        System.out.println("Ingrese valor a buscar en la matriz");
        valor=Lector.leerInt();
        esta=false;
        i=0;
        j=0;
        while((i<DIMF) && (!esta)){
            j=0;
            while((j<DIMC) &&(!esta)){
                if(matriz[i][j]==valor)
                    esta=true;
                else
                    j++;
            }
            if(!esta);
                i++;
        }   
        if(esta)  
            System.out.println("Posicion del valor "+valor+" Fila: "+i+" Columna: "+j);
        else
            System.out.println("No se encontró el elemento");
        
    }  
}


