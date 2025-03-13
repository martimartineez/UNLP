
package tema2;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
public class Persona {
    private String nombre;
    private int DNI;
    private int edad; 
    
    public Persona(String unNombre, int unDNI, int unaEdad){
        nombre = unNombre;
        DNI = unDNI;
        edad = unaEdad; 
    }
    
    public Persona(){
     
    }

    public int getDNI() {
        return DNI;
    }

    public int getEdad() {
        return edad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setDNI(int unDNI) {
        DNI = unDNI;
    }

    public void setEdad(int unaEdad) {
        edad = unaEdad;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }
    
    public String toString(){
        String aux; 
        aux = "Mi nombre es " + nombre + ", mi DNI es " + DNI + " y tengo " + edad + " años.";
        return aux;
    }
    public static void main(String[] args){
     /* EJERCICIO_1
     Persona perso = new Persona();
     perso.setNombre(Lector.leerString());
     perso.setDNI(Lector.leerInt());
     perso.setEdad(Lector.leerInt());
     System.out.println(perso.toString());*/
      
        /*Ejercicio_2Persona [] vector = new Persona[15];
      int dimL = 0;
      vector[dimL] = new Persona();
      vector[dimL].setEdad(GeneradorAleatorio.generarInt(100));
      if (vector[dimL].edad != 0) {
          vector[dimL].setNombre(GeneradorAleatorio.generarString(20));
          vector[dimL].setDNI(GeneradorAleatorio.generarInt(100000000));
          dimL +=1;
      }
      while(vector[dimL-1].edad!=0 && dimL<15){
          vector[dimL]=new Persona();
          vector[dimL].setEdad(GeneradorAleatorio.generarInt(100));
      if (vector[dimL].edad != 0) {
          vector[dimL].setNombre(GeneradorAleatorio.generarString(20));
          vector[dimL].setDNI(GeneradorAleatorio.generarInt(1000000000));
          dimL +=1;
          
      }
    }
      int i,cant,pos;
      cant=0;;pos=0;
     for(i=0;i<=dimL-1;i++){
         if(vector[i].edad > 65)
             cant++;
         if(vector[pos].DNI > vector[i].DNI)
             pos = i;
         }
         
     
     System.out.println(vector[pos].toString());
     System.out.println("LA cantidad de gente mayor a 65 años es: "+cant);*/
      
    
   /*  EJERCICIO 4
      Persona [][]matriz=new Persona[5][8];
      int f,c;int max=0;boolean parar=false;
      f=0;c=0;
      matriz[f][c]=new Persona();
      System.out.println("ingrese su nombre o ZZZ para terminar: ");
      matriz[f][c].setNombre(Lector.leerString());
      if(!"ZZZ".matches(matriz[f][c].nombre)){
          System.out.println("ingrese su DNI: ");
          matriz[f][c].setDNI(Lector.leerInt());
          System.out.println("Ingrese su edad: ");
          matriz[f][c].setEdad(Lector.leerInt());
          c++;
          max++;
      }
      else if("ZZZ".matches(matriz[f][c].nombre)){
          parar=true;
      }
     
      while(parar!=true && max<40 && f<5){
          while(c<8 && parar!=true){
               matriz[f][c]=new Persona();
               System.out.println("ingrese su nombre o ZZZ para terminar: ");
               matriz[f][c].setNombre(Lector.leerString());
                if(!"ZZZ".matches(matriz[f][c].nombre)){
                    System.out.println("ingrese su DNI: ");
                    matriz[f][c].setDNI(Lector.leerInt());
                    System.out.println("Ingrese su edad: ");
                    matriz[f][c].setEdad(Lector.leerInt());
                    max++;
                    c++;
                
          }
                else if("ZZZ".matches(matriz[f][c].nombre)){
                        parar=true;
                        }
                
                    
                
      }
          f++;c=0;
      }
      for (f=0;f<5;f++){
          for(c=0;c<8;c++){
              System.out.print("Dia "+(f+1)+" Turno "+(c+1)+" "+matriz[f][c]+" ");
              
          }
          System.out.println();
      }*/
       
      }
    }
