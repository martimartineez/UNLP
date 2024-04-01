/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

/**
 *
 * @author marti
 */
import PaqueteLectura.Lector;
public class Ej05 {
    public static void main(String[] args) {
        int [][]clientes=new int[5][4];
        int i,j;double prom1=0,prom2=0,prom3=0,prom4=0;
        for(i=0;i<5;i++){
            for(j=0;j<4;j++){
                if(j==0){
                    System.out.print("ingrese una puntuacion AC: ");
                    clientes[i][j]=Lector.leerInt();}
                else if(j==1){
                    System.out.print("ingrese una puntuacion Cal Com: ");
                    clientes[i][j]=Lector.leerInt();}
                else if(j==2){
                    System.out.print("ingrese una puntuacion Precio: ");
                    clientes[i][j]=Lector.leerInt();}
                else if(j==3){
                    System.out.print("ingrese una puntuacion Ambiente: ");
                    clientes[i][j]=Lector.leerInt();}



                
                      
            }
        }
        for (i=0;i<5;i++){
            for(j=0;j<4;j++){
                if(j==0){
                    prom1+=clientes[i][j];}
                else if(j==1){
                    prom2+=clientes[i][j];
                }
                else if(j==2){
                    prom3+=clientes[i][j];
                }
                else if(j==3){
                    prom4+=clientes[i][j];
                }
            }
        }
        System.out.print("El promedio de atencion al cliente es: "+(prom1/5)+" ");
        System.out.print("El promedio de calidad de comida es: "+(prom2/5)+" ");
        System.out.print("El promedio de precio es: "+(prom3/5)+" ");
        System.out.print("El promedio de ambiente es: "+(prom1/5)+" ");
        
    }
}
