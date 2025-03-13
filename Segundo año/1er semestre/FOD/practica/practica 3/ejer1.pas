{
   . Agregar al menú del programa del ejercicio 3, opciones para:
a. Añadir uno o más empleados al final del archivo con sus datos ingresados por
teclado. Tener en cuenta que no se debe agregar al archivo un empleado con
un número de empleado ya registrado (control de unicidad).
b. Modificar la edad de un empleado dado.
c. Exportar el contenido del archivo a un archivo de texto llamado
“todos_empleados.txt”.
d. Exportar a un archivo de texto llamado: “faltaDNIEmpleado.txt”, los empleados
que no tengan cargado el DNI (DNI en 00).
   
}

program ejer4;
const
	valorAlto=9999;
type
	empleado=record
		numero:integer;
		apellido:string;
		nombre:string;
		edad:integer;
		dni:integer;
	end;
	archivo_empleados=file of empleado;
procedure leerF (var empleados:archivo_empleados;var reg:empleado);
begin
	if not eof(empleados) then begin
		read(empleados,reg);
	end
	else
		reg.numero:=valorAlto;
end;
procedure leer(var e:empleado);
begin
	writeln('ingrese apellido o fin para finalizar:');
	readln(e.apellido);
	if(e.apellido<>'fin')then begin
		writeln('ingrese numero de empleade: ');
		readln(e.numero);
		writeln('ingrese nombre:');
		readln(e.nombre);
		writeln('ingrese edad:');
		readln(e.edad);
		writeln('ingrese dni:');
		readln(e.dni);
	end;
end;
	
procedure crearArchivo(var empleados:archivo_empleados; nombre:string);
var
	e:empleado;
begin
	assign(empleados, nombre);
	rewrite(empleados);
	leer(e);
	while(e.apellido<>'fin')do begin
		write(empleados,e);
		leer(e);
	end;
end;

procedure coincidente(var empleados:archivo_empleados;var e:empleado);
var
	nombre:string;apellido:string;
begin
	reset(empleados);
	writeln('ingrese nombre a buscar:');
	readln(nombre);
	writeln('ingrese apellido a buscar');
	readln(apellido);
	while not eof(empleados)do begin
		read(empleados,e);
		if((e.nombre=nombre)or(e.apellido=apellido)) then begin
			write(e.numero);
			write('||');
			write(e.nombre);
			write('||');
			write(e.apellido);
			write('||');
			write(e.dni);
			write('||');
			write(e.edad);
			write('||');
			writeln(' ');
		end;
	end;
end;

procedure aJubilarse(var empleados:archivo_empleados;e:empleado);
begin
	reset(empleados);
	while(not eof(empleados))do begin
		read(empleados,e);
		writeln('empleado: '+e.nombre+' '+e.apellido);
	end;
end;

procedure enLinea(var empleados:archivo_empleados;e:empleado);
begin
	reset(empleados);
	while(not eof(empleados))do begin
		read(empleados,e);
		if(e.edad>70)then begin
			writeln('empleado: '+e.nombre+' '+e.apellido);
		end;
	end;
end;


procedure abrirArchivo(var empleados:archivo_empleados;nombre:string);
var
	e:empleado;
begin
	if(nombre<>'')then begin
		writeln('abriendo archivo...'+nombre);
		assign(empleados,nombre);
		coincidente(empleados,e);
		enLinea(empleados,e);
		aJubilarse(empleados,e);
	end
	else
		writeln('todavia no creo un archivo.');
end;

procedure agregarEmpleado(var empleados:archivo_empleados;nombre:string);
var
	e:empleado;
	em:empleado;
	existe:boolean;
begin
	existe:=false;
	assign(empleados,nombre);
	leer(e);
	while(e.apellido<>'fin')do begin
		reset(empleados);
		while(not eof(empleados))do begin
			read(empleados,em);
			if(em.numero=e.numero)then
				existe:=true;	
		end;
		if(existe=false)then begin
			write(empleados,e);
		end
		else
			writeln('numero de empleado ya registrado.');
		leer(e);
	end;
end;

procedure modificarEmpleado(var empleados:archivo_empleados;nombre:string);
var
	e:empleado;
	edad:integer;
	existe:boolean;
	numero:integer;
begin
	existe:=false;
	assign(empleados,nombre);
	reset(empleados);
	writeln('ingrese el numero de empleado: ');
	readln(numero);
	writeln('ingrese la edad a modificar: ');
	readln(edad);
	while(not eof(empleados))and(existe<>true)do begin
		read(empleados,e);
		if(e.numero=numero)then begin
			e.edad:=edad;
			existe:=true;
			seek(empleados,filePos(empleados)-1);
			write(empleados,e);
		end;
	end;
	if(existe=false)then begin
		writeln('no existe dicho numero de empleado.')
	end;
end;

procedure exportarArchivo(var empleados:archivo_empleados;nombre:string);
var
	nue:Text;
	e:empleado;
begin
	assign(nue,'todos_empleados.txt');
	assign(empleados,nombre);
	reset(empleados);
	rewrite(nue);
	while(not eof(empleados))do begin
		read(empleados,e);
		writeln(nue,e.numero,'	',e.apellido,'	',e.nombre,'	',e.edad,'	',e.dni);
	end;
	close(nue);
end;

procedure exportarValidos(var empleados:archivo_empleados;nombre:string);
var
	nue:Text;
	e:empleado;
begin
	assign(nue,'faltaDNIEmpleado.txt');
	assign(empleados,nombre);
	reset(empleados);
	rewrite(nue);
	while(not eof(empleados))do begin
		read(empleados,e);
		if(e.dni=00)then
			writeln(nue,e.numero,'	',e.apellido,'	',e.nombre,'	',e.edad,'	',e.dni);
	end;
	close(nue);
end;

procedure eliminar(var empleados:archivo_empleados;nombre:string);
var
	aux:empleado;
	numero:integer;
	truncar:empleado;
	pos:integer;
begin
	truncar.numero:=-9999;
	truncar.apellido:='**';
	truncar.nombre:='**';
	truncar.edad:=-9999;
	truncar.dni:=-9999;
	pos:=-1;
	writeln('ingrese numero de empleado a eliminar:');
	readln(numero);
	assign(empleados,nombre);
	reset(empleados);
	leerF(empleados,aux);
	//recorro hasta el final buscandolo
	while(aux.numero<>valorAlto)do begin
		if(aux.numero=numero)then
			pos:=filePos(empleados)-1;
		leerF(empleados,aux);
	end;
	if(pos<>-1)then begin
		seek(empleados,filePos(empleados)-1);
		read(empleados,aux);
		seek(empleados,filePos(empleados)-1);
		write(empleados,truncar);
		seek(empleados,pos);
		write(empleados,aux);
	end;
	
	
		
end;


procedure menu(var empleados:archivo_empleados;nombre:string);
var
	opcion:string;
begin
	writeln('Elija a: para crear un archivo de empleados, b: para abir un archivo creado, c para agregar empleado, d: modificar edad de empleado, e: para exportar archivo o f: para exportar datos validos','g: para eliminar un dato:');
	readln(opcion);
	if(opcion='a')then begin
		crearArchivo(empleados,nombre);
	end
	else
		if(opcion='b')then begin
			abrirArchivo(empleados,nombre);
		end
		else if(opcion='c')then
			agregarEmpleado(empleados,nombre)
			else
				if(opcion='d')then
					modificarEmpleado(empleados,nombre)
				else
					if(opcion='e')then
						exportarArchivo(empleados,nombre)
					else
						if(opcion='f')then
							exportarValidos(empleados,nombre)
						else
							if(opcion='g')then
								eliminar(empleados,nombre)
							else
								writeln('opcion incorrecta');
end;

var
	empleados:archivo_empleados;
	nombre:string;
BEGIN
	writeln('ingrese nombre del archivo a crear o abrir');
	readln(nombre);
	menu(empleados,nombre);
	write('aa');
	close(empleados);
END.
