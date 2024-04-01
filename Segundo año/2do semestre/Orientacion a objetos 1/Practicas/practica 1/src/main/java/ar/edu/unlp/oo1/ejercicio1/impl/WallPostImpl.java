package ar.edu.unlp.oo1.ejercicio1.impl;

import ar.edu.unlp.oo1.ejercicio1.WallPost;

/**
 * Completar esta clase de acuerdo a lo especificado en el cuadernillo
 *
 */
public class WallPostImpl implements WallPost {

	/**
	 * Complete con su implementación
	 */
	private String text;
	private int likes;
	private boolean featured;

		
	public WallPostImpl() {
		text="Undefined post";
		likes=0;
		featured=false;
	}
	public String getText() {
		return text;
	}
	
	public void setText(String unTexto) {
		text=unTexto;
	}
	public int getLikes() {
		return likes;
	}
	public void like() {
		likes=likes+1;
	}
	public void dislike() {
		if(likes>0) {
			likes=likes-1;
		}
	}
	public boolean isFeatured() {
		return featured;
	}
	public void toggleFeatured() {
		if(featured) {
			featured=false;
		}
		else {
			featured=true;
		}
	}
		
	/*
	 * Este mensaje se utiliza para que una instancia de Wallpost se muestre de forma adecuada
	 */
    @Override
    public String toString() {
        return "WallPost {" +
            "text: " + getText() +
            ", likes: '" + getLikes() + "'" +
            ", featured: '" + isFeatured() + "'" +
            "}";
    }

}
