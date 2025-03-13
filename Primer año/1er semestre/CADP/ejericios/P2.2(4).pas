program programadores;
 procedure leerDatos(var legajo: integer; salario : real);
 begin
 writeln('Ingrese el nro de legajo y el salario');
 read(legajo);
 read(salario);
 end;
 procedure actualizarMaximo(nuevoLegajo:integer; nuevoSalario:real; var maxLegajo:integer);
 var
 maxSalario : real;
 begin
 if (nuevoLegajo > maxLegajo) then begin
 maxLegajo:= nuevoLegajo;
 maxSalario := nuevoSalario
 end;
 end;
 var
 legajo, maxLegajo, i : integer;
 salario, maxSalario : real;
 begin
 sumaSalarios := 0;{no declarada}
 for i := 1 to 130 do begin
 leerDatos(salario, legajo);{mal invocada}{a salario se le reasigna el valor del legajo}
 actualizarMaximo(legajo, salario, maxLegajo);{legajo no tiene valor}{maxlejo no tiene valor que comparar, hay que inicializarla antes}
 sumaSalarios := sumaSalarios + salario;
 end;
 writeln('En todo el mes se gastan ', sumaSalarios, ' pesos');
 writeln('El salario del empleado más nuevo es ',maxSalario);{max salario nunca se modifica, deberia modificarse en el procedure como un parametro var} 
 end.
