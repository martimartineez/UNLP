{1.- Implementar un programa que invoque a los siguientes módulos.
a. Implementar un módulo recursivo que permita leer una secuencia de 
caracteres terminada en punto y los almacene en un vector con dimensión 
física igual a 10.
b. Implementar un módulo que imprima el contenido del vector.
c. Implementar un módulo recursivo que imprima el contenido del vector.
d. Implementar un módulo recursivo que permita leer una secuencia de 
caracteres terminada en punto y retorne la cantidad de caracteres leídos. 
El programa debe informar el valor retornado.
e. Implementar un módulo recursivo que permita leer una secuencia de 
caracteres terminada en punto y retorne una lista con los caracteres leídos.
f. Implemente un módulo recursivo que reciba la lista generada en d. e 
imprima los valores de la lista en el mismo orden que están almacenados.
g. Implemente un módulo recursivo que reciba la lista generada en d. e 
imprima los valores de la lista en orden inverso al que están almacenados.}
program ejercicio1;
const
	df=10;
type
	vect10=array[1..df] of char;
	lista=^nodo;
	nodo=record
		dato:char;
		sig:lista;
	end;
procedure cargarVector(var ve:vect10;var dl:integer);

	procedure cargarRe(var ve:vect10;var dl:integer);
	var a:char;
	begin
		writeln('ingrese cadena terminada en  . :');
		readln(a);
		if(a<>'.') and (dl<df)then begin
			dl:=dl+1;
			ve[dl]:=a;
			cargarRe(ve,dl);
		end;
	end;
begin
dl:=0;
cargarRe(ve,dl)

end;
procedure imprimirVec(ve:vect10;dl:integer);
var
	i:integer;
begin
	for i:=1 to dl do
	begin
		writeln('char: ',ve[i]);
		writeln();
	end;
end;
procedure imprimirVecRe(ve:vect10;dl:integer);
	procedure recorrerRe(ve:vect10;i:integer;dl:integer);
	begin
		if(i<=dl)then begin
		writeln('char re: ',ve[i]);
		recorrerRe(ve,i+1,dl);
		end;
	end;
begin
	recorrerRe(ve,1,dl);
	writeln();
end;

function leerContar():integer;
var a:char;
begin
	readln(a);
	if(a<>'.')then
		leerContar:=leerContar()+1
	else
		leerContar:=0;
end;
procedure crearLista(var lis:lista;var ult:lista);
	procedure agregarAtras(var l:lista;var ult:lista;elem:char);
	var nuevo:lista;
	begin
		new(nuevo);
		nuevo^.dato:=elem;
		nuevo^.sig:=nil;
		if l<> nil then begin
			ult^.sig:=nuevo;
			end
		else
			l:=nuevo;
			ult:=nuevo;
	
	end;
var carac:char;
begin
	readln(carac);
	if(carac<>'.')then begin
		agregarAtras(lis,ult,carac);
		crearLista(lis,ult);
		end;
end;

procedure ImprimirListaMismoOrden (l: lista);
begin
  if (l<> nil)then begin
        writeln (l^.dato, ' | ');
        ImprimirListaMismoOrden (l^.sig);
        end;
end;

procedure ImprimirListaOrdenInverso (l:lista);
begin
	if(l<>nil)then begin
		ImprimirListaOrdenInverso(l^.sig);
		writeln(l^.dato,' | ')
	end;
end;
var
	ve:vect10;dl:integer;cant:integer;lis,ult:lista;

BEGIN
	cargarVector(ve,dl);{a}
	imprimirVec(ve,dl);{b}
	imprimirVecRe(ve,dl);{c}
	cant:=leerContar();
	writeln('cantidad leida: ',cant);{d}
	lis:=nil;
	crearLista(lis,ult);{e}
	ult:=lis;
	ImprimirListaMismoOrden(lis);{f}
	ImprimirListaOrdenInverso (ult);{g}
	
END.


