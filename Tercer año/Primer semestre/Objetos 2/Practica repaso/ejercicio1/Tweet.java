package ar.edu.unlp.info.oo1.ejercicio1;
import java.util.*;
public class Tweet implements Itweet{
	private  List<Retweet> retweets;
	private String text;
	
	public Tweet (String a) {
		this.text=a;
		this.retweets=new ArrayList<Retweet>();
	}
	
	public void agregarRT(Retweet tw) {
		this.retweets.add(tw);
	}
	
	public void eliminarRT(Retweet tw) {
		this.retweets.remove(tw);
	}
	
	public void eliminar() {
			this.retweets.stream().forEach(rt->rt.eliminarOrigen());
			this.retweets.clear();
		
	}
}
