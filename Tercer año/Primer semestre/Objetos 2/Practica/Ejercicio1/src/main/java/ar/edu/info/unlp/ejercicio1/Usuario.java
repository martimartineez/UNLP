package ar.edu.info.unlp.ejercicio1;

import java.util.ArrayList;
import java.util.List;

public class Usuario {
	private String nombre;
	private List<Post> posts;
	
	public Usuario(String nombre) {
		this.nombre=nombre;
		this.posts=new ArrayList<>();
	}
	
	public Tweet crearTweet(String texto) {
		if (texto.length() >= 1 && texto.length() <= 280 ) {
			Tweet twit = new Tweet(texto);
			this.posts.add(twit);
			return twit;
		}
		return null;
	}
	public Retweet retweetear(Tweet unTweet) {
		Retweet re=new Retweet(unTweet);
		this.posts.add(re);
		return re;
	}
	
	public String getNombre() {
		return this.nombre;
	}
	
	public boolean eliminarTweets() {
		this.posts.stream().forEach(pst -> pst.wasEliminated());
		this.posts.clear();
		return this.posts.isEmpty();
	}
	public boolean soyYo(String nombre) {
		return this.nombre.equals(nombre);
	}
}
