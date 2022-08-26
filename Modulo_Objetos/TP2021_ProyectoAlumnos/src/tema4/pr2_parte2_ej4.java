/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
A- Definir una clase para representar micros. Un micro conoce su patente, destino, hora 
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

* B- Realice un programa que cree un micro con patente “ABC123”, destino “Mar del Plata” y 
hora de salida 5:00. Cargue pasajeros al micro de la siguiente manera. Leer nros. de 
asientos desde teclado que corresponden a pedidos de personas. La lectura finaliza cuando 
se ingresa el nro. de asiento -1 o cuando se llenó el micro. Para cada nro. de asiento leído 
debe: validar el nro; en caso que esté libre, ocuparlo e informar a la persona el éxito de la 
operación; en caso que esté ocupado informar a la persona la situación y mostrar el nro. 
del primer asiento libre. Al finalizar, informe la cantidad de asientos ocupados del micro.
 */
import PaqueteLectura.Lector;
public class pr2_parte2_ej4 {
    public static void main(String[]args){
        Micro micro=new Micro("ABC123","Mar del Plata","5:00");
        int CORTE=-1;
        int nro;
        
        System.out.println("Nro de asiento  ");
        nro=Lector.leerInt();
        while((nro!=CORTE)&&(micro.getAsientosOcupados()<=20)){
            if(micro.esValido(nro))
                if(!micro.estadoAsiento(nro)){
                    micro.ocuparAsiento(nro);
                    System.out.println("Operacion Exitosa");
                }
                else {
                    System.out.println("Asiento Ocupado");
                    nro=micro.devuelvePrimerLibre();
                    System.out.println("Vaya al asiento libre: "+nro);
                    micro.ocuparAsiento(nro);
                }
            else
                System.out.println("Nro de asiento NO válido");
            //nueva lectura
            System.out.println("Nro de asiento  ");
            nro=Lector.leerInt();
        }
        System.out.println("Asientos ocupados: "+micro.getAsientosOcupados());
    }
}
