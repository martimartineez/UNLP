program ejercicio6;
	procedure pantalones(precio:real;codigo:integer;tipo:string;var codpant:integer;var pantaloncaro:real);
	begin
		if(precio>pantaloncaro)then
		begin
			pantaloncaro:=precio;
			codpant:=codigo;
		end;
	end;
	procedure promedio(precio:real;var precioprom:real;var cantidad:integer);
	begin
		precioprom:=precioprom+precio;
		cantidad:=cantidad+1
		{hacer precioprom/cantidad en el programa}
	end;
var
	precio,codigo: integer; tipo: string;
	barato1, barato2, cantidad,codpant,i : integer;
	precioprom, precio1, precio2,pantaloncaro:real;

BEGIN
	cantidad:=0;
	precio1:=9999;
	barato1:=0;
	barato2:=0;
	precio2:=9999;
	pantaloncaro:=0;
	precioprom:=0;
	for i:=1 to 3 do
	 begin
		readln(precio);
		readln(codigo);
		readln(tipo);
		if (precio<precio1)then
		begin
			precio2:=precio1;
			barato2:=barato1;
			precio1:=precio;
			barato1:=codigo;
		end
		else
			if(precio<precio2)then
			begin
				precio2:=precio;
				barato2:=codigo;
			end;
		if(tipo='pantalon')then
			pantalones(precio,codigo,tipo,codpant,pantaloncaro);
			
		promedio(precio,precioprom,cantidad);
		
	end;
	writeln(barato1, barato2);
		
	writeln(codpant);

	writeln((precioprom/cantidad):1:2);
	
END.

