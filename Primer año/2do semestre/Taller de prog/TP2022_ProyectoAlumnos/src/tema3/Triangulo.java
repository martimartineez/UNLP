/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import tema4.Figura;

/**
 *
 * @author gonetil
 */

public class Triangulo extends Figura{
    private double lado1, lado2, lado3;
    private double s;
    private String colorRelleno,colorBorde;
    
    public Triangulo(double lado1, double lado2, double lado3, String colorRelleno, String colorBorde) {
        
        super(colorRelleno,colorBorde);
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;     
    } //constructor
    
   
        

        public double getLado1() {
            return lado1;
        }

        public void setLado1(double lado1) {
            this.lado1 = lado1;
        }

        public double getLado2() {
            return lado2;
        }

          public void setLado2(double lado2) {
            this.lado2 = lado2;
        }

        public double getLado3() {
            return lado3;
        }

        public void setLado3(double lado3) {
            this.lado3 = lado3;
        }
  
        public double calcularPerimetro(){
            return (this.lado1 +this.lado2+ this.lado3);
        }
        public double calcularArea(){
             this.s=((this.lado1+this.lado2+this.lado3)/2);
            return (Math.sqrt(this.s*(this.s-this.lado1)*(this.s-this.lado2)*(this.s-this.lado3)));
        }
        
        public String toString(){
        super.Despintar(colorBorde, colorRelleno);
        String aux = super.toString()+" perimetro: "+calcularPerimetro();   
 
             return aux;
       }

   
    

}
