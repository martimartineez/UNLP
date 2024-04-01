program clase4 ;
type
	prestamo = record
		isbn :integer;
		num:integer;
		dia:integer;
		mes: integer;
		cantdias:integer;
		end;
	lista = ^nodo;
	nodo = record
		elem:prestamo;
		sig : lista;
		end;
		vector = array [1..12] of lista;
procedure inicializarVector(var v : vector);
	var i : integeR;
	begin
		for i := 1 to 12 do		
				v[i] := nil;
	end;
procedure leerPrestamo(var pres : prestamo);
	begin
		writeln('Ingrese el isbn: ');
		readln(pres.isbn);
		if pres.isbn <> -1 then begin
			writeln('Ingrese Numero');
			readln(pres.num);
			writeln('Ingrese el dia: ');
			readln(pres.dia);
			writeln('Ingrese el mes: ');
			readln(pres.mes);
			writeln('Ingrese la cantidad de dias: ');
			readln(pres.cantdias);
		end;
	end;
procedure InsertarOrdenado (var l :lista;pres : prestamo);
	var act,ant,nue :lista;
	begin
			new(nue);
			nue^.elem := pres;
			act := L;
			ant:= l;
			while (act <> nil) and (pres.isbn < act^.elem.isbn) do begin
				ant := act;
				act := act^.sig;
				end;
			if (act = ant) then
				L := nue
			else begin
				ant^.sig := nue;
				nue^.sig := act;
			end;
	end;
procedure minimo (v : vector;var pres:prestamo);
	var i
	begin
		for 
	
	
	end;
procedure UltraMerge (v:vector;var l :lista);
	var pres : prestamo; i :integer
	begin
		pres.isbn := 999;
		minimo(v,pres);
		
	
	
	
	end;
procedure ImprimirLista(l :lista);
	begin
		if l <> nil then begin
			writeln('El isbn es: ', l^.elem.isbn);
			writeln('El numero de socio es: ', l^.elem.num);
			ImprimirLista(l^.sig);
		end;
	end;	
procedure ArmarVector(var v : vector);
	var pres :prestamo;
	begin
		leerPrestamo(pres);
		while pres.isbn <> -1 do begin
			InsertarOrdenado(v[pres.mes],pres);
			leerPrestamo(pres);
		end;
	end;
procedure RecorrerVector(v :vector);
	var i :integer;
	begin
		  for i:=1 to 12 do begin
					ImprimirLista(v[i]);
		end;
	end;
var
	v:vector;NuevaLista : lista;
begin
	NuevaLista := nil;
	inicializarVector(v);
	ArmarVector(v);
	RecorrerVector(v);
end.
