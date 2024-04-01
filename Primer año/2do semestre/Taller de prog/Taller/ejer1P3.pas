{1.	Escribir un programa que:
a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol binario de búsqueda. De cada socio se lee número de socio, nombre y edad. La lectura finaliza con el número de socio 0 y el árbol debe quedar ordenado por número de socio.
b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como parámetro y que : 
i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que retorne dicho valor.
ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo recursivo que retorne dicho socio.
iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que retorne dicho valor.
iv. Aumente en 1 la edad de todos los socios.
v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a un módulo recursivo que reciba el valor leído y retorne verdadero o falso.
vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha cantidad.
viii. Informe el promedio de edad de los socios. Debe invocar a un módulo recursivo que retorne dicho promedio.
ix. Informe, a partir de dos valores que se leen, la cantidad de socios en el árbol cuyo número de socio se encuentra entre los dos valores ingresados. Debe invocar a un módulo recursivo que reciba los dos valores leídos y retorne dicha cantidad.
x. Informe los números de socio en orden creciente. 
xi. Informe los números de socio pares en orden decreciente. 
}

begin
    if ((a = nil) or (a^.HI = nil))
    then SocioMasChico:= a
    else SocioMasChico:= SocioMasChico (a^.HI);
  end;
   
var minSocio: arbol;
begin
  writeln;
  writeln ('----- Informar Datos Socio Numero Mas Chico ----->');
  writeln;
  minSocio:= SocioMasChico (a);
  if (minSocio = nil) 
  then writeln ('Arbol sin elementos')
  else begin
         writeln;
         writeln ('Socio con numero mas chico: ', minSocio^.dato.numero, ' Nombre: ', minSocio^.dato.nombre, ' Edad: ', minSocio^.dato.edad); 
         writeln;
       end;
end;


procedure InformarNumeroSocioConMasEdad (a: arbol);
{ Informe el numero de socio con mayor edad. Debe invocar a un modulo recursivo que retorne dicho valor.  }

  procedure actualizarMaximo(var maxValor,maxElem : integer; nuevoValor, nuevoElem : integer);
	begin
	  if (nuevoValor >= maxValor) then
	  begin
		  maxValor := nuevoValor;
		  maxElem := nuevoElem;
	  end;
	end;
	procedure NumeroMasEdad (a: arbol; var maxEdad: integer; var maxNum: integer);
	begin
	   if (a <> nil) then
	   begin
		   actualizarMaximo(maxEdad,maxNum,a^.dato.edad,a^.dato.numero);
		   numeroMasEdad(a^.hi, maxEdad,maxNum);
		   numeroMasEdad(a^.hd, maxEdad,maxNum);
	   end; 
	end;
var maxEdad, maxNum: integer;
begin
  writeln;
  writeln ('----- Informar Numero Socio Con Mas Edad ----->');
  writeln;
  NumeroMasEdad (a, maxEdad, maxNum);
  if (maxEdad = -1) 
  then writeln ('Arbol sin elementos')
  else begin
         writeln;
         writeln ('Numero de socio con mas edad: ', maxNum);
         writeln;
       end;
end;

procedure AumentarEdad (a: arbol);
begin
 if (a <> nil)
 then begin
        a^.dato.edad:= a^.dato.edad + 1;
        AumentarEdad (a^.HI);
        AumentarEdad (a^.HD);
      end;
end;

procedure InformarExistenciaNumeroSocio (a: arbol);
{ Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a un modulo recursivo que reciba el valor lei­do y
       retorne verdadero o falso. }
       
  function Buscar (a: arbol; num: integer): boolean;
  begin
    if (a = nil) 
    then Buscar:= false
    else If (a^.dato.numero = num) 
         then Buscar:= true
         else if (num < a^.dato.numero)
              then Buscar:= Buscar (a^.HI, num)
              else Buscar:= Buscar (a^.HD, num)
  end;
  
var numABuscar: integer;
begin
  writeln;
  writeln ('----- Informar Existencia Numero Socio ----->');
  writeln;
  write ('Ingrese numero de socio a buscar: ');
  Readln (numABuscar);
  writeln;
  if (Buscar (a, numABuscar)) 
  then writeln ('El numero ', numABuscar, ' existe')
  else writeln ('El numero ', numABuscar, ' no existe');
  writeln;
end;

procedure InformarExistenciaNombreSocio(a:arbol);
	function BuscarNombre (a : arbol; nom : cadena15): boolean;
		begin
			if a = nil then BuscarNombre := false
			else if (a^.dato.nombre = nom) and (BuscarNombre = false) then BuscarNombre := True
					else
						BuscarNombre(a^.HI,nom);
						BuscarNombre(a^.HD,nom);
		end;
var nom:cadena15;
begin
	write('nombre a buscar: ');
	readln(nom);
	If BuscarNombre(a,nom)


end;  
function InformarCantidadSocios(a:arbol):integer;

begin 
	if(a<>nil)then
		InformarCantidadSocios := 1 + InformarCantidadSocios(a^.HI)+ InformarCantidadSocios(a^.HD)
	else
		InformarCantidadSocios := InformarCantidadSocios +1;
	end;	
var a: arbol; 
Begin
  GenerarArbol (a);
  InformarNumeroSocioMasGrande (a);
  InformarDatosSocioNumeroMasChico (a);
  InformarNumeroSocioConMasEdad (a);
  // AumentarEdad (a);
  InformarExistenciaNumeroSocio (a);
  InformarExistenciaNombreSocio (a);
   //writeln( InformarCantidadSocios (a));
    {InformarPromedioDeEdad (a);
    InformarCantidadSociosEnRango (a);
	InformarNumerosSociosOrdenCreciente (a);
    InformarNumerosSociosOrdenDeCreciente (a);
  }   
  readln;
End.
