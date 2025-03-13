{
  
   
}


program parcialidk;
const
	df=50;	
type
	rango=1..20;
	empleado=record
		legajo:integer;
		dni:integer;
		categoria:rango;
		anio:integer;
	end;
	arbol=^nodoA;
	nodoA=record
		dato:empleado;
		HI:arbol;
		HD:arbol;
	end;
	nueDato=record
		dni:integer;
		legajo:integer;
		categoria: rango;
	end;
	
	vector=Array[1..50]of nueDato;



procedure crearArbol(var a:arbol;dato:empleado);	
begin
	if(a=nil)then begin
		new(a);
		a^.dato:=dato;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else
		if(dato.dni< a^.dato.dni)then
			crearArbol(a^.HI,dato)
			else
				crearArbol(a^.HD,dato);
	
end;
procedure leerDatos(var a:arbol);
var 
	dato:empleado;
begin
	writeln('ingrese dni: ');
	readln(dato.dni);
	while(dato.dni <> -1)do begin
		writeln('ingrese legajo: ');
		readln(dato.legajo);
		writeln('ingrese categoria(1 a 20): ');
		readln(dato.categoria);
		writeln('ingrese anio: ');
		readln(dato.anio);
		crearArbol(a,dato);
		writeln('ingrese dni: ');
		readln(dato.dni);
	end;
end;	
procedure agregarVector(var v:vector;var dl:integer;dato:empleado);
var
	datoNuevo:nueDato;
begin
	datoNuevo.dni:=dato.dni;
	datoNuevo.legajo:=dato.legajo;
	datoNuevo.categoria:=dato.categoria;
	v[dl]:=datoNuevo;
	dl:=dl+1;
end;

procedure generarVector(var v:vector;a:arbol;dnia:integer;B:integer;categoria:integer;var dl:integer);
begin
	if(a<>nil)then
		if(a^.dato.dni> B)then 
			generarVector(v,a^.HI,dnia,B,categoria,dl)
		else
			if((a^.dato.dni >= dnia))then begin
				generarVector(v,a^.HI,dnia,B,categoria,dl);
				if((a^.dato.categoria=categoria))then
					agregarVector(v,dl,a^.dato);
				generarVector(v,a^.HD,dnia,B,categoria,dl);
				end
			else
				generarVector(v,a^.HD,dnia,B,categoria,dl)
		
end;

function maximo(v:vector;dl:integer;i:integer;max:integer):integer;
begin
	if(i<dl)then begin
		if(V[i].legajo>max)then
			max:=v[i].legajo;
		i:=i+1;
		maximo:=maximo(v,dl,i,max);
	end
	else
		maximo:=max;
end;
procedure imprimir(v:vector;dl:integer);
var
	i:integer;
begin
	for i:=1 to dl do begin
		writeln(v[i].dni);
	end;
end;
var
	dl:integer;
	i:integer;
	max:integer;
	v:vector;
	a:arbol;
BEGIN
	a:=nil;
	i:=1;
	leerDatos(a);
	dl:=0;
	max:=-999;
	generarVector(v,a,5,10,3,dl);
	writeln(maximo(v,dl,i,max));
	imprimir(v,dl)
END.

