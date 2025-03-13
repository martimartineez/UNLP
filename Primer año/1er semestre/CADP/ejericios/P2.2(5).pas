program ejercicio5;
  procedure doble(numA, numB: real; var EsPar:boolean);
	
	begin
	if(numA*2=numB)then
		EsPar:=true
	else
		EsPar:=false;
	end;

var 
numA, numB: real;
EsPar:boolean;
totpares, besdoble:integer;


BEGIN
	read(numA);
	Read(numB);
	totpares:=0;
	besdoble:=0;
	while((numA<>0)and(numB<>0))do
	begin
		totpares:=totpares+1;
		doble(numA, numB,EsPar);
		if (EsPar=true)then
			besdoble:=besdoble+1;
		
		read(numA);
		Read(numB);
	end;
	write(totpares, besdoble);
END.
{(1,2) (3,4) (9,3) (7,14) (0,0)}
