package ejer2;

public class Spock extends Jugada{
	public Spock() {
		
	}
	public void jugarContra(Jugada aPlay) {
		aPlay.jugarContraSpock();
	}
	
	public void jugarContraPiedra() {
		System.out.println("gana spock");
	}
	public void jugarContraPapel() {
		System.out.println("gana papel");
	}
	public void jugarContraTijera() {
		System.out.println("gana spock ");
	}
	public void jugarContraLagarto() {
		System.out.println("gana lagarto ");
	}
}
