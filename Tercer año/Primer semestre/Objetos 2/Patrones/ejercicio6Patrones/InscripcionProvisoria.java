package ar.edu.unlp.info.oo1.ejercicio6Patrones;

public class InscripcionProvisoria extends EstadoInscripcion{
	
	public InscripcionProvisoria(Excursion excursion) {
		super(excursion);
	}
	
	public void inscribir(Usuario usario) {
		this.getExcursion().agregarInscripto(usario);
		if(this.getExcursion().alcanzoMinimo()) {
			this.getExcursion().setEstado(new InscripcionDefinitiva(this.getExcursion()));
		}
	}
	
	public String obtenerInformacion() {
		return "\n faltan " + (this.getExcursion().getCupoMinimo() - this.getExcursion().getInscriptos().size())
				+ " personas para alcanzar el cupo minimo.";
	};
}
