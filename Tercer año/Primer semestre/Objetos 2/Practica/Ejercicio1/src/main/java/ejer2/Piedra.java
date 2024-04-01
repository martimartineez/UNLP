package ejer2;

public class Piedra extends Jugada{
	public Piedra() {
		
	}
	public void jugarContra(Jugada aPlay) {
		aPlay.jugarContraPiedra();
	}
	
	public void jugarContraPapel() {
		System.out.println("gana papel");
	}
	public void jugarContraTijera() {
		System.out.println("gana piedra ");
	}
	public void jugarContraSpock() {
		System.out.println("gana spock ");
	}
	public void jugarContraLagarto() {
		System.out.println("gana piedra ");
	}
}
