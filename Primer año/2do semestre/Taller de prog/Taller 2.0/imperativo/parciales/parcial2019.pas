

program parcial2019;

type
alumno=record
	topico:string;
	cant:integer;
end;
lista=^nodo2;
nodo2=record
	dato:alumno;
	sig:lista;
end;	
infoGuardar=record
	nombre:string;
	proyectos:lista;
end;
arbol=^nodo;
nodo=record
	dato:infoGuardar;
	hi:arbol;
	hd:arbol;
end;
procedure leer(var b:alumno;var nom:string);
begin
	writeln('ingrese el nombre: ');
	readln(nom);
	if(nom<>'zzz')then begin
		writeln('ingrese el topico: ');
		readln(b.topico);
	end;
end;
procedure agregarAdelante(var l:lista;b:alumno);
var nue:lista;
begin
	new(nue);
	nue^.dato.topico:=b.topico;
	nue^.dato.cant:=1;
	nue^.sig:=l;
	l:=nue;
end;
procedure insertar(var a:arbol;b:alumno;nom:string);
begin
	if(a=nil)then begin
		new(a);
		a^.dato.nombre:=nom;
		a^.dato.proyectos:=nil;
		agregarAdelante(a^.dato.proyectos,b);//ponerlo en 1 o asi cant topico
		a^.hi:=nil;
		a^.hd:=nil;
		end
	else begin
		if(a^.dato.nombre=nom)then begin
			if(a^.dato.proyectos<>nil)and(a^.dato.proyectos^.dato.topico=b.topico)then
				a^.dato.proyectos^.dato.cant:=a^.dato.proyectos^.dato.cant+1;
		end
		else if(nom<a^.dato.nombre)then
			insertar(a^.hi,b,nom)
			else
				insertar(a^.hd,b,nom);
	
	end;
end;
procedure punto1(var a:arbol);
var
b:alumno;nom:string;
begin
	leer(b,nom);
	while(nom<>'zzz')do begin
		insertar(a,b,nom);
		leer(b,nom);
	end;

end;
procedure procesarLista(li:lista;aux:lista;var max:integer);
begin
	aux:=l;
	while(aux<>nil)do begin
		if(aux^.dato.cant>max)then
			
	
	end;

end;
procedure ganador(a:arbol);
	procedure buscarGanador(a:arbol;var max:integer;l:lista);
	begin
		if(a<>nil)then begin
			if(a^.dato.proyectos<>nil)then
				procesarLista(a^.dato.protectos,l,max);
				buscarGanador(a^.hi,max,l);
				buscarGanador(a^.hd,max,l);
				end
			else begin
				buscarGanador(a^.hi,max,l);
				buscarGanador(a^.hd,max,l);
			end;
		end;
	end;
		
var
max:integer;l:lista;
begin
	l:=nil;
	max:=-9999
	buscarGanador(a,max,l)
end;
var
a:arbol;
BEGIN
	punto1(a);
	ganador(a);
	
END.

