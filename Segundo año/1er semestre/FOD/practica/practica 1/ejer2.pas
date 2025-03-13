program ej2;
type
    coso = file of integer;
procedure mostrarPantalla(var archivo: coso);
    var
        act : integer;
        menor : integer;
        promedio : integer;
        cant : integer;
    begin
        menor := 0;
        promedio := 0;
        cant := 0;
        reset(archivo);
        while not eof(archivo) do begin
                cant := cant + 1;
                read(archivo,act);
                promedio := promedio + act;
                cant := cant +1;
                if (act < 1500) then
                    menor := menor + 1;
                writeln(act);
            end;
            close(archivo);
            writeln('La cantidad de menores es: ', menor);
            writeln('El promedio es: ',promedio /cant);

end;
var
    archivo : file of integer;
    nombre : string;
begin
    writeln('Ingrese el nombre del archivo: ');
    readln(nombre);
    assign(archivo,nombre);
    mostrarPantalla(archivo);
end.
