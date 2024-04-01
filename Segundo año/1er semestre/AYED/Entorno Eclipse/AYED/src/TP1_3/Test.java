package TP1_3;

public class Test {
public static void main(String[] args) {
	Estudiante es1=new Estudiante();
	es1.setApellido("Diaz");
	es1.setNombre("Ana");
	es1.setComision("nerds");
	es1.setDireccion("calle 1254 645");
	es1.setEmail("ana@gmail.com");
	Estudiante es2=new Estudiante();
	es2.setApellido("perez");
	es2.setNombre("alfredo");
	es2.setComision("meh");
	es2.setDireccion("calle 222");
	es2.setEmail("fredy@gmail.com");
	Estudiante []estudiantes=new Estudiante[2];
	estudiantes[0]=es1;
	estudiantes[1]=es2;
	Profesor pro1=new Profesor();
	pro1.setNombre("maria");
	pro1.setApellido("gimenez");
	pro1.setCatedra("ayuda");
	pro1.setEmail("MAria.com");
	pro1.setFacultad("UNAJ");
	Profesor pro2=new Profesor();
	pro2.setNombre("pepe");
	pro2.setApellido("pelin");
	pro2.setCatedra("pro");
	pro2.setEmail("pepe.com");
	pro2.setFacultad("UNLP");
	Profesor pro3=new Profesor();
	pro3.setNombre("javier");
	pro3.setApellido("madina");
	pro3.setCatedra("pls");
	pro3.setEmail("javi22.com");
	pro3.setFacultad("UBA");
	Profesor []profesores=new Profesor[3];
	profesores[0]=pro1;
	profesores[1]=pro2;
	profesores[2]=pro3;
	int i;
	for (i=0;i<estudiantes.length;i++) {
		System.out.println(estudiantes[i].tusDatos());
	}
	for (i=0;i<profesores.length;i++) {
		System.out.println(profesores[i].tusDatos());
	}
}
}
