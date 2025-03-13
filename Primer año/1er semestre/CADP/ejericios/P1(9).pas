
program ejercicio9;

Var
	operacion: char;
	numero, total: Real;

BEGIN
	total:=0;
	read(operacion);
	if(operacion='+')then
	begin
		read(numero);
		while(numero<>0)Do
		begin
			total:=total+numero;
			read(numero);
		end;
		write(total:1:2);
	end
	else 
	if(operacion='-')then
		begin
			read(numero);
			while(numero<>0)Do
			begin
				total:=total-numero;
				read(numero);
			end;
			write(total:1:2);
		end
	else
		write('ingrese + o - ');
	
	
	
END.

