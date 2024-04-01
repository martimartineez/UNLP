/*
1-A. Incluya la clase Triángulo a la jerarquía de figuras vista (carpeta tema4). 
Triángulo debe heredar de Figura todo lo que es común y definir su constructor y sus atributos y métodos propios. 
Además debe redefinir el método toString.
 */
package tema4ejercicio1;

public class Triangulo extends Figura {         //Inciso A
    
    private double lado1, lado2, lado3;
   
    //Constructor
    public Triangulo(double lado1, double lado2, double lado3, String unCR, String unCL) {
        super(unCR, unCL);    //Invoca al constructor de la superclase
        this.lado1 = lado1;   
        this.lado2 = lado2;
        this.lado3 = lado3;
    }
    
    //Metodos

    //Getters y setters
    
    public double getLado1() {
        return lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }
    
    //calcularPerimetro
    public double calcularPerimetro(){
        return lado1+lado2+lado3;
    }
   
     //calcularArea
    public double calcularArea(){
        double auxS= this.calcularPerimetro()/2;
        return Math.sqrt(auxS*(auxS-lado1)*(auxS-lado2)*(auxS-lado3));
    }
    
    //toString                            // Lo redefino...
    public String toString(){             // Asi ADEMAS concateno los lados
        String aux = super.toString() +   // ¿Por qué super y no this?
                    " Lado 1: " + lado1 +
                    " Lado 2: " + lado2 +
                    " Lado 3: " + lado3;
        return aux;
    }  
    
}
