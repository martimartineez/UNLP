package ar.edu.unlp.info.oo1.ejercicio1;
import java.util.*;

public class Usuario {

	private List<Tweet> tweets;
	private String screenName;
	
	public Usuario(String screenName) {
		this.tweets= new ArrayList<Tweet>();
		this.screenName = screenName;
	}
	
	public void tweetear() {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Ingrese el texto");
		String text = scanner.nextLine();
		if (text.length()>0 && text.length()<=280){
			Tweet aux= new Tweet(text);
			this.tweets.add(aux);
			
		}else {
			System.out.print("Ingrese almenos un caracter");
		}
		scanner.close();
		
	}
	public void reTweetear(Tweet tw) {
		Tweet aux= new Tweet(tw);
		this.tweets.add(aux);
	}
	
	public String getName() {
		return this.screenName;
	}
	
	public void eliminar() {
		this.tweets.stream().forEach(tw->tw.eliminar());
		this.tweets.clear();
	}
}
