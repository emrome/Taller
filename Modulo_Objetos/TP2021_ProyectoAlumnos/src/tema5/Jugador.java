/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

/**
Los jugadores son empleados que se caracterizan por el número de partidos jugados y 
el número de goles anotados.

-calcularSueldoACobrar:
Para los jugadores: el sueldo a cobrar es el sueldo básico y si el promedio de goles por 
partido es superior a 0,5 se adiciona un plus de otro sueldo básico.
 */
public class Jugador extends Empleado {
    private int partidosJugados,golesAnotados;
    
    public Jugador(String nombre,double sueldo, int partidos,int goles){
        super(nombre,sueldo);
        this.setPartidosJugados(partidos);
        this.setGolesAnotados(goles);
    }
    
    public void setPartidosJugados(int partidos){
        partidosJugados=partidos;
    }
    
    public void setGolesAnotados(int goles){
        golesAnotados=goles;
    }

    public int getPartidosJugados(){
        return partidosJugados;
    }
    
    public int getGolesAnotados(){
        return golesAnotados;
    }
    
    public double calcularSueldoACobrar(){
        double aux=getSueldoBasico();
        if(partidosJugados!=0){
            double golesPorPartido=golesAnotados/partidosJugados;
            if(golesPorPartido>0.5)
                aux=aux+aux;
        }
        return aux;
    }

}
