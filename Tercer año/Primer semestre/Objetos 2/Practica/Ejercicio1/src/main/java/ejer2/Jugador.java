package ejer2;

public class Jugador {
	private Jugada jugada;
	
	public Jugador(Jugada unaJugada){
		this.jugada=unaJugada;
	}
	public Jugada getJugada() {
		return this.jugada;
	}
	public void jugar(Jugador aPlay) {
		this.jugada.jugarContra(aPlay.getJugada());
	}
}
