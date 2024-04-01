
program finalFebrebro;

type
	alumno=record
		nombre:string;
		legajo:integer;
		cantidad:integer;
	end;
	
	arbol=^nodoA;
	nodoA=record
		dato:alumno;
		HI:arbol;
		HD:arbol;
	end;
	
	lista=^nodo;
	nodo=record
		dato:alumno;
		sig:lista;
	end;
	
procedure armarArbol(var a:arbol;e:alumno);
begin
	if(a=nil)then begin
		new(a);
		a^.dato:=e;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else
		if(e.legajo<a^.dato.legajo)then begin
			armarArbol(a^.HI,e);
		end
		else
			armarArbol(a^.HD,e);
end;


procedure leerDatos(var a:arbol);
var
	e:alumno;
begin
	writeln('ingrese legajo o 0: ');
	readln(e.legajo);
	while(e.legajo <> 0)do begin
		writeln('ingrese nombre: ');
		readln(e.nombre);
		e.cantidad:=0;
		armarArbol(a,e);
		writeln('ingrese legajo o 0: ');
		readln(e.legajo);
	end;
end;

procedure aumentar(a:arbol;num:integer);
begin
	if(a<> nil)then begin
		if(a^.dato.legajo=num)then begin
			a^.dato.cantidad:=a^.dato.cantidad+1;
			aumentar(a^.HI,num);
			aumentar(a^.HD,num);
		end
		else
			if(a^.dato.legajo>num)then begin
				aumentar(a^.HI,num);
			end
			else
				aumentar(a^.HD,num);
	end;
end;

procedure agregarOrdenado(var l:lista;e:alumno);
var
	nue,ant,act:lista;
begin
	new(nue);
	nue^.dato:=e;
	act:=l;
	ant:=l;
	while(act<>nil)and(act^.dato.nombre < e.nombre)do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(ant=act)then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure generarLista(a:arbol;var l:lista);
begin
	if(a<>nil)then begin
		generarLista(a^.HI,l);
		if(a^.dato.cantidad>=3)then
			agregarOrdenado(l,a^.dato);
		generarLista(a^.HD,l);
	end;
end;

Procedure enOrden ( a : arbol );
begin //Input 1,22,3,44,5,6,7,2,0
    if ( a<> nil ) then begin
        enOrden (a^.HI);
        write (a^.dato.legajo,'|');
        enOrden (a^.HD);
    end;
end;

Procedure imprimir (L:lista);
Begin
    if (L <> nil) then
    begin
        write (L^.dato.nombre);
        L:= L^.sig;
        imprimir (L);
    end;
End;

var
	a:arbol;
	l:lista;
BEGIN
	a:=nil;
	l:=nil;
	leerDatos(a);
	aumentar(a,2);
	aumentar(a,2);
	aumentar(a,2);
	generarLista(a,l);
	enOrden(a);
	imprimir(l);
END.

