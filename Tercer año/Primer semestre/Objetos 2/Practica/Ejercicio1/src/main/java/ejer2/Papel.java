package ejer2;

public class Papel extends Jugada{
	
	public Papel() {
		
	}
	public void jugarContra(Jugada aPlay) {
		aPlay.jugarContraPapel();
	}
	
	public void jugarContraPiedra() {
		System.out.println("gana papel");
	}
	public void jugarContraTijera() {
		System.out.println("gana tijera ");
	}
	public void jugarContraSpock() {
		System.out.println("gana papel ");
	}
	public void jugarContraLagarto() {
		System.out.println("gana lagarto ");
	}
}
