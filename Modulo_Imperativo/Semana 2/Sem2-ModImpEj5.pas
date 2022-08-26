{Escribir un programa que:
a. Implemente un módulo que genere un vector de 20 números enteros.
b. Implemente un módulo recursivo que devuelva el máximo valor del vector.
c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos
en el vector.
}

program ej5;
const
	dimf=6;
type
	vector=array[1..dimf]of integer;

procedure generarVector(var v:vector);
var
	num,i:integer;
begin
	for i:=1 to dimf do begin
		writeln('Ingrese un numero entero');
		readln(num);
		v[i]:=num;
	end;
end;

function maximo(v:vector;i:integer):integer;
var
	max:integer;
begin
	if(i<=dimf)then begin
		max:=maximo(v,i+1);
		if(v[i]>max)then 
			maximo:=v[i]
		else
			maximo:=max;
	end
	else
		maximo:=-1;
end;

procedure maximoP(v:vector;i:integer;var max:integer);
begin
	if(i<=dimF)then begin
		if(v[i]>max)then
			max:=v[i];
		maximoP(v,i+1,max);
	end;
end;

function minimo(v:vector;i:integer):integer;
var
	min:integer;
begin
	if(i<=dimf)then begin
		min:=minimo(v,i+1);
		if(v[i]<min)then
			minimo:=v[i]
		else 
			minimo:=min;
	end
	else
		minimo:=9999;
end;

procedure minimoP(v:vector;i:integer;var min:integer);
begin
	if(i<=dimf)then begin
		if(v[i]<min)then
			min:=v[i];
		minimoP(v,i+1,min);
	end;
end;

procedure sumaElem(v:vector; i:integer; var suma:integer);
begin
	if(i<=dimf)then begin
		sumaElem(v,i+1,suma);
		suma:= v[i] + suma;
	end
	else
		suma:=0;
end;

function sumaVec(v:vector;i:integer):integer;
begin
	if (i<=dimf)then 
		sumaVec:= v[i] + sumaVec(v,i+1)
	else
		sumaVec:=0;
end;

var
	vec:vector;
	suma,i,max,min:integer;
	
begin
	i:=1;
	generarVector(vec);
	
	max:=-1;
	min:=9999;
	minimoP(vec,i,min);
	maximoP(vec,i,max);
	writeln('MAXIMO: ',max);
	writeln('MINIMO: ',min);
	writeln('ELEMENTO MAXIMO: ',maximo(vec,i));
	writeln('ELEMENTO MINIMO ',minimo(vec,i));
	
	suma:=0;
	sumaElem(vec,i,suma);
	writeln('SUMA CON PROCESO ',suma);
	writeln('SUMA CON FUNCION ',sumaVec(vec,i));
end.
