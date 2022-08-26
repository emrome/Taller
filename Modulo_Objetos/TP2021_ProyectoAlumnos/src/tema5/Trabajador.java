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
public class Trabajador extends Persona{
    private String trabajo;
    
    public Trabajador(String nombre,int DNI,int edad,String trabajo){
        super(nombre,DNI,edad);
        this.setTrabajo(trabajo);
    }
    public void setTrabajo(String trabajo){
        this.trabajo=trabajo;
    }
    
    public String getTrabajo(){
        return trabajo;
    }
    
    @Override
    public String toString(){
        return super.toString()+" Soy "+trabajo;
    }
}
