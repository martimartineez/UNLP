
program ejercicio4;

Var
	num,min1,min2,i:integer;

BEGIN
	min1:=999;
	min2:=999;
	for i:=1 to 5 do
		begin
	{repeat}
			read(num);
			if(num<min1)then
			begin
				min2:=min1;
				min1:=num;
			end
			else if(num<min2)then
				min2:=num;
			
		end;
	{until(num=0);}
	write(min1,'  ',min2);
	
END.

