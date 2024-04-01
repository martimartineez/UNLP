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
import PaqueteLectura.Lector;
public class Gira extends Recital{
    private String nombre;
    private fecha[]fechas;
    private int actual;
    private int df;
    private int dl;

    public Gira( String banda, int cant,String nombre,int df ) {
        super(banda, cant);
        this.nombre = nombre;
        this.df=df;
        this.fechas=new fecha[df];
        this.actual=0;
        this.dl=0;
    }
    
    public String getNombre() {
        return this.nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public void agregarFecha(fecha unaFecha){
        if(this.dl<df){
            this.fechas[dl]=unaFecha;
            this.dl++;
        }
    }
    
    public String actuar(){
        String aux="";
        if(actual<df){
            aux="Buenas noches... "+this.fechas[this.actual].getCiudad()+""+super.actuar();
            this.actual++;
        }
        return aux;
    }
    
    public double calcularCosto(){
        int aux=this.fechas.length;
        return (aux*30000);
    }
    
    
}
