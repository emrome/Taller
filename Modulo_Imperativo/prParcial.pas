program practica;
const 
	DIMFS=5;
	CORTE=-1;
	DIMFV=200;
type
	venta=record
		codigo=integer;
		cant=integer;
		montoT=real;
	end;
	vVentas=array[1..DIMFV]of venta;
	sucursal=record
		diml:integer;
		vec:vVentas;
	end;
	
	vSuc=array[1..DIMS]of sucursal;
	
	producto=record
		cod:integer;
		cantVendido:integer;
	end;
	
	listaP=^nodo;
	nodo=record
		dato:producto;
		sig:listaP;
	end;
	vIndices=array[1..DIMFS]of integer;
	
procedure leerVenta(var v:venta);
begin
	readln(v.codigo);
	if(v.codigo<>CORTE)then begin
		readln(v.cant);
		readln(montoT);
	end;
end;

procedure cargarSucursales(var vec:vSuc);
var
	i:integer;
	v:venta;
begin
	for i:=1 to DIMFS do begin
		vec[i].diml:=0;
		leerVenta(v);
		while((v.codigo<>CORTE)and(diml<DIMFV))do begin
			vec[i].diml:=vec[i].diml+1;
			vec[i].vec[diml]:=v;
			leerVenta(v);
		end;
	end;
end;

//------------------------------inciso A-------------------------------
procedure agregarAtras(var l,ult:listaP; prod:producto);
var
	nue:listaO;
begin
	new(nue);
	nue^.dato:=prod;
	nue^.sig:=nil;
	if(l=nil)then
		l:=nue
	else
		ult^.sig:=nue;
	ult:=nue;
end;
procedure inicializarIndices(var vInd:vIndices);
var
	i:integer;
begin
	for i:=1 to DIMFS do
		vInd[i]:=
end;

procedure minimo(var vec
procedure mergeAcumulador(vec:vSuc;var l:listaP);

//------------------------------inciso B-------------------------------
function cantMas500(l:listaP):integer;
var
	cant:integer;
begin
	cant:=0;
	if(l=nil)then 
		cantMas500:=0
	else begin
		if(l^.dato.cantVendido>500)then
			cantMas500:=1+cantMayor(l^.sig)
		else
			cantMas500:=cantMas500(l^.sig);
	end;
end;
