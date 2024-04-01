


program gitHub1;
const
	dfPlanes=5;
	dfAfi=500;
type 
	rango=1..5;
	afilPerPlan=1..500;
	
	
	afiliado=record
		afiliado:integer;
		dni:integer;
		plan:rango;
		anio:integer;
		end;
	
	arbol=^nodoA;
	nodoA=record
		dato:afiliado;
		HI:arbol;
		HD:arbol;
		end;
	afi=record
		afiliado:integer;
		dni:integer;
		end;
		
vecAfi=array[afilPerPlan]of afi;


vecPlanes=array[rango]of vecAfi;

procedure crearArbol(a:arbol);
begin
	
end;

procedure leerDatos(var num1:integer;var num2:integer; var plan:integer);
begin
	writeln('ingrese el primer numero: ');
	readln(num1);
	writeln('ingrese el segundo numero: ');
	readln(num2);
	writeln('ingrese el numero de plan: ');
	readln(plan);
	

end;

var
	a:arbol;
	vec:vecPlanes;
	num1, num2:integer;
	plan:integer;
	dl:integer;

BEGIN
	a:=nil;
	dl:=0;
	crearArbol(a);//se dispone
	leerDatos(num1,num2,plan);
	
	
	
END.

