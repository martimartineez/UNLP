{1.- El administrador de un edificio de oficinas, cuenta en papel, con la información del pago de las expensas de dichas oficinas. 
Implementar un programa que:
* (a)	Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa código de identificación, 
* DNI del propietario y valor de la expensa. La lectura finaliza cuando llega el código de identificación -1.
* (b)	Ordene el vector, aplicando uno de los métodos de inserción vistos en la cursada, para obtener el vector ordenado por código de 
* identificación de la oficina.
* (c)	Realice una búsqueda dicotómica que recibe el vector generado en b) y un código de identificación de oficina y retorne si dicho 
* código está en el vector. En el caso de encontrarlo, se debe informar el DNI del propietario y en caso contrario informar que el 
* código buscado no existe.
* (d)	Tenga un módulo recursivo que retorne el monto total de las expensas.
}


program ejercicio1;
const
df=300;
type
oficina=record
	codigo:integer;
	dni:integer;
	expensa:real;
end;
vector=array[1..df]of oficina;

procedure leer(var a:oficina);
begin
	writeln('ingrese el cod: ');
	readln(a.codigo);
	if(a.codigo<>-1)then begin
		writeln('ingrese el dni: ');
		readln(a.dni);
		writeln('ingrese el valor de la expensa: ');
		readln(a.expensa);
		end;
end;

procedure generarVector(var ve:vector;var dl:integer);
var
	a:oficina;i:integer;
begin
	leer(a);i:=1;dl:=0;
	while(dl<df)and(a.codigo<>-1)do begin
		dl:=dl+1;
		ve[i]:=a;
		i:=i+1;
		leer(a);
	end;

end;
procedure ordenarVector(var ve:vector;dl:integer);
var
i,j:integer;item:oficina;
begin
	for i:=2 to dl do begin
		item:=ve[i];
		j:=i-1;
		while(j>0)and(ve[j].codigo>item.codigo)do begin
			ve[j+1]:=ve[j];
			j:=j-1;
		end;
		ve[j+1]:=item;
	end;
end;
procedure buscar(ve:vector;dl:integer;cod:integer);
	function buscarDic(ve:vector;dl:integer;cod:integer):integer;
	var pos,pri,ult,medio:integer;
	begin
		pos:=0;
		pri:=1;
		ult:=dl;
		medio:=(pri+ult)div 2;
		while(pri<=ult)and(cod<>ve[medio].codigo)do begin
			if(cod<ve[medio].codigo)then 
				ult:=medio-1
			else
				pri:=medio+1;
			medio:=(pri+ult)div 2;
		end;
		if(pri<=ult)then
			pos:=medio;
		buscarDic:=pos;
	end;
var aux:integer;
begin
	aux:=buscarDic(ve,dl,cod);
	if(aux<>0)then
		writeln('Encontrado! DNI: ',ve[aux].dni)
	else
		writeln('El codigo: ',cod,'. No fue encontrado.');
end;
procedure contarExpensas(ve:vector;dl:integer;var expTotal:real);
	function contar(ve:vector;dl:integer;i:integer):real;
	begin
		if(i<dl)then begin
		i:=i+1;
		contar:=(ve[i].expensa)+(contar(ve,dl,i));
		end;
	end;
var
i:integer;
begin
i:=0;
expTotal:=contar(ve,dl,i);
end;
var
ve:vector;dl:integer;cod:integer;expTotal:real;
BEGIN
	expTotal:=0;
	generarVector(ve,dl);{a}
	ordenarVector(ve,dl);{b}
	writeln('ingrese el codigo de oficina a buscar: ');
	readln(cod);
	buscar(ve,dl,cod);
	contarExpensas(ve,dl,expTotal);
	writeln('expensas: ',expTotal:2:2)
END.

