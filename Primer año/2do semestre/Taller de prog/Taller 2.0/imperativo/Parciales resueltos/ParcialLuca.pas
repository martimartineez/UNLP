
program parcialLuca;
type
	alumno=record
		nombre:string;
		dni:integer;
		tiempo:real;
	end;
	arbol=^nodoA;
	nodoA=record
		dato:alumno;
		HI:arbol;
		HD:arbol;
	end;
	lista=^nodo;
	nodo=record
		dato:alumno;
		sig:lista;
	end;

procedure agregarArbol(var a:arbol;dato:alumno);
begin
	if(a=nil)then begin
		new(a);
		a^.dato:=dato;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else
		if(dato.tiempo < a^.dato.tiempo)then
			agregarArbol(a^.HI,dato)
		else
			agregarArbol(a^.HD,dato);
end;
	
procedure registarAlumno(var a:arbol);
var
	dato:alumno;
begin
	writeln('ingrese dni: ');
	readln(dato.dni);
	while(dato.dni<>0)do begin
		writeln('ingrese nombre: ');
		readln(dato.nombre);
		writeln('ingrese tiempo: ');
		readln(dato.tiempo);
		agregarArbol(a,dato);
		writeln('ingrese dni: ');
		readln(dato.dni);
	end;
end;
procedure insertarAtras(var l:lista;var u:lista;dato:alumno);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=dato;
	nue^.sig:=nil;
	if(l<>nil)then
		u^.sig:=nue
	else
		l:=nue;
	u:=nue;
end;
	
procedure generarLista(a:arbol;num1:real;num2: real;var l:lista;var u:lista);
begin
	if(a<>nil)then begin
		if(a^.dato.tiempo >= num1)then begin
			generarLista(a^.HI,num1,num2,l,u);
			if(a^.dato.tiempo<=num2)then begin
				insertarAtras(l,u,a^.dato);
				generarLista(a^.HD,num1,num2,l,u);		
				end;
			end
		else
			generarLista(a^.HD,num1,num2,l,u);
	end;
end;

procedure masRapido(a:arbol;var nombre:string;var dni:integer);
begin
	if(a<>nil)then begin
		masRapido(a^.HI,nombre,dni);
		if(a^.HI=nil)then begin
			nombre:=a^.dato.nombre;
			dni:=a^.dato.dni;
		end;
	end;
end;
var 
	a:arbol;
	u,l:lista;
	nombre:string;
	dni:integer;
BEGIN
	a:=nil;
	l:=nil;
	u:=nil;
	registarAlumno(a);
	writeln('1');
	generarLista(a,2,5,l,u);
	writeln('2');
	masRapido(a,nombre,dni);
	writeln('3');
END.

