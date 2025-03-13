
package tema1;

//Paso 1: Importar la funcionalidad para lectura de ;


import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class Ej02Jugadores {

  
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        //Paso 2: Declarar la variable vector de double 
        double [] jugadores= new double[15];
        //Paso 3: Crear el vector para 15 double 
        
        //Paso 4: Declarar indice y variables auxiliares a usar
         int i;double promedio=0;double suma=0;int cant=0;       
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for(i=0;i<15;i++){
           double altura=Lector.leerDouble();
           suma=suma+altura;
           jugadores[i]=altura;
        }
        //Paso 7: Calcular el promedio de alturas, informarlo
        promedio=suma/15;
        System.out.println("promedio es:"+promedio);
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        for(i=0;i<15;i++){
            if(jugadores[i]>promedio){
                cant=cant+1;
            }
        }
        //Paso 9: Informar la cantidad.
        System.out.println("cantidad:"+cant);
    }
    
}
