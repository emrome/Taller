/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

/**
 * Escriba un programa que imprima en consola el factorial de un número N (ingresado por teclado, N > 0). 
 * Ejemplo: para N=5 debería imprimir 5! = 120 
*/

import PaqueteLectura.Lector; 
public class Pr1_parte1_ej1 {
    public static void main (String[]args){
        int num,factorial,i;
        num = Lector.leerInt();
        factorial=1;
        for(i=2;i<=num;i++)
            factorial=factorial*num;
        System.out.println(num + "! = " +factorial);
    }
}

        