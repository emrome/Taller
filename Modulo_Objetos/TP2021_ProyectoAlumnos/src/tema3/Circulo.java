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
* 
pr2-parte2-ej1B:
- i) Defina constructores para la clase Círculo (definida anteriormente): el primer 
constructor debe recibir un valor para el radio y para los colores de línea y relleno; el 
segundo constructor no debe poseer parámetros ni código (constructor nulo).
 */
public class Circulo {
    private double radio;
    private String colorRelleno;
    private String colorLinea;
    
    public Circulo() {//constructor nulo
    }
    public Circulo(double radio,String relleno,String linea){
        this.radio=radio;
        colorRelleno=relleno;
        colorLinea=linea;
    }
    
    public double getRadio(){
        return radio;
    }
    public String getColorLinea(){
        return colorLinea;
    }
    public String getColorRelleno(){
        return colorRelleno;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    public double calcularArea(){
        double aux;
        aux=Math.PI*(radio*radio);
        return aux ;
    }

    public double calcularPerimetro(){
        double aux;
        aux=2*Math.PI*radio;
        return aux;
    }
}
