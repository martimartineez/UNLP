program parcial2017a;

const
	valorAlto=9999;
type
	Mlog=record
		numero:integer;
		usuario:string[20];
		nombre:string[20];
		apellido:string[20];
		cant:integer;
	end;
	Dlog=record
		numero:integer;
		destino:integer;
		mensaje:string;
	end;
	
	archMaestro=file of Mlog;
	archDetalle=file of Dlog;

procedure leerD(var detalle:archDetalle;var info:Dlog);
begin
	if not eof(detalle)then
		read(detalle,info)
	else
		info.numero:=valorAlto;
end;

procedure leerM(var maestro:archMaestro;var info:Mlog);
begin
	if not eof(maestro)then
		read(maestro,info)
	else
		info.numero:=valorAlto;
end;



procedure actualizar(var maestro:archMaestro;var detalle:archDetalle);
var
	cliente:Mlog;
	info:Dlog;
	mails,numAct:integer;
begin
	reset(maestro);
	reset(detalle);
	leerD(detalle,info);
	while(info.numero<>valorAlto)do begin
		numAct:=info.numero;
		mails:=0;
		while(numAct=info.numero)do begin
			mails:=mails+1;
			leerD(detalle,info);
		end;
		read(maestro,cliente);
		while(cliente.numero<>numAct)do begin
			read(maestro,cliente);
		end;
		cliente.cant:=cliente.cant+mails;
		seek(maestro,filePos(maestro)-1);
		write(maestro,cliente);
	end;
	close(maestro);
	close(detalle);

end;

procedure crearTxt(var maestro:archMaestro);
var
	listado:Text;
	info:Mlog;
	
begin
	assign(listado,'listado.txt');
	rewrite(listado);
	reset(maestro);
	leerM(maestro,info);
	while(info.numero<>valorAlto)do begin
		writeln(listado,info.numero,info.usuario,info.cant);
		leerM(maestro,info);
	end;
	close(maestro);
	close(listado);
end;


var
	maestro:archMaestro;
	detalle:archDetalle;
	opcion:integer;
BEGIN
	assign(maestro,'logmail.dat');
	assign(detalle,'6junio2017.dat');
	
	writeln('ingrese 1 para actualizar maestro o 2 para generar archivo txt');
	readln(opcion);
	if(opcion=1)then
		actualizar(maestro,detalle)
	else
		if(opcion=2)then begin
			actualizar(maestro,detalle); //para tener el maestro actualizado al generar el txt
			crearTxt(maestro);
		end
		else
			writeln('opcion incorrecta');
END.

