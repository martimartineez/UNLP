package tema1;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;


public class Eje3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int suma =0;
        int [][] matrix = new int [5][5];
        for (int i =0;i<5;i++){
            for(int j = 0;j<5;j++){
                matrix[i][j] = GeneradorAleatorio.generarInt(31);
                System.out.print(matrix[i][j] +" ");
            }
            System.out.println();
        }
         for(int i=0;i<5;i++){
             suma += matrix[0][i];
         }
         int []vector=new int[5];
         int i,j;
         for(j=0;j<5;j++){
             suma=0;
             for(i=0;i<5;i++){
                 suma+=matrix[i][j];
             }
             vector[j]=suma;
         }
         for(i=0;i<5;i++){
             System.out.print(vector[i]+" ");
         }
         System.out.println();
         System.out.println("ingrese nunmero entero a buscas.");
         int leido=Lector.leerInt();
         boolean estado=false;
         i=0;
         while((i<5)&&(estado==false)){
             j=0;
             while((j<5)&&(estado==false)){
                 if(matrix[i][j]==leido){
                     estado=true;
                 }
                 j++;
             }
             i++;
         }
         if(estado==true){
            System.out.println("el numero se encuentra en fila: "+(i)+" columna: "+(j));
         }
         else{
             System.out.println("NO esta.");
         }
    }
    
}
