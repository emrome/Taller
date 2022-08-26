/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
A- Definir una clase para representar flotas de micros. Una flota se caracteriza por 
conocer a los micros que la componen (a lo sumo 15). Defina un constructor para crear 
una flota vacía (sin micros). 
Implemente métodos para:
 i. devolver si la flota está completa (es decir, si tiene 15 micros o no).
 ii. agregar a la flota un micro recibido como parámetro.
 iii. eliminar de la flota el micro con patente igual a una recibida como parámetro, y 
retornar si la operación fue exitosa. 

        Flota                                           Micro
micros, cantidadMicros                          patente, destino, horaSalida, 
        Metodos                                 asientos, cantidadOcupados        
boolean estaCompleta()                                  Metodos
void agregarMicro(Micro m)                      String getPatente()
boolean eliminarMicro(String pat)               void setPatente(String pat)
Micro buscarMicroPorPatente(String pat)         
Micro buscarMicroPorDestino(String dest)        


 iv. buscar en la flota un micro con patente igual a una recibida como parámetro y 
retornarlo (en caso de no existir dicho micro, retornar null).
 v. buscar en la flota un micro con destino igual a uno recibido como parámetro y 
retornarlo (en caso de no existir dicho micro, retornar null). 
 */
public class Flota {
    private Micro micros[];
    private int CANTMICROS=15;
    private int cantMicros;
    
    public Flota(){
        cantMicros=0;
        micros=new Micro[CANTMICROS];
    }
    //i. devolver si la flota está completa (es decir, si tiene 15 micros o no).
    public boolean estaCompleta(){
        return cantMicros==CANTMICROS;
    }
    //ii. agregar a la flota un micro recibido como parámetro.
    public void agregarMicro(Micro m){
        micros[cantMicros]=m;
        cantMicros++;
    }
    //iii. eliminar de la flota el micro con patente igual a una recibida como parámetro, y 
    //retornar si la operación fue exitosa. 
    public boolean eliminarMicro(String pat){
        int i=0,j;
        while((i<cantMicros)&&(!(micros[i].getPatente().equals(pat)))){
            i++;
        }
        /*SE PUEDE HACER CON UN INTERCAMBIO
        if((i<cantMicros)&&(micros[i].getPatente().equals(pat))){
            micros[i]=micros[cantMicros-1]
            cantMicros--;
            return true;
        }
        */
        if((i<cantMicros)&&(micros[i].getPatente().equals(pat))){
            for(j=i;j<(cantMicros-1);j++)
                micros[j]=micros[j+1];
            cantMicros--;
            return true;
        }
        else 
            return false;
    }
    //iv. buscar en la flota un micro con patente igual a una recibida como parámetro y 
    //retornarlo (en caso de no existir dicho micro, retornar null).
    public Micro buscarMicro(String pat){
        int i=0;
        while((i<cantMicros)&&(!(micros[i].getPatente().equals(pat))))
            i++;
        if((i<cantMicros)&&(micros[i].getPatente().equals(pat)))
            return micros[i];
        else return null;
    }
    
    //v. buscar en la flota un micro con destino igual a uno recibido como parámetro y 
    //retornarlo (en caso de no existir dicho micro, retornar null).
    public Micro buscarDestino(String destino){
        int i=0;
        while((i<cantMicros)&&(!(micros[i].getDestino().equals(destino))))
            i++;
        if((i<cantMicros)&&(micros[i].getDestino().equals(destino)))
            return micros[i];
        else return null;
    }
}
