/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

/**
Modificar la clase Visor Figuras: ahora debe permitir guardar las figuras a mostrar (a lo 
sumo 5) y también mostrar todas las figuras guardadas en forma conjunta. Usar la 
siguiente estructura.
 */
public class VisorFigurasModificado {
    private int guardadas;
    private int cantFiguras=5;
    private Figura [] vector;
    
    
    public VisorFigurasModificado(){
        guardadas=0;
        vector=new Figura[cantFiguras];
        for(int i=0;i<cantFiguras;i++)
            vector[i]=null;
    }
 
    public void guardar(Figura f){
        if(this.quedaEspacio()){
            vector[guardadas]=f;
            guardadas++;
        }
    }
    public boolean quedaEspacio(){
        return guardadas<cantFiguras;
    }
 
    public void mostrar(){
        for(int i=0;i<guardadas;i++)
            System.out.println(vector[i].toString());
    }
    public int getGuardadas() {
        return guardadas;
    }
}


