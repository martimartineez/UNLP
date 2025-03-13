program ejercicio5;
 { suma los números entre a y b, y retorna el resultado en c }
 procedure sumar(a, b, c : integer);{falta ;}
 var
 suma, i : integer;{no declarada i}
 begin
 for i := a to b do
 suma := suma + i;
 c := c + suma;

 end;
 var
 result,a,b : integer;
 ok: boolean;
 begin
 result := 0;
 
 readln(a); readln(b);{no hay declaradas a ni b}
 sumar(a, b, 0);
 write('La suma total es ',result);
 { averigua si el resultado final estuvo entre 10 y 30}
 ok := (result >= 10) and (result <= 30);{ok no declarada}{y}{deberia ir un and en vez de un OR, sino nunca daria el resultado que se busca}
 if (ok=false) then 
 write ('La suma no quedó entre 10 y 30');
 end.

