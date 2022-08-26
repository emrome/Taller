/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;
/**
 Utilizando la clase Persona (ya implementada). Realice un programa que almacene en 
un vector 15 personas. La información de cada persona debe leerse de teclado. Luego de 
almacenar la información:
- Informe la cantidad de personas mayores de 65 años.
- Muestre la representación de la persona con menor DNI
 */

import PaqueteLectura.Lector;
public class Pr1_parte2_ej2 {
    public static void main(String[]args){
        int DIMF=2,EDAD_COMP=65;
        Persona vPersonas[]=new Persona[DIMF];
        int i,minDni,minInd,cantMayor65=0;
        String nombre;
        int DNI,edad;
        
        for(i=0;i<DIMF;i++){
            System.out.println("-Nombre: ");
            nombre=Lector.leerString();
            System.out.println("-DNI: ");
            DNI=Lector.leerInt();
            System.out.println("-Edad: ");
            edad=Lector.leerInt();  
            vPersonas[i]=new Persona(nombre,DNI,edad);
        }
        minDni=999999999;
        minInd=-1;
        for(i=0;i<DIMF;i++){
            if(vPersonas[i].getEdad()>EDAD_COMP)
                cantMayor65++;
            if(vPersonas[i].getDNI()<minDni){
                minDni=vPersonas[i].getDNI();
                minInd=i;
            }
        }
        System.out.println("Personas mayores a 65 años: "+cantMayor65);
        System.out.println(vPersonas[minInd].toString());
    }
}
