package ar.edu.unlp.info.oo1.ejercicio1;

public class Retweet implements Itweet{
	private Tweet origen;
	
	
	public Retweet(Tweet ori) {
		ori.agregarRT(this);
		this.origen=ori;
	}
	
	public void eliminarOrigen() {
		this.origen=null;
	}
	
	public void eliminar() {
		origen.eliminarRT(this);
		this.eliminarOrigen();
		
	}
}
