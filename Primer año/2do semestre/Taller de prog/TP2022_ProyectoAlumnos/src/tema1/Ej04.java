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
public class Ej04 {
    public static void main(String[] args) {
        int [][]edificio=new int[8][4];
        int i,j,piso,oficina;
        for(i=0;i<8;i++){
            for(j=0;j<4;j++){
                edificio[i][j]=0;
            }
        }
        System.out.println("ingrese el numero de piso: ");
        piso=Lector.leerInt();
        System.out.println("ingrese la oficina: ");
        oficina=Lector.leerInt();
        while(piso!=9){
            edificio[piso-1][oficina-1]+=1;
            System.out.println("ingrese el numero de piso: ");
            piso=Lector.leerInt();
            System.out.println("ingrese la oficina: ");
            oficina=Lector.leerInt();
        }
        for (i=0;i<8;i++){
            for(j=0;j<4;j++){
                System.out.print(" "+edificio[i][j]+" ");
            }
            System.out.println();
        }
        
        
    }
}
