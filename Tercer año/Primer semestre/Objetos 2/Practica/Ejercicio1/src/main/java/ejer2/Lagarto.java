package ejer2;

public class Lagarto extends Jugada{
	public Lagarto() {
		
	}
	public void jugarContra(Jugada aPlay) {
		aPlay.jugarContraLagarto();
	}
	
	public void jugarContraPiedra() {
		System.out.println("gana piedra");
	}
	public void jugarContraPapel() {
		System.out.println("gana lagarto");
	}
	public void jugarContraTijera() {
		System.out.println("gana tijera ");
	}
	public void jugarContraSpock() {
		System.out.println("gana lagarto ");
	}
}
