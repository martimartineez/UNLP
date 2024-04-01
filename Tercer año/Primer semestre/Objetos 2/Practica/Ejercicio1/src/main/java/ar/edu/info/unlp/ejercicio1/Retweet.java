package ar.edu.info.unlp.ejercicio1;

public class Retweet implements Post{
private Tweet origen;
	
	public Retweet(Tweet unTweet) {
		this.origen=unTweet;
		this.origen.hicieronRetweet(this);
	}
	
	public Boolean wasEliminated() {
		this.origen=null;
		return true;
	}
	public Tweet getOrigen() {
		return this.origen;
	}
}
