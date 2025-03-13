/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4ejercicio1;

/**
 *
 * @author marti
 */
public class ejer1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
      Triangulo untriangulo=new Triangulo(2,3,4,"azul","rojo");
      Circulo uncirculo=new Circulo(25,"amarillo","verde");
      
      System.out.println(untriangulo.toString());
      System.out.println(uncirculo.toString());
      
      untriangulo.despintar();
      System.out.println(untriangulo.toString());
    }
    
}
