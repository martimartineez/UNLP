{2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de las expensas de dichas oficinas. 
Implementar un programa modularizado que:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.}

program ejercicio2;
const
	dimf=300;

type
oficina = record
		codigo:integer;
		dni:integer;
		expensa:real;
		end;
	vector=array[1..dimf] of oficina;

procedure AlmacenarInformacion (var v: vector; var diml: integer);
  
  procedure Leer (var v: oficina);
  begin
    
    readln(v.codigo);
    if (v.codigo <> -1)
    then begin
           write ('Ingrese' );
           readln (v.dni);
           readln (v.expensa);
         end;
  end;

var unaoficina: oficina;
begin
    dimL := 0;
    Leer(unaoficina);
    while (unaoficina.codigo <> -1)  and ( diml < dimF ) do 
    begin
       dimL := diml + 1;
       v[diml]:= unaoficina;
       Leer (unaoficina);
    end;
end;
procedure ord_inser(var v:vector;diml:integer);
var
	i, j:integer; actual:oficina;
begin
	for i:=2 to diml do begin
		actual:=v[i];
		j:=i-1;
		while((j>0) and (v[j].codigo>actual.codigo))do
		begin
			v[j+1]:=v[j];
			j:=j-1;
		end;
		v[j+1]:=actual;
		end;
	end;
procedure ord_selec(var v:vector;diml:integer);
var
	i,j,p:integer; item:oficina;
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
	oficinas:vector; diml:integer;
BEGIN
	diml:=0;
	AlmacenarInformacion(oficinas,diml);
	ord_selec(oficinas,diml);
	
END.

