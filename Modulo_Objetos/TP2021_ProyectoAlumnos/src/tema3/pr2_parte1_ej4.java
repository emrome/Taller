/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
A- Generar una clase para representar círculos. Los círculos se caracterizan por su radio 
(double), el color de relleno (String) y el color de línea (String). El círculo debe saber: 
▪ Devolver/modificar el valor de cada uno de sus atributos (get# y set#)
▪ Calcular el área y devolverla. (método calcularArea)
▪ Calcular el perímetro y devolverlo. (método calcularPerimetro)
NOTA: la constante PI es Math.PI
 
B- Realizar un programa principal que instancie un círculo, le cargue información leída 
de teclado e informe en consola el perímetro y el área
* 
pr2-parte2-ej1B:Realice un programa que instancie un círculo mediante los distintos constructores
 */
import PaqueteLectura.Lector;
public class pr2_parte1_ej4 {
    public static void main(String[]args){
        Circulo circulo;
        double radio;
        String relleno,linea;
        
        System.out.println(">>Radio");
        radio=Lector.leerDouble();
        System.out.println(">>Color Relleno");
        relleno=Lector.leerString();
        System.out.println(">>Color Linea");
        linea=Lector.leerString();
        circulo=new Circulo(radio,relleno,linea);
        
        System.out.println(">>CIRCULO");
        System.out.println(">>Radio: "+circulo.getRadio());
        System.out.println(">>Color Relleno: "+circulo.getColorRelleno());
        System.out.println(">>Color Linea: "+circulo.getColorLinea());
        System.out.println(">>Perimetro: "+circulo.calcularPerimetro());
        System.out.println(">>Área: "+circulo.calcularArea());
    }
}
