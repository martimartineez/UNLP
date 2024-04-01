{2.	Escribir un programa que:
a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee código de producto, fecha y 
* cantidad de unidades vendidas. La lectura finaliza con el código de producto 0. Un producto puede estar en más de una 
* venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de producto.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por código de producto. Cada nodo 
* del árbol debe contener el código de producto y la cantidad total vendida.
Nota: El módulo debe retornar los dos árboles.
b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne la cantidad total de 
* unidades vendidas de ese producto.
c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne la cantidad total de 
* unidades vendidas de ese producto
}


program ejercicio2;
type
venta=record
	codigo:integer;
	fecha:string;
	vendido:integer;
	end;
ventita=record
	codigo:integer;
	vendido:integer;
	end;
arbol=^nodo;
arbol2=^nodo2;
nodo=record
	dato:venta;
	hi:arbol;
	hd:arbol;
	end;
nodo2=record
	dato:ventita;
	hi:arbol2;
	hd:arbol2;
	end;
procedure leer(var dato:venta);
begin
	writeln('ingrese codigo: ');
	readln(dato.codigo);
	if(dato.codigo<>0)then begin
		writeln('ingrese fecha: ');
		readln(dato.fecha);
		writeln('ingrese cantidad de unidades vendidas: ');
		readln(dato.vendido);
	end;
end;
procedure agregar(var a:arbol;dato:venta);
begin
	if(a=nil)then
	begin
		new(a);
		a^.dato:=dato;
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else
		if(dato.codigo<a^.dato.codigo)then
		agregar(a^.hi,dato)
		else
			agregar(a^.hd,dato);
end;
procedure agregar2(var a2:arbol2;dato:ventita);
begin
	if(a2=nil)then
	begin
		new(a2);
		a2^.dato:=dato;
		a2^.hi:=nil;
		a2^.hd:=nil;
	end
	else
		if(dato.codigo<a2^.dato.codigo)then
		agregar2(a2^.hi,dato)
		else
			agregar2(a2^.hd,dato);
end;

procedure crearArbol(var a:arbol;var a2:arbol2);
var
dato:venta;datito:ventita;
begin
	leer(dato);
	while(dato.codigo<>0)do begin
		agregar(a,dato);
		datito.codigo:=dato.codigo;
		datito.vendido:=dato.vendido;
		agregar2(a2,datito);
		leer(dato);
	end;
end;
procedure contarVentas(a:arbol;cod:integer;var cant:integer);
	function calcular(a:arbol;cod:integer):integer;
	begin
		if(a=nil)then
		calcular:=0
		else begin
			if(cod=a^.dato.codigo)then
				calcular:=a^.dato.vendido+calcular(a^.hd,cod)
			else if(cod<a^.dato.codigo)then
				calcular:=calcular(a^.hi,cod)
			else
				calcular:=calcular(a^.hd,cod);
				
		end;
	end;

begin
cant:=calcular(a,cod);
writeln(cant);
end;
procedure calcularVentas(a2:arbol2;cod:integer;var cant:integer);
	function contar(a2:arbol2;cod:integer):integer;
	begin
		if(a2=nil)then
		contar:=0
		else begin
			if(cod=a2^.dato.codigo)then
				contar:=a2^.dato.vendido+ contar(a2^.hd,cod)
			else if(cod<a2^.dato.codigo)then
				contar:=contar(a2^.hi,cod)
				else
				contar:=contar(a2^.hd,cod);
		end;
	end;
	
begin
cant:=contar(a2,cod);
writeln(cant);
end;
var
a:arbol;a2:arbol2;codigo:integer;cantidadA1:integer;cantidadA2:integer;
BEGIN
	a:=nil;
	a2:=nil;
	crearArbol(a,a2);
	writeln('ingrese codigo de producto a contar: ');
	readln(codigo);
	contarVentas(a,codigo,cantidadA1);
	writeln('ingrese codigo DOS de producto a contar: ');
	readln(codigo);
	calcularVentas(a2,codigo,cantidadA2);
END.

