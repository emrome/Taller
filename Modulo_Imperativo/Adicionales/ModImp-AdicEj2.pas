{Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una lista con las entradas vendidas.
Se desea procesar la información de una semana. Se pide:
a. Generar 7 listas con las entradas vendidas para cada día. De cada entrada se lee día (de 1 a 7), código de la obra, asiento, monto. La lectura finaliza con el código de obra igual a 0. Las listas deben estar ordenadas por código de obra de forma ascendente.
b. Generar una nueva lista que totalice la cantidad de entradas vendidas por obra. Esta lista debe estar ordenada por código de obra de forma ascendente.
c. Realice un módulo recursivo que informe el contenido de la lista generada en b)
}

{program adic2;
const
	DIMF=7;
	CORTE=0;
type
	entrada=record
		codObra:integer;
		asiento:integer;
		monto:real;
	end;
	listaE=^nodo;
	nodo=record
		dato:entrada;
		sig:listaE;
	end;
	vListas=array[1..DIMF]of listaE;
	//para la lista totalizadora
	obra=record
		codObra:integer;
		cantEnt:integer;
	end;
	listaObras=^nodo2;
	nodo2=record
		dato:obra;
		sig:listaObras;
	end;
//--------------------------Inciso A--------------------------
procedure leerEntrada(var e:entrada);
begin
	writeln('Ingrese codigo de obra');
	readln(e.codObra);
	if e.codObra<>CORTE then begin
		writeln('Ingrese asiento');
		readln(e.asiento);
		writeln('Ingrese monto');
		readln(e.monto);
	end;
end;
procedure agregarEntrada(var l:listaE; e:entrada);
var
	nue,act,ant:listaE;
begin
	new(nue);
	nue^.dato:=e;
	ant:=l;
	act:=l;
	while(act<>nil)and(e.codObra>act^.dato.codObra)do begin
		ant:=act;
		act:=act^.sig;
	end;
	if (ant=act)then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure cargarListas(var v:vListas);
var
	e:entrada;
	dia:integer;
begin
	leerEntrada(e);
	while(e.codObra<>CORTE)do begin
		writeln('Ingrese dia ');
		readln(dia);
		agregarEntrada(v[dia],e);
		leerEntrada(e);
	end;
end;
procedure inicializarListas(var v:vListas);
var
	i:integer;
begin
	for i:=1 to DIMF do
		v[i]:=nil
end;

//--------------------------Inciso B--------------------------
//Generar una nueva lista que totalice la cantidad de entradas vendidas por obra. Esta lista debe estar ordenada por código de obra de forma ascendente.
procedure agregarObra(var l,ult:listaObras; o:obra);
var
	nue:listaObras;
begin
	new(nue);
	nue^.dato:=o;
	nue^.sig:=nil;
	if(l=nil)then
		l:=nue
	else
		ult^.sig:=nue;
	ult:=nue
end;
procedure minimo(var vec:vListas; var min:obra);
var
	indMin:integer;
	i:integer;
begin
	indMin:=-1; //si estan vacias todas queda en -1
	min.codObra:=32767;
	for i:=1 to DIMF do 
		if(vec[i]<>nil)then 
			if (vec[i]^.dato.codObra<min.codObra)then begin
				indMin:=i;
				min.codObra:=vec[i]^.dato.codObra;
			end;
	if(indMin<>-1)then
		vec[indMin]:=vec[indMin]^.sig;//avanzo en la lista de donde saque el elemento
end;

procedure mergeObras(var listaO:listaObras; vec:vListas);
var
	ult:listaObras;
	aux,min:obra;
begin
	listaO:=nil; //inicializo la nueva lista
	minimo(vec,min);
	while(min.codObra<>32767)do begin
		aux.codObra:=min.codObra;
		aux.cantEnt:=0;
		while(min.codObra<>32767)and(aux.codObra=min.codObra)do begin
			aux.cantEnt:=aux.cantEnt+1;
			minimo(vec,min)
		end;
		agregarObra(listaO,ult,aux)
	end;
end;

//--------------------------Inciso C--------------------------
//c. Realice un módulo recursivo que informe el contenido de la lista generada en b)
procedure informar(l:listaObras);
begin
	if l<>nil then begin
		writeln('Codigo de Obra: ');
		writeln(l^.dato.codObra);
		writeln('Cantidad de entradas: ');
		writeln(l^.dato.cantEnt);
		informar(l^.sig);
	end;
end;

//--------------------------Programa Principal--------------------------
var
	vFunciones:vListas;
	obras:listaObras;
begin
	inicializarListas(vFunciones);
	cargarListas(vFunciones);
	mergeObras(obras,vFunciones);
	informar(obras);
end.}


//----------------------------------HECHO PARA PRACTICAR---------------------------------------
program Romero;
const
	CORTE=0;
	DIMF=7;
type
	entrada=record
		codObra:integer;
		asiento:integer;
		monto:real;
	end;
	
	listaE=^nodo;
	nodo=record
		dato:entrada;
		sig:listaE;
	end;
	vTeatro=array[1..DIMF]of listaE;
	//----------------B----------------------
	obra=record
		codigo:integer;
		cantE:integer;
	end;
	listaO=^nodo2;
	nodo2=record
		dato:obra;
		sig:listaO;
	end;
	
//----------------------A----------------------
procedure leerEntrada(var e:entrada);
begin
	readln(e.codObra);
	if(e.codObra<>CORTE)then begin
		readln(e.asiento);
		readln(e.monto);
	end;
end;
procedure insertarEntrada(var l:listaE; e:entrada);
var
	nue,ant,act:listaE;
begin
	new(nue);
	nue^.dato:=e;
	ant:=l;
	act:=l;
	while((act<>nil)and(e.codObra>act^.dato.codObra))do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(ant=act)then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure inicializarListas(var v:vTeatro);
var
	i:integer;
begin
	for i:=1 to DIMF do
		v[i]:=nil;
end;

procedure cargarTeatro(var vec:vTeatro);
var
	dia:integer;
	e:entrada;
begin
	leerEntrada(e);
	while(e.codObra<>CORTE)do begin
		readln(dia);
		insertarEntrada(vec[dia],e);
		leerEntrada(e);
	end;
end;
//------------------------------B---------------------------
procedure agregarObra(var l,ult:listaO; o:obra);
var
	nue:listaO;
begin
	new(nue);
	nue^.dato:=o;
	nue^.sig:=nil;
	if(l=nil)then
		l:=nue
	else
		ult^.sig:=nue;
	ult:=nue;
end;
procedure minimo(var vec:vTeatro;var min:integer);
var
	i,indMin:integer;
begin
	min:=32767;
	for i:=1 to DIMF do begin
		if(vec[i]<>nil)then
			if(vec[i]^.dato.codObra<min)then begin
				indMin:=i;
				min:=vec[i]^.dato.codObra;
			end;
	end;
	if(min<>32767)then
		vec[indMin]:=vec[indMin]^.sig;
end;
	
procedure merge(var l:listaO; vec:vTeatro);
var
	ult:listaO;
	aux:obra;
	min:integer;
begin
	l:=nil;
	minimo(vec,min);
	while(min<>32767)do begin
		aux.codigo:=min;
		aux.cantE:=0;
		while((min<>32767)and(aux.codigo=min))do begin
			aux.cantE:=aux.cantE+1;
			minimo(vec,min);
		end;
		agregarObra(l,ult,aux);
	end;
end;

//--------------------C----------------------
procedure informarLista(l:listaO);
begin
	if(l<>nil)then begin
		writeln('Codigo de Obra: ');
		writeln(l^.dato.codigo);
		writeln('Cantidad de entradas: ');
		writeln(l^.dato.cantE);
		informarLista(l^.sig);
	end;
end;

var
	listaObras:listaO;
	vecTeatro:vTeatro;
begin
	inicializarListas(vecTeatro);
	cargarTeatro(vecTeatro);
	merge(listaObras,vecTeatro);
	informarLista(listaObras);
end.
