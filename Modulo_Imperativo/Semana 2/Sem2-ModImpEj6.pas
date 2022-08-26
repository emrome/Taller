{Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando el
siguiente encabezado:
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.
}
program ej6;
const
	dimf=6;
type
	indice=-1..dimf;
	vector=array[1..dimf]of integer;

procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);//ini se inicializa en 1 y fin en la dimension logica
var
	medio:indice;
begin
	if (ini<=fin)then begin
		medio:=(ini+fin)div 2;
		if(v[medio]<>dato)then
			if(v[medio]>dato)then
				busquedaDicotomica(v,ini,medio-1,dato,pos)//me voy a la izquierda
			else
				busquedaDicotomica(v,medio+1,fin,dato,pos)
		else
			pos:=medio;
	end
	else
		pos:=-1;
end;
//para comprobar
var
	vec:vector;
	i,pos:indice;
	dato,num:integer;
begin
	for i:=1 to dimf do begin
		readln(num);
		vec[i]:=num;
	end;
	dato:=6;
	busquedaDicotomica(vec,1,dimf,dato,pos);
	if(pos=-1)then writeln('NO EXISTE EL DATO')
	else writeln('EXISTE EL DATO');
end.
