/*
Demo que crea objetos Libro invocando a los constructores definidos. 
 */
package tema3;

/**
 *
 * @author vsanz
 */
public class Demo01ConstructoresLibro {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Autor autor,autor2;
        autor=new Autor("Ana lizo","Nacio en muy muy lejano","Checolosbaquia");
        Libro libro1= new  Libro( "Java: A Beginner's Guide",   
                                 "Mcgraw-Hill", 2014,   
                                 autor, "978-0071809252", 21.72);
        autor2=new Autor("pepito","sexoso","Chileno");
        Libro libro2= new Libro("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing", 
                               autor2, "978-1512108347");
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println("Precio del libro1: " +libro1.getPrecio());
        System.out.println("Año edición del libro1: " +libro1.getAñoEdicion());
        Libro libro3= new Libro(); 
    }
    
}
