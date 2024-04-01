/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5ejer3;

/**
 *
 * @author marti
 */
public class EventoOcasional extends Recital{
    private String motivo;
    private String contratante;
    private int dia;

    public EventoOcasional(String banda, int cant,String motivo, String contratante, int dia) {
        super(banda, cant);
        this.motivo = motivo;
        this.contratante = contratante;
        this.dia = dia;
    }
    
    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getContratante() {
        return contratante;
    }

    public void setContratante(String contratante) {
        this.contratante = contratante;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }
    
    public String actuar(){
        String aux="";
        if(this.motivo.equals("a beneficio")){
            aux+="Recuerden colaborar con "+this.contratante+".";
        }
        if(this.motivo.equals("show de TV")){
            aux+="Saludos amigos televidentes";
        }
        if(this.motivo.equals("show privado")){
            aux+="Un feliz cumpleanios a "+this.contratante+".";
        }
        return aux+"\n"+super.actuar();
    }
    
    public  double calcularCosto(){
        int aux=0;
        if(this.motivo.equals("a beneficio")){
            aux=0;
        }
        if(this.motivo.equals("show de TV")){
            aux=50000;
        }
        if(this.motivo.equals("show privado")){
            aux=150000;
        }
        return aux;
    }
    
    
}
