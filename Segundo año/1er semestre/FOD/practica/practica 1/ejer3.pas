{
   3. Realizar un programa que presente un menú con opciones para:
a. Crear un archivo de registros no ordenados de empleados y completarlo con
datos ingresados desde teclado. De cada empleado se registra: número de
empleado, apellido, nombre, edad y DNI. Algunos empleados se ingresan con
DNI 00. La carga finaliza cuando se ingresa el String ‘fin’ como apellido.
b. Abrir el archivo anteriormente generado y
i. Listar en pantalla los datos de empleados que tengan un nombre o apellido
determinado, el cual se proporciona desde el teclado.
ii. Listar en pantalla los empleados de a uno por línea.
iii. Listar en pantalla los empleados mayores de 70 años, próximos a jubilarse.
NOTA: El nombre del archivo a crear o utilizar debe ser proporcionado por el usuario.
   
   
}


program ejer3;

type
	empleado=record
		numero:integer;
		apellido:string;
		nombre:string;
		edad:integer;
		dni:integer;
	end;
	archivo_empleados=file of empleado;

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

procedure coincidente(var empleados:archivo_empleados;e:empleado);
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

procedure menu(var empleados:archivo_empleados;nombre:string);
var
	opcion:string;
begin
	writeln('Elija a: para crear un archivo de empleados o b: para abir un archivo creado.');
	readln(opcion);
	if(opcion='a')then begin
		crearArchivo(empleados,nombre);
	end
	else
		if(opcion='b')then begin
			abrirArchivo(empleados,nombre);
		end
		else begin
			writeln('opcion incorrecta');
			
		end;
end;

var
	empleados:archivo_empleados;
	nombre:string;
BEGIN
	writeln('ingrese nombre del archivo a crear o abrir');
	readln(nombre);
	menu(empleados,nombre);
	close(empleados);
END.

