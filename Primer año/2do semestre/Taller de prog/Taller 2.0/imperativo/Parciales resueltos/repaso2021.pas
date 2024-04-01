{
   repaso2021.pas
   
   Copyright 2024 marti <marti@MARTIN-PC>
   
   La Organización Mundial de la Salud (OMS) necesita un sistema para obtener estadísticas
de las dosis de vacunas aplicadas contra el COVID‑19 en cada país. Cada país notifica
diariamente a la OMS la cantidad de dosis aplicadas por tipo de vacuna. De cada
notificación se conoce: fecha, nombre del país, tipo de vacuna (1:Sinopharm, 2:CanSino,
3:AstraZeneca, 4:Sputnik) y cantidad de dosis aplicadas.
Se dispone una estructura que almacena las notificaciones agrupadas por tipo de vacuna.
Para cada tipo, las notificaciones realizadas se encuentran ordenadas por nombre de país.
Implemente un programa que:
* 
* 
a) Reciba la estructura que almacena las notificaciones y, usando la técnica de merge
acumulador, genere un ABB (ordenado por cantidad de dosis) que contenga para
cada país, la cantidad total de dosis aplicadas.
* 
* 
b) Implementar un módulo recursivo que reciba la estructura generada en a) y retorne
el nombre del país que aplicó la mayor cantidad de dosis.
* 
* 
NOTA: Cada país puede aplicar más de un tipo de vacuna por día.
No es necesario implementar la carga de la estructura que se dispone. Alcanza con declarar
el encabezado del procedimiento e invocarlo para que el programa compile
satisfactoriamente.
   
   
}


program repaso2021;
const
	df=4;
type
	rango=1..4;
	notificacion=record
		fecha:string;
		pais:string;
		vacuna:rango;
		dosis:integer;
	end;
	
	lista=^nodo;
	nodo=record
		dato:notificacion;
		sig:lista;
	end;
	
	info=record
		pais:string;
		dosis:integer;
	end;
	
	arbol=^nodoA;
	nodoA=record
		dato:info;
		HI:arbol;
		HD:arbol;
	end;
	
	vector=array[rango] of lista;
	

procedure iniciarVector(var vec:vector);
var
	i:integer;
begin
	for i:=1 to df do begin
		vec[i]:=nil;
		end;
end;

procedure agregarOrdenado(var l:lista; dato:notificacion);
var
	nue,ant,act:lista;
begin
	new(nue);
	nue^.dato:=dato;
	ant:=l;
	act:=l;
	while((act<>nil)and(act^.dato.pais < dato.pais))do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(act=ant)then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure cargarDatos(var vec:vector);
var
	dato:notificacion;
begin
	writeln('ingrese cant dosis o -1 para terminar: ');
	readln(dato.dosis);
	while(dato.dosis <> -1)do begin
		writeln('ingrese fecha: ');
		readln(dato.fecha);
		writeln('ingrese pais: ');
		readln(dato.pais);
		writeln('ingrese tipo vacuna 1 a 4: ');
		readln(dato.vacuna);
		agregarOrdenado(vec[dato.vacuna],dato);
		writeln('ingrese cant dosis o -1 para terminar: ');
		readln(dato.dosis);
	end;
end;

procedure cargarArbol(var a:arbol; dato:info);
begin
	if(a=nil)then begin
		new(a);
		a^.dato:=dato;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else
		if(dato.dosis<a^.dato.dosis)then
			cargarArbol(a^.HI,dato)
		else
			cargarArbol(a^.HD,dato);
end;

procedure minimo(var vec:vector;var min:info);
var
	pos,i:integer;
begin
	min.pais:='ZZZZ';
	pos:=-1;
	for i:=1 to df do begin
		if(vec[i]<>nil)and(vec[i]^.dato.pais<min.pais)then begin
			min.pais:=vec[i]^.dato.pais;
			min.dosis:=vec[i]^.dato.dosis;
			pos:=i;
		end;
	end;
	if(pos<>-1)then begin
		vec[pos]:=vec[pos]^.sig;
	end;
end;


procedure mergeAcumulador(vec:vector;var a:arbol);
var
	min,act:info;
begin
	minimo(vec,min);
	while(min.pais <> 'ZZZZ')do begin
		act.dosis:=0;
		act.pais:=min.pais;
		while((min.pais<> 'ZZZZ')and(act.pais = min.pais))do begin
			act.dosis:=act.dosis+min.dosis;
			minimo(vec, min);
		end;
		cargarArbol(a,act);
	end;

end;

function mayor(a:arbol):string;
begin
	if(a=nil)then
		mayor:='error'
	else
		if(a^.HD = nil)then
			mayor:=a^.dato.pais
		else
			mayor(a^.HD);
end;

BEGIN
	
	
END.

