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
public class Hotel {
    private int df;
    private Habitacion[]habitaciones;

    public Hotel(int df) {
        int i;
        this.df = df;
        habitaciones= new Habitacion[df];
        for(i=0;i<df;i++){
            habitaciones[i]=new Habitacion();
        } 
    }
    

    public int getDf() {
        return df;
    }

    public void setDf(int df) {
        this.df = df;
    }
    
    public void ingresarCli(Cliente cli,int x){
        if(x>=1 && x<=df){
            this.habitaciones[x-1].setCliente(cli);
            this.habitaciones[x-1].setOcupada("Si.");
        }
    }
    public void aumentarMonto(double precio){
        for(int i=0;i<df;i++){
            habitaciones[i].sumarlePrecio(precio);
        }
        
    }
    public String toString(){
        String aux="";
        for(int i=0;i<df;i++){
            aux=(aux+"Habitacion "+(i+1)+": "+habitaciones[i].toString()+"\n");
        }
        return aux;
    }
    
    
}
