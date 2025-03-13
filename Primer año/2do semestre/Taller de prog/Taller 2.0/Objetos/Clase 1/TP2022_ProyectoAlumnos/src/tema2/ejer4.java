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
public class ejer4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int maxPer=8;
        int dias=5;
        Persona [][]casting=new Persona[maxPer][dias];
        int dl=0;
        String nombre;
        int dni,edad;
        System.out.println("Ingrese Nombre: ");
        nombre=Lector.leerString();
        while(!(nombre.toUpperCase().equals("ZZZ"))&&(dl<40)){
            System.out.println("Ingrese DNI: ");
            dni=Lector.leerInt();
            System.out.println("Ingrese Edad: ");
            edad=Lector.leerInt();
            casting[dl%maxPer][dl/maxPer]=new Persona(nombre,dni,edad);
            dl++;
            System.out.println("Ingrese Nombre: ");
            nombre=Lector.leerString();
        }
        int i=0;
        while(i<dl){
            System.out.print("Persona: "+(i+1)+" ");
            System.out.println(casting[i%maxPer][i/maxPer].getNombre());
            i++;
        }
    }
    
}
