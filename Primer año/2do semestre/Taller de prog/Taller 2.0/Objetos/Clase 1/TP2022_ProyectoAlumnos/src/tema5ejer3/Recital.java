/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5ejer3;

/**
 *
 * @author marti
 */
public abstract class Recital {
    private String nombreB;
    private String []temas;
    private int dl;

    public Recital(String nombre,int cant) {
        this.nombreB = nombre;
        this.temas=new String[cant];
        this.dl=0;
    }
    
    public String getNombre() {
        return nombreB;
    }

    public void setNombre(String banda) {
        this.nombreB = banda;
    }
    
    public void agregarTema(String tema){
        if(this.dl<this.temas.length){
            this.temas[dl]=tema;
            this.dl++;
        }
    }
    public String actuar(){
        int i;
        String aux="Y ahora tocaremos: ";
        for(i=0;i<dl;i++){
            aux+=this.temas[i]+" ";
        }
        return aux;
    }
    public abstract double calcularCosto();

    
    
}
