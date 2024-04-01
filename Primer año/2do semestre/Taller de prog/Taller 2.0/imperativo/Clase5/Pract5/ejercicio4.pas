{4.- Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una lista con las entradas vendidas. 
Se desea procesar la información de una semana. Se pide:
a)	Generar 7 listas con las entradas vendidas para cada día. De cada entrada se lee día (de 1 a 7), código de la obra, 
* asiento, monto. La lectura finaliza con el código de obra igual a 0. Las listas deben estar ordenadas por código de obra 
* de forma ascendente.}
{b)	Generar una nueva lista que totalice la cantidad de entradas vendidas por obra. Esta lista debe estar ordenada por 
* código de obra de forma ascendente.}
{c)	Realice un módulo recursivo que informe el contenido de la lista generada en b)}
program pepe;
type
dias=1..7;
entrada=record
	codigo:integer;
	asiento:integer;
	monto:real;
end;
lista=^nodo;
nodo=record
	dato:entrada;
	sig:lista;
end;
guardar=record
	codigo:integer;
	cant:integer;
end;
lista2=^nodo2;
nodo2=record
	dato:guardar;
	sig:lista2;
end;
vector=array[dias]of lista;

procedure iniciarVe(var v:vector);
var i:integer;
begin
	for i:=1 to 7 do begin
		v[i]:=nil;
	end;
end;
procedure leer(var a:entrada;var dia:integer);
begin
	writeln('ingresar dia: ');
	readln(dia);
	writeln('ingresar codigo de obra: ');
	readln(a.codigo);
	if(a.codigo<>0)then begin
		writeln('ingrese el asiento: ');
		readln(a.asiento);
		writeln('ingrese el monto:');
		readln(a.monto);
	end;
end;
procedure insertarOrdenado(var l:lista;a:entrada);
var nue,ant,act:lista;
begin
	new(nue);
	nue^.dato:=a;
	ant:=l;
	act:=l;
	while(act<>nil)and(act^.dato.codigo<nue^.dato.codigo)do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(act=l)then
		l:=nue
	else begin
		ant^.sig:=nue;
		nue^.sig:=act;
	end;
end;
procedure incisoA(var v:vector);
var
dia:integer;a:entrada;
begin
	iniciarVe(v);
	leer(a,dia);
	while(a.codigo<>0)do begin
		insertarOrdenado(v[dia],a);
		leer(a,dia)
	end;
end;
procedure minimo(var v:vector;var min:entrada);
var
i,iMin:integer;
begin
	min.codigo:=9999;
	for i:=1 to 7 do begin
		if(v[i]<>nil)and(v[i]^.dato.codigo<min.codigo)then begin
			min:=v[i]^.dato;
			iMin:=i;
		end;
	end;
	if(min.codigo<>9999)then begin
		v[iMin]:=v[iMin]^.sig;
	end;
end;
procedure insertarAtras(var l:lista2;var u:lista2;actual:guardar);
var nue:lista2;
begin
	new(nue);
	nue^.dato:=actual;
	nue^.sig:=nil;
	if(l<>nil)then
		u^.sig:=nue
	else begin
		l:=nue;
		u:=nue;
	end;
end;

procedure incisoB(v:vector;var l:lista2);
var min:entrada; u:lista2; actual:guardar;
begin
	minimo(v,min);
	while(min.codigo<>9999)do begin
		actual.codigo:=min.codigo;actual.cant:=0;
		while(min.codigo<>9999)and(min.codigo=actual.codigo)do begin
			actual.cant:=actual.cant+1;
			minimo(v,min);
		end;
		insertarAtras(l,u,actual);
	end;
end;
procedure incisoC(l:lista2);

begin
	if(l<>nil)then begin
		writeln('codigo: ',l^.dato.codigo);
		writeln('cantidad: ',l^.dato.cant);
		incisoC(l^.sig);
	end;
end;

var v:vector;l:lista2;
begin
l:=nil;
incisoA(v);
incisoB(v,l);
incisoC(l);
end.
