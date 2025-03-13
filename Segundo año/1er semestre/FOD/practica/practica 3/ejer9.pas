program ejer9;
const
	valorAlto=9999;
type
	producto=record
		codigo:integer;
		nombre:string;
		precio:real;
		stock:integer;
		stockMin:integer;
	end;
	venta=record
		codigo:integer;
		cantidad:integer;
	end;
	
	archivo_productos=file of producto;
	archivo_ventas=file of venta;
	
procedure leerMaster(var maestro:archivo_productos;var pro:producto);
begin
	
end;



var
	maestro:archivo_productos;
	detalle:archivo_ventas;
	
begin


end.

