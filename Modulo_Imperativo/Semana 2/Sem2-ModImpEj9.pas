{Implemente un programa que invoque a un módulo que genere un árbol binario de búsqueda con nombres de personas que se leen desde teclado. La lectura finaliza con el nombre ‘ZZZ’ que no debe procesarse. También debe invocar a otro módulo que reciba el árbol generado y un nombre, y retorne verdadero si existe dicho nombre en el árbol o falso en caso contrario.
}

program ej9;
const
	CORTE='ZZZ';
type
	str=string[30];
	arbol=^nodo;
	nodo=record
		dato:str;
		HI:arbol;
		HD:arbol;
	end;

procedure crear(var a:arbol;nom:str);
begin
	if(a=nil)then begin
		new(a);
		a^.dato:=nom;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else
		if(nom>a^.dato)then crear(a^.HD,nom)
		else crear(a^.HI,nom)
end;

procedure cargarArbol(var a:arbol);
var
	nom:str;
begin
	writeln('Ingrese un nombre ');
	readln(nom);
	while(nom<>CORTE)do begin
		crear(a,nom);
		writeln('Ingrese un nombre ');
		readln(nom);
	end;
end;

procedure imprimirOrden(a:arbol);
begin
	if(a<>nil)then begin
		imprimirOrden(a^.HI);
		writeln(a^.dato);
		imprimirOrden(a^.HD);
	end;
end;

function buscar(a:arbol;nom:str):boolean;
begin
	if(a<>nil)then 
		if(a^.dato=nom)then 
			buscar:=true
		else 
			if(nom>a^.dato)then 
				buscar:=buscar(a^.HD,nom)
			else 
				buscar:=buscar(a^.HI,nom)
	else
		buscar:=false;
end;

var
	nom:str;
	a:arbol;
begin
	a:=nil;
	cargarArbol(a);
	imprimirOrden(a);
	writeln();
	readln(nom);
	if(buscar(a,nom))then writeln('El nombre ',nom,' esta en el arbol')
	else writeln('El nombre no esta en el arbol');
end.
