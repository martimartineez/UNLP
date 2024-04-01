package ejer2;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class TestJuego {
	Jugada piedra,papel,tijera,lagarto,spock;
	Juego juego;
	Jugador j1,j2;
	
	@BeforeEach
	void setUp() throws Exception {
		juego=new Juego();
		piedra=new Piedra();
		papel=new Papel();
		tijera=new Tijera();
		lagarto=new Lagarto();
		spock=new Spock();
		j1=new Jugador(tijera);
		j2=new Jugador(tijera);
		juego.agregarJugadores(j1, j2);
		juego.jugar();
		
	}

	@Test
	void testJuego() {
		//fail("gana papel",juego.jugar());
	}

}
