package ar.edu.unlp.info.oo1.ejercicio6Patrones;

public class InscripcionEspera extends EstadoInscripcion{
	
	public InscripcionEspera(Excursion excursion) {
		super(excursion);
	}
	
	public void inscribir(Usuario usuario) {
		this.getExcursion().agregarListaEspera(usuario);
	}
	
	public String obtenerInformacion() {
		return "";
	}
}
