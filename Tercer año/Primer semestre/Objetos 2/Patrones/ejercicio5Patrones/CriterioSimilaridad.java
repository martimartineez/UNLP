package ar.edu.unlp.info.oo1.ejercicio5Patrones;

import java.util.List;
import java.util.stream.Collectors;

public class CriterioSimilaridad extends CriterioSugerienciaPelicula{

	public CriterioSimilaridad() {
		
	}
	
	public List<Pelicula> sugerirPeliculas(Decodificador decodificador){
		return decodificador.getReproducidas().stream().map(peli -> peli.getPelisSimilares()).flatMap(lista -> lista.stream()).distinct().collect(Collectors.toList());
	}
}
