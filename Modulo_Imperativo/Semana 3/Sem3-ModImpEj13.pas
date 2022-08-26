{Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una lista con las entradas vendidas. Se desea procesar la información de una semana.
Implementar un programa que:
a. Genere 7 listas con las entradas vendidas para cada día. De cada entrada se lee día (de 1 a 7), código de la obra, asiento y monto. La lectura finaliza con el código de obra igual a 0.
Las listas deben estar ordenadas por código de obra de forma ascendente.
b. Genere una nueva lista que totalice la cantidad de entradas vendidas por obra. Esta lista debe estar ordenada por código de obra de forma ascendente.
}

program ej12;
const
	CANT=7;
	CORTE=0;
type
	subrango=1..CANT;
	entrada=record
		dia:subrango;
		codObra:integer;
		asiento:integer;
		monto:real;
	end;
	lista=^nodo;
	nodo=record
		dato:entrada;
		sig:lista;
	end;
	vecListas=array[subrango]of lista;
	
	obra=record //para la nueva lista
		codObra:integer;
		cant:integer;
	end;
	listaObra=^nodo2;
	nodo2=record
		dato:obra;
		sig:listaObra;
	end;

//--------------------------inciso A--------------------------------
procedure leerEntrada(var e:entrada);
begin
	writeln('Ingrese codigo de obra');
	readln(e.codObra);
	if(e.codObra<>CORTE)then begin
		writeln('Ingrese dia de la funcion');
		readln(e.dia);
		writeln('Ingrese asiento');
		readln(e.asiento);
		writeln('Ingrese monto de la entrada');
		readln(e.monto);
	end;
end;

procedure insertarNodo(var l:lista; e:entrada);
var
	ant,act,nue:lista;
begin
	new(nue);
	nue^.dato:=e;
	ant:=l;
	act:=l;
	while((act<>nil)and(act^.dato.codObra<e.codObra))do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(ant=act)then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;
procedure inicializarListas(var v:vecListas);
var
	i:subrango;
begin
	for i:=1 to CANT do 
		v[i]:=nil;
end;

procedure cargarEntradas(var v:vecListas);
var
	ent:entrada;
begin
	leerEntrada(ent);
	while(ent.codObra<>CORTE)do begin
		insertarNodo(v[ent.dia],ent);
		leerEntrada(ent);
	end;
end;

//------------------------inciso B---------------------
procedure agregarAtras(var l,ult:listaObra;aux:obra);
var
	nue:listaObra;
begin
	new(nue); 
	nue^.dato:=aux;
	nue^.sig:=nil;
	if(l=nil)then
		l:=nue
	else
		ult^.sig:=nue;
	ult:=nue;
end;
procedure minimo(var vec:vecListas;var min:obra);
var
	indMin:integer;
	i:subrango;
begin
	indMin:=-1;
	min.codObra:=32767;
	for i:=1 to CANT do 
		if(vec[i]<>nil)then 
			if(vec[i]^.dato.codObra<min.codObra)then begin
				indMin:=i;
				min.codObra:=vec[i]^.dato.codObra;
			end;
			
	if(indMin<>-1)then 
		vec[indMin]:=vec[indMin]^.sig;
end;

procedure mergeAcumulador(v:vecListas; var nue:listaObra);
var
	ult:listaObra;
	aux,min:obra;
begin
	nue:=nil;
	minimo(v,min);
	while(min.codObra<>32767)do begin
		aux.codObra:=min.codObra;
		aux.cant:=0;
		while((min.codObra<>32767)and(aux.codObra=min.codObra))do begin
			aux.cant:= aux.cant + 1;
			minimo(v,min);
		end;
		agregarAtras(nue,ult,aux);
	end;
end;

//--------------------------Programa Principal--------------------------
var
	vecDias:vecListas;
	obras:listaObra;
begin
	inicializarListas(vecDias);
	cargarEntradas(vecDias);
	mergeAcumulador(vecDias,obras);
end.
