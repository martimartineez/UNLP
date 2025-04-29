package ar.edu.unlp.info.oo1.ejercicio7Patrones;

public class Error extends Estado{

	public Error(Calculadora calculadora) {
		super(calculadora);
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public  String getResultado() {
		return "Error";
	}
	@Override
	public  void borrar(){
		this.getCalculadora().setValorAcumulado(0);
		this.getCalculadora().setEstado(new Inicial(this.getCalculadora()));
	}
	@Override
	public  void setValor(double unValor) {
		
	}
	@Override
	public  void mas(){
		
	}
	@Override
    public   void menos(){
    	
	}
	@Override
    public  void por(){
    	
	}
	@Override
    public  void dividio(){
    	
	}

}
