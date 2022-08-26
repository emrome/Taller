/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

/**
 *Escriba un programa que imprima en consola el factorial de todos los números 
 *entre 1 y 9. ¿Qué modificación debe hacer para imprimir el factorial de los 
 *números impares solamente? CAMBIAR SOLO EL INCREMENTO DEL INDICE
 */
public class Pr1_parte1_ej2 {
    public static void main (String[]args){
        int factorial,aux;
        for(int i=1;i<=9;i++){
            factorial=1;
            aux=i;
            while(aux>0){
                factorial=factorial*aux;
                aux--;
            }
            System.out.println(i + "!= "+ factorial);
        }  
    }
}

