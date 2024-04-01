
program ejercicio1;

var
	num, total, cinco, i:integer;

BEGIN
	total:=0;
	cinco:=0;
	for i:=1 to 10 do
		begin
			read(num);
			total:=total+num;
			if(num>5)then
				cinco:=cinco+1;
		end;
	write(total,cinco)
	
END.

