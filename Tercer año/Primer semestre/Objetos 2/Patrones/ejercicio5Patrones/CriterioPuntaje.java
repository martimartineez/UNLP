package ar.edu.unlp.info.oo1.ejercicio5Patrones;

import java.util.List;
import java.util.stream.Collectors;

public class CriterioPuntaje extends CriterioSugerienciaPelicula{

	public CriterioPuntaje() {
		
	}
	
	public List<Pelicula> sugerirPeliculas(Decodificador decodificador){
		return decodificador.getGrilla().stream().sorted((peli1,peli2)->Double.compare(peli2.getPuntaje(), peli1.getPuntaje())).collect(Collectors.toList()); 
	}
}
