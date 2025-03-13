{3.- Escribir un programa que:
a. Implemente un módulo recursivo que genere una lista de números enteros “random” mayores a 0 y menores a 100. Finalizar con el número 0.
b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista. 
c. Implemente un módulo recursivo que devuelva el máximo valor de la lista. 
d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se encuentra en la lista o falso en caso contrario. 
}


program ejercicio3;
type
	lista=^nodo;
	nodo=record
		dato:integer;
		sig:lista;
		end;
procedure agregarOrdenado(var lis:lista;a:integer);
var
nuevo:lista;ant,act:lista;
begin
	new(nuevo);
	nuevo^.dato:=a;
	nuevo^.sig:=nil;
	ant:=lis;
	act:=lis;
	while(act<>nil)and(act^.dato<nuevo^.dato)do begin
	ant:=act;
	act:=act^.sig;
	end;
	if(lis=nil)then
		lis:=nuevo
	else
		ant^.sig:=nuevo;
		nuevo^.sig:=act;
end;
procedure ListaRandom(var lis:lista);
var a:integer;
begin
	a:=random(10);
	writeln(a);
	if(a<>0) then begin
		agregarOrdenado(lis,a);
		ListaRandom(lis);
		end;
end;
procedure minimo(lis:lista;var min:integer);
var aux:lista;
begin
	aux:=lis;
	if(aux<>nil)then begin
		if(aux^.dato<=min)then begin
			min:=aux^.dato;
			end;
		minimo(aux^.sig,min);
		end;
end;
procedure maximo(lis:lista;var max:integer);
var aux:lista;
begin
	aux:=lis;
	if(aux<>nil)then begin
		if(aux^.dato>=max)then begin
			max:=aux^.dato;
			end;
		maximo(aux^.sig,max);
		end;
end;
function buscar(lis:lista;bu:integer):boolean;
var aux:lista;
begin 
	aux:=lis;
	if(aux<>nil)then begin
		if(aux^.dato=bu)then
			buscar:=true
		else 
			buscar:=false;
			buscar(aux,bu);
		end;
end;
var
 lis:lista;min,max:integer;estado:boolean;bu:integer;
BEGIN
	Randomize;
	min:=99;
	max:=-1;
	lis:=nil;
	estado:=false;
	ListaRandom(lis);
	minimo(lis,min);
	maximo(lis,max);
	writeln('max es: ',max,' minimo es: ',min);
END.

writeln('numero a buscar entre 1 y 99');
	readln(bu);
	estado:=buscar(lis,bu);
