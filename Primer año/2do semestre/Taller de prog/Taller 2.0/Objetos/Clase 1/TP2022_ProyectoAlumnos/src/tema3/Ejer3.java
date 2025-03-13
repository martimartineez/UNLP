/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author marti
 */
import PaqueteLectura.Lector;
public class Ejer3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estantes estante=new Estantes();
        Libro libro;
        System.out.println("Ingrese titulo: ");
        String titulo=Lector.leerString();
        while(!titulo.toUpperCase().equals("ZZZ")){
            //pedir todo lo del autor y despues todo lo del libro, para usar el conructor completo 
            System.out.println("ingrese nombre de autor, biografia y origen");
            Autor autor=new Autor(Lector.leerString(),Lector.leerString(),Lector.leerString());
            System.out.println("ingrese editorial, año de edicion, ISBN y precio: ");
            libro= new Libro(titulo,Lector.leerString(),Lector.leerInt(),autor,Lector.leerString(),Lector.leerDouble());
            estante.setLibro(libro);
            System.out.println("Ingrese titulo: ");
            titulo=Lector.leerString();
         
        }
        String aux="Mujercitas";
        System.out.println(estante.getCant());
        if(estante.buscarLibro(aux)!=null){
            System.out.println("Autor: "+estante.buscarLibro(aux).getPrimerAutor().getNombre());
        }
        else{
            System.out.println("No existe el libro.");
        }
        
    }
    
}
