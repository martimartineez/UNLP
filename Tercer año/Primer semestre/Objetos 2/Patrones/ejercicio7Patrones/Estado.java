package ar.edu.unlp.info.oo1.ejercicio7Patrones;

public abstract class Estado {
	private Calculadora calculadora;
	
	public Estado(Calculadora calculadora) {
		this.calculadora=calculadora;
	}
	
	public Calculadora getCalculadora() {
		return this.calculadora;
	}
	
	public  String getResultado() {
		this.getCalculadora().setEstado(new Error(this.getCalculadora()));
		return "Error";
	}
	public  void borrar(){
		this.getCalculadora().setEstado(new Error(this.getCalculadora()));
	}
	public  void mas(){
		this.getCalculadora().setEstado(new Error(this.getCalculadora()));
	}
    public   void menos(){
    	this.getCalculadora().setEstado(new Error(this.getCalculadora()));
	}
    public  void por(){
    	this.getCalculadora().setEstado(new Error(this.getCalculadora()));
	}
    public  void dividio(){
    	this.getCalculadora().setEstado(new Error(this.getCalculadora()));
	}
    
    public abstract void setValor(double unValor);
}
