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
public class Ejercicio3 {
    public static void main(String[] args){
        Estante nuevito;
        Autor autor1,autor2,autor3;
        autor1=new Autor("maria no","copadita","Chile");
        autor2=new Autor("Teresa","zorrina","Peruana");
        autor3=new Autor("Lisa","aaaa","Madrid");
        Libro libro1,libro2,libro3;
        libro1=new Libro("Como no ser gay","Uwu",2012,autor1,"23230w",234);
        libro2=new Libro("Como Ser hetere","7w7",2022,autor2,"23we0w",25);
        libro3=new Libro("Mujercitas","Unu",2002,autor3,"2das30w",69);
        nuevito=new Estante();
        nuevito.agregarLibro(libro1);
        nuevito.agregarLibro(libro2);
        nuevito.agregarLibro(libro3);
        System.out.println((nuevito.buscarLibro("Mujercitas")).getPrimerAutor().getNombre());
        
    }
}
