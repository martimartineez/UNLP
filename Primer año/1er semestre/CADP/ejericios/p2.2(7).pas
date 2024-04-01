program ejercicio7;
	{procedure digcantidad(num:integer);
	var
	suma,cantidad:integer;
	begin
		cantidad:=0;
		suma:=0;
		while(num<>0) do
		begin
			suma:=suma+num MOD 10;
			cantidad:=cantidad+1;
			num:=num DIV 10;
		end;
		writeln(cantidad,'|   |' ,suma);
	end;}
	procedure digcantidad(num:integer; var cantidad:integer; var suma: integer);
	begin
		suma:=0;
		while(num<>0) do
		begin
			suma:=suma+num MOD 10;
			cantidad:=cantidad+1;
			num:=num DIV 10;
		end;
		
	end;
var
		num:integer;
		cantidad, suma:integer;
		
BEGIN
	suma:=0;
	cantidad:=0;
	repeat
	readln(num);
	digcantidad(num,cantidad,suma);
	until(suma=10);
	write(cantidad);
END.

