program parcial2017b;

const
	valorAlto='ZZZZ';
type
	sistema=record
		nombre:string[20];
		cant:integer;
		codAbierto:string[2];
		tipoLicencia:string[10];
	end;
	
	archMaestro=file of sistema;
	
	
procedure leer(var maestro:archMaestro;var sis:sistema);
begin
	if not eof(maestro)then 
		read(maestro,sis)
	else
		sis.nombre:=valorAlto;
end;

procedure pedirDatos(var sis:sistema);
begin
	writeln('ingrese nombre o ZZZZ para cancelar :');
	readln(sis.nombre);
	if(sis.nombre<>'ZZZZ')then begin
		writeln('ingrese cantidad ventas');
		readln(sis.cant);
		writeln('ingrese si es codigo abierto o no');
		readln(sis.codAbierto);
		writeln('ingrese tipo de licencia:');
		readln(sis.tipoLicencia);
	end;
end;

procedure alta(var maestro:archMaestro);
var
	sis,aux:sistema;
	pos:integer;
begin
	reset(maestro);
	leer(maestro,sis);
	writeln('ingrese los datos a agregar');
	pedirDatos(aux);
	if(aux.nombre<>'ZZZZ') then begin
		if(sis.nombre<>valorAlto )then begin
			if(sis.cant<0)then begin
				pos:=sis.cant*-1;
				seek(maestro,pos);
				read(maestro,sis);
				seek(maestro,filePos(maestro)-1);
				write(maestro,aux);
				seek(maestro,0);
				write(maestro,sis);
			end;
		end;
	end;
	
	close(maestro);
end;

procedure baja(var maestro:archMaestro);
var
	aux,sis:sistema;
	pos:integer;
	encontre:boolean;
begin
	encontre:=false;
	reset(maestro);
	writeln	('ingrese los datos a eliminar');
	pedirDatos(aux);
	leer(maestro,sis);
	if(aux.nombre<>'ZZZZ')then begin
		while((sis.nombre<>valorAlto) and (encontre=false))do begin
			if(sis.nombre=aux.nombre)then begin
				encontre:=true;
				pos:=filePos(maestro)-1;
				seek(maestro,0);
				read(maestro,aux);
				sis.cant:=pos*-1;
				seek(maestro,filePos(maestro)-1);
				write(maestro,sis);
				seek(maestro,pos);
				write(maestro,aux);
			end;
			leer(maestro,sis);
		end;
	end;
	
	close(maestro);
end;

var
	maestro:archMaestro;
	opcion:integer;
BEGIN
	assign(maestro,'sistemasOperativos');
	writeln('ingrese 1 para dar de alta o 2 para dar de baja');
	readln(opcion);
	if(opcion=1)then
		alta(maestro)
	else
		if(opcion=2)then begin
			baja(maestro)
		end
		else
			writeln('opcion incorrecta');
	
END.

