/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author marti
 */
public class Jugador extends Empleados {
    private int partidos;
    private int goles;
    private double sueldito;

    public Jugador(int partidos, int goles, String unNombre, double unSueldo, int unAntiguedad) {
        super(unNombre, unSueldo, unAntiguedad);
        this.partidos = partidos;
        this.goles = goles;
    }

    public int getPartidos() {
        return partidos;
    }

    public int getGoles() {
        return goles;
    }

    public void setPartidos(int partidos) {
        this.partidos = partidos;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }
    public double calcularEfectividad(){
        return (this.goles/this.partidos);
    }

    
    public double calcularSueldoACobrar() {
        sueldito=(super.getSueldo()+(((super.getSueldo()/100)*10)*super.getAntiguedad()));
        if(calcularEfectividad()>0.5){
            return(sueldito+super.getSueldo());
        }
        
        else{
        return (sueldito);}
        
    }
    public String toString(){
        String aux=super.toString();
        return aux;
    }
    
    
    
}
