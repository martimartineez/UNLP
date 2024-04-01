

program parcial2018;

type
infoLeer=record
	nombre:string;
	fecha:string;
	monto:real;
end;
infoL=record
	fecha:string;
	monto:real;
end;
lista=^nodo2;
nodo2=record
	datos:infoL;
	sig:lista;
end;

infoGuardar=record
	dni:integer;
	nombre:string;
	info:lista;
end;

arbol=^nodo;
nodo=record
	dato:infoGuardar;
	hi:arbol;
	hd:arbol;
end;
procedure insertarAdelante(var l:lista;fecha:string;monto:real);
var nue:lista;
begin
	new(nue);
	nue^.datos.fecha:=fecha;
	nue^.datos.monto:=monto;
	nue^.sig:=l;
	l:=nue;
	
end;
procedure leer(var b:infoLeer;var num:integer);
begin
	writeln('ingrese monto: ');
	readln(b.monto);
	if(b.monto<>0)then begin
		writeln('ingrese dni: ');
		readln(num);
		writeln('ingrese nombre: ');
		readln(b.nombre);
		writeln('ingrese fecha: ');
		readln(b.fecha);
	end;
end;

procedure insertar(var a:arbol;b:infoLeer;num:integer);
begin
	if(a=nil)then begin
		new(a);
		a^.dato.dni:=num;
		a^.dato.nombre:=b.nombre;
		a^.dato.info:=nil;
		insertarAdelante(a^.dato.info,b.fecha,b.monto);
		a^.hi:=nil;
		a^.hd:=nil;
	end
	else begin
		if(a^.dato.dni=num)then
			insertarAdelante(a^.dato.info,b.fecha,b.monto)
		else if(num<a^.dato.dni)then
			insertar(a^.hi,b,num)
			else
				insertar(a^.hd,b,num);
		
	end;
end;

procedure inciso1(var a:arbol);
var
 b:infoLeer;num:integer;
begin
	leer(b,num);
	while(b.monto<>0)do begin
		insertar(a,b,num);
		leer(b,num);
	end;
end;
procedure inciso2(a:arbol);
	function calcular(a:arbol;var u:lista;fecha:string):integer;
	begin
		if(a=nil)then
			calcular:=0
		else begin
			if(a^.dato.info<>nil)then begin
				u:=a^.dato.info;
				while(u<>nil)do begin
					if(u^.datos.fecha=fecha)then
						calcular:=1+calcular(a^.hi,u,fecha)+calcular(a^.hd,u,fecha);
						u:=u^.sig;
					end;
				end
			else calcular:=calcular(a^.hi,u,fecha)+calcular(a^.hd,u,fecha);
		end;
	end;
var
fecha:string;cant:integer;u:lista;
begin
	writeln('ingrese la fecha a buscar: ');
	readln(fecha);
	cant:=calcular(a,u,fecha);
	writeln('En esa fecha compraron ',cant,' clientees. ');
end;

procedure inciso3(a:arbol);
	procedure buscarOrdenado(a:arbol;dni:integer;var monto:real;var pedidos:integer);
	begin
		if(a<>nil)then begin
			if(a^.dato.dni=dni)then begin
				writeln('entro!');
				while(a^.dato.info<>nil)do begin
					pedidos:=pedidos+1;
					monto:=monto+a^.dato.info^.datos.monto;
					a^.dato.info:=a^.dato.info^.sig;
					writeln('aveeer:',monto)
					end;
				end
			else if(dni<a^.dato.dni)then
				buscarOrdenado(a^.hi,dni,monto,pedidos)
				else
					buscarOrdenado(a^.hd,dni,monto,pedidos);
		end;
	end;
var
dni:integer;totalMonto:real;totalPedidos:integer;
begin
	totalMonto:=0;
	totalPedidos:=0;
	writeln('ingrese el dni a buscar: ');
	readln(dni);
	BuscarOrdenado(a,dni,totalMonto,totalPedidos);
	if(totalPedidos<>0)then
		writeln('total abonado: ',totalMonto:2:2,' total de pedidos: ',totalPedidos)
	else
		writeln('no hay datos uwu');
end;


var
a:arbol;

BEGIN
	inciso1(a);
	inciso2(a);
	inciso3(a);
END.

