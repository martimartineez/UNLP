package ar.edu.unlp.info.oo1.ejercicio2;

public class Figura {
	
	private String soy;
	
	public Figura(String soy) {
		this.soy=soy;
	}
	public String getSoy() {
		return this.soy;
	}
	public String contra(Figura figu) {
		return this.gana(this.getSoy(), figu.getSoy());
	}
	
	public String gana(String uno,String dos) {
		if(uno.equals("piedra")) {
			return this.casoPiedra(dos);
		}
		else if(uno.equals("papel")){
			return this.casoPapel(dos);
		}
		else if(uno.equals("tijera")){
			return this.casoTijera(dos);
		}
		else if(uno.equals("lagarto")){
			return this.casoLagarto(dos);
		}
		else if(uno.equals("spock")){
			return this.casoSpock(dos);
		}
		else {
			return "figura no reconocida";
		}
	}
	
	private String casoPiedra(String dos) {
		if(dos.equals("tijera")|| dos.equals("lagarto")) {
			return "gana uno";
		}
		else if(dos.equals("papel")|| dos.equals("spock")) {
			return "gana dos";
		}
		else {
			return "empate";
		}
	}
	
	private String casoPapel(String dos) {
		if(dos.equals("piedra")|| dos.equals("spock")) {
			return "gana uno";
		}
		else if(dos.equals("tijera")|| dos.equals("lagarto")) {
			return "gana dos";
		}
		else {
			return "empate";
		}
	}
	private String casoTijera(String dos) {
		if(dos.equals("papel")|| dos.equals("lagarto")) {
			return "gana uno";
		}
		else if(dos.equals("piedra")|| dos.equals("spock")) {
			return "gana dos";
		}
		else {
			return "empate";
		}
	}
	private String casoLagarto(String dos) {
		if(dos.equals("papel")|| dos.equals("spock")) {
			return "gana uno";
		}
		else if(dos.equals("tijera")|| dos.equals("piedra")) {
			return "gana dos";
		}
		else {
			return "empate";
		}
	}
	private String casoSpock(String dos) {
		if(dos.equals("tijera")|| dos.equals("piedra")) {
			return "gana uno";
		}
		else if(dos.equals("lagarto")|| dos.equals("papel")) {
			return "gana dos";
		}
		else {
			return "empate";
		}
	}
}
