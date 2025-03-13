program ejer6;
const
	valorAlto=9999;
type
	prenda=record
		codigo:integer;
		descripcion:string;
		colores:string;
		tipo:string;
		stock:integer;
		precio:real;
	end;
	eliminar=record;
		codigo:integer;
	end;
	
	archivo_prendas=file of prenda;
	archivo_eliminar=file of eliminar;

procedure leerP(var archivo:archivo_prendas;var pre:prenda);
begin
	if not eof(archivo)then
		read(archivo,pre);
	else
		pre.codigo:=valorAlto;
end;

procedure leerE(var archivo:archivo_eliminar;var pre:eliminar);
begin
	if not eof(archivo)then
		read(archivo,pre);
	else
		pre.codigo:=valorAlto;
end;

procedure bajaLogica(var archivo:archivo_prendas;var archivoE:archivo_eliminar);
var
	pre:prenda;
	e:eliminar;
begin
	reset(archivo);
	reset(archivoE);
	leerE(archivoE,e);
	while(e.codigo<>valorAlto)do begin
		seek(archivo,0);
		leerP(archivo,pre);
		while(pre.codigo<>valorAlto) do begin
			if(pre.codigo=e.codigo)then begin
				seek(archivo,filePos(archivo)-1);
				pre.stock:=(pre.strock*(-1));
				write(archivo,pre);
			end;
			leerP(archivo,pre);
		end;
		leerE(archivoE,e);
	end;
	close(archivo);
	close(archivoE);
end;

procedure bajasFisica(var archivo:archivo_prendas;var archivoAux:archivo_prendas);
var
	pre:prenda;
begin
	reset(archivo);
	rewrite(archivoAux);
	leer(archivo,pre);
	while(pre.codigo<>valorAlto)do begin
		if(pre.stock>0)then begin
			write(archivoAux,pre);
		end;
		leer(archivo,pre);
	end;
	archivo:=archivoAux;//no se si se puede hacer xd o se puede cambiar el nombre de otra forma
	close(archivo);
	close(archivoAux);
end;


var
	archivo:archivo_prendas;
	archivoE:archivo_eliminar;
	archivoAux:archivo_prendas;
	
begin
	assign(archivo,'archivoPrendas');
	assign(archivoE,'archivoCodigos');
	assign(archivoAux,'archivoAuxiliar');
	//crear(archivo);
	//crearCod(archivoE);
	bajaLogica(archivo,archivoE);
	bajasFisicas(archivo,archivoAux);
	
	
	
end.
