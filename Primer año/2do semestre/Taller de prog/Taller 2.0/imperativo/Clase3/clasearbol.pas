{Escribir un programa que:
a. Implemente un modulo que lea informacion de socios de un club y las almacene en un arbol binario de busqueda.
De cada socio se lee numero de socio, nombre y edad.
La lectura finaliza con el numero de socio 0 y el arbol debe quedar ordenado por numero de socio.
b. Una vez generado el arbol, realice modulos independientes que reciban el arbol como parametro y: 
    i. Informe el numero de socio mas grande. Debe invocar a un modulo recursivo que retorne dicho valor. 
    ii. Informe los datos del socio con el numero de socio mas chico. Debe invocar a un modulo recursivo que retorne dicho socio. 
    iii. Informe el numero de socio con mayor edad. Debe invocar a un modulo recursivo que retorne dicho valor. 
    iv. Aumente en 1 la edad de todos los socios.
    v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a un modulo recursivo que reciba el valor lei­do y
       retorne verdadero o falso.
    vi. Lea un nombre e informe si existe o no existe un socio con ese valor. Debe invocar a un modulo recursivo que reciba el nombre lei­do y 
        retorne verdadero o falso.
    vii. Informe la cantidad de socios. Debe invocar a un modulo recursivo que retorne dicha cantidad.
    viii. Informe el promedio de edad de los socios. Debe invocar a un modulo recursivo que retorne dicho promedio.
    ix. Informe, a partir de dos valores que se leen, la cantidad de socios en el arbol cuyo numero de socio se encuentra entre 
        los dos valores ingresados. Debe invocar a un modulo recursivo que reciba los dos valores leÃ­dos y retorne dicha cantidad. 
    x. Informe los numeros de socio en orden creciente. 
    xi. Informe los numeros de socio pares en orden decreciente.
}

Program ImperativoClase3;

type rangoEdad = 12..100;
     cadena15 = string [15];
     socio = record
               numero: integer;
               nombre: cadena15;
               edad: rangoEdad;
             end;
     arbol = ^nodoArbol;
     nodoArbol = record
                    dato: socio;
                    HI: arbol;
                    HD: arbol;
                 end;
     
procedure GenerarArbol (var a: arbol);
{ Implemente un modulo que lea informacion de socios de un club y las almacene en un arbol binario de busqueda. 
* De cada socio se lee numero de socio, nombre y edad. 
* La lectura finaliza con el numero de socio 0 y el arbol debe quedar ordenado por numero de socio. }

  Procedure LeerSocio (var s: socio);
  begin
    write ('Ingrese numero del socio: ');
    readln (s.numero);
    If (s.numero <> 0)
    then begin
           write ('Ingrese nombre del socio: ');
           readln (s.nombre);
           write ('Ingrese edad del socio: ');
           readln (s.edad);
         end;
  end;  
  
  Procedure InsertarElemento (var a: arbol; elem: socio);
  Begin
    if (a = nil) 
    then begin
           new(a);
           a^.dato:= elem; 
           a^.HI:= nil; 
           a^.HD:= nil;
         end
    else if (elem.numero < a^.dato.numero) 
         then InsertarElemento(a^.HI, elem)
         else InsertarElemento(a^.HD, elem); 
  End;

var unSocio: socio;  
Begin
 a:= nil;
 LeerSocio (unSocio);
 while (unSocio.numero <> 0)do
  begin
   InsertarElemento (a, unSocio);
   writeln;
   LeerSocio (unSocio);
  end;
end;

procedure InformarNumeroSocioMasGrande (a: arbol);
{Informe el numero de socio mas grande. 
* Debe invocar a un modulo recursivo que retorne dicho valor.}

  function NumeroMasGrande (a: arbol): integer;
  begin
    if (a = nil) then NumeroMasGrande:= -1
    else if (a^.HD = nil) then NumeroMasGrande:= a^.dato.numero
                          else NumeroMasGrande:= NumeroMasGrande (a^.HD);
  end;
   
var max: integer;
begin
  writeln;
  writeln ('----- Informar Numero Socio Mas Grande ----->');
  writeln;
  max:= NumeroMasGrande (a);
  if (max = -1) 
  then writeln ('Arbol sin elementos')
  else begin
         writeln;
         writeln ('Numero de socio mas grande: ', max);
         writeln;
       end;
end;

procedure InformarDatosSocioNumeroMasChico (a: arbol);
{ Informe los datos del socio con el numero de socio mas chico. 
* Debe invocar a un modulo recursivo que retorne dicho socio. }
  
  function SocioMasChico (a: arbol): arbol;
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
{ Informe el numero de socio con mayor edad. 
* Debe invocar a un modulo recursivo que retorne dicho valor.  }

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
  maxEdad:=-1;
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
{Aumente en 1 la edad de todos los socios}
begin
 if (a <> nil)
 then begin
        a^.dato.edad:= a^.dato.edad + 1;
        AumentarEdad (a^.HI);
        AumentarEdad (a^.HD);
      end;
end;

procedure InformarExistenciaNumeroSocio (a: arbol);
{ Lea un valor entero e informe si existe o no existe un socio con ese valor. 
* Debe invocar a un modulo recursivo que reciba el valor lei­do y retorne verdadero o falso. }
       
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

procedure InformarExistenciaNombreSocio (a:arbol);
	function buscarNom(a:arbol;nom:string):boolean;
	begin
		if(a=nil)then
			buscarNom:=False
		else if(a^.dato.nombre=nom)then
			buscarNom:=True
		else //**
		    if (BuscarNoM(a^.hd,nom) = False) then
			BuscarNom:= buscarNom(a^.hi,nom)
		     else
			    buscarNom := true;
	end;
	
	//** buscarNom:= buscarNom(a^.hi,nom) or buscarNom(a^.hd,nom)
var nom:string;
begin
	writeln('ingrese nombre: ');
	readln(nom);
	if(buscarNom(a,nom))then begin
		write('El nombre existe.');	
	end
	else
		writeln('el nombre no existe papu');
 end;
 function contar(a:arbol):integer;
	begin
		if a = nil then 
			contar := 0
		else
			begin
				contar := 1 + contar(a^.hi)+ contar(a^.hd);
			end;
	end;
 procedure InformarCantidadSocios (a:arbol);

var cant:integer; 
begin
	cant:=contar(a);
	writeln('Cantidad de socios es de: ',cant);
end;
procedure informarPromedioDeEdad(a:arbol);
	function contar(a:arbol):integer;
	begin
		if a = nil then 
			contar := 0
		else
			begin
				contar := 1 + contar(a^.hi)+ contar(a^.hd);
			end;
	end;
	function contarEdades(a:arbol): integer;
		begin
			if (a=nil) then
				contarEdades:=0
			else begin
				contarEdades := a^.dato.edad + contarEdades(a^.hd) + contarEdades(a^.hi) ;
				end;
		end;
	var
		cant : integer;
		edades : integer;
		promedio : real;
	begin
		promedio := 0;
		cant := contar(a);
		edades := contarEdades(a);
		promedio := (edades) / (cant);
		Writeln('edaddes',contarEdades(a));
		writeln('cant := ',cant);
		writeln('El promedio de edades es de: ',promedio-1:2:2);
	end;
 
 procedure InformarCantidadSociosEnRango(a:arbol);
	function buscarEnRango(a:arbol;num1:integer;num2:integer):integer;
		begin
			if(a=nil)then
				buscarEnRango:=0
			else begin
			if(a^.dato.numero>num2)then
				buscarEnRango:=buscarEnRango(a^.hi,num1,num2)
			else if(a^.dato.numero>=num1)and(a^.dato.numero<=num2)then
				buscarEnRango:=1+buscarEnRango(a^.hi,num1,num2)+buscarEnRango(a^.hd,num1,num2)
			else
				buscarEnRango:=buscarEnRango(a^.hd,num1,num2);
			end;
		end;
 var
 num1,num2:integer;
 begin
	writeln('ingrese primer valor: ');
	readln(num1);
	writeln('ingrese el otro valor: ');
	readln(num2);
	writeln('la cantidad de socios entre ',num1,' y ',num2,' es de: ',buscarEnRango(a,num1,num2));
	
 end;
 procedure InformarNumerosSociosOrdenCreciente (a:arbol);
 begin
	if(a<>nil)then
	begin
		InformarNumerosSociosOrdenCreciente(a^.hi);
		writeln(a^.dato.numero);
		InformarNumerosSociosOrdenCreciente(a^.hd)
	end;
	
 end;
 procedure InformarNumerosSociosOrdenDeCreciente (a:arbol);
 
 begin
	if(a<>nil)then
	begin
	InformarNumerosSociosOrdenDeCreciente (a^.hd);
	writeln(a^.dato.numero);
	InformarNumerosSociosOrdenDeCreciente (a^.hi);
	
	end;
 end;
var a: arbol; 
Begin
  GenerarArbol (a);
  InformarNumeroSocioMasGrande (a);
  InformarDatosSocioNumeroMasChico (a);
  InformarNumeroSocioConMasEdad (a);
  AumentarEdad (a);
  InformarExistenciaNumeroSocio (a);
  InformarCantidadSocios (a);
  InformarPromedioDeEdad (a);
  //InformarCantidadSociosEnRango (a);
  //InformarNumerosSociosOrdenCreciente (a);
  //InformarNumerosSociosOrdenDeCreciente (a);
  
    
   
end.
