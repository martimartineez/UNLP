package ar.edu.unlp.info.oo1.ejercicio5Patrones;
import java.time.Year;
import java.util.*;
public class Pelicula {
	private String titulo;
	private Year anioEstreno;
	private List<Pelicula> pelisSimilares;
	private double puntaje;
	
	public Pelicula(String titulo, double puntaje, Year anioEstreno) {
		this.titulo = titulo;
		this.anioEstreno = anioEstreno;
		this.puntaje = puntaje;
		this.pelisSimilares = new ArrayList<>();
	}
	
	
	public void agregarSimilar(Pelicula pelicula) {
		if (!this.pelisSimilares.contains(pelicula)) {
			this.pelisSimilares.add(pelicula);
			pelicula.agregarSimilar(this);
		}
	}


	public String getTitulo() {
		return titulo;
	}


	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}


	public Year getAnioEstreno() {
		return anioEstreno;
	}


	public void setAnioEstreno(Year anioEstreno) {
		this.anioEstreno = anioEstreno;
	}


	public List<Pelicula> getPelisSimilares() {
		return pelisSimilares;
	}


	public void setPelisSimilares(List<Pelicula> pelisSimilares) {
		this.pelisSimilares = pelisSimilares;
	}


	public double getPuntaje() {
		return puntaje;
	}


	public void setPuntaje(double puntaje) {
		this.puntaje = puntaje;
	}
	
}
