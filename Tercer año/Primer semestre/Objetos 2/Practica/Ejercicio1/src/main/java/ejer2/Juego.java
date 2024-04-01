package ejer2;

public class Juego {
	private Jugador j1;
	private Jugador j2;
	
	public Juego() {
		
	}
	public void agregarJugadores(Jugador jugadorOne,Jugador jugadorTwo) {
		this.j1=jugadorOne;
		this.j2=jugadorTwo;
		System.out.println("ya puede jugar");
	}
	
	public void jugar() {
		this.j1.jugar(j2);
	}
}
