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
public class Corista {
    private String nombreCo;
    private int dniCo;
    private int edadCo;
    private int tono;

    public Corista() {
    }

    public Corista(String nombreCo, int dniCo, int edadCo, int tono) {
        this.nombreCo = nombreCo;
        this.dniCo = dniCo;
        this.edadCo = edadCo;
        this.tono = tono;
    }
    
    public String getNombreCo() {
        return nombreCo;
    }

    public void setNombreCo(String nombreCo) {
        this.nombreCo = nombreCo;
    }

    public int getDniCo() {
        return dniCo;
    }

    public void setDniCo(int dniCo) {
        this.dniCo = dniCo;
    }

    public int getEdadCo() {
        return edadCo;
    }

    public void setEdadCo(int edadCo) {
        this.edadCo = edadCo;
    }

    public int getTono() {
        return tono;
    }

    public void setTono(int tono) {
        this.tono = tono;
    }
    
    
}
