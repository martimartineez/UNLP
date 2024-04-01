/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author marti
 */
public class ejer5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        VisorFigurasModificado visor=new VisorFigurasModificado();
        Cuadrado c1 = new Cuadrado(10,"Violeta","Rosa");
        Cuadrado c2 = new Cuadrado(15,"Rojo","amarllo");
        Rectangulo r= new Rectangulo(20,10,"Azul","Celeste");
        
        visor.guardar(c1);
        visor.guardar(c2);
        visor.guardar(r);
        
        
        visor.mostrar();
        System.out.println(visor.quedaEspacio());
        System.out.println(visor.getGuardadas());
    }
    
}
