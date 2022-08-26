{4. Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la información de los autos en venta.

Implementar un programa que:
a. Genere un árbol binario de búsqueda ordenado por patente identificatoria del auto en venta. Cada nodo del árbol debe contener patente, año de fabricación (2010..2018), la marca y el modelo.
b. Contenga un módulo que recibe el árbol generado en a) y una marca y devuelva la cantidad de autos de dicha marca que posee la agencia. Mostrar el resultado.
c. Contenga un módulo que reciba el árbol generado en a) y retorne una estructura con la información de los autos agrupados por año de fabricación.
d. Contenga un módulo que reciba el árbol generado en a) y una patente y devuelva el año de fabricación del auto con dicha patente. Mostrar el resultado.}
program adic4;
const
	CORTE='-1';
type
	subAnios=2010..2018;
	auto=record
		patente:string;
		anio:subAnios;
		marca:string;
		modelo:string;
	end;
	arbol=^nodo;
	nodo=record
		dato:auto;
		HI:arbol;
		HD:arbol;
	end;
	
//----------------para Inciso C---------------------
	auto2=record
		patente:string;
		marca:string;
		modelo:string;
	end;
	listaA=^nodo2;
	nodo2=record
		dato:auto2;
		sig:listaA;
	end;
	vAnios=array[subAnios]of listaA;
	
//------------------------------Iniciso A------------------------------
procedure leerAuto(var a:auto);
begin
	writeln('Ingrese patente ');
	readln(a.patente);
	if(a.patente<>CORTE)then begin
		writeln('Ingrese anio de fabricacion ');
		readln(a.anio);
		writeln('Ingrese marca');
		readln(a.marca);
		writeln('Ingrese modelo');
		readln(a.modelo);
	end;
end;
procedure crearNodo(var a:arbol; nue:auto);
begin
	if(a=nil)then begin
		new(a);
		a^.dato:=nue;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else 
		if (nue.patente>a^.dato.patente) then
			crearNodo(a^.HD,nue)
		else
			crearNodo(a^.HI,nue);
end;
procedure cargarArbol(var a:arbol);
var
	aut:auto;
begin
	leerAuto(aut);
	while aut.patente<>CORTE do begin
		crearNodo(a,aut);
		leerAuto(aut)
	end;
end;
		
{------------------------------Iniciso B------------------------------
Contenga un módulo que recibe el árbol generado en a) y una marca y devuelva la cantidad de autos de dicha marca que posee la agencia. Mostrar el resultado.}
procedure cantAutMarca(a:arbol; marca:string;var cant:integer);
begin
	if a<>nil then begin
		if(a^.dato.marca=marca)then
			cant:=cant+1;
		cantAutMarca(a^.HD,marca,cant);
		cantAutMarca(a^.HI,marca,cant);
	end;
end;

function cantMarca(a:arbol; marca:string):integer;
var
	cant:integer;
begin
	if a<>nil then begin
		if(a^.dato.marca=marca)then
			cant:=1
		else
			cant:=0;
		cantMarca:=cant + cantMarca(a^.HD,marca)+ cantMarca(a^.HI,marca);
	end
	else
		cantMarca:=0;
end;
{------------------------------Iniciso C------------------------------
Contenga un módulo que reciba el árbol generado en a) y retorne una estructura con la información de los autos agrupados por año de fabricación.}
procedure inicializarLista(var v:vAnios);
var
	i:subAnios;
begin
	for i:=2010 to 2018 do 
		v[i]:=nil
end;

procedure agregarAuto(var l:listaA; a:auto2);
var
	nue:listaA;
begin
	new(nue);
	nue^.dato:=a;
	nue^.sig:=l;
	l:=nue;
end;

procedure generarLista(a:arbol;var v:vAnios);
var
	auto:auto2;
begin
	if(a<>nil)then begin
		generarLista(a^.HD,v);
		generarLIsta(a^.HI,v);
		auto.patente:=a^.dato.patente;
		auto.marca:=a^.dato.marca;
		auto.modelo:=a^.dato.modelo;
		agregarAuto(v[a^.dato.anio],auto);
	end;
end;
procedure imprimirLista(l:listaA);
begin
	while(l<>nil)do begin
		writeln('Patente Auto: ',l^.dato.patente);
		writeln('Marca Auto: ',l^.dato.marca);
		writeln('Modelo Auto: ',l^.dato.modelo);
		l:=l^.sig;
	end;
end;
procedure imprimirVector(v:vAnios);
var
	i:subAnios;
begin
	for i:=2010 to 2018 do 
		if v[i]<>nil then begin
			writeln('Autos anio ',i); 
			imprimirLista(v[i]);
			writeln();
		end;
end;
{------------------------------Iniciso D------------------------------
Contenga un módulo que reciba el árbol generado en a) y una patente y devuelva el año de fabricación del auto con dicha patente. Mostrar el resultado.}

function buscarPatente(a:arbol; patente:string):integer;
begin
	if a<>nil then 
		if(a^.dato.patente=patente)then
			buscarPatente:=a^.dato.anio
		else
			if patente>a^.dato.patente then
				buscarPatente(a^.HD,patente)
			else
				buscarPatente(a^.HI,patente)
	else
		buscarPatente:=-1;
end;


//------------------------------Programa Principal------------------------------
var
	arbAutos:arbol;
	//cantAut:integer;
	cMarca:string;
	vecAnios:vAnios;
	patente:string;
	anioPat:integer;
begin
	//cantAut:=0;
	arbAutos:=nil;
	cargarArbol(arbAutos);
	writeln();
	
	//iniciso B
	writeln('Ingrese Marca a buscar cantidad de autos ');
	readln(cMarca);
	writeln('Son ',cantMarca(arbAutos,cMarca),' los autos de la Marca ',cMarca);
	{cantAutMarca(arbAutos,cMarca,cantAut);
	writeln(cantAut);}
	writeln();
	
	//iniciso C
	inicializarLista(vecAnios);
	generarLista(arbAutos,vecAnios);
	imprimirVector(vecAnios);
	writeln();
	
	//iniciso D
	writeln('Ingrese patente a buscar');
	readln(patente);
	anioPat:=buscarPatente(arbAutos,patente);
	if(anioPat<>-1)then
		writeln('Anio de fabricacion del auto con patente ',patente,': ',anioPat)
	else
		writeln('No hay auto con la patente ',patente);
end.



