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
public class Ejer5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       Circulo circulo;
       double radio;
       String relleno;
       String linea;
       System.out.println("Ingrese Radio del circulo, color de relleno y color de linea");
       radio=Lector.leerDouble();
       relleno=Lector.leerString();
       linea=Lector.leerString();
       circulo=new Circulo(radio,relleno,linea);
       
       System.out.println("El perimetro es: "+circulo.calcularPerimetro()+"\n"+"El area es: "+circulo.calcularArea()+".");
    }
    
}
