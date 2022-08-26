{El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
las expensas de dichas oficinas.
Implementar un programa modularizado que:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De
cada oficina se ingresa el código de identificación, DNI del propietario y valor de la
expensa. La lectura finaliza cuando se ingresa el código de identificación -1, el cual no se
procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación
de la oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación
de la oficina.
}
program ej1;
const
    dimF=300;
    CORTE=-1;
type
    oficina=record
        cod:integer;
        dni:integer;
        expensa:real;
    end;
    oficinas=array[1..dimF]of oficina;

procedure leerOficina(var o:oficina);
begin
    writeln('Ingrese codigo de identificacion');readln(o.cod);
    if(o.cod<>CORTE)then begin
        writeln('Ingrese DNI del propietario');readln(o.dni);
        writeln('Ingrese valor de la expensa');readln(o.expensa);
    end;
end;
procedure cargarOficinas(var v:oficinas;var dimL:integer);
var
    ofi:oficina;
begin
    dimL:=0;
    leerOficina(ofi);
    while((dimL<dimF)and (ofi.cod<>CORTE))do begin
        dimL:=dimL+1;
        v[dimL]:=ofi;
        leerOficina(ofi);
    end;
end;

procedure ordenarInsercion(var v:oficinas;dimL:integer);
var 
    i,j:integer;
    act:oficina;
begin
    for i:=2 to dimL do begin
        act:=v[i];
        j:=i-1;
        while(j>0)and(act.cod<v[j].cod)do begin
            v[j+1]:=v[j];
            j:=j-1;
        end;
        v[j+1]:=act;
    end;
end;

procedure ordenarSeleccion(var v:oficinas;dimL:integer);
var
    i,j,min:integer;
    item:oficina;
begin
    for i:=1 to dimL-1 do begin
        min:=i;
        for j:=i+1 to dimL do 
            if(v[j].cod<v[min].cod)then min:=j;
        item:=v[min];
        v[min]:=v[i];
        v[i]:=item;
    end;
end;

var
    vOficinas:oficinas;
    dimL:integer;
begin
    cargarOficinas(vOficinas,dimL);
    ordenarInsercion(vOficinas,dimL);
    ordenarSeleccion(vOficinas,dimL);
end.

