    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author marti
 */
public class Estantes {
        private int df=20;
        private int dl;
        private Libro[]vector;

        public Estantes() {
            this.vector=new Libro [df];
            dl=0;
        }

        public int getCant() {
            return dl;
        }
        public Boolean getLLeno(){
            if(dl==df){
                return (true);
            }
            else {
                return (false);
            }

        }
        public void setLibro(Libro l){
            if(!this.getLLeno()){
                vector[dl]=l;
                dl++;
            }
        }
        public Libro buscarLibro(String title){
            Libro aux2=null;
            Boolean encontre=false;
            int i=0;
            while((i<dl)&&(encontre==false)){
                if(this.vector[i].getTitulo().equals(title)){
                    aux2=this.vector[i];
                    encontre=true;
                }
                i++;
            }

            return aux2;
        }

}
