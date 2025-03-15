package ar.edu.unlp.info.oo1.ejercicio1;
import java.util.*;
public class Tweet {
	private Tweet origen;
	private  List<Tweet> retweets;
	private String text;
	
	public Tweet (String a) {
		this.text=a;
		this.retweets=new ArrayList<Tweet>();
	}
	public Tweet(Tweet ori) {
		ori.agregarRT(this);
		this.origen=ori;
	}
	
	public void agregarRT(Tweet tw) {
		this.retweets.add(tw);
	}
	
	public void eliminarRT(Tweet tw) {
		this.retweets.remove(tw);
	}
	
	public void eliminarOrigen() {
		this.origen=null;
	}
	
	public void eliminar() {
		if (this.origen!=null){
			origen.eliminarRT(this);
			this.eliminarOrigen();
		}
		else {
			this.retweets.stream().forEach(rt->rt.eliminarOrigen());
			this.retweets.clear();
		}
		
	}
}
