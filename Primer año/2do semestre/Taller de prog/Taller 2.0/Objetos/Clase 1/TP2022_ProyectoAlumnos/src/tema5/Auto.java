/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

/**
 *
 * @author marti
 */
public class Auto {
    private String dueño;
    private int patente;

    public Auto(String dueño, int patente) {
        this.dueño = dueño;
        this.patente = patente;
    }
    

    public String getDueño() {
        return dueño;
    }

    public void setDueño(String dueño) {
        this.dueño = dueño;
    }

    public int getPatente() {
        return patente;
    }

    public void setPatente(int patente) {
        this.patente = patente;
    }
    
    public String toString(){
        return "patente: "+this.patente+"duenio: "+this.dueño+"\n";
    }
    
}
