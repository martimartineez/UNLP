program Ejer1;

type 

	archivo = file of integer;

var 
	arc_num: archivo;
	num: integer;
	nombr: string[50];

begin
	write ('|INGRESE NOMBRE DEL ARCHIVO: ');
	readln (nombr);
	Assign(arc_num, nombr);
	rewrite (arc_num);
	write ('|INGRESE NUMERO ENTERO: '); 
	readln (num);
	while (num <> 30000) do begin
		write (arc_num,num);
		write ('|INGRESE NUMERO ENTERO: '); 
		readln (num);	
	end;
	close (arc_num);
end.
