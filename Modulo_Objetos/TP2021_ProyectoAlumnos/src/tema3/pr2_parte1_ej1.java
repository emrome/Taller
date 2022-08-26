/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el 
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String). 
El triángulo debe saber: 
▪ Devolver/modificar el valor de cada uno de sus atributos (métodos get# y set#) 
▪ Calcular el área y devolverla (método calcularArea)
▪ Calcular el perímetro y devolverlo (método calcularPerimetro)

NOTA: Calcular el área con la fórmula Área = √s(s − a)(s − b)(s − c) , donde a,b y c son 
los lados y s =(a+b+c)/2 .La función raíz cuadrada es Math.sqrt(#)

B- Realizar un programa principal que instancie un triángulo, le cargue información leída 
desde teclado e informe en consola el perímetro y el área. 
ii) Realice un programa que instancie un triángulo mediante los distintos constructores.
 */

import PaqueteLectura.Lector;
public class pr2_parte1_ej1 {
    public static void main(String[]args){
        Triangulo triangulo;
        
        //carga
        triangulo=new Triangulo();//instacicion constructor nulo
        System.out.println(">>Medida lado 1: ");
        triangulo.setLado1(Lector.leerDouble());
        System.out.println(">>Medida lado 2: ");
        triangulo.setLado2(Lector.leerDouble());
        System.out.println(">>Medida lado 3: ");
        triangulo.setLado3(Lector.leerDouble());
        System.out.println(">>Color de linea: ");
        triangulo.setColorLinea(Lector.leerString());
        System.out.println(">>Color de relleno: ");
        triangulo.setColorRelleno(Lector.leerString());
        
        //instancion constructor no nulo;
        double lado1,lado2,lado3;
        String colorLinea,colorRelleno;
        System.out.println(">>Medida lado 1: ");
        lado1=Lector.leerDouble();
        System.out.println(">>Medida lado 2: ");
        lado2=Lector.leerDouble();
        System.out.println(">>Medida lado 3: ");
        lado3=Lector.leerDouble();
        System.out.println(">>Color de linea: ");
        colorLinea=Lector.leerString();
        System.out.println(">>Color de relleno: ");
        colorRelleno=Lector.leerString();
        triangulo=new Triangulo(lado1,lado2,lado2,colorLinea,colorRelleno);
        
        //informar
        System.out.println(">>Área: "+triangulo.calcularArea());
        System.out.println(">>Perimetro: "+triangulo.calcularPerimetro());
    }
}
