/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

/**
 *
 * @author marti
 */
import PaqueteLectura.Lector;
public class Ejer1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Persona sujeto= new Persona();
        System.out.println("Ingrese el nombre: ");
        sujeto.setNombre(Lector.leerString());
        System.out.println("Ingrese el dni: ");
        sujeto.setDNI(Lector.leerInt());
        System.out.println("Ingrese la edad: ");
        sujeto.setEdad(Lector.leerInt());
        System.out.println(sujeto.toString());
    
    }
    
}
