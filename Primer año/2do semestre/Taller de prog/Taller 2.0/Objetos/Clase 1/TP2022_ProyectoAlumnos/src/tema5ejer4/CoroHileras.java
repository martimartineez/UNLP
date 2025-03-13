/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5ejer4;

/**
 *
 * @author marti
 */
public class CoroHileras extends Coro{
     private int df;
     private int dl;
    private Corista[][]unCoro;

    public CoroHileras(String nombre, Director unDirector,int df) {
        super(nombre, unDirector);
        this.df = df;
        this.dl=0;
        this.unCoro=new Corista[this.df][this.df];
    }
    
     public void agregarCorista(Corista unCorista){
         int i=0;
         if(dl<(df*df)){
             while(!(this.unCoro[i/this.df][i%this.df]==null)){
                 i++;
             }
             this.unCoro[i/df][i%df]=unCorista;
             dl++;  
         }
     }
     public boolean coroLLeno(){
         boolean aux=false;
         if(dl==(df*df)){
             aux=true;
         }
         return aux;
     }
     public boolean bienFormado(){
         boolean aux=false;
         
         
         return aux;
     }
}
