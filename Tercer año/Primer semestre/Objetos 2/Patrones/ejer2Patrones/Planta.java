package ar.edu.unlp.objetos.uno.ejer2Patrones;

public class Planta extends CasadoHijos{
	private double sueldoBasico=50000;
	private double cantidadAnios;
	private double bonoAntiguedad=2000;
	
	
	public double calcularBasico() {
		return this.sueldoBasico;
	}
	
	private double calcularPorAntiguedad() {
		return this.bonoAntiguedad*this.cantidadAnios;
	}
	
	public double calcularAdicional() {
		return super.calcularAdicional()+this.calcularPorAntiguedad();
	}
	
	
}

