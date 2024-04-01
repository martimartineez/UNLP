
program ejercicio3;
var
	nombre: string;
	nota, aprob, siete:integer;

BEGIN
	aprob:=0;
	siete:=0;
	repeat
		read(nombre);
		read(nota);
		if(nota>=8)then
			aprob:=aprob+1
		else if(nota=7)then
			siete:=siete+1;
		
	until(nombre='zara');
	write(aprob,'   ',siete);
END.

