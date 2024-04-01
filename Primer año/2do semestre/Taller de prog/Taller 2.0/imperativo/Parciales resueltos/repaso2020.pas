{
   repaso2020.pas
   
   Se lee información acerca de las ventas de productos realizadas en las 5 sucursales de una empresa.
Cada sucursal realizó a lo sumo 200 ventas. De cada venta se conoce el código de producto, cantidad
vendida y monto total de la venta. Las ventas de cada sucursal se leen de manera consecutiva y
ordenadas por código de producto. La lectura por cada sucursal finaliza al completar las 200 ventas o
cuando se lee el código de producto -1, el cual no se procesa. Implementar un programa para que a
partir de la información leida, resuelva los siguientes ítems:

a) Utilizando la técnica de merge o merge acumulador según corresponda, generar una lista que
contenga la cantidad total vendida para cada código de producto, ordenada por código de
producto.
b) Realizar un módulo recursivo que reciba la lista generada en el punto a y retorne la cantidad de
productos para los cuales la cantidad total vendida supera las 500 unidades.
   
   
}


program repaso2020;
const 
	df=200;
	sucu=5;
type
	rango=1..df;
	rango2=1..sucu;
	
	venta=record
		codProducto:integer;
		cantidad:integer;
		montoTotal:real;
	end;
	
	
	ven=record
		codProducto:integer;
		montoTotal:real;
	end;
	
	lista=^nodo;
	
	nodo=record
		dato:ven;
		sig:lista;
	end;
	
	vector=array[rango] of venta;
	sucursales=array[rango2]of vector;

procedure agregar(var vec:vector; var dl:integer; dato:venta);
begin
	if(dl<df)then begin
		dl:=dl+1;
		vec[dl]:=dato;
	end;
end;

procedure cargarDatos(var vec:vector;var dl:integer);
var
	dato:venta;
begin
	writeln('ingrese cod de prod: ');
	readln(dato.codProducto);
	while((dl<df)and(dato.codProducto<>-1))do begin
		writeln	('ingrese cantidad: ');
		readln(dato.cantidad);
		writeln('ingrese montoTotal: ');
		readln(dato.montoTotal);
		agregar(vec,dl,dato);
		writeln('ingrese cod de prod: ');
		readln(dato.codProducto);
		end;
	
end;
	

BEGIN
	
	
END.

