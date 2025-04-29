package ar.edu.unlp.objetos.uno.ejer2Patrones;

public abstract class CasadoHijos extends Empleado{
	private int cantidadHijos;
	private double adicionalCasado=5000;
	private double adicionalHijos=2000;
	
	public double calcularAdicional() {
		return this.adicionalCasado+ this.cantidadHijos* this.adicionalHijos;
	}
	
	
}
