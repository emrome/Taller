/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
        Flota                                           Micro
micros, cantidadMicros                          patente, destino, horaSalida, 
        Metodos                                 asientos, cantidadOcupados        
boolean estaCompleta()                                  Metodos
void agregarMicro(Micro m)                      String getPatente()
boolean eliminarMicro(String pat)               void setPatente(String pat)
Micro buscarMicroPorPatente(String pat)         
Micro buscarMicroPorDestino(String dest)        


B- Genere un programa que cree una flota vacía. Cargue micros (sin pasajeros) a la flota 
con información leída desde teclado (hasta que se ingresa la patente “ZZZ000” o hasta 
completar la flota). Luego lea una patente y elimine de la flota el micro con esa patente; 
busque el micro con dicha patente para comprobar que ya no está en la flota. Para 
finalizar, lea un destino e informe la patente del micro que va a dicho destino.
 */
import PaqueteLectura.Lector;
public class pr2_parte2_ej5 {
    public static void main(String[]args){
        String CORTE="ZZZ000";
        Flota flota=new Flota();
        String patente,destino,horaSalida;
        Micro micro;
        
        System.out.println(">>Patente");
        patente=Lector.leerString();
        
        while((!patente.equals(CORTE))&& (!flota.estaCompleta())){
            
            System.out.println(">>Destino");
            destino=Lector.leerString();
            System.out.println(">>Hora de Salida");
            horaSalida=Lector.leerString();
            
            micro=new Micro(patente,destino,horaSalida);
            
            flota.agregarMicro(micro);
            
            //nueva lectura
            System.out.println(">>Patente");
            patente=Lector.leerString();
        }
        System.out.println(">>Patente del micro a ELIMINAR");
        patente=Lector.leerString();
        
        if(flota.eliminarMicro(patente))
            if (flota.buscarMicro(patente)==null)
                System.out.println("Micro Eliminado");
        else
            System.out.println("Operacion no exitosa");  
        
        System.out.println(">>Destino a buscar");
        destino=Lector.leerString(); 
        micro=flota.buscarDestino(destino);
        if(micro==null)
            System.out.println("No hay micro con destino a "+destino);
        else
            System.out.println("Patente del micro con destino a "+destino+": "+micro.getPatente());
    }
}
