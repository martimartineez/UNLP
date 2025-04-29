package ar.edu.unlp.objetos.uno.ejer2Patrones;

public class Pasante extends Empleado{
	private double sueldoBasico=20000;
	private int examenesRendidos;
	private double bonoExamen=2000;
	
	public double calcularBasico() {
		return this.sueldoBasico;
	}
	
	public double calcularAdicional() {
		return this.bonoExamen*this.examenesRendidos;
	}
	
	
}
