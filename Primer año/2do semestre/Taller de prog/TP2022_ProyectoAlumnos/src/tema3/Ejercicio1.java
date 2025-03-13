/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import PaqueteLectura.Lector;

/**
 *
 * @author gonetil
 */
public class Ejercicio1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Triangulo unTriangulo;
        
        System.out.println("Mandale el lado 1");
        double sideA = Lector.leerDouble();
        System.out.println("Ahora el lado 2");
        double sideB = Lector.leerDouble();
        System.out.println("Y ahora el 3");
        double sideC = Lector.leerDouble();
        System.out.println("¿qué color de fondo te gustaría?");
        String backgroundColor = Lector.leerString();
        System.out.println("Ya casi estamos. ¿Color de borde?");
        String borderColor = Lector.leerString();
        
        unTriangulo = new Triangulo(sideA, sideB, sideC, backgroundColor, borderColor);
        System.out.println(unTriangulo.toString());
    }
    
}




    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   