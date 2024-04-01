{3.- Escribir un programa que:
a. Implemente un módulo recursivo que genere una lista de números enteros “random” mayores a 0 y menores a 100. Finalizar con el número 0.
b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista. 
c. Implemente un módulo recursivo que devuelva el máximo valor de la lista. 
d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se encuentra en la lista o falso en caso contrario. 
}


program ejercicio3;
const
max=100;
type lista=^nodo;
		nodo=record
		dato:integer;
		sig:lista;
		end;

procedure agregaratras(var li:lista; r:integer);
var nue:lista;
begin
	new(nue);
	nue^.dato:=r;
	nue^.sig:=li;
	li:=nue;
			
	end;
procedure puntoA(var li:lista);
var  r:integer;
begin 
randomize;
r:=random(100);
if r<>0 then begin
	agregaratras(li,r);
	puntoA(li);
		end;

end;
procedure imprimirlista(li:lista);
begin
	while(li<>nil)do begin
		writeln(li^.dato);
		li:=li^.sig;
		end;
	end;
var
	li:lista;
BEGIN
	li:=nil;
	
	puntoA(li);
	imprimirlista(li);
END.

