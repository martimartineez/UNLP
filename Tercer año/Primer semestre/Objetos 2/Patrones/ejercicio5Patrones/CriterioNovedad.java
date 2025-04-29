package ar.edu.unlp.info.oo1.ejercicio5Patrones;

import java.util.List;
//import java.util.stream.Collectors;

public class CriterioNovedad extends CriterioSugerienciaPelicula{

	public CriterioNovedad() {
		
	}
	public List<Pelicula> sugerirPeliculas(Decodificador decodificador){
		return decodificador.getGrilla();
		
	}
}
