
program ejer4;
const
	valorAlto=9999;
type
	reg_flor = record
		nombre: String[45];
		codigo:integer;
	end;
	tArchFlores = file of reg_flor;

{Abre el archivo y agrega una flor, recibida como parámetro
manteniendo la política descrita anteriormente}


procedure pedirDatos(var nove:reg_flor);
begin
	writeln('ingrese el codigo o -1 para finalizar');
	readln(nove.codigo);
	if(nove.codigo<>-1)then begin
		writeln('ingrese nombre');
		readln(nove.nombre);
	end;
end;

procedure leer(var archivo:tArchFlores;var nove:reg_flor);
begin
	if not eof(archivo)then
		read(archivo,nove)
	else
		nove.codigo:=valorAlto;
end;

procedure crearArchivo(var archivo:tArchFlores;nombre:string);
var
	nove:reg_flor;
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

procedure alta(var archivo:tArchFlores;nombre:string;cod:integer;nom:string);
var
	nove:reg_flor;
	aux:reg_flor;
	pos:integer;
begin
	assign(archivo,nombre);
	reset(archivo);
	leer(archivo,nove);
	//pedirDatos(aux);
	aux.codigo:=cod;
	aux.nombre:=nom;
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

procedure eliminar(var archivo:tArchFlores;nombre:string);
var
	nove:reg_flor;
	cod:integer;
	pos:integer;
	ok:boolean;
begin
	assign(archivo,nombre);
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

procedure listar(var archivo:tArchFlores;nombre:string;var archivoText:Text);
var
	nove:reg_flor;
begin
	assign(archivoText,'flores.txt');
	rewrite(archivoText);
	assign(archivo,nombre);
	reset(archivo);
	leer(archivo,nove);
	while(nove.codigo<>valorAlto)do begin
		with nove do begin
			if(codigo>0) then
				writeln(archivoText,' nombre ',nombre,' codigo ',codigo);
		end;
		leer(archivo,nove);	
	end;
	close(archivo);
	close(archivoText);
end;


procedure agregarFlor (var a: tArchFlores ; nombre: string;nom:string; codigo:integer);
begin
	assign(a,nombre);
	alta(a,nombre,codigo,nom);
	
end;

var
 archivo:tArchFlores;
 nombre:string;
 archivoText:Text;
 cod:integer;
 nom:string;
begin
	cod:=69;
	nom:='anales';
	writeln('ingrese nombre de archivo a crear/modificar: ');
	readln(nombre);
	//crearArchivo(archivo,nombre);
	//eliminar(archivo,nombre);
	agregarFlor(archivo,nombre,nom,cod);
	listar(archivo,nombre,archivoText);
	
end.
