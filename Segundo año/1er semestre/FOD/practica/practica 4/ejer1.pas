
Program ejer1;
const
	M=4
type
	alumno=record
		nombre:string;
		apellido:string;
		dni:integer;
		legajo:integer;
		ingreso:integer;
	end;
	
	end;
	TNodo=record
		cant_claves=integer;
		claves=array[1..M-1] of integer; //se pone el mismo tipo del archivo, para que coincidan orden
		enlaces=array[1..M-1] of integer;
		hijos=array[1..M] of integer;
	end;
	arbolB= file of TNodo;
	alumnos=file of alumno;

procedure 



var
	archivoDatos=alumnos;
	archivoIndice=arbolB;

Begin
  writeln('holi')

End.
