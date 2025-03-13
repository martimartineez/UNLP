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
public class Entrenador extends Empleados {
    private int ganados;
    private double sueldito;

    public Entrenador(int ganados, String unNombre, double unSueldo, int unAntiguedad) {
        super(unNombre, unSueldo, unAntiguedad);
        this.ganados = ganados;
    }

    public int getGanados() {
        return ganados;
    }

    public void setGanados(int ganados) {
        this.ganados = ganados;
    }

    
    public double calcularEfectividad() {
        return (this.ganados/super.getAntiguedad());
    }

   
    public double calcularSueldoACobrar() {
        sueldito=(super.getSueldo()+(((super.getSueldo()/100)*10)*super.getAntiguedad()));
        if(this.ganados>1&&this.ganados<4){
            return(sueldito+5000);
        }
        else if(this.ganados>5&&this.ganados<10){
            return(sueldito+30000);
        }
        else if(this.ganados>10){
            return(sueldito+50000);
        }
        else{
        return(sueldito);}
    }
     public String toString(){
        String aux=super.toString();
        return aux;
    }
    
}
