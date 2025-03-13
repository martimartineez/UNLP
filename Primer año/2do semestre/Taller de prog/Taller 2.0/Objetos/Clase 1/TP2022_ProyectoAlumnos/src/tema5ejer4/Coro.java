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
public abstract class Coro {
    private String nombre;
    private Director unDirector;
    
    public Coro(String nombre, Director unDirector) {
        this.nombre = nombre;
        this.unDirector = unDirector;
        
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Director getUnDirector() {
        return unDirector;
    }

    public void setUnDirector(Director unDirector) {
        this.unDirector = unDirector;
    }
    
    public abstract void agregarCorista(Corista unCorista);
    public abstract boolean coroLLeno();
    public abstract boolean bienFormado();
}
