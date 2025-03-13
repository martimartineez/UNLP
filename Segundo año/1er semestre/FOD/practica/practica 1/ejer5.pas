{
  Realizar un programa para una tienda de celulares, que presente un menú con
opciones para:
a. Crear un archivo de registros no ordenados de celulares y cargarlo con datos
ingresados desde un archivo de texto denominado “celulares.txt”. Los registros
correspondientes a los celulares deben contener: código de celular, nombre,
descripción, marca, precio, stock mínimo y stock disponible.
b. Listar en pantalla los datos de aquellos celulares que tengan un stock menor al
stock mínimo.
c. Listar en pantalla los celulares del archivo cuya descripción contenga una
cadena de caracteres proporcionada por el usuario.
d. Exportar el archivo creado en el inciso a) a un archivo de texto denominado
“celulares.txt” con todos los celulares del mismo. El archivo de texto generado
podría ser utilizado en un futuro como archivo de carga (ver inciso a), por lo que
debería respetar el formato dado para este tipo de archivos en la NOTA 2.
   
}


program ejer5;
type
	celu=record
		codigo:integer;
		nombre:string;
		descripcion:string;
		marca:string;
		precio:real;
		stockMin:integer;
		stock:integer;
	end;
	arch_celulares=file of celu;

procedure imprimir(c:celu);
begin
	write(c.codigo);
	write('||');
	write(c.nombre);
	write('||');
	write(c.descripcion);
	write('||');
	write(c.marca);
	write('||');
	write(c.precio);
	write('||');
	write(c.stockMin);
	write('||');
	write(c.stock);
	write('||');
	writeln();
end;
procedure crear(var celulares:arch_celulares;var celu_txt:Text);
var
	c:celu;
begin
	rewrite(celulares);
	writeln('si?');
	reset(celu_txt);
	writeln('uy');
	while(not eof(celu_txt))do begin
		readln(celu_txt,c.codigo,c.precio,c.marca);
		readln(celu_txt,c.stock,c.stockMin,c.descripcion);
		readln(celu_txt,c.nombre);
		write(celulares,c);
	end;
	writeln('uwu');
	close(celulares);
	close(celu_txt);
end;

procedure listarStock(var celulares:arch_celulares);
var
	c:celu;
begin
	reset(celulares);
	while(not eof(celulares))do begin
		read(celulares,c);
		if(c.stock<c.stockMin)then begin
			imprimir(c);
		end;
	end;
	close(celulares);
end;

procedure buscar(var celulares:arch_celulares);
var
	cadena:string;
	c:celu;
	estado:boolean;
begin
	estado:=false;
	reset(celulares);
	writeln('ingrese la descripcion a buscar:');
	readln(cadena);
	while(not eof(celulares))and(estado<>true)do begin
		read(celulares,c);
		//writeln(c.descripcion); recordar el tab o como armaste el archivo
		if(c.descripcion=cadena)then begin
			imprimir(c);
			estado:=true;
		end;
	end;
	if(estado=false)then
		writeln('no se encontro descipcion');
	close(celulares);
end;

procedure exportar(var celulares:arch_celulares;var celu_txt2:Text);
var 
	c:celu;
begin
	reset(celulares);
	rewrite(celu_txt2);
	while(not eof(celulares))do begin
		read(celulares,c);
		writeln(celu_txt2,c.codigo,'	',c.precio:10:2,'	',c.marca);
		writeln(celu_txt2,c.stock,'	',c.stockMin,'	',c.descripcion);
		writeln(celu_txt2,c.nombre);
	end;
	close(celulares);
	close(celu_txt2);
end;

procedure menu(var celulares:arch_celulares;var celu_txt:Text;var celu_txt2:Text);
var
	opcion:string;
begin
	writeln('ingrese la opcion ');
	writeln('a: para crear archivo');
	writeln('b: para listar datos de poco stock');
	writeln('c: buscar celular con descripcion');
	writeln('d: para exportar archivo creado. ');
	writeln('\\\\');
	readln(opcion);
	
	case opcion of
					'a':
						crear(celulares,celu_txt);
					'b':
						listarStock(celulares);
					'c':
						buscar(celulares);
					'd':
						exportar(celulares,celu_txt2);
					else writeln ('NO SE ENCUENTRA ESA OPCION');
	end;	
end;
	
var
	celulares:arch_celulares;
	nombre:string;
	celu_txt:Text;
	celu_txt2:Text;
BEGIN
	writeln('ingrese nombre de archivo a crear u operar: ');
	readln(nombre);
	assign(celulares,nombre);
	assign(celu_txt,'celulares.txt');
	assign(celu_txt2,'celulares2.txt');
	menu(celulares,celu_txt,celu_txt2);
	
END.

