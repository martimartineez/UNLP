/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej2;

/**
 *
 * @author marti
 */
public class Jugador extends Empleado {
    private int partidos;
    private int goles;
    
    public Jugador(){
        
    }
    public Jugador(String nom,double sue,int ant,int par, int gol){
        super(nom,sue,ant);
        this.goles = gol;
        this.partidos = par;
    }

    public int getPartidos() {
        return partidos;
    }

    public void setPartidos(int partidos) {
        this.partidos = partidos;
    }
    public double calcularEfectividad(){
        return this.goles/this.partidos;
    }
    public double calcularSueldoACobrar(){
        double aux=0;
        if(this.calcularEfectividad()> 0.5){
            aux=(super.getAntiguedad()*(super.getSueldo()*0.10))+(super.getSueldo()*2);
        }
        else {
             aux=(super.getAntiguedad()*(super.getSueldo()*0.10))+super.getSueldo();
        }
        return aux;
    }
    
    

    public int getGoles() {
        return goles;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }
    
    
}

