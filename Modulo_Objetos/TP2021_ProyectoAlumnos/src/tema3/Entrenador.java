/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
Definir una clase para representar entrenadores de un club de fútbol. Un entrenador 
se caracteriza por su nombre, sueldo básico y la cantidad de campeonatos ganados.
▪ Defina métodos para obtener/modificar el valor de cada atributo.
▪ Defina el método calcularSueldoACobrar que calcula y devuelve el sueldo a cobrar por 
el entrenador. El sueldo se compone del sueldo básico, al cual se le adiciona un plus por 
campeonatos ganados (5000$ si ha ganado entre 1 y 4 campeonatos; $30.000 si ha 
ganado entre 5 y 10 campeonatos; 50.000$ si ha ganado más de 10 campeonatos).
* 

pr2-parte2-ej2:
– i) Defina un constructor para la clase Entrenador (definida anteriormente) que reciba 
los datos necesarios (nombre, sueldo básico, cantidad de campeonatos ganados). Además 
defina un constructor nulo.
 */
public class Entrenador {
    private String nombre;
    private double sueldoBasico;
    private int campeonatosGanados;

    public Entrenador() {//constructor nulo
    }
    public Entrenador(String nombre, double sueldoBasico, int campeonatosGanados) {
        this.nombre = nombre;
        this.sueldoBasico = sueldoBasico;
        this.campeonatosGanados = campeonatosGanados;
    }
    
    public String getNombre(){
        return nombre;
    }
    public double getSueldoBasico(){
        return sueldoBasico;
    }
    public int getCampeonatosGanados(){
        return campeonatosGanados;
    }
    
    public void setNombre(String nombre){
        this.nombre=nombre;
    }
    public void setSueldoBasico(double sueldo){
        sueldoBasico=sueldo;
    }
    public void setCampeonatosGanados(int campeonatos){
        campeonatosGanados=campeonatos;
    }
    /*El sueldo se compone del sueldo básico, al cual se le adiciona un plus por 
    campeonatos ganados (5000$ si ha ganado entre 1 y 4 campeonatos; $30.000 si ha 
    ganado entre 5 y 10 campeonatos; 50.000$ si ha ganado más de 10 campeonatos).*/
    public double calcularSueldoACobrar(){
        double aux=sueldoBasico;
        if(this.getCampeonatosGanados()>10)//ganado más de 10 campeonatos
            aux=aux+50000;
        else//gano menos de 10
            if(this.getCampeonatosGanados()>=5)//gano entre 5 y 10
                aux=aux+30000;
            else if(this.getCampeonatosGanados()>=1)//gano entre 1 y 4
                aux=aux+5000;
        return aux;
    }
}
