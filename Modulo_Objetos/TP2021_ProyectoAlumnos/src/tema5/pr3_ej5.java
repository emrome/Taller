/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

/**
- Un objeto visor de figuras se encarga de mostrar en consola cualquier figura que reciba 
y también mantiene cuántas figuras mostró. Analice y ejecute el siguiente programa y 
responda: ¿Qué imprime? ¿Por qué?

 IMPRIME:
 1- Area: 100, CR:Violeta, CL:Rosa, Lado:10
 2- Area: 200, CR:Azul, CL:Celeste, Base:20 Altura:10
 3- Area:900, CR:Rojo, CL:Naranja, Lado:30
 4- 3(del getMostradas)
*/
public class pr3_ej5 {
    public static void main(String[] args) {
        VisorFiguras visor = new VisorFiguras();
 
        Cuadrado c1 = new Cuadrado(10,"Violeta","Rosa");
        Rectangulo r= new Rectangulo(20,10,"Azul","Celeste");
        Cuadrado c2= new Cuadrado(30,"Rojo","Naranja");
 
        visor.mostrar(c1);
        visor.mostrar(r);
        visor.mostrar(c2);
 
        System.out.println(visor.getMostradas());
    } 
}   

