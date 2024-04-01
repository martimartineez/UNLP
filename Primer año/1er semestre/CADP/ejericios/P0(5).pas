program ejemplo;

Var
	caramelos, clientes, sobra, venta: integer;
	valor: Real;
BEGIN
 read(caramelos);
 read(clientes);
 venta:=caramelos div clientes;
 sobra:=caramelos mod clientes;
 valor:= venta*1.60;
 writeln('vende ',venta,'sobram ',sobra,'precio de caramelo', valor:1:2);
 
END.

