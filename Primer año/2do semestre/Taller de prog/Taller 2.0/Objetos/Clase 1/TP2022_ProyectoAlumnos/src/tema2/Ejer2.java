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
import PaqueteLectura.GeneradorAleatorio;
public class Ejer2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int df=15;
        String nombre= GeneradorAleatorio.generarString(15); //Conviene usar un aux de tipo persona para no poner edad,dni, nombre por separado
        int dni= GeneradorAleatorio.generarInt(11);
        int edad=GeneradorAleatorio.generarInt(99);
        Persona []vector=new Persona[df];
        int i;
        /*for(i=0;i<15;i++){
            vector[i]=new Persona();
        }*/
        i=0;
        int dl=0;
        while((i<df)&&(edad!=0)){
            vector[i]=new Persona();
            vector[i].setNombre(nombre);
            vector[i].setDNI(dni);
            vector[i].setEdad(edad);
            nombre= GeneradorAleatorio.generarString(15);
            dni= GeneradorAleatorio.generarInt(11);
            edad=GeneradorAleatorio.generarInt(99);
            i++;
          
        }
        dl=i;
        for (i=0;i<dl;i++){
            System.out.println(vector[i].toString()+" ");
        }
        int mayores=0;Persona menor=new Persona("Maria",99,40);
        for(i=0;i<dl;i++){
            if(vector[i].getEdad()>65){
                mayores++;
            }
            if(vector[i].getDNI()<menor.getDNI()){
                menor=vector[i];
            }
            
        }
        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println("Personas mayores de 65: "+ mayores); //muestro mayores
        System.out.println(menor.toString()); //informo la persona de menor dni
       
       
       
    }
    
}
