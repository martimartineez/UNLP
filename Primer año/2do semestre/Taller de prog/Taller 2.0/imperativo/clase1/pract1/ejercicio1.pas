{1.- Implementar un programa que procese la información de las ventas de productos de un comercio (como máximo 20). 
De cada venta se conoce código del producto (entre 1 y 15) y cantidad vendida (como máximo 99 unidades).  El ingreso de las ventas finaliza con el código 0 (no se procesa).
a. Almacenar la información de las ventas en un vector. El código debe generarse automáticamente (random) y la cantidad se debe leer. 
b. Mostrar el contenido del vector resultante.
c. Ordenar el vector de ventas por código.
d. Mostrar el contenido del vector resultante.
e. Eliminar del vector ordenado las ventas con código de producto entre dos valores que se ingresan como parámetros. 
f. Mostrar el contenido del vector resultante.
g. Generar una lista ordenada por código de producto de menor a mayor a partir del vector resultante del inciso e., sólo para los códigos pares.
h. Mostrar la lista resultante.}
program ejercicio1;
const
	tope = 20;
type
	venta = record
		codigo:integer;
		vendido:integer;
	end;
	ventas = array [1..tope] of venta;
		lista = ^nodo;
	nodo = record 
		sig: lista;
		dato:venta;
	end;
procedure leerVentas {a} (var v:ventas; var dimL:integer);
var
	aux: integer;
begin
	aux:= (100+random(60))div 10; dimL:=0;
	while (dimL < 20) and (aux <> 0) do begin
		dimL:=dimL+1;
		v[dimL].codigo:=aux;
		//readln(v[dimL].vendido);
		v[dimL].vendido:=random(100);
		aux:= (100+random(60))div 10;
	end;
end;
procedure mostrarVector {b} {d} {f} (v:ventas; dimL:integer);
var
	i:integer;
begin
	for i:= 1 to dimL do 
		writeln('codigo ', v[i].codigo, ' vendido ', v[i].vendido);
	writeln('|--------------------|');
end;
procedure ordenar {c} (var v:ventas; dimL:integer);
var
	i, j:integer; actual:venta;
begin
	for i:= 2 to dimL do begin
		actual:=v[i];
		j:=i-1;
		while (j > 0) and (v[j].codigo > actual.codigo) do begin
			v[j+1]:=v[j];
			j:=j-1;
		end;
		v[j+1]:=actual;
	end;
end;
procedure eliminarRango {e} (var v:ventas; var dimL:integer; var1:integer; var2:integer);
var
	i,j:integer;
begin
	i:=1;
	while (i < dimL) do begin
		if (v[i].codigo >= var1) and (v[i].codigo <= var2) then begin
			writeln('Moviendo');
			for j:= i to diml-1 do
				v[j]:=v[j+1];
			dimL:=dimL-1;
			mostrarVector(v, dimL);
		end
		else i:=i+1;
	end;
end;
procedure insertar (var l:lista; N:venta);
var
	nue, ant, act: lista;
begin
	new (nue);
	nue^.sig:=nil;
	nue^.dato:=N;
	act:=l; ant:=l;
	while(act <>nil) and (act^.dato.codigo < nue^.dato.codigo) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if (act = ant) then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;
procedure extraerLista {g} (var l:lista; v:ventas; dimL:integer);
var
	i:integer; N:venta;
begin
	l:=nil;
	for i:=1 to dimL do begin
		if (v[i].codigo mod 2 = 0) then begin
			N:=v[i];
			insertar(l, N);
		end;
	end;
end;
procedure mostrarLista {h} (l:lista);
begin
	while (l <> nil) do begin
		writeln('LISTA codigo ', l^.dato.codigo, ' vendido ', l^.dato.vendido);
		l:=l^.sig;
	end;
	writeln('|--------------------|');
end;
var
	v:ventas; dimL, var1, var2:integer; l:lista;
begin
	leerVentas(v, dimL);
	mostrarVector(v, dimL);
	ordenar(v, dimL);
	mostrarVector(v,dimL);
	readln(var1);
	readln(var2);
	eliminarRango(v, dimL, var1, var2);
	mostrarVector(v, dimL);
	extraerLista(l,v,dimL);
	mostrarLista(l);
end.


n(var2);
	eliminarRango(v, dimL, var1, var2);
	mostrarVector(v, dimL);
	extraerLista(l,v,dimL);
	mostrarLista(l);
end.


