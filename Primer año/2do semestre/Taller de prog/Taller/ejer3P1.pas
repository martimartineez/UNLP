{3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas. 
Implementar un programa modularizado que:
a. Lea los datos de películas y los almacene por orden de llegada y agrupados por código de género, en una estructura de datos adecuada. La lectura finaliza cuando se lee el código de la película -1. 
b. Una vez almacenada la información, genere un vector que guarde, para cada género, el código de película con mayor puntaje obtenido entre todas las críticas.
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos métodos vistos en la teoría. 
d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el código de película con menor puntaje.}

program ej3pr1;
type
	pelicula = record
		codigo : integer;
		ngenero: integer;
		promedio: integer;
		end;
	lista = ^nodo;
	nodo = record
		elem : pelicula;
		sig : lista;
		end;
	vector = array [1..8] of lista;
procedure InicializarVec (var v : vector);
	var i :integer;
	begin
		for i := 1 to 8 do 
			v[i] := nil;
	end;
procedure LeerPelicula (var pel : pelicula);
	begin
		writeln('Ingrese el codigo de la pelicula: ');
		read(pel.codigo);
		if pel.codigo <> -1 then begin
			writeln('Ingrese el codigo de genero: ');
			read(pel.ngenero);
			writeln('Ingrese el promedio de los criticos: ');
			read(pel.promedio);
		end;
	end;
Procedure InicializarVectorUlt(var v: vector; var vult: vector);
	var i : integer;
	begin
		for i:= 1 to 8 do 
			vult[i] := v[i]
		end;
Procedure InsertarAtras(var v : vector;var vult:vector; pel : pelicula);
	var nue : lista;
	begin
		new(nue);
		nue^.elem := pel;
		nue^.sig:=nil;
		if v[pel.ngenero] = nil then 
			v[pel.ngenero] := nue
		else
			vult[pel.ngenero]^.sig := nue;
		vult[pel.ngenero]:= nue;		
	end;
procedure AlmacenarInfo(var v: vector;var vult:vector);
	var	pel :pelicula;
	begin
		InicializarVec(v);
		InicializarVectorUlt(v,vult);
		LeerPelicula(pel);
		while pel.codigo <> -1 do begin
			InsertarAtras(v,vult,pel);
			LeerPelicula(pel);
		end;
	end;
Procedure IncisoB (VectorData: vector;var VectorMP: vector);
	var mayorPromedio: integer; i : integer; aux : lista; mayorCodigo:integer;
	begin
		for i:= 1 to 8 do begin
			mayorPromedio := 0;
			mayorCodigo:= 0;
			aux := VectorData[i];
			while (aux^.sig <> nil) do begin
				if aux^.elem.promedio > mayorPromedio then begin
					mayorPromedio:= aux^.elem.promedio;
					mayorCodigo:= aux^.elem.codigo;
				end;
				VectorMP[i]^.elem.codigo:=mayorCodigo;
			end;
		end;
	end;
procedure ord_selec(var v:vector;diml:integer);
var
	i,j,p:integer; item:integer;
begin
	for i:=1 to (diml-1) do begin
		p:=i;
		for j:=i+1 to diml do begin
			if (v[j].codigo>v[p].codigo)then
				p:=j;
			end;
		item:=v[p];
		v[p]:=v[i];
		v[i]:=item;	
	end;
end;		
	
var
	VectorData : vector;
	VectorULT : vector;
	VectorMP : vector;
begin
	AlmacenarInfo(vectorData,VectorULT);
	IncisoB(VectorData,VectorMP);
	ordenarVector(VectorMP);
end.
