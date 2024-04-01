package ejer4;

public class Temporario extends Empleado{
	private int horas;
	
	public Temporario(boolean esCasado,int hijos,int horas) {
		super(esCasado,hijos);
		this.horas=horas;
	}
	public double basico() {
		return (20000+(this.horas)*300);
	}
	
	public double adicional() {
		double aux=0;
		this.estaCasado(aux);
		this.adicionalHijos(aux);
		return aux;
	}
}
