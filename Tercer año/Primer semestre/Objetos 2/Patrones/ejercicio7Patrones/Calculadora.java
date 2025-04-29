package ar.edu.unlp.info.oo1.ejercicio7Patrones;

public class Calculadora {
	private Estado estado;
	private double valorAcumulado;
	private double valorActual;
	
	public Calculadora() {
		this.estado=new Inicial(this);
		this.valorAcumulado=0;
		this.valorActual=0;
	}
	 /**
 	* Devuelve el resultado actual de la operación realizada.
* Si no se ha realizado ninguna operación, devuelve el valor acumulado.
* Si la calculadora se encuentra en error, devuelve “error”
     */
    public String getResultado() {
    	return estado.getResultado();
    }
    

    /**
     * Pone en cero el valor acumulado y reinicia la calculadora
     */
    public void borrar() {
    	estado.borrar();
    }


    /**
     * Asigna un valor para operar. 
     * si hay una operación en curso, el valor será utilizado en la operación
     */
    public void setValor(double unValor) {
    	estado.setValor(unValor);
    }


     /**
      * Indica que la calculadora debe esperar un nuevo valor. 
      * Si a continuación se le envía el mensaje setValor(), la calculadora sumará
      * el valor recibido como parámetro, al valor actual y guardará el resultado 
      */
    public void mas() {
    	estado.mas();
    }
    
    public void menos() {
    	estado.menos();
    }
    
    public void por() {
    	estado.por();
    }
    
    public void dividio() {
    	estado.dividio();
    }
	public Estado getEstado() {
		return estado;
	}
	public void setEstado(Estado estado) {
		this.estado = estado;
	}
	public double getValorAcumulado() {
		return valorAcumulado;
	}
	public void setValorAcumulado(double valorAcumulado) {
		this.valorAcumulado = valorAcumulado;
	}
	public double getValorActual() {
		return valorActual;
	}
	public void setValorActual(double unValor) {
		this.valorActual=unValor;
	}
    
    

}
