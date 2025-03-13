{4.- Escribir un programa que:
a. Implemente un módulo recursivo que genere un vector de 20 números enteros “random” mayores a 0 y menores a 100. 
b. Implemente un módulo recursivo que devuelva el máximo valor del vector. 
c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos en el vector.
}


program ejercicio4;
const
	df=20;
type
	vector=array[1..df]of integer;

procedure inivector(var v:vector);
var i:integer;
begin
	for i:=0 to df do begin
		v[i]:=0;
		end;
	end;

procedure cargarvector(var v:vector;var dl:integer;var i:integer);
var r:integer;
begin
	//Randomize;
	readln(r);
	if ((r<>0) and (i<=df)) then begin
		v[i]:=r;
		dl:=dl+1;
		i:=i+1;
		cargarvector(v,dl,i);
		end;
	end;
procedure imprimirvec(v:vector;dl:integer);
var	i:integer;

begin
	for i:=1 to dl do begin
	writeln(v[i]);
	end;
end;
	
var
	v:vector;i,dl:integer;

BEGIN
	dl:=0;
	i:=1;
	inivector(v);
	cargarvector(v,dl,i);
	imprimirvec(v,dl);
END.

