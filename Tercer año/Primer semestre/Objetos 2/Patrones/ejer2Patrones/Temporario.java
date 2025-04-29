package ar.edu.unlp.objetos.uno.ejer2Patrones;

public class Temporario extends CasadoHijos{
	private double horas;
	private double bonoHoras=300;
	private double sueldoBasico=20000;
	
	public double calcularBasico() {
		return this.sueldoBasico+(this.bonoHoras*this.horas);
	}
	
	
}
	

