/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

/**
Escriba un programa que instancie un triángulo, un círculo y un cuadrado, con 
información leída desde teclado. Luego muestre en consola el área y perímetro de cada 
uno y su representación en String
 */
import  PaqueteLectura.Lector;
public class pr3_ej1 {
    public static void main(String[]args){
        Circulo circulo;
        Cuadrado cuadrado;
        Triangulo triangulo;
        String colorL,colorR;
        double lado1,lado2,lado3;
        //CUADRADO
        System.out.println(">>Color linea cuadrado");
        colorL=Lector.leerString();
        System.out.println(">>Color relleno cuadrado");
        colorR=Lector.leerString();
        System.out.println(">>Medida lados: ");
        lado1=Lector.leerDouble();
        cuadrado=new Cuadrado(lado1,colorR,colorL);
        
        //TRIANGULO
        
        System.out.println(">>Color linea triangulo");
        colorL=Lector.leerString();
        System.out.println(">>Color relleno triangulo ");
        colorR=Lector.leerString();
        System.out.println(">>Medida lado 1: ");
        lado1=Lector.leerDouble();
        System.out.println(">>Medida lado 2: ");
        lado2=Lector.leerDouble();
        System.out.println(">>Medida lado 3: ");
        lado3=Lector.leerDouble();
        triangulo=new Triangulo(colorR,colorL,lado1,lado2,lado3);
        
        //CIRCULO
        System.out.println(">>Color linea circulo");
        colorL=Lector.leerString();
        System.out.println(">>Color relleno circulo");
        colorR=Lector.leerString();
        System.out.println(">>Medida radio: ");
        lado1=Lector.leerDouble();
        circulo=new Circulo(colorR,colorL,lado1);
        
        //IMPRIMIR
        System.out.println("TRIANGULO");
        System.out.println("Area: "+triangulo.calcularArea());
        System.out.println("Perimetro: "+triangulo.calcularPerimetro());
        System.out.println(triangulo.toString());
        
        System.out.println("CIRCULO");
        System.out.println("Area: "+circulo.calcularArea());
        System.out.println("Perimetro: "+circulo.calcularPerimetro());
        System.out.println(circulo.toString());
        
        System.out.println("CUADRADO");
        System.out.println("Area: "+cuadrado.calcularArea());
        System.out.println("Perimetro: "+cuadrado.calcularPerimetro());
        System.out.println(cuadrado.toString());
    }
}
