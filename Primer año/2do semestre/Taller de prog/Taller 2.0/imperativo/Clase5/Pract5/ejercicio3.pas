{3.- Un supermercado requiere el procesamiento de sus productos. De cada producto se conoce código, rubro (1..10), stock y 
* precio unitario. Se pide:
a)	Generar una estructura adecuada que permita agrupar los productos por rubro. A su vez, para cada rubro, se requiere que 
* la búsqueda de un producto por código sea lo más eficiente posible. La lectura finaliza con el código de producto igual a -1..}
{b)	Implementar un módulo que reciba la estructura generada en a), un rubro y un código de producto y retorne si dicho código 
* existe o no para ese rubro.}
{c)	Implementar un módulo que reciba la estructura generada en a), y retorne, para cada rubro, el código y stock del producto 
* con mayor código.}
{d)	Implementar un módulo que reciba la estructura generada en a), dos códigos y retorne, para cada rubro, la cantidad de 
* productos con códigos entre los dos valores ingresados.}

program ejercicio3;

type
rubros=1..10;
producto=record
	codigo:integer;
	stock:integer;
	precio:real;
end;
mayor=record
	codigo:integer;
	stock:integer;
end;
arbol=^nodo;
nodo=record
	dato:producto;
	hi:arbol;
	hd:arbol;
end;
vector=array[rubros]of arbol;
vector2=array[rubros]of mayor;
vector3=array[rubros]of integer;

procedure iniciarVector1(var v:vector);
var i:integer;
begin
	for i:=1 to 10 do
		v[i]:=nil;
end;

procedure leer(var b:producto;var ru:rubros);
begin
	writeln('ingrese el codigo del prducto: ');
	readln(b.codigo);
	if(b.codigo<> -1)then begin
		writeln('ingrese el rubro: ');
		readln(ru);
		writeln('ingrese el stock: ');
		readln(b.stock);
		writeln('ingrese el precio unitario: ');
		readln(b.precio);
		end;
end;

procedure insertar(var a:arbol;b:producto);
begin
	if(a=nil)then begin
		new(a);
		a^.dato:=b;
		a^.hi:=nil;
		a^.hd:=nil;
		end
	else if(b.codigo<a^.dato.codigo)then
		insertar(a^.hi,b)
		else
			insertar(a^.hd,b);
end;

procedure incisoA(var v:vector);
var
	b:producto;ru:rubros;
begin
	iniciarVector1(v);
	leer(b,ru);
	while(b.codigo<>-1)do begin
		insertar(v[ru],b);
		leer(b,ru);
		end;
end;

procedure incisoB(v:vector;var esta:boolean);
	function buscarOrdenado(a:arbol;codigo:integer):boolean;
	begin
		if(a=nil)then
			buscarOrdenado:=false
		else if(a^.dato.codigo=codigo)then
			buscarOrdenado:=true
			else if(codigo<a^.dato.codigo)then
				buscarOrdenado:=buscarOrdenado(a^.hi,codigo)
				else
					buscarOrdenado:=buscarOrdenado(a^.hd,codigo);
	end;
var 
	rubro:rubros;codigo:integer;
begin
	writeln('ingrese el rubro a buscar: ');
	readln(rubro);
	writeln('ingrese el codigo a buscar: ');
	readln(codigo);
	esta:=buscarOrdenado(v[rubro],codigo);
	if(esta)then
		writeln('encontrado!')
	else
		writeln('no esta.');
end;

procedure incisoC(v:vector;var v2:vector2);
	procedure buscarMax(a:arbol;var max:mayor);
	begin
		if(a=nil)then begin
			writeln('no hay datos.');
			max.codigo:=-1;
			max.stock:=-1;
		end
		else begin 
			if(a^.hd=nil)then begin
			max.codigo:=a^.dato.codigo;
			max.stock:=a^.dato.stock;
			end
			else
				buscarMax(a^.hd,max);
			
			end;
	
	end;
var max:mayor;i:integer;
begin
	for i:=1 to 10 do begin
		buscarMax(v[i],max);
		v2[i]:=max;
	end;
end;
procedure incisoD(v:vector;var v3:vector3);
	function calcular(a:arbol;cod1:integer;cod2:integer):integer;
	begin
		if(a=nil)then
			calcular:=0
		else  begin
				if(a^.dato.codigo>=cod1)and(a^.dato.codigo<=cod2)then
			calcular:=1+calcular(a^.hi,cod1,cod2)+calcular(a^.hd,cod1,cod2)
				else if(a^.dato.codigo<cod1)then
				calcular:=calcular(a^.hd,cod1,cod2)
				else
					calcular:=calcular(a^.hi,cod1,cod2);
			end;
	end;
var
	cod1,cod2:integer;i:integer;cantidad:integer;
begin
	writeln('ingrese el codigo  min: ');
	readln(cod1);
	writeln('ingrese el codigo max: ');
	readln(cod2);
	for i:=1 to 10 do begin
		cantidad:=calcular(v[i],cod1,cod2);
		v3[i]:=cantidad;
	end;
end;
var
v:vector;v2:vector2;v3:vector3;esta:boolean;i:integer;
BEGIN
	incisoA(v);
	incisoB(v,esta);	
	incisoC(v,v2);
	incisoD(v,v3);
	for i:=1 to 10 do begin
		writeln('v3: ',v3[i]);
		end;
END.

