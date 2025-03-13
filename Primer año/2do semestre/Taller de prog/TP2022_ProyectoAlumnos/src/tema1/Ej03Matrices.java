/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class Ej03Matrices {

    public static void main(String[] args) {
	    //Paso 2. iniciar el generador aleatorio     
	 GeneradorAleatorio.iniciar();
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        int [][]matriz=new int[5][5];
        int i,j;
        for (i=0;i<5;i++){
            for(j=0;j<5;j++){
                matriz[i][j]=GeneradorAleatorio.generarInt(30);
            }
        }
    
        //Paso 4. mostrar el contenido de la matriz en consola
        for (i=0;i<5;i++){
            for(j=0;j<5;j++){
                System.out.print(" "+matriz[i][j]+" ");
            }
            System.out.println();
        }
    
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        int suma;suma=0;
        for (j=0;j<5;j++){
            suma=suma+matriz[1][j];
        }
        System.out.print("La suma de los elementos de la fila 1 es: "+suma);
        System.out.println();
    
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        int []vector=new int[5];suma=0;
        for (j=0;j<5;j++){
            for (i=0;i<5;i++){
                suma=suma+matriz[i][j];
            }
            vector[j]=suma;

        }
        for(j=0;j<5;j++){
           
            System.out.print(" "+vector[j]+" ");
            
        }
        System.out.println();
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        int fila=0,columna=0,valor;boolean find=false;
        System.out.print("Ingrese un valor a buscar: ");
        valor=Lector.leerInt();
        for(i=0;i<5;i++){
            for(j=0;j<5;j++){
                if((matriz[i][j]==valor) && (find==false)){
                    find=true;
                    fila=i;
                    columna=j;
                    
                }
          
              
            }
        }
        if(find){
            System.out.print("se encontró el valor en la fila "+fila+" columna "+columna);
        }
        else{
            System.out.print("No se encontró el elemento");
        }

    }
}
