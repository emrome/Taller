/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
Definir una clase para representar balanzas comerciales (para ser utilizadas en 
verdulerías, carnicerías, etc). Una balanza comercial sólo mantiene el monto y la cantidad 
de items correspondientes a la compra actual (es decir, no almacena los ítems de la 
compra). La balanza debe responder a los siguientes mensajes: 

▪ iniciarCompra(): inicializa el monto y cantidad de ítems de la compra actual. 
▪ registrarProducto(pesoEnKg, precioPorKg): recibe el peso en kg del ítem comprado y 
su precio por kg, debiendo realizar las actualizaciones en el estado de la balanza. 
▪ devolverMontoAPagar(): retorna el monto de la compra actual. 
▪ devolverResumenDeCompra(): retorna un String del siguiente estilo “Total a pagar X 
por la compra de Y productos” , donde X es el monto e Y es la cantidad de ítems de la 
compra.
 */
public class Balanza {
    private double montoTotal;
    private int items;
    
    public void iniciarCompra(){
        montoTotal=0;
        items=0;
    }
    
    public void registrarProducto(double pesoEnKg,double precioPorKg){
        montoTotal=montoTotal+(pesoEnKg*precioPorKg);
        items++;
    }
    
    public double devolverMontoAPagar(){
        return montoTotal;
    }
    
    public String devolverResumenDeCompra(){
        String aux;
        aux="Total a pagar "+montoTotal+" por la compra de "+items+" productos";
        return (aux);
    }
}
