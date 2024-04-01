{12. Implementar un programa que procese la información de las ventas de productos de una
librería que tiene 4 sucursales. De cada venta se lee fecha de venta, código del producto
vendido, código de sucursal y cantidad vendida. El ingreso de las ventas finaliza cuando se
lee el código de sucursal 0.
Implementar un programa que:
a. Almacene las ventas ordenadas por código de producto y agrupados por sucursal,
en una estructura de datos adecuada.
b. Contenga un módulo que reciba la estructura generada en el punto a y retorne
una estructura donde esté acumulada la cantidad total vendida para cada código de
producto.}


program parcialR;
const
	sucursales=4;
type
	
	venta= record
		fecha:string;
		codVenta:integer;
		codSucursal:0..sucursales;
		cantidad:integer;
	end;
	ventaNueva=record
		cant:integer;
		codigo:integer;
	end;
	
	listaNueva=^nodo2;
	nodo2=record
		dato:ventaNueva;
		sig:listaNueva;
	end;
	
	lista=^nodo;
	nodo=record
		dato:venta;
		sig:lista;
	end;
	
	vector_sucursales=array [1..sucursales]of lista;
	
procedure iniciarVector(var v:vector_sucursales);
var
	i:integer;
begin
	for i:=1 to sucursales do
	begin
		v[i]:=nil;
	end;
end;

procedure agregarOrdenado(var l:lista; ven: venta);
var
	nue,act,ant:lista;
begin
	new(nue);
	nue^.dato:=ven;
	act:=l;
	ant:=l;
	while((act<>nil)and(act^.dato.codVenta < ven.codVenta))do
	begin
		ant:=act;
		act:=act^.sig;
	end;
	if(act=ant)then
	begin
		l:=nue;
	end
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure cargarVenta(var v:vector_sucursales);
var
	ven:venta;
begin
	writeln('ingrese cod de sucursal: ');
	readln(ven.codSucursal);
	while(ven.codSucursal <> 0) do
	begin
		writeln('ingrese fecha de venta: ');
		readln(ven.fecha);
		writeln('ingrese cod de veta: ');
		readln(ven.codVenta);
		writeln('ingrese cantidad vendida: ');
		readln(ven.cantidad);
		agregarOrdenado(v[ven.codSucursal],ven);
		writeln('ingrese cod de sucursal: ');
		readln(ven.codSucursal);
	end;
end;

procedure agregarAtras(var l,ult:listaNueva; x:ventaNueva);
var
	nue:listaNueva;
begin
	new(nue);
	nue^.dato:=x;
	nue^.sig:=nil;
	if(l<>nil)then
		ult^.sig:=nue
	else
		l:=nue;
	ult:=nue;
end;


procedure minimo(var v:vector_sucursales;var min:ventaNueva);
var
	i,pos:integer;
begin
	min.codigo:=9999;
	pos:=-1;
	for i:=1 to sucursales do
	begin
		if((v[i]<>nil) and (v[i]^.dato.codVenta <=min.codigo ))then
		begin
			min.codigo:=v[i]^.dato.codVenta;
			pos:=i;
		end;
	end;
	if(pos<>-1)then 
	begin
		min.cant:=v[pos]^.dato.cantidad;
		v[pos]:=v[pos]^.sig;
	end;
end;

procedure mergeAcumulador(var l:listaNueva; v:vector_sucursales);
var
	min, actual:ventaNueva;
	ult:listaNueva;
begin
	minimo(v,min);
	while(min.codigo<>9999)do
	begin
		actual.cant:=0;
		actual.codigo:=min.codigo;
		while((min.codigo<>9999)and(actual.codigo=min.codigo))do
		begin
			actual.cant:=actual.cant+min.cant;
			minimo(v,min);
		end;
		agregarAtras(l,ult,actual);
	end;
end;

procedure imprimirLista(l:listaNueva);
begin
    WriteLn('______________________________');
    while l <> nil do
    begin
        WriteLn('Codigo: ',l^.dato.codigo);
        WriteLn('Cantidad: ',l^.dato.cant);
        WriteLn('______________________________');
        l:=l^.sig;
    end;
end;

var
	l:listaNueva;
	vec:vector_sucursales;

BEGIN
	l:=nil;
	iniciarVector(vec);
	cargarVenta(vec);
	mergeAcumulador(l,vec);
	imprimirLista(l);

	
END.

