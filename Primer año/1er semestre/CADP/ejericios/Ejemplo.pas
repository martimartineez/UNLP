program ejemplo;

Var
	num1:integer;
	num2:integer;
	mayor:integer;	
BEGIN
	read(num1);
	read(num2);
	if(num1>num2)then
	 begin
		mayor:=num1;
		write('el numero mayor es ',mayor);
	 end;
	if(num2>num1)then
	 begin
		mayor:=num2;
		write('el numero mayor es ',mayor);
	 end;
	if(num1=num2)then
		write('los numeros son iguales');
 
END.

