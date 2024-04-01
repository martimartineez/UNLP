package ejer4;

public class Pasante extends Empleado{
	private int examenRendido;
	
	public Pasante(boolean esCasado,int hijos) {
		super(esCasado,hijos);
		this.examenRendido=0;
	}
	public double basico() {
		return 20000;
	}
	public double adicional() {
		return examenRendido*2000;
	}
}
