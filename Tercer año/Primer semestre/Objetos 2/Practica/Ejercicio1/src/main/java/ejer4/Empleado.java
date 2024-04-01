package ejer4;

public abstract class Empleado {
	private boolean casado;
	private int hijos;
	
	public Empleado(boolean esCasado,int hijos) {
		this.casado=esCasado;
		this.hijos=hijos;
	}
	public abstract double basico();
	public abstract double adicional();
	
	public double descuento() {
		return ((this.basico()/100*13)+(this.adicional()/100*5));
	}
	public void estaCasado(double aux) {
		if(casado) {
			aux+=5000;
		}
	}
	
	public void adicionalHijos(double aux) {
		aux+=hijos*2000;
	}
}
