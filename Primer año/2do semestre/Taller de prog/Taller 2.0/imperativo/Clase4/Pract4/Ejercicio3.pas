{3.	Implementar un programa que procese la información de las ventas de productos de una librería que tiene 4 sucursales. De cada venta se lee fecha de venta, 
* código del producto vendido, código de sucursal y cantidad vendida. El ingreso de las ventas finaliza cuando se lee el código de sucursal 0. Implementar un 
* programa que:
a.	Almacene las ventas ordenadas por código de producto y agrupados por sucursal, en una estructura de datos adecuada.
b.	Contenga un módulo que reciba la estructura generada en el punto a y retorne una estructura donde esté acumulada la cantidad total vendida para cada 
* código de producto.}
program mergeadoAcumulado;
type
	venta = record
		fecha : integer;
		codigo : integer;
		sucu : integer;
		cant : integer;
		end;
	lista = ^nodo;
	nodo = record
		elem : venta;
		sig : lista;
		end;
	producto = record
		codigo : integeR;
		cant : integer;
		end;
	lista2 = ^nodo2;
	nodo2 = record
		elem : producto;
		sig : lista2;
	end;
	vector = array [1..4] of lista;
procedure leerVen(var ven : venta);
	begin
		read(ven.codigo);
		if ven.codigo <> 0 then begin
			readln(ven.fecha);
			readln(ven.sucu);
			readln(ven.cant);
		end;
	end;
procedure insertarOrdenado (var l :lista; ven : venta);
	var nue,act,ant : lista;
	begin
		new(nue);
		nue^.elem := ven;
		act := l;
		ant := l;
		while (act <> nil)and (act^.elem.codigo < ven.codigo) do begin
			ant := act;
			act := act^.sig 
		end;
		if act = ant then
			l := nue
		else
			ant^.sig := nue;
		nue^.sig := act;
 	end;
procedure incisoA(var v : vector);
	var
		ven : venta;
	begin
		leerVen(ven);	
		while ven.codigo <> 0 do begin
			insertarOrdenado(v[ven.sucu],ven);
			leerVen(ven);
		end;
	end;
procedure agregarAtras(var l:lista2; var u:lista2; n:producto);
	var
		nue:lista2;
	begin
		new(nue); nue^.elem:=n; nue^.sig:=nil;
		if (l <> nil) then
			u^.sig:=nue
		else l:=nue;
		u:=nue;
	end;
procedure minimo(var v : vector; var ven : venta);
	var
		iMin : integer;
		i : integer;
	begin
		ven.codigo := 9999;
		for i := 1 to 4 do begin
			if (v[i]<>nil)and (v[i]^.elem.codigo < ven.codigo) then begin
				iMin := i;
				ven.codigo := v[i]^.elem.codigo;
			end;
		end;
		if ven.codigo <> 9999 then begin
			v[iMin] :=v[iMin]^.sig;
		end;
	end;
procedure mergeAcumulador ( v : vector ; var l : lista2);
	var
		actual: producto;
		ven : venta;
		u:lista2;
	begin
	l:=nil;u:=nil;
		minimo(v,ven);
		while ven.codigo <> 9999 do begin
			actual.codigo := ven.codigo;
			actual.cant := 0;
			while(ven.codigo <> 9999)and (actual.codigo = ven.codigo) do begin
				actual.cant  := actual.cant  + ven.cant;
				minimo(v,ven);
		end;
			agregarAtras(l,u,actual);
		
	end;
	end;
var
	v : vector;
	i : integer;

begin
	for i := 1 to 4 do 
		v[i] := nil;
	incisoA(v);
	

end.
