{
 
2.- Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la información de los autos en venta.
Implementar un programa que:
a)	Genere un árbol binario de búsqueda ordenado por patente identificatoria del auto en venta. Cada nodo del árbol debe contener patente, año de fabricación (2010..2018), la marca y el modelo.
b)	Invoque a un módulo que reciba el árbol generado en a) y una marca y retorne la cantidad de autos de dicha marca que posee la agencia. Mostrar el resultado. 
c)	Invoque a un módulo que reciba el árbol generado en a) y retorne una estructura con la información de los autos agrupados por año de fabricación.
d)	Contenga un módulo que reciba el árbol generado en a) y una patente y devuelva el año de fabricación del auto con dicha patente. Mostrar el resultado. 

   
   
}


program bruh;
type
	auto  = record
		patente : integer;
		anio : integer;
		marca : string;
		modelo : string;
		end;
	arbol = ^nodo;
	nodo = record
		elem : auto;
		HI : arbol;
		HD : arbol;
		end;
lista=^nodito;
	nodito=record
	dato:auto;
	sig:lista;
	end;
		
procedure leer(var c:auto);
begin
	writeln('ingrese la patente: ');
	readln(c.patente);
	if(c.patente<>-1)then begin
		writeln('anio');
		readln(c.anio);
		writeln('marca');
		readln(c.marca);
		writeln('modelo');
		read(c.modelo);
		end;
	end;
	
procedure insertar(var a:arbol;c:auto);
begin
	if a=nil then begin
		new(a);
		a^.elem := c;
		a^.HI := nil;
		a^.HD := nil;
		end
	else begin
		 if (c.patente < a^.elem.patente)then Insertar(a^.HI,c)
		 else
				Insertar(a^.HD,c);
		end;
	end;

procedure GenerarArbol(var a : arbol);
	var c:auto;
	begin
		leer(c);
		while (c.patente <> -1) do begin
		insertar(a,c);
		leer(c);
		end;
	end;

Procedure enOrden ( a : arbol );
begin
   if ( a<> nil ) then begin
    enOrden (a^.HI);
    write (a^.elem.patente);
    enOrden (a^.HD);
   end;
end;	


{procedure insertarlista(var b:lista;c:auto);
	var ant,actual,p:lista;
	begin
	new(p);
	p^.dato:=c;
	p^.sig:=nil;
	if(b=nil)then
	b:=p
	else begin
		actual:=b;ant:=b;
		while((actual<>nil)and(actual^.dato.anio<p^.dato.anio))do begin
			ant:=actual;
			actual:=actual^.sig;
			end;
		end;
	if actual=b then begin
		p^.sig:=b;
		b:=p;
		end
	else if(actual<>nil)then begin
		ant^.sig:=p;
		p^.sig:=actual;
		end
	else begin
		ant^.sig:=p;
		p^.sig:=nil;
		end;
	end;}
	
procedure insertarlista(var b:lista;c:auto);
var 
	p:lista;
begin
	new(p);		
	p^.dato:=c;
	p^.sig:=nil;
	if b=nil then
		b:=p
	else begin
		p^.sig:=b;
		b:=p;
	end;
end;

procedure canti(a:arbol;b:string;var c:integer);
begin
	if a<>nil then begin
		if(a^.elem.marca=b)then begin
		c:=c+1;
		canti(a^.HI,b,c);
		canti(a^.HD,b,c);
		end
	else if(b<>a^.elem.marca)then begin
		canti(a^.HI,b,c);
		canti(a^.HD,b,c);
		end;
	end;
end;

procedure poranio(a:arbol;var b:lista);
var
	c:auto;
begin
	while (a<>nil)do begin
	c:=a^.elem;
	insertarlista(b,c);
	poranio(a^.HI,b);
	poranio(a^.HD,b);
	end;
end;

procedure printl(b:lista);
	begin
		while(b<>nil)do begin
			writeln(b^.dato.anio);
			end;
		end;
			
procedure patente(a:arbol;pat:integer);
var encontre:boolean;anio:integer;
begin
	encontre:=false;
	if a<>nil then begin
		if(a^.elem.patente=pat)then begin
			encontre:=true;
			anio:=a^.elem.anio;
			end
		else if(a^.elem.patente<pat)then
			patente(a^.HI,pat)
		else patente(a^.HD,pat);
	end;
	if (encontre=true)then
		writeln('el año es: ',anio)
	else
		writeln('no se encontró el auto: ');
	end;
	

var a: arbol; mar:string;c:integer;b:lista;paten:integer;
begin
	c:=0;
	b:=nil;
	GenerarArbol(a);
	//enOrden(a);
	//writeln('ingrese la marca a buscar: ');
	//readln(mar);
	//canti(a,mar,c);
	//writeln(c);
	//poranio(a,b);
	//printl(b);
	writeln('ingrese patente a buscar');
	readln(paten);
	patente(a,paten);
end.

