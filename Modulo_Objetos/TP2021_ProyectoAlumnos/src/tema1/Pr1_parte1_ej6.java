/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

/**
 *
 * Escriba un programa que simule el ingreso de personas a un banco. Cada persona que ingresa indica la operación 
 * que desea realizar (0: “cobro de cheque” 1:“depósito/ extracción en cuenta” 2: “pago de impuestos o servicios” 
 * 3: “cobro de jubilación” 4: “cobro de planes”). 
 * La recepción de personas culmina cuando un empleado ingresa la operación 5 (cierre del banco). 
 * Informar la cantidad de personas atendidas por cada operación y la operación más solicitada. 
 */
import PaqueteLectura.Lector;
public class Pr1_parte1_ej6 {
    public static void main (String[]args){
        int DIMF=5;
        int CORTE=5;
        int bancoOp[] = new int[DIMF];
        int i,operacion,maxOp,maxInd;
       
        //inicializar vector
        for(i=0;i<DIMF;i++)
            bancoOp[i]=0;
        
        //recepción de personas
        System.out.println("Ingrese operacion a realizar ");
        operacion=Lector.leerInt();
        while(operacion !=CORTE){
            bancoOp[operacion]++;
            System.out.println("Ingrese operacion a realizar ");
            operacion=Lector.leerInt();
        }
        maxOp=0;
        maxInd=-1;
        for(i=0;i<DIMF;i++){
            System.out.println("Operacion "+i+" Personas atendidas: "+bancoOp[i]);
            if(bancoOp[i]>maxOp){
                maxOp=bancoOp[i];
                maxInd=i;
            }
        }
        System.out.println("Operacion mas solicitada: "+maxInd);
        
    }
}
