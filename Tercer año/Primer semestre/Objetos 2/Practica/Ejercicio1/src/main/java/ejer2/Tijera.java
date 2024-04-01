package ejer2;

public class Tijera extends Jugada{
	public Tijera() {
		
	}
	public void jugarContra(Jugada aPlay) {
		aPlay.jugarContraTijera();
	}
	
	public void jugarContraPiedra() {
		System.out.println("gana piedra");
	}
	public void jugarContraPapel() {
		System.out.println("gana tijera");
	}
	public void jugarContraSpock() {
		System.out.println("gana spock ");
	}
	public void jugarContraLagarto() {
		System.out.println("gana tijera ");
	}
}
