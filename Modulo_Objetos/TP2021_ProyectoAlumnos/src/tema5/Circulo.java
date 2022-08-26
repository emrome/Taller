/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

/**
 *
 * @author Emilia
 */
public class Circulo extends Figura{
    private double radio;
    
    public Circulo(String colorR,String colorL,double radio){
        super(colorL,colorR);
        setRadio(radio);
    }
    
    public void setRadio(double radio){
        this.radio=radio;
    }
    public double getRadio(){
        return radio;
    }
    @Override
    public double calcularArea(){
        return radio*radio*Math.PI;
    }
    @Override
    public double calcularPerimetro(){
        return 2*Math.PI*radio;
    }
    
    @Override
    public String toString(){
        String aux=super.toString()+ " Radio: "+getRadio();
        return aux;
    }
}
