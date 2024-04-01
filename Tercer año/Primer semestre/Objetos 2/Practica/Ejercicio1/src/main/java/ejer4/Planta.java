package ejer4;

public class Planta extends Empleado{
	private int antiguedad;
	
	public Planta(boolean esCasado,int hijos,int anti) {
		super(esCasado,hijos);
		this.antiguedad=anti;
	}
	public double basico() {
		return 50000;
	}
	public double adicional() {
		double aux=0;
		this.estaCasado(aux);
		this.adicionalHijos(aux);
		aux+=antiguedad*2000;
		return aux;
	}
}
