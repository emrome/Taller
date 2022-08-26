/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
Definir una clase para representar triángulos. Un triángulo se caracteriza por el 
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String). 
El triángulo debe saber: 
▪ Devolver/modificar el valor de cada uno de sus atributos (métodos get# y set#) 
▪ Calcular el área y devolverla (método calcularArea)
▪ Calcular el perímetro y devolverlo (método calcularPerimetro)

NOTA: Calcular el área con la fórmula Área = √s(s − a)(s − b)(s − c) , donde a,b y c son 
los lados y s =(a+b+c)/2 .La función raíz cuadrada es Math.sqrt(#)
 
1-A– i) Segunda Parte
Constructores: 
-primer constructor debe recibir un valor para cada lado y para los colores de línea y relleno; 
-segundo constructor no debe poseer parámetros ni código (constructor nulo). 
 */
public class Triangulo {
    //estado interno-variables de instancia
    private double lado1;
    private double lado3;
    private double lado2;
    private String colorRelleno;
    private String colorLinea;

   
    
    //constructores
    public Triangulo(double lado1,double lado2,double lado3,String linea,String relleno){
        this.lado1=lado1;
        this.lado2=lado2;
        this.lado3=lado2;
        colorLinea=linea;
        colorRelleno=relleno;
    }
    public Triangulo(){//constructor nulo
    }
    
    public double getLado1(){
        return lado1;
    }
    public double getLado3() {
        return lado3;
    }
    public double getLado2() {
        return lado2;
    }
    public String getColorRelleno() {
        return colorRelleno;
    }
    public String getColorLinea() {
        return colorLinea;
    }
    
    
    public void setLado1(double lado1){
        this.lado1=lado1;
    }
    public void setLado2(double lado2){
        this.lado2=lado2;
    }
    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }
    public void setColorRelleno(String colorRelleno){
        this.colorRelleno=colorRelleno;
    }
    public void setColorLinea(String colorLinea){
        this.colorLinea=colorLinea;
    }
    
    public double calcularPerimetro(){
        return lado1+lado2+lado3;
    }
    public double calcularArea(){
        double s;
        s=(this.calcularPerimetro())/2;
        return Math.sqrt(s*(s-lado1)*(s-lado2)*(s-lado3));
    }
}
