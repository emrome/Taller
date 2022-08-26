{Realizar un programa que lea números y que utilice un procedimiento recursivo que
escriba el equivalente en binario de un número decimal. El programa termina cuando el
usuario ingresa el número 0 (cero).
Ayuda: Analizando las posibilidades encontramos que: Binario (N) es N si el valor es
menor a 2. ¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos
el número para la próxima llamada recursiva? Ejemplo: si se ingresa 23, el programa
debe mostrar: 10111.
}

program ej7;
const
	CORTE=0;
	
procedure binario(num:integer);
var
	dig:integer;
begin
	if(num<>0)then begin
		dig:=num mod 2;
		num:=num div 2;
		binario(num);
		write(dig);
	end;
end;

procedure leerNumeros;
var
	num:integer;
begin
	writeln('Ingrese un numero');
	readln(num);
	while (num <>CORTE)do begin
		writeln('Numero binario: ');
		binario(num);
		writeln();
		writeln('Ingrese un numero');
		readln(num);
	end;
end;

begin
	leerNumeros
end.
