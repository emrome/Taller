{Una cadena de gimnasios que tiene 5 sucursales necesita procesar las asistencias de los clientes. Implementar un programa con:
a. Un módulo que lea la información de las asistencias realizadas en las sucursales y genere una estructura con código de cliente, dni de cliente, fecha y cantidad de minutos que asistió a la sucursal, agrupados por sucursal. Para cada sucursal, los clientes deben estar ordenados por código de cliente. De cada asistencia se lee: código de sucursal (1..5), dni del cliente, código del cliente, fecha y cantidad de minutos que asistió. La lectura finaliza con el código de cliente -1, el cual no se procesa.

b. Un módulo que reciba la estructura generada en a) y utilizando la técnica de merge o merge acumulador genere un árbol ordenado por dni que contenga el dni de cliente y la cantidad total de veces que asistió a las sucursales del gimnasio.}

program adic5;
const
	CORTE=-1;
	DIMF=5;
type
	subrango=1..DIMF;
	asistencia=record
		//sucursal:subrango;
		codigo:integer;
		dni:integer;
		fecha:string;
		mins:integer;
	end;
	listaA=^nodo;
	nodo=record
		dato:asistencia;
		sig:listaA;
	end;
	vSucursales=array[subrango]of listaA;
	//---------------para inciso B--------------
	cliente=record
		dni:integer;
		asistencias:integer;
	end;
	arbol=^nodo2;
	nodo2=record
		dato:cliente;
		HD:arbol;
		HI:arbol;
	end;
	
	
//--------------------------------------Inciso A-------------------------------------
procedure leerAsistencia(var a:asistencia);
begin
	writeln('Ingrese codigo de cliente');
	readln(a.codigo);
	if(a.codigo<>CORTE)then begin
		writeln('Ingrese dni del cliente');
		readln(a.dni);
		{writeln('Ingrese fecha de la asistencia');
		readln(a.fecha);
		writeln('Ingrese cantidad de minutos de la asistencia');
		readln(a.mins);}
	end;
end;
procedure agregarAsistencia(var l:listaA; a:asistencia);
var
	ant,act,nue:listaA;
begin
	new(nue);
	nue^.dato:=a;
	ant:=l;
	act:=l;
	while(act<>nil)and(a.codigo>act^.dato.codigo)do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(ant=act)then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;
procedure inicializarListas(var v:vSucursales);
var
	i:subrango;
begin
	for i:=1 to DIMF do
		v[i]:=nil;
end;
procedure cargarSucursales(var v:vSucursales);
var
	a:asistencia;
	suc:subrango;
begin
	leerAsistencia(a);
	while(a.codigo<>CORTE)do begin
		writeln('Ingrese sucursal(1..5)');
		readln(suc);
		agregarAsistencia(v[suc],a);
		leerAsistencia(a);
	end;
end;

procedure imprimirLista(l:listaA);
begin
	while(l<>nil)do begin
		writeln('Codigo cliente: ',l^.dato.codigo);
		writeln('Dni cliente: ',l^.dato.dni);
		{writeln('Fecha asistencia: ',l^.dato.fecha);
		writeln('Minutos de la asistencia: ',l^.dato.mins);}
		l:=l^.sig;
	end;
end;
procedure imprimirSuc(v:vSucursales);
var
	i:subrango;
begin
	for i:=1 to DIMF do 
		if(v[i]<>nil)then begin
			writeln('Sucursal ',i);
			imprimirLista(v[i]);
		end;
end;
			
//--------------------------------------Inciso B-------------------------------------
procedure crearNodo(var abb:arbol; cli:cliente);
begin
	if(abb=nil)then begin
		new(abb);
		abb^.dato:=cli;
		abb^.HD:=nil;
		abb^.HI:=nil;
	end
	else 
		if(cli.dni>abb^.dato.dni)then
			crearNodo(abb^.HD,cli)
		else
			crearNodo(abb^.HI,cli);
end;

procedure minimo(var vec:vSucursales; var min:asistencia);
var
	indMin:integer;
	i:integer;
begin
	indMin:=-1;
	min.codigo:=32767;
	for i:=1 to DIMF do begin
		if(vec[i]<>nil)then
			if(vec[i]^.dato.codigo<min.codigo)then begin
				indMin:=i;
				min.codigo:=vec[i]^.dato.codigo;
			end;
	end;
	if(indMin<>-1)then begin
		min.dni:=vec[indMin]^.dato.dni;
		vec[indMin]:=vec[indMin]^.sig;
	end;
end;

procedure merge(vec:vSucursales; var abb:arbol);
var
	min:asistencia;
	cli:cliente;
begin
	abb:=nil;
	minimo(vec,min);
	while(min.codigo<>32767)do begin
		cli.dni:=min.dni;
		cli.asistencias:=0;
		while(min.codigo<>32767)and(cli.dni=min.dni)do begin
			cli.asistencias:=cli.asistencias+1;
			minimo(vec,min);
		end;
		crearNodo(abb,cli);
	end;
end;

procedure imprimirArbol(abb:arbol);
begin
	if abb<>nil then begin
		imprimirArbol(abb^.HI);
		writeln('DNI: ',abb^.dato.dni);
		writeln('Cant asistencias: ',abb^.dato.asistencias);
		imprimirArbol(abb^.HD);
	end;
end;
//--------------------------------------Programa Principal-------------------------------------
var
	vecSuc:vSucursales;
	abb:arbol;
begin
	//inciso A
	inicializarListas(vecSuc);
	cargarSucursales(vecSuc);
	imprimirSuc(vecSuc);
	//inciso B
	merge(vecSuc,abb);
	writeln('ARBOL');
	imprimirArbol(abb)
end.



