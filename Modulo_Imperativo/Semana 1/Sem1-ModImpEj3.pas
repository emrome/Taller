{Una librería requiere el procesamiento de la información de sus productos. De cada producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
Implementar un programa modularizado que:

a. Lea los datos de los productos y los almacene ordenados por código de producto y agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza cuando se lee el precio 0. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.

b. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3 es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.

c. Ordene, por precio, los elementos del vector generado en b) utilizando alguno de los dos métodos vistos en la teoría.

d. Muestre los precios del vector ordenado.
}

program ej3;
const
    CORTE=0;
    dimf3=5;
    dimfR=4;
    rub=3;
type
    rubro=1..dimfR;
    producto=record
        codProd:integer;
        //codRubro:rubro;
        precio:real;
    end;
    listaP=^nodo;
    nodo=record
        elem:producto;
        sig:listaP;
    end;
    vRubros=array[rubro]of listaP;
    rubro3=array[1..dimf3]of producto;

//inciso a
procedure inicializarListas(var v:vRubros);//inicializa todas las listas de los distintos rubros en NIL
var
    i:integer;
begin
    for i:=1 to dimfR do 
        v[i]:=nil
end;
procedure leerProducto(var p:producto; var codRubro:rubro);
begin
    writeln('Ingrese precio del producto ');readln(p.precio);
    if (p.precio<>CORTE)then begin
        writeln('Ingrese codigo del producto ');readln(p.codProd);
        writeln('Ingrese codigo de rubro ');readln(codRubro);
    end;
end;
procedure insertarOrdenado(var l:listaP;p:producto);
var
    act,ant,nue:listaP;
begin
    new(nue);nue^.elem:=p;
    ant:=l;
    act:=l;
    while(act<>nil)and(act^.elem.codProd<p.codProd)do begin
        ant:=act;
        act:=act^.sig;
    end;
    if(ant=act)then
       l:=nue
    else
       ant^.sig:=nue;
    nue^.sig:=act;
end;
procedure cargarProductos(var v:vRubros);//carga cada producto, ordenados por cod de producto, en la lista del rubro correspondiente
var
    p:producto;
    codRubro:rubro;
begin
    leerProducto(p,codRubro);
    while(p.precio<>CORTE)do begin
        insertarOrdenado(v[codRubro],p);
        leerProducto(p,codRubro);
    end;
end;
procedure recorrerLista(l:listaP);
begin
    while(l<>nil)do begin
       writeln(l^.elem.codProd);
       l:=l^.sig;
    end;
end;
procedure imprimirRubros(var v:vRubros);
var
    i:integer;
begin
    for i:=1 to dimfR do begin
        writeln('Codigos de productos del rubro ',i,': ');
        recorrerLista(v[i]);
    end;
end;

//inciso b (interprete que habia que hacerlo una vez almacenados los datos)
procedure cargarRubro3(var v:rubro3 ;var dimL:integer;l:listaP);//recorre la lista del rubro pedido(hasta que no haya mas o este lleno vector) y lo inserta en el vector
begin
    dimL:=0;
    while(l<>nil)and(dimL<dimf3)do begin
        dimL:=dimL+1;
        v[dimL]:=l^.elem;
        l:=l^.sig;
    end;
end;

//inciso c
procedure ordenarRubro3(var v:rubro3;diml:integer);
var
    i,j:integer;
    act:producto;
begin
    for i:= 2 to dimL do begin
        act:=v[i];
        j:=i-1;
        while(j>0)and(v[j].precio>act.precio)do begin
           v[j+1]:=v[j];
           j:=j-1;
        end;
        v[j+1]:=act
    end;
end;

//inciso d
procedure imprimirVector(var v:rubro3;dimL:integer);
var
    i:integer;
begin
    writeln('Precios de los productos del rubro ',rub,': ');
    for i:= 1 to dimL do 
        writeln(v[i].precio:2:2);
end;
var
    dimL:integer;
    rubroX:rubro3;
    productos:vRubros;
begin
	inicializarListas(productos);
    cargarProductos(productos);
    writeln('CODIGOS POR RUBRO');
    imprimirRubros(productos);
    cargarRubro3(rubroX,dimL,productos[rub]);//productos[rub] rub es constante dependiendo del rubro y es la lista de determinado rubro lo que pasa como parametro
    ordenarRubro3(rubroX,dimL);
    writeln('PRECIOS DEL RUBRO ',rub,' ORDENADOS');
    imprimirVector(rubroX,dimL);
end.
