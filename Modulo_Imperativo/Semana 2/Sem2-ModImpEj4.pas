{Escribir un programa que:
a. Implemente un módulo que genere una lista a partir de la lectura de números
enteros. La lectura finaliza con el número -1.
b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.
c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.
d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado
se encuentra en la lista o falso en caso contrario.
}
program ej4;
const
	CORTE=-1;
type
	lista=^nodo;
	nodo=record
		dato:integer;
		sig:lista;
	end;

//a. Implemente un módulo que genere una lista a partir de la lectura de números enteros. La lectura finaliza con el número -1.
procedure crearNodo(var l:lista;num:integer);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=num;
	nue^.sig:=l;
	l:=nue;
end;

procedure generarLista(var l:lista);
var
	num:integer;
begin
	readln(num);
	while(num<>CORTE)do begin
		crearNodo(l,num);
		readln(num);
	end;
end;

//c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.
function maximoRec(l:lista):integer;
var
	max:integer;
begin
	if(l<>nil)then begin
		max:=maximoRec(l^.sig);
		if(l^.dato>max)then
			maximoRec:=l^.dato
		else//si no es mas grande, le asigno el valor anterior
			maximoRec:=max;
	end
	else //lega al final y setea el maximo en -1
		maximoRec:=-1;
end;
procedure maximo(l:lista;var max:integer);//inicializo max en el programa, o donde sea invocado el módulo
begin
	if(l<>nil)then begin
		maximo(l^.sig,max);
		if(l^.dato>max)then
			max:=l^.dato;
	end;
end;

//b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.
function minimoRec(l:lista):integer;
var
	min:integer;
begin
	if l=nil then begin //lega al final y setea el minimo en 9999
		minimoRec:=9999;
	else begin
		min:=minimoRec(l^.sig);
		if(l^.dato<min)then
			minimoRec:=l^.dato
		else//si no es mas chico, le asigno el valor anterior
			minimoRec:=min;
	end

end;
procedure minimo(l:lista;var min:integer);//inicializo min en el programa, o donde sea invocado el módulo
begin
	if(l<>nil)then begin
		minimo(l^.sig,min);
		if(l^.dato<min)then
			min:=l^.dato;
	end
end;

//d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se encuentra en la lista o falso en caso contrario.
function buscar(l:lista;valor:integer):boolean;
begin
	if(l<>nil)then 
		if(l^.dato=valor)then
			buscar:=true
		else
			buscar:=buscar(l^.sig,valor)
	else
		buscar:=false;
end;

var
	max,min,x:integer;
	l:lista;
begin
	l:=nil;
	generarLista(l);
	
	readln(x);
	if(buscar(l,x))then 
		writeln('El valor ',x,' esta en la lista')
	else
		writeln('El valor ',x,' no esta en la lista');
		
	writeln();
	writeln('funciones');
	writeln('El valor minimo de la lista es ',minimoRec(l));
	writeln('El valor maximo de la lista es ',maximoRec(l));
	
	writeln();
	min:=9999;
	max:=-1;
	maximo(l,max);
	minimo(l,min);
	writeln('Procesos');
	writeln('El valor minimo de la lista es ',min);
	writeln('El valor maximo de la lista es ',max);
end.
