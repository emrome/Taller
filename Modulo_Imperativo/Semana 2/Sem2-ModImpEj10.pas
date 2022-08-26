{Implementar un programa que contenga:
a. Un módulo que lea información de alumnos de Taller de Programación y almacene en una estructura de datos sólo a aquellos alumnos que posean año de ingreso posterior al 2010. Esta estructura debe estar ordenada por legajo y debe ser eficiente para la búsqueda por dicho criterio. De cada alumno se lee legajo, apellido, nombre, DNI y año de ingreso.
b. Un módulo que reciba la nueva estructura e informe el nombre y apellido de aquellos alumnos cuyo legajo sea inferior a 15853.
c. Un módulo que reciba la nueva estructura e informe el nombre y apellido de aquellos alumnos cuyo legajo esté comprendido entre 1258 y 7692.
}

program ej10;
const
	COND=2010;
	CORTE=-1;
type
	str=string[20];
	alumno=record
		anioIng:integer;
		legajo:integer;
		apellido:str;
		nombre:str;
		DNI:integer;
	end;
	arbol=^nodo;
	nodo=record
		dato:alumno;
		HD:arbol;
		HI:arbol;
	end;

procedure leerAlumno(var al:alumno);
begin
	
	writeln('Ingrese anio de ingreso');
	readln(al.anioIng);
	if (al.anioIng<>CORTE)then begin
		writeln('Ingrese legajo del alumno ');
		readln(al.legajo);
		writeln('Ingrese apellido del alumno ');
		readln(al.apellido);
		writeln('Ingrese nombre del alumno ');
		readln(al.nombre);
		writeln('Ingrese DNI del alumno ');
		readln(al.DNI);
		end;
	end;
end;

procedure crear(var a:arbol;al:alumno);
begin
	if(a=nil)then begin
		new(a);
		a^.dato:=al;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else 
		if(al.legajo<a^.dato.legajo)then 
			crear(a^.HI,al)
		else 
			if(al.legajo>a^.dato.legajo)then 
				crear(a^.HD,al);
end;

procedure cargarArbol(var a:arbol);
var
	al:alumno;
begin
	leerAlumno(al);
	while(al.legajo<>CORTE)do begin
		if(al.anioIng<>COND)then 
			crear(a,al);
		writeln();
		leerAlumno(al);
	end;
end;

procedure imprimirMenorX(a:arbol;num:integer);
begin
	if(a<>nil)then
		if(a^.dato.legajo<num)then begin //si es menor recorro por las dos ramas
			imprimirMenorX(a^.HD,num);
			writeln(a^.dato.apellido,' ',a^.dato.nombre);
		end
		imprimirMenorX(a^.HI,num); //si es mayor o igual, recorro solo la izquierda
end;

procedure imprimirEntreXeY(a:arbol;max,min:integer);
begin
	if(a<>nil)then
		if(a^.dato.legajo>max)then //si es mayor al tope me voy por la izquierda, porque los valores son menores
			imprimirEntreXeY(a^.HI,max,min)
		else if(a^.dato.legajo<min)then //si es menor al minimo me voy por la derecha, donde los valores son mayores
			imprimirEntreXeY(a^.HD,max,min)
			else begin //esta comprendido entre max y min
				writeln(a^.dato.apellido,' ',a^.dato.nombre); //imprimo en nombre y apellido
				imprimirEntreXeY(a^.HI,max,min);//sigo recorriendo el arbol hasta que no haya nodos para comparar
				imprimirEntreXeY(a^.HD,max,min);
			end;
end;

var
	a:arbol;
	max,min,num:integer;
begin
	num:=15853;
	a:=nil;
	cargarArbol(a);
	imprimirMenorX(a,num);
	max:=7692;
	min:=1258;
	imprimirEntreXeY(a,max,min);
end.
