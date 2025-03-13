program parcial2023uno;

const
	valorAlto=9999;

type
	empleado=record
		dni:integer;
		nombre:string[10];
		apellido:string[10];
		edad:1..150;
		domicilio:string[30];
		nacimiento:string[20];
	end;
	
	archMaestro= file of empleado;

procedure leer(var maestro:archMaestro;var emp:empleado);
begin
	if not eof(maestro)then
		read(maestro,emp)
	else
		emp.dni:=valorAlto;
end;

procedure pedirDatos(var aux:empleado);
begin
	writeln('ingrese dni o -1 para finalizar');
	readln(aux.dni);
	if(aux.dni<>-1)then begin
		writeln('ingrese nombre');
		readln(aux.nombre);
		writeln('ingrese apellido');
		readln(aux.apellido);
		writeln('ingrese edad');
		readln(aux.edad);
		writeln('ingrese domicillio');
		readln(aux.domicilio);
		writeln('ingrese fecha de nacimiento');
		readln(aux.nacimiento);
	end;
end;
	
procedure agregarEmpleado(var maestro:archMaestro);
var
	emp:empleado;
	aux:empleado;
	encontre:boolean;
	pos:integer;
begin
	reset(maestro);
	encontre:=false;
	pedirDatos(aux);
	leer(maestro,emp);
	if(aux.dni<>-1)then begin 
		if(not existeEmpleado(aux.dni,maestro)) then begin //suponiendo que existeEmpleado retorna y deja el archivo en las pos original
			if(emp.dni<>valorAlto)then begin
				if(emp.dni=0)then begin
					seek(maestro,fileSize(maestro));
					write(maestro,aux);
				end;
				if(emp.dni<0)then begin
					pos:=emp.dni*-1;
					seek(maestro,pos);
					read(maestro,emp);
					seek(maestro,filePos(maestro)-1);
					write(maestro,aux);
					seek(maestro,0);
					write(maestro,emp);
				end;
			end;
		end
		else
			writeln('el dni ya existe.');
	end;
	
	close(maestro);
end;

procedure quitarEmpleado(var maestro:archMaestro);
var
	pos,dni:integer;
	emp:empleado;
	hecho:boolean;
	
begin
	hecho:=false;
	reset(maestro);
	writeln('ingrese dni a eliminar:');
	readln(dni);
	leer(maestro,emp);
	if(existeEmpleado(dni,maestro) and hecho=false)then begin
		while(emp.dni<>valorAlto)do begin
			if(emp.dni=dni)then begin
				hecho:=true;
				pos:=filePos(maestro)-1;
				seek(maestro,0);
				read(maestro,emp);
				seek(maestro,pos);
				write(maestro,emp);
				seek(maestro,0);
				emp.dni:=pos*-1;
				write(maestro,emp);
			end;
			leer(maestro,emp);
		end;
	end
	else
		writeln('el dni no existe.');
	close(maestro);
end;


var
	maestro:archMaestro;

BEGIN
	assign(maestro,'maestro');
	agregarEmpleado(maestro);
	quitarEmpleado(maestro);
END.

