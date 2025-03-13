program ejercicio3;

Var
	num1, num2, num3, mayor, medio, minimo: integer;
BEGIN
	read(num1);
	read(num2);
	read(num3);
	if((num1<num2) and (num1<num3))then
		minimo:=num1;
	if((num2<num1) and (num2<num3))then
		minimo:=num2;
	if((num3<num1) and (num3<num2))then
		minimo:=num3;
	if((num1>num2) and (num1>num3))then
		mayor:=num1;
	if((num2>num1) and (num2>num3))then
		mayor:=num2;
	if((num3>num1) and (num3>num2))then
		mayor:=num3;
	if((num1>minimo) and (num1<mayor))then
		medio:=num1;
	if((num2>minimo) and (num2<mayor))then
		medio:=num2;
	if((num3>minimo) and (num3<mayor))then
		medio:=num3;
	write(mayor,' ',medio,' ',minimo);
END.

