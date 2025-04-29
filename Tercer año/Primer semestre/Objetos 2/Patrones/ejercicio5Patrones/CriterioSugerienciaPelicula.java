package ar.edu.unlp.info.oo1.ejercicio5Patrones;

import java.util.List;
import java.util.stream.Collectors;

public abstract class CriterioSugerienciaPelicula {
	
	public List<Pelicula> obtenerSugerencias(Decodificador decodificador){
		return this.sugerirPeliculas(decodificador).stream()
				.filter(pelicula -> !decodificador.getReproducidas().contains(pelicula)).sorted((peli1, peli2)->peli2.getAnioEstreno().compareTo(peli1.getAnioEstreno()))
				.limit(3).collect(Collectors.toList());
	
	}
	

	public abstract List<Pelicula> sugerirPeliculas(Decodificador decodificador);
}
