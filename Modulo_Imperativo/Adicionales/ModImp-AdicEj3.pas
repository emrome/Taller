{El administrador de un edificio de oficinas, cuenta en papel, con la información del pago de las expensas de dichas oficinas.
Implementar un programa que:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa código de identificación, DNI del propietario y valor de la expensa. La lectura finaliza cuando llega el código de identificación -1.
b. Ordene el vector, aplicando alguno de los métodos vistos en la teoría, para obtener el vector ordenado por código de identificación de la oficina.
c. Realice una búsqueda dicotómica que recibe el vector generado en b) y un código de identificación de oficina y retorne si dicho código está en el vector. En el caso de encontrarlo, se debe informar el DNI del propietario y en caso contrario informar que el código buscado no existe.
}

program adic3;
const
	CORTE=-1;
	DIMF=300;
type
	oficina=record
		codigo:integer;
		dniP:integer;
		expensa:real;
	end;
	vOficinas=array[1..DIMF]of oficina;

procedure leerOficina(var o:oficina);
begin
	writeln('Ingrese codigo de identificacion ');
	readln(o.codigo);
	if(o.codigo<>CORTE)then begin
		writeln('Ingrese DNI del propietario ');
		readln(o.dniP);
		writeln('Ingrese valor de la expensa ');
		readln(o.expensa);
	end;
end;

procedure cargarOficinas(var v:vOficinas; var diml:integer);
var
	ofic:oficina;
begin
	diml:=0;
	leerOficina(ofic);
	while((diml<DIMF)and(ofic.codigo<>CORTE))do begin
		diml:=diml+1;
		v[diml]:=ofic;
		leerOficina(ofic)
	end;
end;
//----------------------------Inciso B----------------------------
procedure ordenarOficinas(var v:vOficinas; diml:integer);
var
	i,j:integer;
	act:oficina;
begin
	for i:=2 to diml do begin
		act:=v[i];
		j:=i-1;
		while((j>0)and(v[j].codigo>act.codigo))do begin
			v[j+1]:=v[j];
			j:=j-1
		end;
		v[j+1]:=act;
	end;
end;
procedure ordenarSeleccion(var v:vOficinas; diml:integer);
var
	i,j,min:integer;
	aux:oficina;
begin
	for i:=1 to diml-1 do begin
		min:=i;
		for j:=i+1 to diml do //busca el minimo
			if v[j].codigo<v[min].codigo then
				min:=j;
		aux:=v[min];
		//intercambio
		v[min]:=v[i];
		v[i]:=aux;
	end;
end;

procedure imprimirOficinas(v:vOficinas; diml:integer);
var
	i:integer;
begin
	writeln('OFICINAS');
	for i:=1 to diml do
		writeln(v[i].codigo)
end;
{----------------------------Inciso B----------------------------
Realice una búsqueda dicotómica que recibe el vector generado en b) y un código de identificación de oficina y retorne si dicho código está en el vector. En el caso de encontrarlo, se debe informar el DNI del propietario y en caso contrario informar que el código buscado no existe.
}
{procedure busquedaDicotomica(vec:vOficinas; codBuscar,diml:integer; var pos:integer);
var
	pri,ult,medio:integer;
begin
	pri:=1;
	ult:=diml;
	medio:=(pri+diml) div 2;
	while((pri<=ult)and(codBuscar<>vec[medio].codigo))do begin
		if (codBuscar>vec[medio].codigo)then
			pri:=medio+1
		else
			ult:=medio-1;
		medio:=(pri+diml) div 2
	end;
	if(pri<=ult)then
		pos:=medio
	else
		pos:=-1
end;}

procedure busquedaDicotomica (v: vector; ini,fin: integer; dato:integer; var pos: indice);//ini se inicializa en 1 y fin en la dimension logica
var
	medio:integer;
begin
	if (ini<=fin)then begin
		medio:=(ini+fin)div 2;
		if(v[medio]<>dato)then
			if(dato<v[medio])then
				busquedaDicotomica(v,ini,medio-1,dato,pos)//me voy a la izquierda
			else
				busquedaDicotomica(v,medio+1,fin,dato,pos)
		else
			pos:=medio;
	end
	else
		pos:=-1;
end;

var
	posX,diml,codBuscar,ini,fin:integer;
	vOfic:vOficinas;
begin
	diml:=0;
	cargarOficinas(vOfic,diml);
	imprimirOficinas(vOfic,diml);
	//ordenarOficinas(vOfic,diml);
	ordenarSeleccion(vOfic,diml);
	imprimirOficinas(vOfic,diml);
	
	
	ini:=1;
	fin:=diml;
	writeln('Ingrese codigo de oficina a buscar');
	readln(codBuscar);
	busquedaDicotomica(vOfic,ini,fin,codBuscar,posX);
	if(posX<>-1)then begin
		writeln('posicion: ',posX);
		writeln('Dni del propietario de la oficina con codigo ',codBuscar,': ',vOfic[posX].dniP);
	end
	else
		writeln('Codigo de oficina ',codBuscar,' no existe');
end.
