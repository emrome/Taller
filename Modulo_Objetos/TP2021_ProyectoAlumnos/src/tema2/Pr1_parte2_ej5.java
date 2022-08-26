/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

/**
Realice un programa que cargue un vector con 10 strings leídos desde teclado. El vector generado tiene 
un mensaje escondido que se forma a partir de la primera letra de cada string. Muestre el mensaje 
escondido en consola.
NOTA: La primera letra de un string se obtiene enviándole el mensaje charAt(0) al objeto string. 
Probar con: humo oso lejos ala menos usado nene de ocho ! Debería imprimir: holamundo!
 */
import  PaqueteLectura.Lector;
public class Pr1_parte2_ej5 {
    public static void main(String[]args){
        int DIMF=10;
        String vStrings[]=new String[DIMF];
        int i;
        //carga del vector
        for(i=0;i<DIMF;i++){
            System.out.println("String "+i+": ");        
            vStrings[i]=Lector.leerString();
        }
        
        System.out.print("Mensaje escondido: ");
        for(i=0;i<DIMF;i++)
            System.out.print(vStrings[i].charAt(0));
    }
}
