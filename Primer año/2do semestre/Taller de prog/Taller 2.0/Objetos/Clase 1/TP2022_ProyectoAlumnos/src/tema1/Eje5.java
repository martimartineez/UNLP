package tema1;

import PaqueteLectura.Lector;
public class Eje5 {

    public static void main(String[] args) {
        int [][] tabla= new int[5][4];
        int cliente,aspecto;
        for (cliente=0;cliente<5;cliente++){
            System.out.println("Cliente: "+(cliente+1));
            for(aspecto=0;aspecto<4;aspecto++){
                System.out.println("ingrese puntaje del 1 a 10: ");
                tabla[cliente][aspecto]=Lector.leerInt();
            }
        }
        double promedio;double total;
        for(aspecto=0;aspecto<4;aspecto++){
            total=0;
            for(cliente=0;cliente<5;cliente++){
                total=total+tabla[cliente][aspecto];
            }
            promedio=total/5;
            System.out.println("Aspeto "+aspecto+" promedio: "+promedio);
        }
    }
    
}

