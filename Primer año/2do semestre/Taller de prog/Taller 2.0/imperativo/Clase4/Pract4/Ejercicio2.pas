{2.	Un cine posee la lista de películas que proyectará durante el mes de octubre. De cada película se conoce: código de 
*película, código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror)
*y puntaje promedio otorgado por las críticas. Implementar un programa que contenga:
a.Un módulo que lea los datos de películas y los almacene ordenados por código de película y agrupados por código de 
*género, en una estructura de datos adecuada. La lectura finaliza cuando se lee el código de película -1. 
b.Un módulo que reciba la estructura generada en el punto a y retorne una estructura de datos donde estén todas las 
*películas almacenadas ordenadas por código de película.}
program mergeado;
type

	pelicula = record
		codigo : integer;
		genero : integer;
		promedio : integer;
		end;
		lista = ^nodo;
		nodo = record
			elem : pelicula;
			sig : lista;
			end;
	vector = array [1..8] of lista;
procedure leerPel(var pel : pelicula);
	begin
		writeln('Ingrese el ccodigo de pelicula: ');
		readln(pel.codigo);
		while pel.codigo <> -1 do begin
			writeln('Ingrese el codigo de genero: ');
			read(pel.genero);
			writeln('Ingrese el promedio: ');
			readln(pel.promedio);
		end;
	end;
procedure insertarOrdenado( var l : lista; pel : pelicula);
	var
		nue : lista;
		act : lista;
		ant : lista;
	begin
		new(nue);
		nue^.elem := pel;
		act := l;
		ant := l;
		while (act <> nil) and (act^.elem.codigo < pel.codigo) do begin
			ant := act;
			act := act^.sig;
		end;
		if act = l then 
			l := nue
		else
			ant^.sig := nue;
		nue^.sig := act;
	end;
procedure incisoA ( var v : vector);
	var
		pel : pelicula;
	
	begin
		leerPel(pel);
		while pel.codigo <> -1 do begin
			insertarOrdenado(v[pel.genero],pel);
			leerPel(pel);
		end;
	end;
procedure minimo(var v:vector;var pel:pelicula);
var i:integer;indiceMin:integer;
begin
	pel.codigo := 9999;
	for i:=1 to 8 do begin
	
				if (v[i]<>nil) and (v[i]^.elem.codigo < pel.codigo) then begin
					indiceMin := i;
					pel := v[i]^.elem
					end;
			end;
	
	if pel.codigo <> 9999 then begin
		v[indiceMin] := v[indiceMin]^.sig;
		end;
end;
procedure insertarAtras(var l,ult:lista;pel:pelicula);
var nue:lista;
begin
new(nue);nue^.elem:=pel;nue^.sig:=nil;
	if(l<>nil)then begin
		ult^.sig:=nue;
	end
	else
		l:=nue;
		ult:=nue;
end;

procedure incisoB(v : vector;var l : lista);
	var
		pel : pelicula;
		ult : lista;
	begin
		minimo(v,pel);
		while pel.codigo <> 9999 do begin
			insertarAtras(l,ult,pel);
			minimo(v,pel);
		end;
	end;

var
	v : vector;
	i : integer;

begin
	for i:= 1 to 8 do 
		v[i] := nil;
	incisoA(v);

end.	
