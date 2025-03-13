program pruebaParcial;

const
	valorAlto=9999;
type
	novela=record
		codigo:integer;
		nombre:string;
		genero:string;
		precio:real;
	end;
	
	archNovelas= file of novela;
procedure leer(var archText:Text;var dato:novela);
begin
	if not eof(archText) do begin
		readln(archText,dato.codigo,dato.precio,dato.genero);
		readln(archText,dato.nombre);
	end
	else
		dato.codigo:=valorAlto;
end;

procedure leer2(var novelas:archNovelas;var dato:novela);
begin
	if not eof(novelas) do begin
		readln(novelas,dato);
	end
	else
		dato.codigo:=valorAlto;
end;

procedure abrirArchivo(var archText:Text;nombre:string;var novelas:archNovelas);
var
	nove:novela;
begin
	Assign(archText,'novelas.txt');
	Assign(novelas,nombre);
	reset(archText);
	rewrite(novelas);
	leer(archText,nove);
	while(nove.codigo<>valorAlto)do begin
		write(novelas,nove);
		leer(archText,nove);
	end;
	close(archText);
	close(novelas);
end;
procedure pedirNovela(var nove:novela);
begin
	writeln('ingrese codigo de novela:');
	readln(nove.codigo);
	writeln('ingrese nombre de novela:');
	readln(nove.nombre);
	writeln('ingrese genero de novela:');
	readln(nove.genero);
	writeln('ingrese precio de novela:');
	readln(nove.precio);
end;
procedure agregar(var novelas:archNovelas);
var
	nove:novela;
begin
	pedirNovela(nove);
	reset(novelas);
	seek (novelas,fileSize(novelas));
	write(novelas,nove);
	close(novelas);

end;

procedure modificar(var novelas:archNovelas)
var
	nove:novela;
	cod:integer;
begin
	reset(novelas);
	leer2(novelas,nove)
	writeln('ingrese codigo de novela a modificar:');
	readln(cod);
	while(nove.codigo<>valorAlto) do begin
		if(nove.codigo=cod)then begin
			seek(novelas,filePos(novelas)-1);
			pedirNovela(nove);
			write(novelas,nove);
		end;
		leer2(novelas,nove);
	close(novelas);
end;

procedure menu(nombre:string;var novelas:archNovelas);
var
	opcion:integer;
begin
	Assign(novelas,nombre);
	writeln('ingrese 1: para agregar novela o 2: para modificar una existente');
	readl(opcion);
	if(opc=1)then 
		agregar(novelas);
	else
		if(opc=2)then
			modificar(novelas);
		else
			writeln('opcion incorrecta');
end;

var
	archText:Text;
	novelas:archNovelas;
	nombre:string;
	opc:integer;
BEGIN
	writeln('ingrese el nombre del archivo binario: ');
	readln(nombre);
	writeln('1 para crear archivo nuevo, 2 para modificarlo');
	readln(opc);
	if(opc=1)then 
		abrirArchivo(archText,nobre,novelas)
	else
		if(opc=2)then
			menu(nobre,novelas);
		else
			writeln('opcion incorrecta');
END.

