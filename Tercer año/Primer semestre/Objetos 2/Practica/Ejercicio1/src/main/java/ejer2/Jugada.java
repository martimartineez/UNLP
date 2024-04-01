package ejer2;

public abstract class Jugada {
	public abstract void jugarContra(Jugada a);
	
	public void jugarContraPapel() {
		System.out.println("empate");
	}
	public void jugarContraPiedra() {
		System.out.println("empate");
	}
	public void jugarContraTijera() {
		System.out.println("empate");
	}
	public void jugarContraLagarto() {
		System.out.println("empate");
	}
	public void jugarContraSpock() {
		System.out.println("empate");
	}
	
}
