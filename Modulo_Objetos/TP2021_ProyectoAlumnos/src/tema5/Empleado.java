/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

/**
 Queremos representar la información de empleados de un club: jugadores y 
 entrenadores. 
-Cualquier empleado se caracteriza por su nombre y sueldo básico. 
-Cualquier empleado (jugador / entrenador) debe saber responder al mensaje calcularSueldoACobrar
-Cualquier empleado debe responder al mensaje toString, que devuelve un String que lo representa. 
La representación de cualquier empleado está compuesta por su nombre y sueldo a cobrar
 */
public abstract class Empleado {
    private String nombre;
    private double sueldoBasico;
    
    public Empleado(String nombre,double sueldo){
        this.nombre=nombre;
        sueldoBasico=sueldo;
    }
    
    public void setSueldoBasico(double num){
        sueldoBasico=num;
    }
    public void setNombre(String nombre){
        this.nombre=nombre;
    }
    
    public double getSueldoBasico(){
        return sueldoBasico;
    }
    
    public String getNombre(){
        return nombre;
    }
    
    public abstract double calcularSueldoACobrar();
    
    @Override
    public String toString(){
        String aux="Nombre: "+this.getNombre()+" Sueldo a cobrar: "+this.calcularSueldoACobrar();
        return aux;
    }
    
    
}
