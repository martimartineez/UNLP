
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos

import PaqueteLectura.Lector;
public class Ej02Jugadores {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        double []jugadores=new double[15];
        
        //Paso 4: Declarar indice y variables auxiliares a usar
         int i;double prom;int cant;       
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (i=0;i<15;i++){
            System.out.print("ingrese una altura: ");
            jugadores[i]=Lector.leerInt();
        }
        //Paso 7: Calcular el promedio de alturas, informarlo
        prom=0;
        for(i=0;i<15;i++){
            prom+=jugadores[i];
        }
        prom=prom/15;
        System.out.print("El promedio es: "+prom);
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        cant=0;
        for (i=0;i<15;i++){
            if(jugadores[i]>prom){
                cant++;
            }
        }
        //Paso 9: Informar la cantidad.
        System.out.print("La cantidad que supera el promedio es: "+cant+"//");
    }
    
}
