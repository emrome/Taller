{Implementar un programa que procese la información de las ventas de productos de una librería que tiene 4 sucursales. De cada venta se lee fecha de venta, código del producto vendido, código de sucursal y cantidad vendida. El ingreso de las ventas finaliza cuando se lee el código de sucursal 0.
Implementar un programa que:
a. Almacene las ventas ordenadas por código de producto y agrupados por sucursal, en una estructura de datos adecuada.
b. Contenga un módulo que reciba la estructura generada en el punto a y retorne una estructura donde esté acumulada la cantidad total vendida para cada código de producto.
}

program ej12;
const
	CANTS=4;
	CORTE=0;
type
	subSuc=0..CANTS;
	subMes=1..12;
	subDia=1..31;
	fecha=record
		dia:subDia;
		mes:subMes;
		anio:integer;
	end;
	
	venta=record
		suc:subSuc;
		fec:fecha;
		codProd:integer;
		cant:integer;
	end;
	listaVenta=^nodo;
	nodo=record
		dato:venta;
		sig:listaVenta;
	end;
	vecSuc=array[1..CANTS]of listaVenta;
	
//otro registro que solo guarde codigo de producto y cant vendida
	subVenta=record
		cod:integer;
		cant:integer;
	end;
	listaMerge=^nodo2;
	nodo2=record
		dato:subVenta;
		sig:listaMerge;
	end;
	
//--------------------------inciso A--------------------------------
procedure leerFecha(var f:fecha);
begin
	writeln('Ingrese dia de la venta ');
	readln(f.dia);
	writeln('Ingrese mes de la venta');
	readln(f.mes);
	writeln('Ingrese anio de la venta');
	readln(f.anio);
end;
procedure leerVenta(var v:venta);
begin
	writeln('Ingrese codigo de la sucursal');
	readln(v.suc);
	if(v.suc<>CORTE)then begin
		//leerFecha(v.fec);
		writeln('Ingrese codigo de producto');
		readln(v.codProd);
		writeln('Ingrese cantidad vendida');
		readln(v.cant);
	end;
end;
procedure insertarNodo(var l:listaVenta; v:venta);
var
	ant,act,nue:listaVenta;
begin
	new(nue);
	nue^.dato:=v;
	ant:=l;
	act:=l;
	while((act<>nil)and(act^.dato.codProd<v.codProd))do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(act=ant)then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=nil;
end;
procedure inicializarListas(var v:vecSuc);
var
	i:integer;
begin
	for i:=1 to CANTS do 
		v[i]:=nil;
end;

procedure cargarVentas(var v:vecSuc);
var
	vent:venta;
begin
	leerVenta(vent);
	while(vent.suc<>CORTE)do begin
		insertarNodo(v[vent.suc],vent);
		leerVenta(vent);
	end;
end;
//--------------------------inciso B--------------------------------
procedure agregarAtras(var l,ult:listaMerge;aux:subVenta);
var
	nue:listaMerge;
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
procedure minimo(var vec:vecSuc;var min:subVenta);
var
	i,indMin:integer;
begin
	indMin:=-1;min.cod:=32767;
	for i:=1 to CANTS do 
		if(vec[i]<>nil)then
			if(vec[i]^.dato.codProd<min.cod)then begin
				indMin:=i;
				min.cod:=vec[i]^.dato.codProd;
			end;
			
	if(indMin<>-1)then begin
		min.cant:=vec[indMin]^.dato.cant;
		vec[indMin]:=vec[indMin]^.sig;
	end;
end;

procedure mergeVentas(vec:vecSuc; var l:listaMerge);
var
	ult:listaMerge;
	min,aux:subVenta;
begin
	l:=nil;
	minimo(vec,min);
	while(min.cod<>32767)do begin
		aux.cod:=min.cod;
		aux.cant:=0;
		while((min.cod<>32767)and(aux.cod=min.cod))do begin
			aux.cant:= aux.cant + min.cant;
			minimo(vec,min);
		end;
		agregarAtras(l,ult,aux);
	end;
end;
//-----------------------------Comprobar---------------------------------
procedure imprimirLista(l:listaMerge);
begin
	while(l<>nil)do begin
		writeln('Codigo Producto: ',l^.dato.cod);
		writeln('Ventas Totales: ',l^.dato.cant);
		l:=l^.sig;
	end;
end;
//-----------------------------Programa Principal---------------------------
var
	ventasSuc:vecSuc;
	listaCodProd:listaMerge;
begin
	inicializarListas(ventasSuc);
	cargarVentas(ventasSuc);
	mergeVentas(ventasSuc,listaCodProd);
	imprimirLista(listaCodProd);
end.
