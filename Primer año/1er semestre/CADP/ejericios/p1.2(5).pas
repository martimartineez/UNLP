
program ejercicio5;

Var
	num,max,min,total:integer;

BEGIN
	max:=-999;
	min:=999;
	total:=0;
	repeat
		read(num);
		total:=total+num;
		if(num>max)then
			max:=num;
		if(num<min)then
			min:=num;
	until(num=100);
	write(max,' ',min,' ',total);
	
END.

