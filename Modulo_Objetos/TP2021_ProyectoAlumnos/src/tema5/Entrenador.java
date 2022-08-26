/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

/**
Los entrenadores son empleados que se caracterizan por la cantidad de campeonatos ganados
 
-calcularSueldoACobrar:
Para los entrenadores: el sueldo a cobrar es el sueldo básico al cual se le adiciona un 
plus por campeonatos ganados (5000$ si ha ganado entre 1 y 4 campeonatos; $30.000 
si ha ganado entre 5 y 10 campeonatos; 50.000$ si ha ganado más de 10 
campeonatos).
 */
public class Entrenador extends Empleado {
    private int campeonatosGanados;
    
    public Entrenador(String nombre,double sueldo, int campeonatos){
        super(nombre,sueldo);
        this.setCampeonatosGanados(campeonatos);
    }
    public int getCampeonatosGanados(){
        return campeonatosGanados;
    }
    public void setCampeonatosGanados(int campeonatos){
        campeonatosGanados=campeonatos;
    }
    
    public double calcularSueldoACobrar(){
        double aux=getSueldoBasico();
        if(campeonatosGanados>10)//ganado más de 10 campeonatos
            aux=aux+50000;
        else//gano menos de 10
            if(campeonatosGanados>=5)//gano entre 5 y 10
                aux=aux+30000;
            else if(campeonatosGanados>=1)//gano entre 1 y 4
                aux=aux+5000;
        return aux;
    }
    /*@Override
    public String toString(){
        return super.toString();
    }NO ES NECESARIO*/
}
