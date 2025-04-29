package ar.edu.unlp.info.oo1.ejercicio6Patrones;

public abstract class EstadoInscripcion {
	private Excursion excursion;
	
	public EstadoInscripcion(Excursion excursion) {
		this.excursion=excursion;
	}
	
	public Excursion getExcursion() {
		return this.excursion;
	}
	
	public abstract void inscribir(Usuario usario);
	public abstract String obtenerInformacion();
}
