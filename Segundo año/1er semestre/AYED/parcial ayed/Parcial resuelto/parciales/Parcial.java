package parciales;
import java.util.List;

import TP5_1.ejercicio1.Graph;
import TP5_1.ejercicio1.Vertex;
import TP5_1.ejercicio1.Edge;

public class Parcial {
	public int resolver(Graph<Sitio>sitios,int tiempo) {
		Vertex<Sitio> v=buscar(sitios);
		Cantidad cant=new Cantidad();
		if(v!=null) {
			int actual=0;
			boolean[]marcas=new boolean[sitios.getVertices().size()];
			recorrer(v,tiempo,actual,cant,marcas,sitios);
		}
		return cant.getNumero();
	}
	private Vertex<Sitio> buscar(Graph<Sitio> sitios){
		Vertex<Sitio> v=null;
		
		List<Vertex<Sitio>> ver= sitios.getVertices();
		for(Vertex<Sitio> vertice:ver) {
			if(vertice.getData().getNombre().equals("Entrada")) {
				v=vertice;
			}
		}
		return v;
	}
	
	private void recorrer(Vertex<Sitio> v,int tiempo,int actual,Cantidad cant,boolean[]marcas,Graph<Sitio>sitios){
		marcas[v.getPosition()]=true;
		tiempo=tiempo-v.getData().getTiempo();
		if(tiempo>=0){
			actual++;
			if(cant.getNumero() < actual){
				cant.setNumero(actual);
			}
			List<Edge<Sitio>> ady=sitios.getEdges(v);
			for(Edge<Sitio> ed:ady){
				if(!marcas[ed.getTarget().getPosition()]){
					recorrer(ed.getTarget(),tiempo-ed.getWeight(),actual,cant,marcas,sitios);
				}
			}
		}
		marcas[v.getPosition()]=false;
	}
}
