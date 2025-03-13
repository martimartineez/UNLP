



package tema2;
import PaqueteLectura.Lector;

public class ejer5 {

    public static void main(String[] args) {
        int df=20;
        Partido []vector=new Partido[df];
        int dl=0;
        String visitante=Lector.leerString();
        String local;
        int golLocal,golVisitante;
        while(!(visitante.equals("ZZZ")&&(dl<df))){
            golVisitante=Lector.leerInt();
            local=Lector.leerString();
            golLocal=Lector.leerInt();
            vector[dl]=new Partido(local,visitante,golLocal,golVisitante);
            dl++;
            visitante=Lector.leerString();
        }
        int i,cant,goles;
        cant=0;
        goles=0;
        for (i=0;i<dl;i++){
            System.out.println(vector[i].getLocal()+vector[i].getGolesLocal()+" VS "+vector[i].getVisitante()+vector[i].getGolesVisitante()+" .");
            if(vector[i].getGanador().equals("River")){
                cant++;
            }
            if(vector[i].getLocal().equals("Boca")){
                goles=goles+vector[i].getGolesLocal();
            }
        }
        System.out.println("River gano: "+cant+"partidos");
        System.out.println("Boca como local hizo: "+goles+" goles");
        
    }
    
}


