/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

/**
 Se dispone de la clase Partido (ya implementada en la carpeta tema2). Un objeto 
partido representa un encuentro entre dos equipos (local y visitante). Un objeto partido 
puede crearse sin valores iniciales o enviando en el mensaje de creación el nombre del 
equipo local, el nombre del visitante, la cantidad de goles del local y del visitante (en ese 
orden). Un objeto partido sabe responder a los siguientes mensajes:
-getLocal() retorna el nombre (String) del equipo local
-getVisitante() retorna el nombre (String) del equipo visitante
-getGolesLocal() retorna la cantidad de goles (int) del equipo local
-getGolesVisitante() retorna la cantidad de goles (int) del equipo visitante
-setLocal(X) modifica el nombre del equipo local al “String” pasado por parámetro (X)
-setVisitante(X) modifica el nombre del equipo visitante al “String” pasado por parámetro (X)
-setGolesLocal(X) modifica la cantidad de goles del equipo local “int” pasado por parámetro (X)
-setGolesVisitante(X) modifica la cantidad de goles del equipo visitante “int” pasado por parámetro (X)
-hayGanador() retorna un boolean que indica si hubo (true) o no hubo (false) ganador
-getGanador() retorna el nombre (String) del ganador del partido (si no hubo retorna un String 
vacío). 
-hayEmpate() retorna un boolean que indica si hubo (true) o no hubo (false) empate

 Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en el 
campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con 
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga informar:
- La cantidad de partidos que ganó River.
- El total de goles que realizó Boca jugando de local.
- El porcentaje de partidos finalizados con empate. 

 */

import  PaqueteLectura.Lector;
public class Pr1_parte2_ej6 {
    public static void main(String[]args){
        int DIMF=20;
        String CORTE="ZZZ";
        Partido vPartidos[]=new Partido[DIMF];
        int dimL=0;
        
        int golesLocal,golesVis;
        String equipoLocal,equipoVis;

        //carga vector
        System.out.println("-Equipo Visitante: ");
        equipoVis=Lector.leerString();
        while((dimL<DIMF) &&(!equipoVis.equals(CORTE))){
            System.out.println("-Equipo Local: ");
            equipoLocal=Lector.leerString();
            System.out.println("-Goles Visitante: ");
            golesVis=Lector.leerInt();
            System.out.println("-Goles Local: ");
            golesLocal=Lector.leerInt();
            
            //termina lectura
            vPartidos[dimL]=new Partido(equipoLocal,equipoVis,golesLocal,golesVis);
            dimL++;
            //nueva lectura
            System.out.println("-Equipo Visitante: ");
            equipoVis=Lector.leerString();
        }
        //Procesamiento Info
        int ganoRiver=0,golesBocaLocal=0,empates=0;
        double porcentaje;
        
        for(int i=0;i<dimL;i++){
            if(!vPartidos[i].hayGanador())
                empates++;
            else
                if("River".equals(vPartidos[i].getGanador()))
                    ganoRiver++;
            if("Boca".equals(vPartidos[i].getLocal()))
                golesBocaLocal=golesBocaLocal+vPartidos[i].getGolesLocal();
        }
        /*informar:
        - La cantidad de partidos que ganó River.
        - El total de goles que realizó Boca jugando de local.
        - El porcentaje de partidos finalizados con empate. 
        */
        System.out.println("Partidos que ganó River: "+ganoRiver);
        System.out.println("Goles de Boca de local: "+golesBocaLocal);
        porcentaje= (double)empates/dimL *100;
        System.out.println("Porcentaje de partidos con empate: "+porcentaje);
    }
}
