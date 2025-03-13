program JugamosConListas;
type
lista = ^nodo;
nodo = record
num : integer;
sig : lista;
end;
function multi(l:lista; numero:integer):integer;
 var
    cant:integer;
    begin
        cant:=0;
        while(l<>nil)do begin
            if(l^.num MOD numero=0)then
             cant:=cant+1;
             l:=l^.sig;
            end;
        multi:=cant;
    end;

procedure printlis(l:lista);
var 
    pri:lista;
    begin;
    pri:=l;
    while (pri<>nil) do begin
    writeln(pri^.num);
    pri:=pri^.sig;
    end;
    end;
function min(l:lista):integer;
    var
        a:integer;
    begin
    a:=9999;
    while(l<>nil)do begin
        if(l^.num<a)then
            a:=l^.num;
            l:=l^.sig;
        end;
    min:=a;
    end;
function max(l:lista):integer;
    var
        cant:integer;
    begin
    cant:=0;
    while(l<>nil)do begin
        if(l^.num>cant)then
            cant:=l^.num;
        l:=l^.sig;
    end;
    max:=cant;
end;
procedure incrementar( L:lista;v:integer);
    begin
        while(L<>nil)do begin
        L^.num:=L^.num+v;
        L:=L^.sig;
        end;
    end;
procedure armarNodo(var L,ult : lista; v: integer);
var
nuevo : lista;
begin
new(nuevo);
nuevo^.num := v;
nuevo^.sig := nil;
if(L=nil)then
    L:=nuevo
else 
    ult^.sig:=nuevo;
    ult:=nuevo;
end;
var
    pri, ult : lista;
    valor : integer;
    v:integer;
    numero:integer;
begin
pri := nil;
writeln('Ingrese un numero');
read(valor);
while (valor <> 0) do begin
armarNodo(pri,ult, valor);
writeln('Ingrese un numero');
read(valor);
end;

writeln('ingrese un numero: ');
readln(numero);
writeln(multi(pri,numero));
printlis(pri);
writeln(max(pri));
writeln(min(pri));

end.
