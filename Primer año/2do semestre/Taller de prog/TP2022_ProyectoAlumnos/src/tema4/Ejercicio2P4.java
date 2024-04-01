/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;
import PaqueteLectura.Lector;

/**
 *
 * @author marti
 */
public class Ejercicio2P4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Jugador unJugador;
        Entrenador UnEntrenador;
        System.out.println("ingrese nombre jugador: ");
        String nombre=Lector.leerString();
        System.out.println("ingrese sueldo jugador: ");
        Double sueldo=Lector.leerDouble();
        System.out.println("ingrese antiguedad jugador: ");
        int antiguedad=Lector.leerInt();
        System.out.println("ingrese partidos juados: ");
        int partidos=Lector.leerInt();
        System.out.println("ingrese goles del jugador: ");
        int goles=Lector.leerInt();
        
        unJugador=new Jugador(partidos, goles, nombre, sueldo, antiguedad);
        
        System.out.println("ingrese nombre Entrenador: ");
        nombre=Lector.leerString();
        System.out.println("ingrese sueldo Entreandor: ");
        sueldo=Lector.leerDouble();
        System.out.println("ingrese antiguedad Entrenador: ");
        antiguedad=Lector.leerInt();
        System.out.println("ingrese campeonatos ganados: ");
        int ganados=Lector.leerInt();
        
        UnEntrenador=new Entrenador(ganados, nombre, sueldo, antiguedad);
        
        System.out.println(unJugador.toString());
        System.out.println(UnEntrenador.toString());
        
    }
    
}
