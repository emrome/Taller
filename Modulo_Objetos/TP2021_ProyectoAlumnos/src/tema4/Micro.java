/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
Definir una clase para representar micros. Un micro conoce su patente, destino, hora 
salida, el estado de sus 20 asientos (es decir si está o no ocupado) y la cantidad de asientos 
ocupados al momento. Lea detenidamente a) y b) y luego implemente.

 a) Implemente un constructor que permita iniciar el micro con una patente, un destino y 
una hora de salida (recibidas por parámetro) y sin pasajeros. 
 b) Implemente métodos para: 
    i. devolver/modificar patente, destino y hora de salida
    ii. devolver la cantidad de asientos ocupados
    iii. devolver si el micro está lleno
    iv. validar un número de asiento recibido como parámetro (es decir, devolver si está en rango o no)
    v. devolver el estado de un nro. de asiento válido recibido como parámetro
    vi. ocupar un nro. de asiento válido recibido como parámetro
    vii. liberar un nro. de asiento válido recibido como parámetro
    viii. devolver el nro. del primer asiento libre
 */
public class Micro {
    private String patente;
    private String destino;
    private String horaSalida;
    private int cantAsientos=20;
    private boolean[]asientos=new boolean[cantAsientos];//false=libre, true=ocupado
    private int asientosOcupados;
    
    public Micro(){
    }
    
    //constructor patente,destino y hora de salida recibidas por parámetro y sin pasajeros. 
    public Micro(String patente,String destino, String salida){
        this.patente=patente;
        this.destino=destino;
        horaSalida=salida;
        for(int i=0;i<cantAsientos;i++)
            asientos[i]=false;
        asientosOcupados=0;
    }
    
    //i. devolver/modificar patente, destino y hora de salida
    public String getPatente() {
        return patente;
    }
    public String getDestino() {
        return destino;
    }
    public String getHoraSalida() {
        return horaSalida;
    }
    
    public void setPatente(String patente){
        this.patente=patente;
    }
    public void setDestino(String destino) {
        this.destino = destino;
    }
    public void setHoraSalida(String horaSalida) {
        this.horaSalida = horaSalida;
    }
    
    //ii. devolver la cantidad de asientos ocupados
    public int getAsientosOcupados(){
        return asientosOcupados;
    }
    
    //iii. devolver si el micro está lleno
    public boolean estaLleno(){
        return asientosOcupados==cantAsientos;
    }
    //iv. validar un número de asiento recibido como parámetro (es decir, devolver si está en rango o no)
    public boolean esValido(int nro){
        return nro<cantAsientos;
    }
    //v. devolver el estado de un nro. de asiento válido recibido como parámetro
    public boolean estadoAsiento(int nro){
        return asientos[nro];//true=ocupado
    }
    //vi. ocupar un nro. de asiento válido recibido como parámetro
    public void ocuparAsiento(int nro){
        asientos[nro-1]=true;//porque el indice va de 0 a 19, los asinetos de 1 a 20
        asientosOcupados++;
    }
    //vii. liberar un nro. de asiento válido recibido como parámetro
    public void liberarAsiento(int nro){
        asientos[nro]=false;
    }
    //viii. devolver el nro. del primer asiento libre
    public int devuelvePrimerLibre(){
        int i=0;
        if(this.estaLleno())
            return -1;
        while((i<cantAsientos)&&(asientos[i]))//si es true esta ocupado
                i++;
        return (i+1);
    }
}
