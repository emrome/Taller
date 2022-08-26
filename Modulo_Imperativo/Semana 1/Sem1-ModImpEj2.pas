{Netflix ha publicado la lista de películas que estarán disponibles durante el mes de diciembre de 2021. De cada película se conoce: código de película, código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas.
Implementar un programa modularizado que:
a. Lea los datos de películas y los almacene por orden de llegada y agrupados por código de género, en una estructura de datos adecuada. La lectura finaliza cuando se lee el código de la película -1.
b. Una vez almacenada la información, genere un vector que guarde, para cada género, el código de película con mayor puntaje obtenido entre todas las críticas.
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos métodos vistos en la teoría.
d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el código de película con menor puntaje.
}
program ej2;
const
    CORTE=-1;
    dimF=8;
type
    genero=1..dimF;
    pelicula=record
        codPel:integer;
        //codGen:genero;
        puntaje:real;
    end;
    listaP=^nodo;
    nodo=record
        elem:pelicula;
        sig:listaP;
    end;
    vPeliculas=array[genero]of listaP;
    vPuntaje=array[genero]of pelicula;
    
procedure leerPelicula(var p:pelicula;var codGen:genero);
begin
    writeln('Ingrese codigo de pelicula');readln(p.codPel);
    if(p.codPel<>CORTE)then begin
        writeln('Ingrese codigo del genero de pelicula: 1:accion, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: belica, 7: documental y 8: terror ');readln(codGen);
        writeln('Ingrese puntaje promedio otorgado por las criticas ');readln(p.puntaje);
    end;
end;

procedure agregarPelicula(var l:listaP;p:pelicula);
var
   act,nue:listaP;
begin
    new(nue);nue^.elem:=p;nue^.sig:=nil;
    if(l=nil)then 
        l:=nue
    else begin    
        act:=l;
        while(act^.sig<>nil)do
           act:=act^.sig;
        act^.sig:=nue;
    end;
end;

procedure inicializarListas(var v:vPeliculas);
var
    i:integer;
begin
    for i:=1 to dimF do 
       v[i]:=nil;
end;

procedure cargarPeliculas(var v:vPeliculas);
var
    p:pelicula;
    codGen:genero;
begin
    leerPelicula(p,codGen);
    while(p.codPel<>CORTE)do begin
        agregarPelicula(v[codGen],p);
        leerPelicula(p,codGen);
    end;
end;
//inciso b
procedure maximos(var pelMax:pelicula;p:pelicula);
begin
    if(p.puntaje>pelMax.puntaje)then 
        pelMax:=p
end;
procedure recorrerLista(l:listaP;var pelMax:pelicula);
begin 
    pelMax.codPel:=-1;
    pelMax.puntaje:=-1;
    while(l<>nil)do begin
        maximos(pelMax,l^.elem);
        l:=l^.sig;
    end;
end;

procedure cargarMayorPuntaje(var vPun:vPuntaje;vPel:vPeliculas);
var
   i:integer;
begin
    for i:=1 to dimF do begin
        recorrerLista(vPel[i],vPun[i]);
    end;
end;

//inciso c
procedure ordenarInsercion(var v:vPuntaje);
var 
    i,j:integer;
    act:pelicula;
begin
    for i:=2 to dimF do begin
        act:=v[i];
        j:=i-1;
        while(j>0)and(act.puntaje>v[j].puntaje)do begin
            v[j+1]:=v[j];
            j:=j-1;
        end;
        v[j+1]:=act;
    end;
end;

//inciso d
procedure eliminarCodSinPuntaje(var v:vPuntaje;var diml:integer; valor:integer);
var
    pos:integer;
begin
    diml:=0;
    pos:=1;
    while(pos<=dimF)and (v[pos].puntaje<>valor)do begin
        diml:=diml+1;        
        pos:=pos+1;
    end;
end;

procedure imprimirMayorMenor(var v:vPuntaje;diml:integer);
begin
    writeln('Codigo de pelicula con mayor puntaje: ',v[1].codPel);
    writeln('Codigo de pelicula con menor puntaje: ',v[diml].codPel);
end;

var
    vecPuntajes:vPuntaje;
    vecPeliculas:vPeliculas;
    diml:integer;
begin
    inicializarListas(vecPeliculas);
    cargarPeliculas(vecPeliculas);
    cargarMayorPuntaje(vecPuntajes,vecPeliculas);
    ordenarInsercion(vecPuntajes);
    eliminarCodSinPuntaje(vecPuntajes,diml,-1);
    imprimirMayorMenor(vecPuntajes,diml);
end.
