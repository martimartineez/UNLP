{ Un comercio necesita el procesamiento de las compras realizadas por sus clientes durante el mes de julio de 2022. De cada compra se conoce código del 
cliente, día, cantidad de productos y monto pagado.
a) Implementar un módulo que lea compras, genere y retorne una estructura adecuada para la búsqueda por código del cliente, donde para cada código de cliente 
se almacenan juntas todas sus compras (día, cantidad de productos y monto) que realizó. La lectura finaliza con cantidad de productos 0. 
Se sugiere utilizar el módulo leerRegistro ().
b) Implementar un módulo que reciba la estructura generada en a) y un código de cliente y retorne todas las compras de dicho cliente.
c) Realizar un módulo recursivo que reciba la estructura que retorna el inciso b) y retorne el monto de la compra con mayor cantidad de productos. 
NOTA: Implementar el programa principal, que invoque a los incisos a, b y c.
}


program prueba_parcial;

type

compra=record
	dia:string;
	cant:integer;
	monto:real;
end;
lista=^nodo2;
nodo2=record
	datol:compra;
	sig:lista;
end;

infoGuardar=record
	codigo:integer;
	l:lista;
end;
	
arbol=^nodo;
nodo=record
	dato:infoGuardar;
	hi:arbol;
	hd:arbol;
end;

procedure agregarAdelante(var l:lista;b:compra);
var nue:lista;
begin
	new(nue);
	nue^.datol:=b;
	nue^.sig:=l;
	l:=nue;
end;

procedure incisoA(var a:arbol);
	procedure leerRegistro(var b:compra;var cod:integer);
	begin
		writeln('ingrese la cantidad: ');
		readln(b.cant);
		if(b.cant<>0)then begin
			writeln('ingrese el codigo: ');
			readln(cod);
			writeln('ingrese el dia: ');
			readln(b.dia);
			writeln('ingrese el monto: ');
			readln(b.monto);
		end;
	end;
	procedure insertar(var a:arbol;cod:integer;b:compra);
	begin
		if(a=nil)then begin
			new(a);
			a^.dato.l:=nil;
			agregarAdelante(a^.dato.l,b);
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else if(a^.dato.codigo=cod)then
			agregarAdelante(a^.dato.l,b)
			
			else if(cod<a^.dato.codigo)then
				insertar(a^.hi,cod,b)
				else
					insertar(a^.hd,cod,b);
	end;
var
b:compra;cod:integer;
begin
	leerRegistro(b,cod);
	while(b.cant<>0)do begin
		insertar(a,cod,b);
		leerRegistro(b,cod);
	end;
end;

procedure incisoB(a:arbol;var compras:lista);
	function buscarCompras(a:arbol;codigo:integer):lista;
	begin
		if(a=nil)then
			buscarCompras:=nil
		else begin
			if(a^.dato.codigo=codigo)then
			buscarCompras:=a^.dato.l
			else if(codigo<a^.dato.codigo)then
				buscarCompras:=buscarCompras(a^.hi,codigo)
				else
					buscarCompras:=buscarCompras(a^.hd,codigo);
			end;
	end;
var
	codigo:integer;
begin
	writeln('ingrese un codigo a buscar: ');
	readln(codigo);
	compras:=buscarCompras(a,codigo);
end;

function incisoC(l:lista;var max):real;
begin
	if(l=nil)then
	incisoC:=0;
	else begin
		if()
	
	end;

end;
var
a:arbol;compras:lista;max:integer;montoMayor:real;
BEGIN
	compras:=nil;
	max:=0;
	incisoA(a);
	incisoB(a,compras);
	montoMayor:=incisoC(compras);
	writeln(montoMayor);
END.

