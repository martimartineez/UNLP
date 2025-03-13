/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author marti
 */
public class VisorFigurasModificado {
    private int guardadas;
    private int capacidadMaxima=5;
    private Figura [] vector;
 
 public VisorFigurasModificado(){
     vector=new Figura[capacidadMaxima];
     this.guardadas=0;
 }
 
 public void guardar(Figura f){
   if(guardadas<capacidadMaxima){
       vector[guardadas]=f;
       this.guardadas++;
   }
   else{
       System.out.println("Ya no hay espacio");
   }
 }
public boolean quedaEspacio(){
    boolean aux;
    aux = guardadas<capacidadMaxima;
    return aux;
 }
 
 public void mostrar(){
     int i;
     for(i=0;i<guardadas;i++){
         System.out.println(vector[i].toString());
     }
 }
 public int getGuardadas() {
 return this.guardadas;
 }

}
