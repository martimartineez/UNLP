/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package tema3;
import PaqueteLectura.Lector;
/**
 *
 * @author marti
 */
public class Ejer5 {
    public static void main(String[] args) {
        Circulo circulito;
        double radio;String colorRelleno,colorLinea;
        System.out.println("Ingrese el radio: ");
        radio=Lector.leerDouble();
        System.out.println("Ingrese el color de Relleno: ");
        colorRelleno=Lector.leerString();
        System.out.println("Ingrese el color de Linea: ");
        colorLinea=Lector.leerString();
        circulito=new Circulo(radio,colorRelleno,colorLinea);
        System.out.println(circulito.toString());
    }
}
