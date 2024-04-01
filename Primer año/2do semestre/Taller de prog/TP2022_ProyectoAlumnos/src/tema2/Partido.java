/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.Lector;
public class Partido {
    private String local;
    private String visitante;
    private int golesLocal; 
    private int golesVisitante;
    
    public Partido(){
    
    }

    public Partido(String unLocal, String unVisitante, int unGolLocal, int unGolVisitante){
        local = unLocal;
        visitante = unVisitante;
        golesLocal = unGolLocal;
        golesVisitante = unGolVisitante;
    }

    
    public String getLocal() {
        return local;
    }

    public String getVisitante() {
        return visitante;
    }

    public int getGolesLocal() {
        return golesLocal;
    }

    public int getGolesVisitante() {
        return golesVisitante;
    }

    public void setLocal(String unEquipo) {
        local = unEquipo;
    }

    public void setVisitante(String unEquipo) {
        visitante = unEquipo;
    }

    public void setGolesLocal(int unosGoles) {
        golesLocal = unosGoles;
    }

    public void setGolesVisitante(int unosGoles) {
        golesVisitante = unosGoles;
    }
    
    public boolean hayGanador(){
         return (golesLocal!=golesVisitante); 
    }
    
    public boolean hayEmpate(){
         return ((golesLocal==golesVisitante));
    }
    
    public String getGanador(){
         String ganador=new String();
         if (golesLocal>golesVisitante){
             ganador = local;
         }
         else {
             if (golesLocal<golesVisitante){
                 ganador = visitante;
             }
         }
         return ganador;
                 
    }
    public static void main(String[] args){
        Partido [] vector=new Partido[20];
        int dimL=0;boolean parar=false;
        for(dimL=0;dimL<20;dimL++){
            vector[dimL]=new Partido();
        }
        dimL=0;
                
        System.out.println("Ingrese Local: ");
        vector[dimL].setLocal(Lector.leerString());
        if(!"ZZZ".equals(vector[dimL].getLocal())){
            System.out.println("Ingrese el visitante: ");
            vector[dimL].setVisitante(Lector.leerString());
            System.out.println("ingrese los goles del local: ");
            vector[dimL].setGolesLocal(Lector.leerInt());
            System.out.println("Ingrese los goles del Visitante: ");
            vector[dimL].setGolesVisitante(Lector.leerInt());
            dimL++;
            
        }
        else if("ZZZ".matches(vector[dimL].getLocal())){
            parar=true;
        }
        while(parar!=true && dimL<20 ){
         
            System.out.println("Ingrese Local: ");
            vector[dimL].setLocal(Lector.leerString());
            if(!"ZZZ".matches(vector[dimL].getLocal())){
                System.out.println("Ingrese el visitante: ");
                vector[dimL].setVisitante(Lector.leerString());
                System.out.println("ingrese los goles del local: ");
                vector[dimL].setGolesLocal(Lector.leerInt());
                System.out.println("Ingrese los goles del Visitante: ");
                vector[dimL].setGolesVisitante(Lector.leerInt());
                dimL++;
                  
        } else if("ZZZ".matches(vector[dimL].getLocal())){
            parar=true;
        }
            
        }
        int river=0,boca=0; 
        for(dimL=0;dimL<20;dimL++){
            if("river".matches(vector[dimL].getGanador())){
                river++;
            }
            if("boca".equals(vector[dimL].getLocal())){
                boca+=vector[dimL].getGolesLocal();
            }

            
            System.out.print((" "+vector[dimL].getLocal()+" "+vector[dimL].getGolesLocal()+" VS "+vector[dimL].getVisitante()+" "+vector[dimL].getGolesVisitante()));
            System.out.println();
            
        }
        System.out.println("River gano un total de: "+river+" partidos.");
         System.out.println("Boca anoto: "+boca+" de goles como local.");
    }
    
}
