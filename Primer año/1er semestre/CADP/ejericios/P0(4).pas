program ejemplo;

Var
	num1:Real;
	radio:Real;
	area:Real;
	perimetro:Real;
BEGIN
 num1:=0;
 radio:=0;
 area:=0;
 perimetro:=0;
 read(num1);
 radio:=num1/2;
 area:=Pi*(radio*radio);
 perimetro:=Pi*radio*2;
 writeln(radio:1:2,' ',area:1:2,' ',perimetro:1:2);
 
END.

