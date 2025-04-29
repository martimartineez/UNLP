package ar.edu.unlp.objetos.uno.ejer2Patrones;

public abstract class Empleado {
	private double porcentajeSueldoBasico=1.13;
	private double porcentajeAdicional=1.03;
	public double calcularDescuentos() {
		return (this.calcularBasico()*porcentajeSueldoBasico )+(this.calcularAdicional()*porcentajeAdicional);
	}
	
	public double calcularSueldo() {
		return this.calcularBasico()+this.calcularAdicional()-this.calcularDescuentos();
	}
	public abstract double calcularBasico();
	public abstract double calcularAdicional();
}
