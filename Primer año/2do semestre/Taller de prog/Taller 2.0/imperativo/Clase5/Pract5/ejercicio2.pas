{2.- Una agencia dedicada a la venta de autos ha organizado su stock y, 
* dispone en papel de la información de los autos en venta.
Implementar un programa que:
a)	Genere un árbol binario de búsqueda ordenado por patente identificatoria del auto en venta. 
* Cada nodo del árbol debe contener patente, año de fabricación (2010..2018), 
la marca y el modelo.
b)	Invoque a un módulo que reciba el árbol generado en a) y una marca y retorne la cantidad 
* de autos de dicha marca que posee la agencia. Mostrar el resultado. 
c)	Invoque a un módulo que reciba el árbol generado en a) y retorne una estructura con la 
* información de los autos agrupados por año de fabricación.
d)	Contenga un módulo que reciba el árbol generado en a) y una patente y devuelva el año de 
* fabricación del auto con dicha patente. Mostrar el resultado}


program ejercicio2;

type
anios = 2010..2018;
auto=record
	patente:string;
	anio:anios;
	marca:string;
	modelo:string;
end;
	
arbol=^nodo;
nodo=record
	dato:auto;
	hi:arbol;
	hd:arbol;
end;
auto2=record
	patente:string;
	marca:string;
	modelo:string;
end;

lista=^nodo2;
nodo2=record
	dato:auto2;
	sig:lista;
end;
vector=array[anios]of lista;
procedure leer(var b:auto);
begin
	writeln('ingrese patente o -1 para terminar. ');
	readln(b.patente);
	if(b.patente<>'-1')then begin
		writeln('ingrese anio: ');
		readln(b.anio);
		writeln('ingrese marca: ');
		readln(b.marca);
		writeln('ingrese modelo: ');
		readln(b.modelo);
	end;
end;

procedure insertar(var a:arbol;b:auto);
begin
	if(a=nil)then begin
	new(a);
	a^.dato:=b;
	a^.hi:=nil;a^.hd:=nil;
	end
	else if(b.patente<a^.dato.patente)then
		insertar(a^.hi,b)
	else
		insertar(a^.hd,b);
end;

procedure generarArbol(var a:arbol);
var
b:auto;
begin
	leer(b);
	while(b.patente<>'-1')do begin
		insertar(a,b);
		leer(b);
	end;
end;
procedure contarMarca(a:arbol;var total:integer);
	function calcularMarca(a:arbol;marca:string):integer;
	begin
		if(a=nil)then
			calcularMarca:=0
		else begin
			if(a^.dato.marca=marca)then
				calcularMarca:=1+calcularMarca(a^.hi,marca)+calcularMarca(a^.hd,marca)
			else
				calcularMarca:=calcularMarca(a^.hi,marca)+calcularMarca(a^.hd,marca);
			end;
	end;
var
marca:string;
begin
	writeln('ingrese la marca a buscar: ');
	readln(marca);
	total:=calcularMarca(a,marca);
	writeln('total: ',total);
end;
procedure procesarDato(var b:auto2;a:auto);
begin
	b.patente:=a.patente;
	b.modelo:=a.modelo;
	b.marca:=a.marca;
end;

procedure agregarAlFinal(var l:lista;b:auto2);
var nue:lista;ant,act:lista;
begin
	new(nue);
	nue^.dato:=b;
	ant:=l;
	act:=l;
	while(act<>nil)and(act^.dato.patente<nue^.dato.patente)do begin
		ant:=act;
		act:=act^.sig;
		end;
	if(act=l)then
		l:=nue
	else begin
		ant^.sig:=nue;
		nue^.sig:=act;
		end;
end;

procedure nuevaEstru(a:arbol;var v:vector);
var b:auto2;
begin
	if(a<>nil)then begin
		procesarDato(b,a^.dato);
		writeln('patente prueba',b.patente);
		agregarAlFinal(v[a^.dato.anio],b);
		nuevaEstru(a^.hi,v);
		nuevaEstru(a^.hd,v);
	end;

end;
procedure encontrarAuto(a:arbol);
	function buscarPatente(a:arbol;patente:string):integer;
	begin
		if(a=nil)then
			buscarPatente:=0
		else begin
			if(a^.dato.patente=patente)then
				buscarPatente:=a^.dato.anio
			else if(patente<a^.dato.patente)then
				buscarPatente:=buscarPatente(a^.hi,patente)
				else
					buscarPatente:=buscarPatente(a^.hd,patente);
			end;
	end;
var
patente:string;anio:integer;
begin
	writeln('ingresar patente de autoa  buscar: ');
	readln(patente);
	anio:=buscarPatente(a,patente);
	if(anio<>0)then
		writeln('Se encontro el auto!, fabricado en el anio: ',anio)
	else
		writeln('No se encontro el auto :c ');
end;
var
a:arbol;v:vector;totalMarca:integer;i:integer;
BEGIN
	generarArbol(a);{a}
	contarMarca(a,totalMarca);{b}
	for i:=2010 to 2018 do
		v[i]:=nil;
	nuevaEstru(a,v);{c}
	encontrarAuto(a);{d}
END.

