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
public class CoroSemicircular extends Coro {
    private int df;
    private int dl;
    private Corista[]unCoro;

    public CoroSemicircular(String nombre, Director unDirector,int df) {
        super(nombre, unDirector);
        this.df = df;
        this.dl=0;
        this.unCoro=new Corista[this.df];
    }
    
     public void agregarCorista(Corista unCorista){
         if(dl<df){
             this.unCoro[dl]=unCorista;
             dl++;
         }
     }
     public boolean coroLLeno(){
         boolean aux=false;
         if(dl==df){
             aux=true;
         }
         return aux;
     }
     public boolean bienFormado(){
         int i=1;
         int may=1;
         int men=0;
         boolean aux=false;
         while((i<dl)&&(may>men)){
             may=this.unCoro[i-1].getTono();
             men=this.unCoro[i].getTono();
             i++;
         }
         if((i==dl)&&(may>men)){
             aux=true;
         }
         return aux;
                 
     }
     
    
}
