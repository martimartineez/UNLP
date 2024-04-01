{1.- El administrador de un edificio de oficinas, cuenta en papel, con la información del pago de las expensas de dichas oficinas. 
Implementar un programa que:
a)	Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa código de identificación, DNI del propietario y valor de la expensa. La lectura finaliza cuando llega el código de identificación -1.
b)	Ordene el vector, aplicando uno de los métodos vistos en la cursada, para obtener el vector ordenado por código de identificación de la oficina.
c)	Realice una búsqueda dicotómica que recibe el vector generado en b) y un código de identificación de oficina y retorne si dicho código está en el vector. En el caso de encontrarlo, se debe informar el DNI del propietario y en caso contrario informar que el código buscado no existe.
d)	Tenga un módulo recursivo que retorne el monto total de las expensas.
}
program cosito;
type
	oficina = record
		Codigo : integer;
		dni : integer;
		valor : real ;
		end;
	vector = array  [1..300] of oficina;

procedure leer(var c:oficina);
	begin
		writeln('ingrese codigo de oficina o -1 para finalizar: ');
		readln(c.codigo);
		if(c.codigo<>-1)then begin
			readln(c.dni);
			readln(c.valor);
			end;
		end;
	
procedure armarvector(var v:vector;var dimL:integer);
var c:oficina; i:integer;
	begin
		i := 0;
		leer(c);
		while(c.codigo<>-1)do begin
			i := i+1;
			dimL := dimL +1;
			v[i] := c;
			leer(c)
			end;
		end;
procedure OrdenarSeleccion(var v : vector ; dimL : integer);
	var i,j,p : integer; item : oficina;
	begin
		for i:= 1 to dimL -1 do begin
				p := i;
				for j := i +1 to dimL do begin
					if v[p].codigo > v[j].codigo then
						p := j
				end;
				item := v[p];
				v[p]:= v[i];
				v[i]:= item;
		end;
	end;

procedure BusquedaDick(v:vector;DimL,b:integer);
	var pri,ult,medio : integer;
	begin
	pri := 1;
	ult := dimL;
	medio := (pri+ult) div 2;
	while (pri <= ult) and (b <> v[medio].codigo) do 
		begin
			if (b < v[medio].codigo) then
				ult := medio-1
			else pri := medio +1;
			medio := (pri + ult) div 2;
			
			end;
			if (pri <= ult) and (b = v[medio].codigo) then writeln ('dni: ', v[medio].dni)
			else 
				writeln('no se encontró el codigo');
				
		end;
procedure Inciso (v:vector;dimL:integer;var total : real;var i :integer);
	begin
		if (i <= dimL) then
			begin
				total := total + v[i].valor;
				i:= i+1;
				Inciso(v,dimL,total,i);
			end;
	end;
var v : vector; dimL : integer;b:integer; i : integer; total : real;
begin
	i := 1;
	total := 0;
	dimL := 0;
	armarvector(v,diml);
	OrdenarSeleccion(v,DimL);
	writeln('diabetes type 1: ');
	readln(b);
	BusquedaDick(v,DimL,b);
	Inciso(v,diml,total,i);
	writeln('el total de expensas es: ',total:1:1);
end.
