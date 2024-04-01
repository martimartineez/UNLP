

program parcial2022;

type
horas=1..8;
empleado=record
	dia:integer;
	mes:integer;
	cant:horas;
end;

infoGuardar=record
	datos:empleado;
	cod:integer;
end;
lista=^nodo2;
nodo2=record
	dato:empleado;
	sig:lista;
end;
arbol=^nodo;
nodo=record
	dato:infoGuardar;
	hi:arbol;
	hd:arbol;
end;
procedure leerRegistro(var b:empleado;var num:integer);
begin
	writeln('ingrese el dia: ');
	readln(b.dia);
	if(b.dia<>0)then begin
		writeln('ingrese numero de empleado: ');
		readln(num);
		writeln('ingrese mes: ');
		readln(b.mes);
		writeln('ingrese la cant de horas: ');
		readln(b.cant);
	end;
end;

procedure insertar(var a:arbol;num:integer;b:empleado);
begin
	if(a=nil)then begin
	new(a);
	a^.dato.datos:=b;
	a^.dato.cod:=num;
	a^.hi:=nil;
	a^.hd:=nil;
	end
	else begin
		if(num<a^.dato.cod)then
			insertar(a^.hi,num,b)
		else
			insertar(a^.hd,num,b);
	end;

end;
procedure incisoA(var a:arbol);
var b:empleado;num:integer;
begin
	leerRegistro(b,num);
	while(b.dia<>0)do begin
		insertar(a,num,b);
		leerRegistro(b,num);
	end;
end;
procedure agregarAtras(var l:lista;var u:lista;b:empleado);
var nue:lista;
begin
	new(nue);
	nue^.dato:=b;
	nue^.sig:=nil;
	if(l<>nil)then
		u^.sig:=nue
	else
		l:=nue;
		u:=nue;

end;
 
procedure incisoB(a:arbol;var l:lista);
	procedure buscarDatos(a:arbol;var l:lista;var u:lista;min:integer;max:integer);
	begin
		if(a<>nil)then begin
			if(a^.dato.cod<=max)and(a^.dato.cod>=min)then begin
				agregarAtras(l,u,a^.dato.datos);
				buscarDatos(a^.hd,l,u,min,max);
				buscarDatos(a^.hi,l,u,min,max);
			end
			else if(a^.dato.cod<min)then
					buscarDatos(a^.hd,l,u,min,max)
				 else
					buscarDatos(a^.hi,l,u,min,max);
		end;
	end;
var
emp1:integer;emp2:integer;u:lista;
begin
	u:=nil;
	writeln('ingrese num1: ');
	readln(emp1);
	writeln('ingrese num2: ');
	readln(emp2);
	buscarDatos(a,l,u,emp1,emp2);
end;
procedure incisoC(l:lista;var cant:integer);
begin
	if(l<>nil)then begin
		cant:=cant+l^.dato.cant;
		incisoC(l^.sig,cant);
	end;
end;

var
a:arbol;l:lista;cant:integer;
BEGIN
	l:=nil;
	cant:=0;
	incisoA(a);
	incisoB(a,l);
	incisoC(l,cant);
	writeln('horas: ',cant);
END.

