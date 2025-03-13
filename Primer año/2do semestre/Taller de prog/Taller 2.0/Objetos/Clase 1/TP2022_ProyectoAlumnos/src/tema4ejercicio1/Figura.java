
package tema4ejercicio1;


public abstract class Figura {
    private String colorRelleno;
    private String colorLinea;
   
    public Figura(String unCR, String unCL){
        setColorRelleno(unCR);
        setColorLinea(unCL);
    }
    
    public String getColorRelleno(){
        return colorRelleno;       
    }
	
    public void setColorRelleno(String unColor){
        colorRelleno = unColor;       
    }
	
    public String getColorLinea(){
        return colorLinea;       
    }
	
    public void setColorLinea(String unColor){
        colorLinea = unColor;       
    }
    
    public abstract double calcularArea();
	
    public abstract double calcularPerimetro();

    public String toString(){
        String aux = "Area: " + this.calcularArea() +             
                     " Perimetro " + this.calcularPerimetro() +   //Inciso C - 
                     " CR: "  + getColorRelleno() +               //Añadir a la representación String el valor del perímetro.
                     " CL: " + getColorLinea();             
             return aux;
       }
    
    public void despintar(){         // Inciso D-  
        colorLinea =   "negro";      // Añada el método despintar que establece los colores de la figura a línea “negra” 
        colorRelleno = "blanco";     // y relleno “blanco”.
    }
     
}
