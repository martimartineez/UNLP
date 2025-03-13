
  {2.- Realizar un programa que lea números hasta leer el valor 0 e imprima, para cada número leído, sus dígitos en el orden en que aparecen en el número. 
* Debe implementarse un módulo recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 256, se debe imprimir 2  5  6}
   



program ejer2;
procedure mostrarDigitos(num:integer);
var aux:integer;
begin
	if(num<>0) then begin
	aux:=num mod 10;
	num:= num div 10;
	mostrarDigitos(num);
	writeln(aux);
	end;
end;
var
	num:integer;

BEGIN
	readln(num);
	mostrarDigitos(num);
END.

