/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5ejer3;

/**
 *
 * @author marti
 */
public class ejer3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       EventoOcasional unEvento=new EventoOcasional("5SOS",5,"show privado","Martin",3007);
       Gira unaGira=new Gira("Madona",3,"Gira loca",3);
       
       unEvento.agregarTema("hola");
       unEvento.agregarTema("que ");
       unEvento.agregarTema("tal");
       unEvento.agregarTema("adios");
       unEvento.agregarTema("aaa");
       unEvento.agregarTema("aadasa");
       
       fecha a=new fecha("buenos aires",10);
       fecha b=new fecha("santiago",15);
       fecha c=new fecha("Rio",20);
       unaGira.agregarFecha(a);
       unaGira.agregarFecha(b);
       unaGira.agregarFecha(c);
       
       unaGira.agregarTema("Soy");
       unaGira.agregarTema("Madon");
       unaGira.agregarTema("na");
       
       System.out.println(unEvento.calcularCosto());
       
       System.out.println(unEvento.actuar());
       
       System.out.println(unaGira.calcularCosto());
       
       System.out.println(unaGira.actuar());
    }
    
}
