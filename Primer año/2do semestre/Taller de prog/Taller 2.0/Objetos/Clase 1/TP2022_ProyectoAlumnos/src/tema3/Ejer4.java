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
import PaqueteLectura.GeneradorAleatorio;
public class Ejer4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Hotel hotel;
        Cliente cliente;
        System.out.println("Ingrese numero de habitaciones: ");
        int df=Lector.leerInt();
        hotel=new Hotel(df);
        String nombre;
        int edad,dni,num;
        System.out.println("Ingrese el nombre del cliente, dni, edad y habitacion a ingresarlo");
        nombre=Lector.leerString();
        dni=Lector.leerInt();
        edad=Lector.leerInt();
        num=Lector.leerInt();
        int i=0;
        while((!nombre.toUpperCase().equals("ZZZ"))&&(i<df)){
            cliente=new Cliente(nombre,dni,edad);
            hotel.ingresarCli(cliente, num);
            System.out.println("Ingrese el nombre del cliente, dni, edad y habitacion a ingresarlo(a partir de 1)");
            nombre=Lector.leerString();
            dni=Lector.leerInt();
            edad=Lector.leerInt();
            num=Lector.leerInt();
            i++;
        }
        System.out.println(hotel.toString());
        
        System.out.println("Ingrese el monto a aumentarle a los precios: ");
        hotel.aumentarMonto(Lector.leerDouble());
        
        System.out.println(hotel.toString());
    }
    
}
