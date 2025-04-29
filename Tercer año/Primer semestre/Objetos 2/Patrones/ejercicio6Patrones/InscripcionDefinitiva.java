package ar.edu.unlp.info.oo1.ejercicio6Patrones;

public class InscripcionDefinitiva extends EstadoInscripcion{

	public InscripcionDefinitiva(Excursion excursion) {
		super(excursion);
	}
	
	public  void inscribir(Usuario usario) {
		this.getExcursion().agregarInscripto(usario);
		if(this.getExcursion().alcanzoMaximo()) {
			this.getExcursion().setEstado(new InscripcionEspera(this.getExcursion()));
		}
	}
	public String obtenerInformacion() {
		return "\n"+this.getExcursion().getMailsInscriptos()+ "y faltan " + (this.getExcursion().getCupoMinimo() - this.getExcursion().getInscriptos().size())
				+ " personas para alcanzar el cupo minimo.";
	}
}
