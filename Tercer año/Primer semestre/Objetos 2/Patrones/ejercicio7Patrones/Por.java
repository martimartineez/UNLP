package ar.edu.unlp.info.oo1.ejercicio7Patrones;

public class Por extends Estado{

	public Por(Calculadora calculadora) {
		super(calculadora);
		// TODO Auto-generated constructor stub
	}
	
	
	
	public  void setValor(double unValor) {
		this.getCalculadora().setValorAcumulado(this.getCalculadora().getValorActual()*unValor);
		this.getCalculadora().setEstado(new Inicial(this.getCalculadora()));
	}
	
	

}
