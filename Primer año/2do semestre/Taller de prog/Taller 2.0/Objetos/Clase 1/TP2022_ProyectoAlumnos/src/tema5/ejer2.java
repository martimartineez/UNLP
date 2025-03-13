/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

/**
 *
 * @author marti
 */
import PaqueteLectura.Lector;
public class ejer2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       Estacionamiento unEstacionamiento=new Estacionamiento("Pepes","Calle 1254",8,20,3,3);
       Auto a=new Auto("Marcos",234);
       Auto b=new Auto("Sandra",24);
       Auto c=new Auto("Raul",26);
       Auto d=new Auto("Lucia",28);
       Auto e=new Auto("Pedro",30);
       Auto f=new Auto("Luis",33);
       
       unEstacionamiento.agregarAuto(a, 0, 0);
       unEstacionamiento.agregarAuto(b, 1, 2);
       unEstacionamiento.agregarAuto(c, 0, 2);
       unEstacionamiento.agregarAuto(d, 1, 0);
       unEstacionamiento.agregarAuto(e,2,1);
       unEstacionamiento.agregarAuto(f, 2, 2);
       
       System.out.println(unEstacionamiento.toString());
       
       System.out.println(unEstacionamiento.cantAutos(1));
       
       System.out.println("ingrese patente a buscar");
       int patente=Lector.leerInt();
       
       System.out.println(unEstacionamiento.buscarAuto(patente));
       
    }
    
}
