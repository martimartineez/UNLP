{Realizar un programa que genere un archivo de novelas filmadas durante el presente
año. De cada novela se registra: código, género, nombre, duración, director y precio.
El programa debe presentar un menú con las siguientes opciones:
* 
* 
* 
* a. Crear el archivo y cargarlo a partir de datos ingresados por teclado. Se
utiliza la técnica de lista invertida para recuperar espacio libre en el
archivo. Para ello, durante la creación del archivo, en el primer registro del
mismo se debe almacenar la cabecera de la lista. Es decir un registro
ficticio, inicializando con el valor cero (0) el campo correspondiente al
código de novela, el cual indica que no hay espacio libre dentro del
archivo.
* 
* 
* b. Abrir el archivo existente y permitir su mantenimiento teniendo en cuenta el
inciso a., se utiliza lista invertida para recuperación de espacio. En
particular, para el campo de ´enlace´ de la lista, se debe especificar los
números de registro referenciados con signo negativo, (utilice el código de
novela como enlace).Una vez abierto el archivo, brindar operaciones para:
* 	i. Dar de alta una novela leyendo la información desde teclado. Para
esta operación, en caso de ser posible, deberá recuperarse el
espacio libre. Es decir, si en el campo correspondiente al código de
novela del registro cabecera hay un valor negativo, por ejemplo -5,
se debe leer el registro en la posición 5, copiarlo en la posición 0
(actualizar la lista de espacio libre) y grabar el nuevo registro en la
posición 5. Con el valor 0 (cero) en el registro cabecera se indica
que no hay espacio libre.
* 
	ii. Modificar los datos de una novela leyendo la información desde
teclado. El código de novela no puede ser modificado.
* 
	iii. Eliminar una novela cuyo código es ingresado por teclado. Por
ejemplo, si se da de baja un registro en la posición 8, en el campo
código de novela del registro cabecera deberá figurar -8, y en el
registro en la posición 8 debe copiarse el antiguo registro cabecera.
* 
* 
* c. Listar en un archivo de texto todas las novelas, incluyendo las borradas, que
representan la lista de espacio libre. El archivo debe llamarse “novelas.txt”.
}

program ejer3;
const
	valorAlto=9999;
type
	novela=record
		codigo:integer;
		genero:string[15];
		nombre:string[30];
		duracion:integer;
		director:string[30];
		precio:real;
	end;
	
	archivo_novelas=file of novela;
	
procedure pedirDatos(var nove:novela);
begin
	writeln('ingrese el codigo o -1 para finalizar');
	readln(nove.codigo);
	if(nove.codigo<>-1)then begin
		writeln('ingrese genero');
		readln(nove.genero);
		writeln('ingrese nombre');
		readln(nove.nombre);
		writeln('ingrese duracion');
		readln(nove.duracion);
		writeln('ingrese director');
		readln(nove.director);
		writeln('ingrese precio');
		readln(nove.precio);
	end;
end;

procedure leer(var archivo:archivo_novelas;var nove:novela);
begin
	if not eof(archivo)then
		read(archivo,nove)
	else
		nove.codigo:=valorAlto;
end;


procedure crearArchivo(var archivo:archivo_novelas;nombre:string);
var
	nove:novela;
begin
	assign(archivo,nombre);
	rewrite(archivo);
	nove.codigo:=0;
	write(archivo,nove);
	pedirDatos(nove);
	while(nove.codigo<>-1)do begin
		write(archivo,nove);
		pedirDatos(nove);
	end;
	close(archivo);
end;

procedure alta(var archivo:archivo_novelas);
var
	nove:novela;
	aux:novela;
	pos:integer;
begin
	reset(archivo);
	leer(archivo,nove);
	pedirDatos(aux);
	if(aux.codigo<>-1)then begin
		if(nove.codigo<>valorAlto)then begin
			if(nove.codigo<0)then begin
				pos:=nove.codigo;
				seek(archivo,(pos*(-1)));
				read(archivo,nove);
				seek(archivo,0);
				write(archivo,nove);
				seek(archivo,(pos*(-1)));
				write(archivo,aux);
			end;
		end;
	end;
	close(archivo);
end;

procedure modificar(var archivo:archivo_novelas);
var
	nove:novela;
	aux:novela;
	ok:boolean;
begin
	reset(archivo);
	ok:=false;
	pedirDatos(aux);
	leer(archivo,nove);
	if(aux.codigo<>-1)then begin
		while(nove.codigo<>valorAlto)do begin
			if(nove.codigo=aux.codigo)then begin
				seek(archivo,filePos(archivo)-1);
				write(archivo,aux);
				ok:=true;
			end;
			leer(archivo,nove);
		end;
	end;
	if(not ok)then
		writeln('no existe ese codigo de novela');
	close(archivo);
end;

procedure eliminar(var archivo:archivo_novelas);
var
	nove:novela;
	cod:integer;
	pos:integer;
	ok:boolean;
begin
	reset(archivo);
	ok:=false;
	writeln('ingrese el codigo de novela a eliminar: ');
	readln(cod);
	leer(archivo,nove);
	while((nove.codigo<>valorAlto)and(not ok))do begin
		if(nove.codigo=cod)then begin
			pos:=filePos(archivo)-1;
			seek(archivo,0);
			read(archivo,nove);
			seek(archivo,pos);
			write(archivo,nove);
			seek(archivo,0);
			nove.codigo:=(pos*(-1));
			write(archivo,nove);
			ok:=true;
		end;
		leer(archivo,nove);
	end;
	close(archivo);
end;

procedure mantenimiento(var archivo:archivo_novelas;nombre:string);
var
	opcion:integer;
begin
	assign(archivo,nombre);
	writeln('ingrese 1 para dar de alta novela: , 2 para modificar datos de una novela o 3 para eliminar una novela: ');
	readln(opcion);
	case opcion of 
	1: alta(archivo);
	2: modificar(archivo);
	3: eliminar(archivo);
	else
		writeln ('opcion incorrecta');
	end;
	
end;

procedure listar(var archivo:archivo_novelas;nombre:string;var archivoText:Text);
var
	nove:novela;
begin
	assign(archivoText,'novelas.txt');
	rewrite(archivoText);
	assign(archivo,nombre);
	reset(archivo);
	leer(archivo,nove);
	while(nove.codigo<>valorAlto)do begin
		with nove do begin
			if(codigo>0) then
				writeln(archivoText,'codigo ',codigo,' genero ',genero,' nombre ',nombre,' duracion ',duracion,' director ',director,' precio ',precio:1:1)
			else
				writeln(archivoText,'Espacio Libre');
		end;
		leer(archivo,nove);	
	end;
	close(archivo);
	close(archivoText);
end;

procedure imprimir(var archivo:archivo_novelas;nombre:string);
var
	asis:novela;
begin
	assign(archivo,nombre);
	reset(archivo);
	leer(archivo,asis);
	while(asis.codigo<>valorAlto)do begin
		with asis do begin
			writeln(codigo);
			writeln(nombre);
			writeln('////');
		end;
		leer(archivo,asis);
	end;
end;

procedure menu(var archivo:archivo_novelas;nombre:string;var archivoText:Text);
var
	opcion:integer;
begin
	writeln('ingrese 1 para crear archivo: , 2 para modificar el archivo o 3 para generar listado: ');
	readln(opcion);
	case opcion of 
	1: crearArchivo(archivo,nombre);
	2: mantenimiento(archivo,nombre);
	3: listar(archivo,nombre,archivoText);
	else
		writeln ('opcion incorrecta');
	end;
end;

var
	archivo:archivo_novelas;
	archivoText:Text;
	nombre:string;
begin
	writeln('ingrese el nombre del archivo a crear/modificar');
	readln(nombre);
	menu(archivo,nombre,archivoText);
	
end.
