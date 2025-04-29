package ar.edu.unlp.info.oo1.ejercicio5Patrones;

import java.util.ArrayList;
import java.util.List;

public class Decodificador {
	private List<Pelicula> catalogo;
	private List<Pelicula> reproducidas;
	private CriterioSugerienciaPelicula criterio;
	
	public Decodificador(List<Pelicula>pelis,CriterioSugerienciaPelicula criterio) {
		this.catalogo=pelis;
		this.criterio=criterio;
		this.reproducidas=new ArrayList<>();
	}
	
	public void agregarReproducida(Pelicula pelicula) {
		this.reproducidas.add(pelicula);
	}
	
	public void setCriterioSugerencia(CriterioSugerienciaPelicula criterio) {
		this.criterio = criterio;
	}
	
	public List<Pelicula> obtenerSugerencias() {
		return this.criterio.obtenerSugerencias(this);
		
	}
	public List<Pelicula> getGrilla() {
		return this.catalogo;
	}
	
	public List<Pelicula> getReproducidas() {
		return this.reproducidas;
	}
}
