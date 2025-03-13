{3.- Un supermercado requiere el procesamiento de sus productos. De cada producto se conoce código, rubro (1..10), stock y precio unitario. Se pide:
a)	Generar una estructura adecuada que permita agrupar los productos por rubro. A su vez, para cada rubro,
*  se requiere que la búsqueda de un producto por código sea lo más eficiente posible. La lectura finaliza con el código de producto igual a -1..
b)	Implementar un módulo que reciba la estructura generada en a), un rubro y un código de producto y retorne si dicho código existe o no para ese rubro.
c)	Implementar un módulo que reciba la estructura generada en a), y retorne, para cada rubro, el código y stock del producto con mayor código.
d)	Implementar un módulo que reciba la estructura generada en a), dos códigos y retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores ingresados.
}
program ejercicio3;
const
	max=10;
type
	rango=1..max;
	producto=record
		cod:integer;
		rubro: rango;
		stock:integer;
		precio:real;
		end;
	arbol=^nodo;
	nodo=record
		dato:producto;
		HI:arbol;
		HD:arbol;
		end;
	vector=array[1..max]of arbol;

procedure iniciarvector(var v:vector);
	var i:integer;
	begin
	for i:=1 to max do 
		v[i]:=nil;
	end;
procedure leerproducto(var c:producto);
begin
	writeln('ingrese el cod o -1 para finalizar: ');
	readln(c.cod);
		if(c.cod<>-1)then begin
			readln(c.rubro);
			readln(c.stock);
			readln(c.precio);
			end;
		end;
procedure creararbol(var a:arbol;c:producto);
begin
	if a=nil then begin
		new(a);	
		a^.dato:=c;
		a^.HI:=nil;
		a^.HD:=nil;
		end
	else if(c.cod<a^.dato.cod)then
		creararbol(a^.HI,c)
	else
		creararbol(a^.HD,c);
		
	end;

Procedure enOrden ( a : arbol );
begin
   if ( a<> nil ) then begin
    enOrden (a^.HI);
    write (a^.dato.cod);
    enOrden (a^.HD);
   end;
end;	

procedure almacenarinfo(var v:vector);
var
	a:arbol;c:producto;
begin
	iniciarvector(v);
	leerproducto(c);
	while(c.cod<>-1)do begin
		a:=v[c.rubro];
		creararbol(a,c);
		v[c.rubro]:=a;
		leerproducto(c);
		end;
	end;

procedure imprimir(v:vector);
var i:integer;
begin
	for i:=1 to max do begin
		enorden(v[i]);
		
	end;
end;

var
	v:vector;
Begin
almacenarinfo(v);
imprimir(v);









end.
