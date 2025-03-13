{1-
a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol binario de búsqueda. 
* De cada socio se lee número de socio, nombre y edad. La lectura finaliza con el número de socio 0 y el árbol debe quedar ordenado 
* por número de socio.
b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como parámetro y que : 
i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que retorne dicho valor.
ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo recursivo que retorne dicho socio.
iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que retorne dicho valor.
iv. Aumente en 1 la edad de todos los socios.
v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a un módulo recursivo que reciba el valor leído 
* y retorne verdadero o falso.
vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a un módulo recursivo que reciba el nombre leído 
* y retorne verdadero o falso.
vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha cantidad.
viii. Informe el promedio de edad de los socios. Debe invocar a un módulo recursivo que retorne dicho promedio.
ix. Informe, a partir de dos valores que se leen, la cantidad de socios en el árbol cuyo número de socio se encuentra entre los dos valores 
* ingresados. Debe invocar a un módulo recursivo que reciba los dos valores leídos y retorne dicha cantidad.
x. Informe los números de socio en orden creciente. 
xi. Informe los números de socio pares en orden decreciente. }


program ejercicio1;
type
	socio=record
		numero:integer;
		nombre:string;
		edad:integer;
	end;
	arbol=^nodo;
	nodo=record
		dato:socio;
		hi:arbol;
		hd:arbol;
	end;
procedure crear(var data:arbol;a:socio);

begin
	if(data=nil)then
	begin
		new(data);
		data^.dato:=a; data^.hi:=nil;data^.hd:=nil;
	end
	else
		if(a.numero<data^.dato.numero)then
			crear(data^.hi,a)
		else
			crear(data^.hd,a);

end;

procedure leer(var data:arbol;var a:socio);
begin
	writeln('ingrese numero de socio: ');
	readln(a.numero);
	while(a.numero<>0)do begin
		writeln('ingrese nombre de socio: ');
		readln(a.nombre);
		writeln('ingrese edad: ');
		readln(a.edad);
		crear(data,a);
		writeln('ingrese numero de socio: ');
		readln(a.numero);
		end;
end;
Procedure x ( a : arbol );
begin
   if ( a<> nil ) then begin
    x (a^.hi);
	writeln ('Numero de socio:',a^.dato.numero);
    x (a^.hd);
   end;
end;
var
	data:arbol;a:socio;
BEGIN
	data:=nil;
	leer(data,a);{A}
	x(data);
	
END.
super(data);{B}
	
