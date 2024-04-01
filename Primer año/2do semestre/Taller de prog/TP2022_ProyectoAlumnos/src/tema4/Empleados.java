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
public abstract class Empleados {
    private String nombre;
    private double sueldo;
    private int antiguedad;
    
    public Empleados(String unNombre,double unSueldo, int unAntiguedad){
    setNombre(unNombre);
    setSueldo(unSueldo);
    setAntiguedad(unAntiguedad);
}

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    public String getNombre() {
        return nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public int getAntiguedad() {
        return antiguedad;
    }
    public String toString(){
        String aux="Nombre: "+getNombre()+ "Sueldo a Cobrar: "+this.calcularSueldoACobrar()+ " Efectividad: "+this.calcularEfectividad();
        return aux;
    }
    
    public abstract double calcularEfectividad();
    public abstract double calcularSueldoACobrar();
}
