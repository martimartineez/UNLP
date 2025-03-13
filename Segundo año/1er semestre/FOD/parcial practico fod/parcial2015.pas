program parcial2015;
const
	n=3;
	valorAlto=9999;
type
	prodM=record
		codigo:integer;
		nombre:string[20];
		descripcion:string[50];
		barras:integer;
		categoria:integer;
		stockAct:integer;
		stockMin:integer;
	end;
	prodD=record
		codigo:integer;
		cant:integer;
		descripcion:string[50];
	end;
	
	archDetalle=file of prodD;
	archMaestro=file of prodM;
	
	Vdetalles=array[1..n] of archDetalle;
	Vreg=array[1..n] of prodD;
	

procedure leerD(var detalle:archDetalle;var prod:prodD);
begin
	if not eof(detalle)then
		read(detalle,prod)
	else
		prod.codigo:=valorAlto;
end;


procedure leerM(var maestro:archMaestro;var prod:prodM);
begin
	if not eof(maestro)then
		read(maestro,prod)
	else
		prod.codigo:=valorAlto;
end;

procedure minimo(var detalles:Vdetalles;var min:prodD;var registros:Vreg);
var
	i,pos:integer;
begin
	pos:=0;
	min.codigo:=valorAlto;
	for i:=1 to n do begin
		if(registros[i].codigo<>valorAlto)then begin
			if(registros[i].codigo<min.codigo)then begin
				pos:=i;
				min:=registros[i];
			end;
		end;
	end;
	if(pos <> 0)then begin
		leerD(detalles[pos],registros[pos]);
	end;
end;

procedure analizarStock(var aux:prodM;total:integer);
begin
	if(aux.stockAct < total)then begin
		writeln('el prod',aux.codigo,' le falta stock, en este caso ',(total-(aux.stockAct)),' productos');
		aux.stockAct:=aux.stockAct-aux.stockAct;
	end;
	aux.stockAct:=aux.stockAct-total;
	if(aux.stockAct< aux.stockMin)then
		writeln('el prod',aux.codigo,'quedo por debajo del stock minimo');
 		writeln('la categoría es: ', aux.categoria);
end;

procedure actualizar(var maestro:archMaestro);
var
	min:prodD;
	aux:prodM;
	detalles:Vdetalles;
	registros:Vreg;
	aString:string;
	i,actual,totalPedido:integer;
begin
	reset(maestro);
	for i:=1 to n do begin
		Str(i,aString);
		assign(detalles[i],'detalle'+aString);
		reset(detalles[i]);
		leerD(detalles[i],registros[i])
	end;
	minimo(detalles,min,registros);
	while(min.codigo<>valorAlto)do begin
		actual:=min.codigo;
		totalPedido:=0;
		while(min.codigo = actual) do begin
			totalPedido:=totalPedido+min.cant;
			minimo(detalles,min,registros);
		end;
		read(maestro,aux);
		while(aux.codigo<>actual)do begin
			read(maestro,aux);
		end;
		analizarStock(aux,totalPedido);
		seek(maestro,filePos(maestro)-1);
		write(maestro,aux);
	end;
	for i:=1 to n do begin
		close(detalles[i]);
	end;
	close(maestro);

end;

var
maestro:archMaestro;

begin
	assign(maestro,'maestro');
	actualizar(maestro);

end.
