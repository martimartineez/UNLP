package ar.edu.unlp.info.oo1.ejercicio7Patrones;

public class Inicial extends Estado{

	public Inicial(Calculadora calculadora) {
		super(calculadora);
	}
	@Override
	public  String getResultado() {
		return "El resultado es:"+this.getCalculadora().getValorAcumulado();
	}
	@Override
	public void borrar() {
		this.getCalculadora().setValorAcumulado(0);
	}
	public  void setValor(double unValor) {
		this.getCalculadora().setValorActual(unValor);
	}
	@Override
	public  void mas(){
		this.getCalculadora().setEstado(new Suma(this.getCalculadora()));
	}
	@Override
    public   void menos(){
    	this.getCalculadora().setEstado(new Resta(this.getCalculadora()));
	}
	@Override
    public  void por(){
    	this.getCalculadora().setEstado(new Por(this.getCalculadora()));
	}
	@Override
    public  void dividio(){
    	this.getCalculadora().setEstado(new Division(this.getCalculadora()));
	}
	
}
