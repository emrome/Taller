{Escribir un programa que:
a. Implemente un módulo que lea números enteros y los almacene en un árbol binario de búsqueda. La lectura finaliza con el valor 0.
b. Una vez generado el árbol, realice módulos independientes para:

i. Obtener el número más grande.
ii. Obtener el número más chico.
iii. Obtener la cantidad de elementos.
iv. Informar los números en orden creciente.
v. Informar los números pares en orden decreciente.

Nota: Tener en cuenta que cada número debe aparecer una única vez en el árbol.
}

program ej8;
const
	CORTE=0;
type
	arbol=^nodo;
	nodo=record
		dato:integer;
		der:arbol;
		izq:arbol;
	end;
	
procedure crear(var a:arbol; num:integer);
begin
	if(a=nil)then begin
		new(a);
		a^.dato:=num;
		a^.der:=nil;
		a^.izq:=nil;
	end
	else
		if(num>a^.dato)then
			crear(a^.der,num)
		else if(num<a^.dato)then
			crear(a^.izq,num);
end;
procedure cargarArbol(var arb:arbol);
var
	num:integer;
begin
	writeln('Ingrese un numero ');
	readln(num);
	while(num<>CORTE)do begin
		crear(arb,num);
		writeln('Ingrese un numero ');
		readln(num);
	end;
end;

function maximoArb(a:arbol):integer;
begin
	if a=nil then 
		maximoArb:=-1
	else 
		if (a^.der<>nil)then //si hay un valor mas grande esta a la derecha 
			maximoArb:=maximoArb(a^.der)
		else
			maximoArb:=a^.dato;//no hay mas valores mayores, se guarda ese valor.
end;
procedure maximoP(var max:integer; abb:arbol);
begin
	if(abb=nil)then
		max:=-1
	else
		if(abb^.der<>nil)then
			maximoP(max,abb^.der)
		else
			max:=abb^.dato;
end;
function minimoArb(a:arbol):integer;
begin
	if a=nil then 
		minimoArb:=32767
	else if(a^.izq<>nil)then
		minimoArb:=minimoArb(a^.izq)
		else
			minimoArb:=a^.dato;
end;
procedure minimoP(var min:integer; abb:arbol);
begin
	if(abb=nil)then
		min:=32767
	else
		if(abb^.izq<>nil)then
			minimoP(min,abb^.izq)
		else
			min:=abb^.dato;
end;

//inciso iii
function cantElementos(arb:arbol):integer;
begin
	if(arb<>nil)then
		cantElementos:=1+cantElementos(arb^.izq)+cantElementos(arb^.der)
	else
		cantElementos:=0;
end;

procedure cantElementosP(arb:arbol;var cant:integer);
begin
	if arb<>nil then begin
		cantElementosP(arb^.der,cant);
		cantElementosP(arb^.der,cant);
		cant:=cant +1;
	end
	else
		cant:=0;
end;

//inciso iv
procedure imprimirCreciente(arb:arbol);
begin
	if(arb<>nil)then begin
		imprimirCreciente(arb^.izq);
		writeln(arb^.dato);
		imprimirCreciente(arb^.der);
	end;
end;

//inciso v
procedure imprimirParDecrec(arb:arbol);
begin
	if(arb<>nil)then begin
		imprimirParDecrec(arb^.der);//llega hasta el elemento mas grande y lo imprime, despues imprime el nodo anterior y se mueve al de la izquierda. Y vuelve a buscar el maximo por la rama derecha
		if((arb^.dato mod 2)=0)then
			writeln(arb^.dato);
		imprimirParDecrec(arb^.izq);

	end;
end;

var
	arb:arbol;
	max,min:integer;
begin
	arb:=nil;
	cargarArbol(arb);
	writeln('Cantidad de elementos del arbol ',cantElementos(arb));
	writeln();
	maximoP(max,arb);
	writeln('Elemento maximo funcion ',maximoArb(arb));
	writeln('Elemento maximo procedure ',max);
	minimoP(min,arb);
	writeln('Elemento minimo ',minimoArb(arb));
	writeln('Elemento minimo procedure ',min);
	writeln();
	imprimirCreciente(arb);
	writeln();
	imprimirParDecrec(arb);
end.



