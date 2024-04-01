/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

/**
 *
 * @author marti
 */
public class Estacionamiento {
    private String nombre;
    private String direccion;
    private int apertura;
    private int cierre;
    private int piso;
    private int plaza;
    private Auto[][] matriz;
    
    public Estacionamiento(String nom, String direccion){
        this.nombre = nom;
        this.direccion = direccion;
        this.apertura = 8;
        this.cierre = 21;
        this.matriz = new Auto[5][10];
        this.piso = 5;
        this. plaza = 10;
    }
    public Estacionamiento(String  nom, String dire, int aper, int cier, int piso, int plaza){
        this.nombre = nom;
        this.direccion = dire;
        this.apertura = aper;
        this.cierre = cier;
        this.piso = piso;
        this.plaza = plaza;
        this.matriz = new Auto[piso][plaza];
    }
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getApertura() {
        return apertura;
    }

    public void setApertura(int apertura) {
        this.apertura = apertura;
    }

    public int getCierre() {
        return cierre;
    }

    public void setCierre(int cierre) {
        this.cierre = cierre;
    }

    public int getPiso() {
        return piso;
    }

    public void setPiso(int piso) {
        this.piso = piso;
    }

    public int getPlaza() {
        return plaza;
    }

    public void setPlaza(int plaza) {
        this.plaza = plaza;
    }
    
    public void agregarAuto(Auto unAuto,int piso,int plaza){
        this.matriz[piso][plaza]=unAuto;
    }
    public String buscarAuto(int unaPatente){
        int i=0;
        String aux="Auto Inexistente";

        boolean estado=false;
        while(i<(piso*plaza)&&estado==false){
            if(!(this.matriz[i/plaza][i%plaza]==null)){
                if(this.matriz[i/plaza][i%plaza].getPatente()== unaPatente){
                    aux ="piso= "+i/plaza+" plaza= "+i%plaza ;
                    estado = true;
                }
            }
            i++;
        }
        return aux;
}
    public String toString(){
        int i;
        String aux="";
        for(i=0;i<(piso*plaza);i++){
            if(!(this.matriz[i/plaza][i%plaza]==null)){
                aux+="Piso: "+i/plaza+"plaza: "+i%plaza+" "+this.matriz[i/plaza][i%plaza].toString();
            }
            else{
                aux+="Piso: "+i/plaza+"plaza: "+i%plaza+" Libre"+"\n";
            }
        }
        return aux;
    }
    public int cantAutos(int Y){
       int i;
       int cant=0;
        for(i=0;i<piso;i++){
            if(!(this.matriz[i][Y]==null)){
                cant++;
            }
        }
        return cant;
    }
}
