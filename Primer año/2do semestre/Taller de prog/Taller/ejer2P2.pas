{2.- Realizar un programa que lea números hasta leer el valor 0 e imprima, para cada número leído, sus dígitos en el orden en que aparecen en el número. 
* Debe implementarse un módulo recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 256, se debe imprimir 2  5  6}

program ejercicio2;

procedure recursivo( num:integer);
var
aux:integer;
begin
	if num <>0 then begin
		aux:=num mod 10;
		num:=num div 10;
		recursivo(num);
		write('//');
		write(aux);	
		
		
		end;
end;

procedure leernumeros(var a:integer);
	var
		num:integer;
	begin
		readln(a);
		while(a<>0)do begin
		num:=a;
		recursivo(num);
		readln(a);
		end;
	end;
	


var
	a:integer;
BEGIN
	writeln('ingrese numero: ');
	leernumeros(a);
END.

