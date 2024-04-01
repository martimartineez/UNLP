
program ejercicio6;

Var
	precio,barato1,barato2:Real;
	codigo,codb1,codb2,par,i:integer;
	
BEGIN
	barato1:=9999;
	barato2:=9999;
	par:=0;
	for i:=1 to 4 do
		begin
			read(codigo);
			read(precio);
			if(precio<barato1)then
				begin
					barato2:=barato1;
					barato1:=precio;
					codb2:=codb1;
					codb1:=codigo;
				end
			else
				if(precio<barato2)then
					begin
						barato2:=precio;
						codb2:=codigo;
					end;
				if((precio>16)and(codigo MOD 2=0))then
					par:=par+1;
		end;
	write(codb1,'  ',codb2,'  ',par);
	
END.

