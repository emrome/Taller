{Una aerolínea dispone de un árbol binario de búsqueda con la información de sus empleados. De cada empleado se conoce: Número de legajo, Dni, Categoría (1..20) y año de ingreso a la empresa. El árbol se encuentra ordenado por número de legajo. 
* Se solicita:
a. Implementar un módulo que reciba el árbol de empleados, número de legajo “A”, número de legajo “B” y un número de categoría, y retorne un vector ordenado por
número de legajo. El vector debe contener el número de legajo y Dni de aquellos empleados cuyo número de legajo se encuentra comprendido entre los números de legajo recibidos (“A” y “B”, siendo “A” menor que “B”) y la categoría se corresponda con la recibida por parámetro. Por norma de la empresa, cada categoría puede contar con a lo sumo 250 empleados.
b. Implementar un módulo recursivo que reciba la información generada en “b” y retorne el promedio de los números de Dni.
}

program adic1;
const
	dimF=250;
	CANT=20;
type
	categorias=1..CANT;
	empleado=record
		legajo:integer;
		DNI:integer;
		categoria:categorias;
		ingreso:integer;
	end;
	arbol=^nodo;
	nodo=record
		dato:empleado;
		HI:arbol;
		HD:arbol;
	end;
	vector=array[1..dimF]of empleado;
	
procedure leerEmpleado(var e:empleado);
procedure crearNodo(var abb:arbol;e:empleado);
procedure cargarArbol(var abb:arbol);
//------------------------------inciso A----------------------------------

procedure agregarElem(var vec:vector; var diml:integer; emp:empleado);
begin
	if(diml<dimf)then begin
		diml:=diml+1;
		vec[diml]:=emp;
	end;
end; 

procedure agregarEmpleados(abb:arbol; A,B:integer; cat:categorias;var vec:vector;var diml:integer);
begin
	if(abb<>nil)and(diml<dimf)then
		if(abb^.dato.legajo<A)then//es menor al limite minimo, va por la derecha
			agregarEmpleados(abb^.HD,A,B,cat,vec,diml)

		else if (abb^.dato.legajo>B)then//es mayor al limite maximo, va por la izquierda 
			agregarEmpleados(abb^.HI,A,B,cat,vec,diml)

		else begin//esta comprendido entre A y B
			agregarEmpleados(abb^.HI,A,B,cat,vec,diml);
			if(abb^.dato.categoria=cat)then 
				agregarElem(vec,diml,abb^.dato);
			agregarEmpleados(abb^.HD,A,B,cat,vec,diml);
		end;
end;
//--------------------------inciso B---------------------------------
procedure promDNIs(vec:vector;diml,i:integer;var prom:real);
begin
	if(i<=diml)then begin
		prom:= vec[i].DNI + prom;
		promDNIs(vec,diml,i+1,prom);
	end
	else
		prom:= prom/diml;
end;

//---------------------------Programa Principal---------------------
var
	abb:arbol;
	promedioDnis:real;
	A,B,diml:integer;
	vecLegajos:vector;
	cat:categorias;
begin
	cargarArbol(abb);//Se dispone
	readln(A);
	readln(B);
	readln(cat);
	diml:=0;
	agregarEmpleados(abb,A,B,cat,vecLegajos,diml);
	promedioDnis:=0;
	promDNIs(vecLegajos,diml,1,promedioDnis);
	writeln('El promedio de los numero de DNI es: ',promedioDnis:2:2);
end. 
