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
public class Entrenador extends Empleado{
    private int campeonatos;
    
    public Entrenador(){
        
    }

    public Entrenador(String nom, double sue, int ant, int camp) {
        super(nom, sue, ant);
        this.campeonatos = camp;
    }

    public int getCampeonatos() {
        return campeonatos;
    }

    public void setCampeonatos(int campeonatos) {
        this.campeonatos = campeonatos;
    }
    public double calcularEfectividad(){
        return this.campeonatos/super.getAntiguedad();
    }
    @Override
    public double calcularSueldoACobrar(){
        double aux;
        if((this.campeonatos>0) && (this.campeonatos<5)){
            aux=(super.getAntiguedad()*(super.getSueldo()*0.10))+super.getSueldo()+5000;
        }
        if((this.campeonatos>4) && (this.campeonatos<11)){
            aux=(super.getAntiguedad()*(super.getSueldo()*0.10))+super.getSueldo()+30000;
        }
        if(this.campeonatos>10){
            aux=(super.getAntiguedad()*(super.getSueldo()*0.10))+super.getSueldo()+50000;
        }
        else{
            aux=(super.getAntiguedad()*(super.getSueldo()*0.10))+super.getSueldo();
        }
        return aux;
        
    }
}
