{
 3.	Implementar un programa que contenga:
a. Un módulo que lea información de alumnos de Taller de Programación y almacene en una estructura de datos sólo a aquellos alumnos que posean año de ingreso posterior al 2010. De cada alumno se lee legajo, DNI y año de ingreso. La estructura generada debe ser eficiente para la búsqueda por número de legajo. 
b. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro. 
c. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo legajo esté comprendido entre dos valores que se reciben como parámetro. 
d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con legajo impar.

}


program ejercicio3;

type

alumno=record
	legajo:integer;
	dni:integer;
	anio:integer;
	end;
arbol=^nodo;
nodo=record
	dato:alumno;
	HI:arbol;
	HD:arbol;
end;

procedure leer(var c:alumno);
begin
	writeln('ingrese el lejado del alumno o 0 para terminar');
	readln(c.legajo);
	 if(c.legajo<>0)then begin
		writeln('dni');
		readln(c.dni);
		writeln('anio');
		readln(c.anio);
	end;
end;
procedure crear(var a:arbol;c:alumno);
	begin
	if(a=nil)then begin
		new(a);
		a^.dato:=c;a^.HI:=nil;a^.HD:=nil;
		end
	else
		if(c.legajo<a^.dato.legajo) then crear(a^.HI,c)
	else
		crear(a^.HD,c);
	end;
procedure Aprocesarinfo(var a:arbol;var c:alumno);
begin
	leer(c);
	while(c.legajo<>0)do begin
		if(c.anio>2010)then 
			crear(a,c);
		leer(c);
	end;
end;

procedure Binferior(a:arbol;b:integer);
begin
   if ( a<> nil ) then begin
	if(a^.dato.legajo=b)then
	Binferior(a^.HI,b)
	else
	 if(a^.dato.legajo>b)then
	 Binferior(a^.HI,b)
	else if(a^.dato.legajo<b)then begin
		write('dni es ',a^.dato.dni);
		write('anio es',a^.dato.anio);
		Binferior(a^.HI,b);
		Binferior(a^.HD,b);
		end;
	end;
	
	
end;
procedure Crango(a:arbol;b:integer;d:integer);
begin
   if ( a<> nil ) then begin
	if((a^.dato.legajo>=b) and (a^.dato.legajo<=d))then begin
		write('dni es ',a^.dato.dni);
		write('anio es',a^.dato.anio);
		Crango(a^.HI,b,d);
		Crango(a^.HD,b,d);
		end
	else if(a^.dato.legajo<b)then
		Crango(a^.HD,b,d)
	else if(a^.dato.legajo>d)then
		Crango(a^.HI,b,d);
	end;
	
	
end;
procedure bigdni(a:arbol;var cont:integer);
begin
	   if ( a <> nil ) then begin
		if (a^.dato.dni > cont) then begin
			cont:=a^.dato.dni;
		end;
		bigdni (a^.HI, cont);
		bigdni (a^.HD, cont);
end;
end;

procedure leimpar(a:arbol;var cant:integer);	
begin
	if(a<>nil)then begin
		if(a^.dato.legajo mod 2=0)then begin
			cant:=cant+1;
			end;
		leimpar(a^.HI,cant);
		leimpar(a^.HD,cant);
		end;
	end;
			




var
a:arbol; b:integer; c:alumno; d:integer;cont:integer;cant:integer;

BEGIN
	cont:=-9999;
	cant:=0;
	Aprocesarinfo(a,c);
	//writeln('ingrese un numero de legajo');
	//readln(b);
	//Binferior(a,b);
	//writeln('ingrese d xd');
	//readln(d);
	//Crango(a,b,d);
	//bigdni(a,cont);
	//writeln(cont);
	//leimpar(a,cant);
	//writeln(cant);
END.

