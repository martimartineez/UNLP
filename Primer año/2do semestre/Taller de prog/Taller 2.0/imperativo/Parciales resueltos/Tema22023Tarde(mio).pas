

program Tema22023Tarde(mio);
const 
	estilos=15;
type
	rangoEstilo = 1..estilos;
	
	banda=Record
		nombre:string;
		estilo:rangoEstilo;
		integrantes:integer;
		end;
	
	listaBandas= ^nodo;
	nodo= Record
		dato:banda;
		sig:listaBandas;
		end;
	
	vec_estilos= array [1..estilos] of listaBandas;

procedure iniciarVector(var v:vec_estilos);
	var
		i:integer;
	begin
		for i:=0 to estilos do
			v[i]:=nil;
			
	end;
	
procedure inscribir(var b:banda);
	begin
		writeln('ingrese inte');
		readln(b.integrantes);
		if(b.integrantes<>0)then begin
			readln(b.nombre);
			readln(b.estilo);
			end;
	end;

procedure almacenar(var v:vec_estilos; b:banda);
	procedure agregarOrdenado(var l:listaBandas; b:banda);
		var
			aux,ant,act:listaBandas;
		begin
			new(aux);
			aux^.dato:=b;
			act:=l;
			ant:=l;
			while (act<>nil)and(act^.dato.nombre<b.nombre)do begin
				ant:=act;
				act:=act^.sig;
				end;
			if(act=ant)then
				l:=aux
				else
					ant^.sig:=aux;
			aux^.sig := act;
		end;
	var
		i:integer;
	begin
		i:=b.estilo;
		agregarOrdenado(v[i],b);
	end;

procedure agregarAdelante(var l: listaBandas; b: banda);
	var
		aux: listaBandas;
	begin
		new(aux);
		aux^.dato := b;
		aux^.sig := l;
		l := aux;
		end;

procedure bandasInscriptas(v:vec_estilos; var l:listaBandas);
	procedure minimo(var v: vec_estilos; var min: banda);
			var
				i, pos: integer;
			begin
				min.nombre := 'ZZZZ';
				pos := -1;
				for i := 1 to estilos do
					if (v[i] <> nil) and (v[i]^.dato.nombre <= min.nombre) then begin
						pos := i;
						min := v[i]^.dato;
						end;
				if (pos <> -1) then
					v[pos] := v[pos]^.sig;
				end;
	var
		min:banda;
	begin
		l:=nil;
		minimo(v,min);
		while(min.nombre<>'ZZZZ')do begin
			agregarAdelante(l,min);
			minimo(v,min);
		end;
	end;

procedure solistas(l:listaBandas; var ls:listaBandas);
	begin
		if(l<>nil)then begin
			if(l^.dato.integrantes=1)then begin
				agregarAdelante(ls,l^.dato);
				end;
			solistas(l^.sig,ls);
		end;
	end;

var
	v:vec_estilos;
	b:banda;
	l,ls:listaBandas;

BEGIN
	l:=nil;
	ls:=nil;
	iniciarVector(v);
	inscribir(b);
	while(b.integrantes<>0)do begin
		almacenar(v,b);
		inscribir(b);
	end;
	bandasInscriptas(v, l);
	solistas(l, ls);
	
END.

