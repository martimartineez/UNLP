{Definir un programa que genere un archivo con registros de longitud fija conteniendo
información de asistentes a un congreso a partir de la información obtenida por
teclado. Se deberá almacenar la siguiente información: nro de asistente, apellido y
nombre, email, teléfono y D.N.I. Implementar un procedimiento que, a partir del
archivo de datos generado, elimine de forma lógica todos los asistentes con nro de
asistente inferior a 1000.
Para ello se podrá utilizar algún carácter especial situándolo delante de algún campo
String a su elección. Ejemplo: ‘@Saldaño’.
* }

program ejer2;
const
	valorAlto=9999;

type
	asistente=record
		numero:integer;
		apellido:String[20];
		nombre:string[20];
		email:string[50];
		telefono:string[15];
		dni:string[10];
	end;
	archivo_asistentes=file of asistente;
		
procedure leer(var archivo:archivo_asistentes;var asis:asistente);
begin
	if not eof(archivo)then
		read(archivo,asis)
	else
		asis.numero:=valorAlto;
end;
procedure ingresarInfo(var archivo:archivo_asistentes;var asis:asistente);
begin
	writeln('ingrese numero de asistente o -1 para finalizar: ');
	readln(asis.numero);
	if(asis.numero<>-1)then begin
		writeln('ingrese apellido:');
		readln(asis.apellido);
		writeln('ingrese nombre');
		readln(asis.nombre);
		writeln('ingrese email');
		readln(asis.email);
		writeln('ingrese telefono:');
		readln(asis.telefono);
		writeln('ingrese dni');
		readln(asis.dni);
	end;
end;

procedure generarFile(var archivo:archivo_asistentes);
var 
	asis:asistente;
begin
	assign(archivo,'asistentes');
	rewrite(archivo);
	ingresarInfo(archivo,asis);
	while(asis.numero<>-1)do begin
		write(archivo,asis);
		ingresarInfo(archivo,asis);
	end;
	close(archivo);
end;

procedure eliminarMenores(var archivo:archivo_asistentes);
var
	asis:asistente;
	
begin
	assign(archivo,'asistentes');
	reset(archivo);
	leer(archivo,asis);
	while(asis.numero<>valorAlto)do begin
		if(asis.numero<1000)then begin
			seek(archivo,filePos(archivo)-1);
			asis.apellido:=('@'+asis.apellido);
			write(archivo,asis);
		end;
		leer(archivo,asis);
	end;
	close(archivo);
end;

procedure imprimir(var archivo:archivo_asistentes);
var
	asis:asistente;
begin
	assign(archivo,'asistentes');
	reset(archivo);
	leer(archivo,asis);
	while(asis.numero<>valorAlto)do begin
		with asis do begin
			writeln(numero);
			writeln(apellido);
			writeln('////');
		end;
		leer(archivo,asis);
	end;
end;

var
	archivo:archivo_asistentes;
begin
	//generarFile(archivo);
	//imprimir(archivo);
	//eliminarMenores(archivo);
	imprimir(archivo);
end.
