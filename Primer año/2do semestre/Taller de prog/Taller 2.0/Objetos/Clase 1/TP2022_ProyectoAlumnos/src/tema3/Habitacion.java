/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author marti
 */


public class Habitacion {
    
    private double costo;
    private String ocupada;
    private Cliente cliente;

    public Habitacion() {
        this.ocupada="No.";
        this.costo=GeneradorAleatorio.generarDouble(6000)+2000;
        
    }

    public double getCosto() {
        return costo;
    }

    public String isOcupada() {
        return ocupada;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public void setOcupada(String ocupada) {
        this.ocupada = ocupada;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    public void sumarlePrecio(double pre){
        this.costo=this.costo+pre;
    }
    public String toString(){
        String aux=" ";
        aux+="Costo: "+this.costo+"ocupada: "+this.ocupada+" ";
        if(this.ocupada.equals("Si.")){
            aux+=this.cliente.toString()+" ";
        }
        return aux;
    }
}
