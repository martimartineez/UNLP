package ar.edu.unlp.info.oo1.ejercicio2;

public class Juego {
	
	public Juego() {
		
	}
	
	public String jugar(Figura uno,Figura dos) {
		if(uno.contra(dos).equals("gana uno")) {
			return "Gana jugador 1";
		}
		else if(uno.contra(dos).equals("gana dos")){
			return "gana jugador 2";
		}
		else {
			return "empate";
		}
	}
}
