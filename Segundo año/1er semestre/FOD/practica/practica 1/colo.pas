program TP1ej7;
type
	novela = record
		codigo : integer;
		nombre : string;
		genero : string;
		precio : real;
	end;
	archivoNovela = file of novela;
	
procedure caso1(var archL : archivoNovela; var carga : Text);
	var
		no : novela;
	begin
		rewrite(archL);
		reset(carga);
		while not eof(carga) do begin
			with no do readln(carga,codigo,precio,genero);
			with no do readln(carga,nombre);
			writeln('Datos leidos.');
			write(archL,no);
			writeln('Datos subidos.');
		end;
		writeln('Archivo creado satisfactoriamente');
		close(carga);
		close(archL);
	end;
procedure leerNovela(var no : novela);
	begin
		Writeln('Ingrese el codigo: ');
		readln(no.codigo);
		if no.codigo <> -1 then begin
			writeln('Ingrese el nombre: ');
			readln(no.nombre);
			writeln('Ingrese el genero: ');
			readln(no.genero);
			writeln('Ingrese el precio: ');
			readln(no.precio);
			end;
	end;
procedure agregarNovela(var archL : archivoNovela);
	var
		no : novela;
	begin
		leerNovela(no);
		if (no.codigo <> -1) then begin
			reset(archL);
			seek(archL,fileSize(archL));
			write(archL,no);
			close(archL);
		end
		else begin
			writeln('Carga cancelada.');
		end;
	end;
procedure modificarNovela(var archL : archivoNovela);
	var
		codigo : integer;
		estado : boolean;
		no : novela;
	begin
		estado := false;
		writeln('Ingrese el codigo de la novela a modificar: ');
		read(codigo);
		reset(archL);
		while (not eof(archL) and estado = false) do begin
			read(archL,no);
			if no.codigo = codigo then begin
				estado := true;
				leerNovela(no);
				seek(archL,filepos(archL) - 1);
				write(archL,no);
			end;
		end;
		close(archL);
	end;
procedure imprimir (n:novela);
begin
	with n do begin
		writeln ('|CODIGO: ',codigo);
		writeln ('|PRECIO: ',precio:0:2);
		writeln ('|GENERO: ',genero);
		writeln ('|NOMBRE: ',nombre);
		writeln ('');
	end;
end;
procedure mostrarPantalla (var arc_log:archivoNovela);
var
	n:novela;
begin
	reset (arc_log);
	while not eof (arc_log) do begin
		read (arc_log,n);
		imprimir (n);
	end;
	close (arc_log);
end;
var
	archL : archivoNovela;
	carga : Text;
	opcion : integer;
	nombre : string;
begin
	nombre := 'acaa';
	Writeln('Opcion 1: Crear archivo.');
	Writeln('Opcion 2: Modificar Archivo');
	Write('Ingrese su eleccion: ');
	readln(opcion);
	Writeln('Ingrese el nombre del archivo: ');
	readln(nombre);
	Assign(archL,nombre);
	Assign(carga,'novelas.txt');
	if (opcion = 1) then begin
		caso1(archL,carga);
		end
	else 
		if opcion = 2 then begin
			writeln('1 para agregar novela.');
			writeln('2 para modificar novela.');
			readln(opcion);
			if opcion = 1 then agregarNovela(archL)
			else if opcion = 2 then modificarNovela(archL)
			else writeln('Input errado.');
			end
		else mostrarPantalla(archL);
end.
