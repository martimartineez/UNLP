package ar.edu.unlp.info.oo1.ejercicio7Patrones;

public class Division extends Estado{

	public Division(Calculadora calculadora) {
		super(calculadora);
		// TODO Auto-generated constructor stub
	}
	
	
	
	public  void setValor(double unValor) {
		if(unValor!=0) {
			this.getCalculadora().setValorAcumulado(this.getCalculadora().getValorActual()/unValor);
			this.getCalculadora().setEstado(new Inicial(this.getCalculadora()));
		}
		else {
			this.getCalculadora().setEstado(new Error(this.getCalculadora()));
		}
		
	}
	
	

}
