{ Un cine posee la lista de películas que proyectará durante el mes de octubre. De cada película se conoce: código de película, código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas.
Implementar un programa que contenga:
a. Un módulo que lea los datos de películas y los almacene ordenados por código de película y agrupados por código de género, en una estructura de datos adecuada. La lectura finaliza cuando se lee el código de película -1.
b. Un módulo que reciba la estructura generada en el punto a y retorne una estructura de datos donde estén todas las películas almacenadas ordenadas por código de película.
}

program ej11;
const
	CORTE=-1;
	dimF=8;
type
	gen=1..dimF;
	pelicula=record
		cod:integer;
		genero:gen;
		puntaje:real;
	end;
	lista=^nodo;
	nodo=record
		dato:pelicula;
		sig:lista;
	end;
	vecGen=array[gen]of lista;
//----------------------------------------inciso A----------------------------------------
procedure leerPelicula(var p:pelicula);
begin
	writeln('Ingrese codigo de pelicula');
	readln(p.cod);
	if(p.cod<>CORTE)then begin
		writeln('Ingrese codigo de genero de pelicula');
		readln(p.genero);
		writeln('Ingrese puntaje promedio otorgado por las criticas');
		readln(p.puntaje);
	end;
end;
procedure insertarPel(var l:lista;p:pelicula);
var
	act,ant,nue:lista;
begin
	new(nue);
	nue^.dato:=p;
	act:=l;
	ant:=l;
	while(act<>nil)and(act^.dato.cod<p.cod))do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(act=ant)then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure inicializarListas(var v:vecGen);
var
	i:gen;
begin
	for i:=1 to dimF do
		v[i]:=nil;
end;

procedure cargarListas(var v:vecGen);
var
	p:pelicula;
begin
	leerPelicula(p);
	while(p.cod<>CORTE)do begin
		insertarPel(v[p.genero],p);
		leerPelicula(p);
	end;
end;
//----------------------------------------inciso B----------------------------------------
procedure agregarAtras(var l,ult:lista;p:pelicula);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=p;
	nue^.sig:=nil;
	if(l=nil)then
		l:=nue
	else
		ult^.sig:=nue;
	ult:=nue;
end;
procedure minimo(var v:vecGen;var min:pelicula);
var
	i,indMin:integer;
begin
	min.cod:=32767;
	indMin:=-1;
	for i:=1 to dimF do
		if(v[i]<>nil)then
			if(v[i]^.dato.cod<min.cod)then begin
				min.cod:=v[i]^.dato.cod;
				indMin:=i;
			end;
	
	if(indMin<>-1)then begin
		min.genero:=v[i]^.dato.genero;//se podria hacer min:=v[i]^.dato???
		min.puntaje:=v[i]^.dato.puntaje;
		v[i]:=v[i]^.sig;
	end;
end;

procedure mergePeliculas(v:vecGen; var nueLista:lista);
var
	min:pelicula;
	ult:lista;
begin
	nueLista:=nil;
	minimo(v,min);
	while(min.cod<>32767)do begin
		agregarAtras(nueLista,ult,min);
		minimo(v,min);
	end;
end;

var
	vecGeneros:vecGen;
	nueLista:lista;
begin
	inicializarListas(vecGeneros);
	cargarListas(vecGeneros);
	mergePeliculas(vecGeneros,nueLista);
end.
