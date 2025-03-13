{4.- Escribir un programa que:
a. Implemente un módulo recursivo que genere un vector de 20 números enteros “random” mayores a 0 y menores a 100. 
b. Implemente un módulo recursivo que devuelva el máximo valor del vector. 
c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos en el vector.}

program ejercicio4;
const 
df=20;
type
vect20= array[1..df] of integer;

procedure generarVec(var ve:vect20;i:integer);
begin
	if(i<=df)then begin
		ve[i]:=random(100);
		writeln(ve[i]);
		generarVec(ve,i+1);
	end;
end;
procedure maximo(ve:vect20; i:integer;var max:integer);
begin
	if(i<=df)then begin
		if(ve[i]>=max)then 
			max:=ve[i];
		maximo(ve,i+1,max);
	
	end;
end;
	

function sumar(ve:vect20;i:integer):integer;
begin
	if(i=df)then
		sumar:=ve[i]
	else
		sumar:=sumar(ve,i+1)+ve[i];

end;
procedure imprimir(ve:vect20);
var
i:integer;
begin
	for i:=1 to df do
		writeln(ve[i]);
end;

var 
vect:vect20;i,max,suma:integer;
BEGIN
	Randomize();
	i:=1;
	generarVec(vect,i);
	max:=-1;
	i:=1;
	maximo(vect,i,max);
	write('maximo: ', max);
	i:=1;
	suma:=sumar(vect,i);
	write(' suma:',suma);

END.

