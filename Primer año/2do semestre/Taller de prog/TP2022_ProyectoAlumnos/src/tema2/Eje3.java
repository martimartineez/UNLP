/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

/**
 *
 * @author marti
 */
public class Eje3 {
/*public static void main(String[] args) {
String saludo1=new String("hola");
String saludo2=new String("hola");
System.out.println(saludo1 == saludo2);
System.out.println(saludo1 != saludo2);
System.out.println(saludo1.equals(saludo2));
}
}*/


public static void main(String[] args) {
Persona p1;
Persona p2;
p1 = new Persona();
p1.setNombre("Pablo Sotile");
p1.setDNI(11200413);
p1.setEdad(40);
p2 = new Persona();
p2.setNombre("Julio Toledo");
p2.setDNI(22433516);
p2.setEdad(51);
p1 = p2;
p1.setEdad( p1.getEdad() + 1 );
System.out.println(p2.toString());
System.out.println(p1.toString());
System.out.println( (p1 == p2) );
}
}
    

