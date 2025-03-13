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
public abstract class Empleado {
    private String nombre;
    private double sueldo;
    private int antiguedad;
    
    public Empleado(){
        
    }
    public Empleado(String nom, double sue, int ant){
        this.nombre = nom;
        this.sueldo = sue;
        this.antiguedad = ant;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    public String toString(){
        return "Nombre: "+ this.nombre
                +"Sueldo: "+ this.calcularSueldoACobrar()+
                "Efectividad: "+ this.calcularEfectividad();
    }
    public abstract double calcularEfectividad();
    public abstract double calcularSueldoACobrar();
}
