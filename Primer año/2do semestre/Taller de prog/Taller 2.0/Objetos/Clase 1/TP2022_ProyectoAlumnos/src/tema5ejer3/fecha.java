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
public class fecha {
    private String ciudad;
    private int dia;

    public fecha(String ciudad, int dia) {
        this.ciudad = ciudad;
        this.dia = dia;
    }
    

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }
    
    
}
