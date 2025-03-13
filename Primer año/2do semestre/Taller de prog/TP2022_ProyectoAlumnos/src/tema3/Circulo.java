/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import tema4.Figura;

/**
 *
 * @author marti
 */
public class Circulo extends Figura {
    private double radio;
    
    public Circulo(double radio,String colorRelleno,String colorLinea){
        super(colorRelleno,colorLinea);
        this.radio=radio;
        
    }
    public double getRadio(){
        return this.radio;
    }
    public void setRadio(double radio){
        this.radio=radio;
    }
    
    public double calcularPerimetro(){
        return (2*(Math.PI)*(this.radio));
    }
    public double calcularArea(){
        return ((Math.PI)*((this.radio)*(this.radio)));
    }
    public String toString(){
        String aux = super.toString()+" perimetro: "+calcularPerimetro();            
             return aux;
       }
}
