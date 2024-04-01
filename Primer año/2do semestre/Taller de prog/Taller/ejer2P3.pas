{
a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el código de producto 0. 
* Un producto puede estar en más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de producto.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por código de producto. Cada nodo del árbol debe contener el código de producto y la cantidad total vendida.
               Nota: El módulo debe retornar los dos árboles.
b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne la cantidad total de unidades vendidas de ese producto.
c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne la cantidad total de unidades vendidas de ese producto.

   
}

program ejercicio2;

Type
	venta=record
		codprod:integer;
		fecha:integer;
		univendidas:integer;
	end;
  Type
  arbol = ^nodo;
nodo = record
   dato: venta;
   HI: arbol;
   HD: arbol;
  end;

         
Procedure crear (var A:arbol; num:venta);
Begin
  if (A = nil) then
   begin
      new(A);
      A^.dato:= num; A^.HI:= nil; A^.HD:= nil;
   end
   else
    if (num.codprod < A^.dato.codprod) then crear(A^.HI,num)
    else crear(A^.HD,num)   
   
End;
procedure leer(var a:venta);
begin
	writeln('ingrese cod de producto o 0 para finalizar');
	readln(a.codprod);
	if(a.codprod<>0)then begin
		readln(a.fecha);
		readln(a.univendidas);
		end;
	end;
procedure generar(var a:arbol; var ven:venta);
begin
	leer(ven);
	while(ven.codprod<>0)do begin
		crear(a,ven);
		leer(ven);
	end;
end;
Procedure enOrden ( a : arbol );
begin
   if ( a<> nil ) then begin
    enOrden (a^.HI);
    write (a^.dato.codprod);
    enOrden (a^.HD);
   end;
end;
function cantidad(a:arbol;b:integer):integer;
begin
	if(a=nil)then
		cantidad:=0
	else if(a^.dato.codprod=b)then
		cantidad:=a^.dato.univendidas+cantidad(a^.HD,b)
	else if(b<a^.dato.codprod)then
		cantidad:=cantidad(a^.HI,b)
	else
		cantidad:=cantidad(a^.HD,b);
end;

var
	a:arbol; ven:venta;b:integer;c:integer;
BEGIN
	generar(a,ven);
	enOrden(a);
	writeln('ingrese un cod a buscar cant');
	readln(b);
	c:=cantidad(a,b);
	writeln('la cantidad de ventas de ese producto es: ',c);
END.

