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
public class Estante {
    private Libro[] vector=new Libro[20];
    private int dimL=0;
    private int i=0;
    private boolean estado=false;   
    public Estante(){
        
    }
    public void agregarLibro(Libro libro){
        this.vector[dimL]=libro;
        dimL++; 
    }
    public int cantLibros(){
        return this.dimL;
    }
    public String getEstado(){
        if(dimL<20){
            return "Hay lugar.";
        }
        else{
            return "LLeno.";
    }
    }
    public Libro buscarLibro(String nombre){
        while(i<20 && estado==false){
            if(vector[i].getTitulo().equals(nombre)){
                estado=true;
                return vector[i];
            }
            i++;
        }
        return null ;
    }
    
}
