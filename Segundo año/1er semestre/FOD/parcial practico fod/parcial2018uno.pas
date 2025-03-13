program parcial2018uno;
const
	valorAlto=9999;
type
	Dmaestro=record
		anio:integer;
		mes:integer;
		dia:integer;
		idUsuario:integer;
		tiempo:integer;
	end;
	archMaestro=file of Dmaestro;

procedure leer(var maestro:archMaestro;var dato:Dmaestro);
begin
	if not eof(maestro)then
		read(maestro,dato)
	else
		dato.idUsuario:=valorAlto;
end;

procedure informar(var maestro:archMaestro);
var	
	encontrado:boolean;
	dato:Dmaestro;
	totalanio,totalmes,totaldia,info:integer;
	anio,mes,dia,usuario:integer;
begin
	reset(maestro);
	encontrado:=true;
	writeln('ingrese anio a informar:');
	readln(anio);
	leer(maestro,dato);
	while((dato.idUsuario<>valorAlto) and (encontrado=true))do begin
		if(dato.anio>anio)then
			encontrado:=false;
		if(dato.anio=anio)then begin
			writeln('anio: ',anio);
			totalanio:=0;
			while(dato.anio=anio)do begin
				mes:=dato.mes;
				writeln('	mes:',mes);
				totalmes:=0;
				while((dato.anio=anio) and (dato.mes=mes))do begin
					dia:=dato.dia;
					writeln('		dia:',dia);
					totaldia:=0;
					while((dato.anio=anio) and (dato.mes=mes) and (dato.dia=dia))do begin
						usuario:=dato.idUsuario;
						info:=0;
						while((dato.anio=anio) and (dato.mes=mes) and (dato.dia=dia) and (dato.idUsuario=usuario))do begin
							info:=info+dato.tiempo;
							leer(maestro,dato);
						end;
						writeln('usuario: ',usuario,' ',info,' de tiempo total en dia ',dia,' mes',mes);
						totaldia:=totaldia+info;
					end;
					writeln(totaldia,' tiempo total acceso dia ',dia,' mes ',mes);
					totalmes:=totalmes+totaldia;
				end;
				writeln(totalmes,' tiempo total acceso mes ',mes);
				totalanio:=totalanio+totalmes;
			end;
			writeln(totalanio,' tiempo total acceso anio');
		end;
		leer(maestro,dato);
	end;
	if(encontrado=false)then
		writeln('anio no encontrado');
	
	close(maestro);
end;

var
	maestro:archMaestro;
BEGIN
	assign(maestro,'maestro');
	informar(maestro);
	
END.

